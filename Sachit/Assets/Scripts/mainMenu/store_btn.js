// Single Race Button handling

var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// show the purchase menu
	_menuHandler.botPurchase = true;
	_menuHandler.botConfirm = false;
	_menuHandler.stateChange = true;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}