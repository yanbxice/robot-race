// Single Race Button handling

var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;
var _storeMapHandler : storeMapHandler;
var step : int = 1;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// increase count
	_menuHandler.currMap = Mathf.Repeat( (_menuHandler.currMap + step), _storeMapHandler.numMaps);
	

		// if we have already unlocked all maps, skip offer
	if (_menuHandler.currMap == 6)
	{
		var assumeTrue : boolean = true;
	
		for (var j = 0; j < 6; j++)
		{
			if (!DataTransfer.trackUnlocks[j])
			{
				assumeTrue = false;
			}
		}
		
		if (assumeTrue)
		{
				//once more as this screen is hidden now
			_menuHandler.currMap = Mathf.Repeat( (_menuHandler.currMap + step), _storeMapHandler.numMaps);
		}
	}

		// flag change
	_storeMapHandler.hasChange = true;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}