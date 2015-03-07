// Single Race Button handling

var _touchHandler : touchHandler;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();
	
		// store selected bot
	DataTransfer.playerBot = DataTransfer.activeBot;

		// handle circuit mode (no map select)
	if (DataTransfer.currentCircuit > 0)
	{
		_touchHandler.debugMenu = 80;
	}
	else
	{
			// turn off swipe mode
		_touchHandler.debugMenu = 60;
	}
	
		// store skin
	_touchHandler.setUnlocks();
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}