// Single Race Button handling


var _touchHandler : touchHandler;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// set Circuit Menu
	_touchHandler.debugMenu = 11;

}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}