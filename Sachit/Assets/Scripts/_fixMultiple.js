private var targetGo : GameObject;

private var meshColl : MeshCollider;
private var boxColl : BoxCollider;

var physMat : PhysicMaterial;
var startNum : int = 1;
var endNum : int = 30;
var objName : String = "";

var isMesh : boolean = false;
var isBox : boolean = false;

var doRun : boolean = false;
var doReplace : boolean = false;

function OnDrawGizmosSelected () 
{
	if (doRun)
	{
			// test loading Prefab
		// var testObject : GameObject = Instantiate(Resources.Load("_boxObstacle"));
	
	
		for (var i = startNum; i < endNum; i++)
		{
		
		//HUD_Reticule = GameObject.Find("reticle").GetComponent(Transform) as Transform;
		
			if (i < 10)
			{
				targetGo = GameObject.Find(objName + "_00" + i);
			}
			else if (i<100)
			{
				targetGo = GameObject.Find(objName + "_0" + i);
			}
			else
			{
				targetGo = GameObject.Find(objName + "_" + i);
			}
			
			if (isMesh)
			{
				meshColl = (targetGo.GetComponent(MeshCollider) as MeshCollider); 
		
				meshColl.tag = "wall";
			}
			
			if (isBox)
			{
				boxColl = (targetGo.GetComponent(BoxCollider) as BoxCollider); 
		
				boxColl.tag = "wall";
			}
		}
		
		doRun = false;
	}
	
	if (doReplace)
	{

			// now get a list of all objects in scene, and check against our wanted prefab names
		var allItems : GameObject[] = FindObjectsOfType(GameObject) as GameObject[];
		
		
			// now check all of them for stuff
		for (var item = 0; item < allItems.Length; item++)
		{
				// check pickup
			if (allItems[item].name == objName)
			{
				if (isMesh)
				{			
					meshColl = (allItems[item].GetComponent(MeshCollider) as MeshCollider); 
				
					meshColl.tag = "wall";
				}
				
				if (isBox)
				{			
					boxColl = (allItems[item].GetComponent(BoxCollider) as BoxCollider); 
				
					boxColl.tag = "wall";
				}
			}

		}
		
			// exit loop
		doReplace = false;
	}


}