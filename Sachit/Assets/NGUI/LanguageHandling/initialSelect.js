#pragma strict

var currVer : float;
var _touchHandler : touchHandler;
var menuStates : debugMenuStates;
private var storedVer : float;

function Start () {


	storedVer = PlayerPrefs.GetFloat("version", 0.0);
	
	if (storedVer != currVer) {
		
		_touchHandler.debugMenu = 28;
		menuStates.initLangOn = true;
		PlayerPrefs.SetFloat("version", currVer);
	}
	 
}

