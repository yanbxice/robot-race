// Single Race Button handling

var _touchHandler : touchHandler;
var _itemHandler : storeItemHandler;
var _menuHandler : debugMenuStates;


	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// are we buying all maps??
	if (_menuHandler.currItem == 9)
	{
			// if we have enough money to buy our item show confirmation button
		if (DataTransfer.credits >= DataTransfer.allItems)
		{
				// define what we are buying
			_menuHandler.buyAllItems = true;

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
		// do we buy an item?
	else
	{
			// if we have enough money to buy our item show confirmation button
		if (DataTransfer.credits >= DataTransfer.itemPrice[_menuHandler.currItem])
		{
				// define what we are buying
			_menuHandler.buyItem = true;

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