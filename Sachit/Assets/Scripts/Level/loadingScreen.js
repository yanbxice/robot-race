// The main level loading menu
//
//

var loadLevel : int = 6;

var rotator : Transform;
var loadingText : Transform;

var loadingImage : Texture2D;

private var rotateSpeed : float = 120.0;
private var levelLoaded : boolean = false;

var loading : boolean = false;
var startLoading : float = 0.0;
var passwordToEdit : String = "Enter Password";

var clearPrefs : boolean = false;

var async : AsyncOperation;

function Start()
{
	//#if UNITY_IPHONE
	//	var async : AsyncOperation = Application.LoadLevelAsync(loadLevel);
	//#endif
	
		// this is to clear all prefs on iPhone
	if (!clearPrefs)
	{
		// PlayerPrefs.DeleteAll();
		//async = Application.LoadLevelAsync(loadLevel);
		Invoke ("loadNow", 0.2);
	}
}

function loadNow()
{
	async = Application.LoadLevelAsync(loadLevel);
}

function Update () 
{

	rotator.Rotate(Vector3(0, -(rotateSpeed * Time.deltaTime), 0));
}



function OnGUI()
{
	if (clearPrefs)
	{
		if (GUI.Button (Rect ( ((Screen.width / 2) - 120), ((Screen.height / 2) - 10), 100, 60), "Reset Prefs" ) )
		{
			PlayerPrefs.DeleteAll();
			async = Application.LoadLevelAsync(loadLevel);
		}
		
		if (GUI.Button (Rect ( ((Screen.width / 2) + 20), ((Screen.height / 2) - 10), 100, 60), "Start Game" ) )
		{
			async = Application.LoadLevelAsync(loadLevel);
		}
	}
}
