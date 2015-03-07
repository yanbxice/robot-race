// Single Race Button handling

var _touchHandler : touchHandler;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// set menu to char select
	_touchHandler.debugMenu = 70;

		// set to Quick race
	DataTransfer.currentCircuit = 0;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}