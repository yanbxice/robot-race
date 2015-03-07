using UnityEditor;
using UnityEngine;
using System.Reflection;
using System.Collections;
using System.IO;

public class CheckPrefabBug : MonoBehaviour {
	
#if UNITY_3_4
	static private int index;
	static private int numSavedScenes;
	static private FileInfo[] allFiles;
	static private string projectPath;
	static private string relativeScenePath;

    [MenuItem ("NMY/Check+Fix Prefab Bug in all Scenes (WARNING! Modifies Scenes!)")]
	static void CheckAndFixPrefabBugAllScenes(){
		// make sure there isn't an unsaved scene currently open
		if(!EditorApplication.SaveCurrentSceneIfUserWantsTo()){
			// user cancelled
			return;
		}
		ClearLog();
		projectPath=CleanupPath(Application.dataPath);
		DirectoryInfo dir = new DirectoryInfo("Assets");
		allFiles = dir.GetFiles("*.unity", SearchOption.AllDirectories);

		// process files in the Editor's Update loop, since we need the equivalent of the "yield" functionality.
		index=0;
		numSavedScenes=0;
		EditorApplication.update+=myUpdate;
	}

	static bool waitForFix;
	static void myUpdate(){
//		Debug.Log("*** Editor update "+waitForFix+" "+proceedToNext);

		if(waitForFix){
			// Phase 2: reconnect prefabs and save scene
			if(DoFix()>0){
				print("*** saving scene "+relativeScenePath);
				EditorApplication.SaveScene(relativeScenePath);
				numSavedScenes++;
			}
			// reset flag
			waitForFix=false;
		}
		
		// Phase 1: open next scene, disconnect prefabs
		if(index==allFiles.Length){
			// finished.
			EditorApplication.update-=myUpdate;
			EditorApplication.NewScene();
			Debug.Log("Finished processing. "+numSavedScenes+" scenes have been updated.");
			return;
		}
		FileInfo fi=allFiles[index++];
		relativeScenePath="Assets"+Path.DirectorySeparatorChar+RelativePath(projectPath,fi);
		print("*** opening scene "+relativeScenePath);
		EditorApplication.OpenScene(relativeScenePath);
		if(DoCheck()>0){
			// found intact prefabs, ready to proceed
			
			// proceed to Phase 2
			waitForFix=true;
		}
	}

    [MenuItem ("NMY/Check Prefab Bug in current Scene %#e")]
	static int DoCheck(){
		int numPrefabs=0;

		GameObject[] allObjects=Resources.FindObjectsOfTypeAll(typeof(GameObject)) as GameObject[]; // WARNING! ALL assets, really slow! but necessary, so we don't miss inactive objects
		
		foreach(GameObject go in allObjects){
			// only process prefab instances
			if(EditorUtility.GetPrefabType(go)!=PrefabType.PrefabInstance && EditorUtility.GetPrefabType(go)!=PrefabType.ModelPrefabInstance)
				continue;
			
			// ignore children of prefabs
			if(EditorUtility.GetPrefabParent(go)!=EditorUtility.GetPrefabParent(EditorUtility.FindPrefabRoot(go)))
				continue;
			
			// prefab reconnecting does not work for degenerate prefabs (grey cube icon instead of blue cube icon), so we need to leave them alone
			if(!AssetDatabase.IsMainAsset(EditorUtility.GetPrefabParent(EditorUtility.FindPrefabRoot(go)))){
				Debug.LogError("Found degenerate Prefab \""+AssetDatabase.GetAssetPath(EditorUtility.GetPrefabParent(EditorUtility.FindPrefabRoot(go)))+"\" in scene \""+EditorApplication.currentScene+"\"! Ignoring - please check manually!");
				continue;
			}
			
//			Debug.Log("Checking instantiated prefab \""+go.name+"\" "+EditorUtility.GetPrefabType(go));
			
			// part 1 of quickfix, based on tip from Unity Support
			go.AddComponent<PrefabFixer>();
			numPrefabs++;
		}
		if(numPrefabs>0)
			Debug.Log("Broke up "+numPrefabs+" prefab instances.");
		else
			Debug.Log("No prefabs in scene.");
		return numPrefabs;
	}

	// fix any prefab bugs by re-connecting all prefabs that have been broken above, also cleanup up any PrefabFixer objects
    [MenuItem ("NMY/Fix Prefab Bug in current Scene %#r")]
	static int DoFix(){
		Debug.Log("*** fixing prefabs");
		PrefabFixer[] allObjects=Resources.FindObjectsOfTypeAll(typeof(PrefabFixer)) as PrefabFixer[]; // WARNING! ALL assets, really slow!

		foreach(PrefabFixer p in allObjects){
			// part 2 of quickfix, based on tip from Unity Support
			EditorUtility.ReconnectToLastPrefab(p.gameObject);
		}

		Debug.Log("Reconnected "+allObjects.Length+" prefab instances.");
		return allObjects.Length;
	}
#endif
	
	// resolve any \ and / platform path weirdness, make sure path ends with \ or /
	static string CleanupPath(string path) {
		path = Path.GetFullPath(path);
		if(path[path.Length-1]!=Path.DirectorySeparatorChar)
			path += Path.DirectorySeparatorChar;
		return path;
	}

	// find relative project path
	static string RelativePath(string path, FileInfo fi) {
		return fi.FullName.Replace(path, "");
	}

	// clear Unity Console window
	// http://answers.unity3d.com/questions/10580/editor-script-how-to-clear-the-console-output-wind.html
	static void ClearLog()
	{
	    Assembly assembly = Assembly.GetAssembly(typeof(SceneView));
	
	    System.Type type = assembly.GetType("UnityEditorInternal.LogEntries");
	    MethodInfo method = type.GetMethod("Clear");
	    method.Invoke(new object(), null);
	}
}
