// Single Race Button handling

var _touchHandler : touchHandler;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();
	
		// store selected bot
	DataTransfer.loadLevel = DataTransfer.activeLevel;
	
		// set play menu
	_touchHandler.debugMenu = 80;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}