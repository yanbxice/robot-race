// Single Race Button handling
var _touchHandler : touchHandler;

function over()
{
		// play execute sound
	_touchHandler.isOverSound();
}

	// execute Button function
function execute () 
{
		// enable the unlock buttons again
	_touchHandler.debugMenu = 9;
	
		// play execute sound
	_touchHandler.isExecuteSound();
}