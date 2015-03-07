// Single Race Button handling

var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;
var _storeItemHandler : storeItemHandler;
var step : int = 1;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// increase count
	_menuHandler.currItem = Mathf.Repeat( (_menuHandler.currItem + step), _storeItemHandler.numItems);
	

		// if we have already unlocked all maps, skip offer
	if (_menuHandler.currItem == 9)
	{
		var assumeTrue : boolean = true;
	
		for (var j = 0; j < 9; j++)
		{
			if (!DataTransfer.pickupUnlocks[j])
			{
				assumeTrue = false;
			}
		}
		
		if (assumeTrue)
		{
				//once more as this screen is hidden now
			_menuHandler.currItem = Mathf.Repeat( (_menuHandler.currItem + step), _storeItemHandler.numItems);
		}
	}

		// flag change
	_storeItemHandler.hasChange = true;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}