// Single Race Button handling

var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// hide the badge screen
	//_menuHandler.badgeScreen = false;
	//_menuHandler.stateChange = true;
	
		// back to main menu
	_touchHandler.debugMenu = 9;
	//DataTransfer.currentBadge = 0;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}