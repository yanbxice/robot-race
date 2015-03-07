// Single Race Button handling

var _touchHandler : touchHandler;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// going back renable the unlocks menu
	_touchHandler.debugMenu = 9;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}