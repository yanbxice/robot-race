// Single Race Button handling

var _menuHandler : debugMenuStates;
var _touchHandler : touchHandler;
var isAtm : boolean = false;
var useLastMenu : boolean = false;
var manualMenu : int = 50;

	// execute Button function
function execute () 
{
	if (isAtm)
	{
		if (useLastMenu)
		{
			_touchHandler.debugMenu = _touchHandler.lastMenu;
		}
		else 
		{
			_touchHandler.debugMenu = manualMenu;
		}
	}
		// handle floating version
	else
	{
			// show the confirmation dialog
		_menuHandler.botConfirm = false;
		_menuHandler.botPurchase = false;
		_menuHandler.botResult = false;
		_menuHandler.stateChange = true;
	}	
		// reset purchase sum
	_touchHandler.purchaseSum = 0.0;
}