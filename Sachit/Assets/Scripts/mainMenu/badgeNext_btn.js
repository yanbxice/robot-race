// Single Race Button handling

var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;
var badgeCount : int = 11;
var step : int = 1;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// increase count
	_menuHandler.currBadge = Mathf.Repeat( (_menuHandler.currBadge + step), badgeCount);
	DataTransfer.currentBadge = _menuHandler.currBadge;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}