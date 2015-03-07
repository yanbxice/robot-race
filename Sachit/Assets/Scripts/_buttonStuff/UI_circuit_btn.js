// Circuit Button code

var spriteHandling : UI_ImageButton;
var circuitsRoot : Transform;					// race type selector
var _touchHandler : touchHandler;
var buttonAnim : Animation;

var unlocked : boolean = false;
// Circuit specific

var circuitNo : int;

function Start()
{
		// if this circuit is not unlocked, init locked image
	if (DataTransfer.circuitUnlocks < circuitNo)
	{
		spriteHandling.changeState(1);
		unlocked = false;
	}
	else
	{
		spriteHandling.changeState(0);
		unlocked = true;
	}
}

function Update()
{
	if (DataTransfer.circuitUnlocks < circuitNo)
	{
		if (unlocked)
		{
			spriteHandling.changeState(1);
			unlocked = false;
		}
	}
	else
	{
		if (!unlocked)
		{
			spriteHandling.changeState(0);
			unlocked = true;
		}
	}
}

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

	if (DataTransfer.circuitUnlocks < circuitNo)
	{
		// not unlocked
	}
	else
	{
			// close debug menu
		_touchHandler.debugMenu = 70;
				
			// set the circuit
		DataTransfer.currentCircuit = circuitNo;
	}
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}

function OnTriggerEnter ()
{
	//buttonAnim.Play();
}