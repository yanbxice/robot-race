// Single Race Button handling

var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;


	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// show the badge screen
	//_menuHandler.badgeScreen = true;
	//_menuHandler.stateChange = true;
	
		// go to badge menu
	_touchHandler.debugMenu = 40;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}