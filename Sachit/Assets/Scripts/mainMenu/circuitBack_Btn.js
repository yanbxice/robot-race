// Single Race Button handling

var _touchHandler : touchHandler;

var _circuitNext : circuitNext_btn;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// going back renable the unlocks menu
	_touchHandler.debugMenu = 8;
	
		// reset circuit
	DataTransfer.currentCircuit = 1;
	_circuitNext.handleCircuit();
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}