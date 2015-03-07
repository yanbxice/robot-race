// Single Race Button handling

var _menuHandler : debugMenuStates;
var _touchHandler : touchHandler;
var purchaseSum : float = 5000.0;

var isAtm : boolean = false;

	// execute Button function
function execute () 
{
		// store the purchase sum
	_touchHandler.purchaseSum = purchaseSum;
	
		// on atm show atm version
	if (isAtm)
	{
			// store last menu!!
		//_touchHandler.lastMenu = _touchHandler.debugMenu;
		
			// switch to atm menu
		_touchHandler.debugMenu = 59;
	}
		// else show floating version
	else
	{
			// show the confirmation dialog
		_menuHandler.botConfirm = true;
		_menuHandler.botPurchase = false;
		_menuHandler.stateChange = true;
	}
}