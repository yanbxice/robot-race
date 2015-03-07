// Single Race Button handling

var settingsHolder : settingsHolder;					// script of our settings holder
var _touchHandler : touchHandler;
var mapList : Material[] = new Material[8];
var mapScreen : GameObject;
var numMaps : int = 8;									// total number of maps

var btn_select : Transform;
var btn_buy : Transform;
var icon_lock : Transform;

//var mapName : TextMesh;
//var mapNames : String[] = ["Weapons Factory", "Lost Angeles", "Electric Downtown", "Bio Dome", "White City", "China Town"];


function Start()
{
//	mapName.renderer.material.color = Color(1,1,0,1);
}

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// get the current map
	var currMap : int = DataTransfer.activeLevel;
	
		// set the next map
	currMap++;
	
		// check we don't exceed max (loop maps)
	if (currMap > numMaps)
	{
		currMap = 1;			// if we have already shown the last map, start from the beginning
	}

/*

//Now handled in Update Function

		// if the current map is locked, show our lock symbol and switch for the buy button...
	if (!DataTransfer.trackUnlocks[(currMap-1)])
	{
		btn_select.localPosition = Vector3(0,200,0);
		btn_buy.localPosition = Vector3(0,0,0);
		icon_lock.localPosition = Vector3(0,0,0);
	}
	else
	{
		btn_select.localPosition = Vector3(0,0,0);
		btn_buy.localPosition = Vector3(0,200,0);
		icon_lock.localPosition = Vector3(0,-2000,0);
	}
	
		// show correct map
	mapScreen.renderer.material = mapList[currMap-1];

*/
		// store the new mapindex
	DataTransfer.activeLevel = currMap;

		

}


	// Handle the map image at all times
function Update()
{
		// show the correct image
	mapScreen.renderer.material = mapList[DataTransfer.activeLevel-1];
	
		// show the correct name
	//mapName.text = LanguageHandler.mapNames[DataTransfer.activeLevel-1];
		// trigger localize refresh
	//NGUI_Handler.locUpdate = true;
	//Debug.Log ("mapNext");
		// if the current map is locked, show our lock symbol and switch for the buy button...
	if (!DataTransfer.trackUnlocks[(DataTransfer.activeLevel-1)])
	{
		btn_select.localPosition = Vector3(0,200,0);
		btn_buy.localPosition = Vector3(0,0,0);
		icon_lock.localPosition = Vector3(0,0,0);
	}
	else
	{
		btn_select.localPosition = Vector3(0,0,0);
		btn_buy.localPosition = Vector3(0,200,0);
		icon_lock.localPosition = Vector3(0,-2000,0);
	}
}


function over()
{
		// play over sound
	_touchHandler.isOverSound();
}