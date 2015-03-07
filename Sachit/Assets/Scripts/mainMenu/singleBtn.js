// Single Race Button handling

var _touchHandler : touchHandler;

	// execute Button function
function execute () 
{
		// disable settings display
	_touchHandler.debugMenu = 8;
	
		// play execute sound
	_touchHandler.isExecuteSound();
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}