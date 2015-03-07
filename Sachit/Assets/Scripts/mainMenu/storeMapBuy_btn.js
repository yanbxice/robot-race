// Single Race Button handling

var _touchHandler : touchHandler;
var _mapHandler : storeMapHandler;
var _menuHandler : debugMenuStates;


	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// are we buying all maps??
	if (_menuHandler.currMap == 6)
	{
			// if we have enough money to buy our item show confirmation button
		if (DataTransfer.credits >= DataTransfer.allMaps)
		{
				// define what we are buying
			_menuHandler.buyAllMaps = true;

				// store last menu!!
			_touchHandler.lastMenu = _touchHandler.debugMenu;
			
				// show the confirmation dialog
			_touchHandler.debugMenu = 59;
		}
		else
		{
				// store last menu!!
			_touchHandler.lastMenu = _touchHandler.debugMenu;
		
				// show the Crystals dialog
			_touchHandler.debugMenu = 58;
		}
	}
		// do we buy a map?
	else
	{
			// if we have enough money to buy our item show confirmation button
		if (DataTransfer.credits >= DataTransfer.trackPrice[_menuHandler.currMap])
		{
				// define what we are buying
			_menuHandler.buyMap = true;

				// store last menu!!
			_touchHandler.lastMenu = _touchHandler.debugMenu;
			
				// show the confirmation dialog
			_touchHandler.debugMenu = 59;
		}
		else
		{
				// store last menu!!
			_touchHandler.lastMenu = _touchHandler.debugMenu;
		
				// show the Crystals dialog
			_touchHandler.debugMenu = 58;
		}
	}

		
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}