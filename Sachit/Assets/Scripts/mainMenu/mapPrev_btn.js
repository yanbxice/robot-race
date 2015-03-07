// Single Race Button handling

var settingsHolder : settingsHolder;					// script of our settings holder
var _touchHandler : touchHandler;
// var mapList : Material[] = new Material[8];
// var mapScreen : GameObject;
var numMaps : int = 8;									// total number of maps


var btn_select : Transform;
var btn_buy : Transform;
var icon_lock : Transform;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// get the current map
	// var currMap : int = settingsHolder.activeLevel;
	var currMap : int = DataTransfer.activeLevel;
	
		// set the next map
	currMap--;
	
		// check that we don't exceed our maps
	if (currMap <= 0)
	{
		currMap = numMaps;			// if we have already shown the last map, start from the beginning
	}

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


/*
		// if / while the map is not unlocked, move on
	while (!DataTransfer.trackUnlocks[(currMap-1)])
	{
			// increase again
		currMap--;
		
			// check max
		if (currMap <= 0)
		{
			currMap = numMaps;			// if we have already shown the last map, start from the beginning
		}
	}
*/	

		// store the new mapindex
	// settingsHolder.activeLevel = currMap;
	DataTransfer.activeLevel = currMap;

		// show correct map
	//mapScreen.renderer.material = mapList[currMap-1];
	

}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}