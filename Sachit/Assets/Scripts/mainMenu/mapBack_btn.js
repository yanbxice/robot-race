// Single Race Button handling

var _touchHandler : touchHandler;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();
	
		// turn off swipe mode
	_touchHandler.debugMenu = 70;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}