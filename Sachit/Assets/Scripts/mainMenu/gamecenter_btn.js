// GameCenter Button handling

var _touchHandler : touchHandler;

function Start()
{
	//Debug.Log("Authenticate");
	#if UNITY_IPHONE
	iOSPlugin.auth();
	#endif
}

	// execute Button function
function execute () 
{
		//Debug.Log("Launch GameCenter");
	//Launch GameCenter on Click
	#if UNITY_IPHONE
	iOSPlugin.showGC();
	#endif
}

function over()
{

}