// Single Race Button handling

var _touchHandler : touchHandler;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();
	
		// set Circuit Menu
	_touchHandler.debugMenu = 10;
	
		// set to first circuit
	DataTransfer.currentCircuit = 1;
	
		// set to electric as map image, as we are always starting with the first circuit
	DataTransfer.activeLevel = 3;

}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}