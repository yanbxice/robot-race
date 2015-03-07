// Single Race Button handling

var _touchHandler : touchHandler;
var _botHandler : storeBotHandler;
var _menuHandler : debugMenuStates;

var purchaseType : int = 10;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// are we buying all bots??
	if (_menuHandler.currBot == 7)
	{
			// if we have enough money to buy our item show confirmation button
		if (DataTransfer.credits >= DataTransfer.allBots)
		{
				// define what we are buying
			_menuHandler.buyAllBots = true;

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
		// do we buy a bot?
	else if (_menuHandler.currSkin == 0)
	{
			// if we have enough money to buy our item show confirmation button
		if (DataTransfer.credits >= DataTransfer.botPrice[_menuHandler.currBot])
		{
				// define what we are buying
			_menuHandler.buyBot = true;

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
		// do we buy a skin?
	else if (_menuHandler.currSkin >= 1)
	{
			// if we have enough money to buy our item show confirmation button
		if (DataTransfer.credits >= DataTransfer.skinPrice[_menuHandler.currSkin])
		{
				// define what we are buying
			_menuHandler.buySkin = true;

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