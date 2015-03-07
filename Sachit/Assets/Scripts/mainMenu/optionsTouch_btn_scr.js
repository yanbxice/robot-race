// Single Race Button handling

var inputScript : touchHandler;						// the animation node (CamAnim)
var buttonScript : HUD_SingleButton;			// race type selector
var isOver : boolean = false;					// here isOver is used to check if music state is already changed
var index : int = 1;
// var value : float = 0.5;

function Start()
{
		// get our settings holder
	inputScript = GameObject.Find("_mainMenu_code").GetComponent(touchHandler) as touchHandler; 
	
		// get our button script
	buttonScript = (transform.GetComponent(HUD_SingleButton) as HUD_SingleButton); 
	
		// init our isOver Value and change the state
	if(DataTransfer.touchSensIndex >= index)
	{
			// if we are below our current sensIndex ... enable it
		isOver = true;
		buttonScript.changeState(1);
	}
	else
	{
		isOver = false;
		buttonScript.changeState(0);
	}
}

	// execute Button function
function execute () 
{
		// inactivate the button
	// buttonScript.changeState(1);

		// set the correct index
	DataTransfer.touchSensIndex = index;
	
		// run the sens script
	inputScript.setTouchSens();
}

function over()
{
		// set value while even sliding over
	DataTransfer.touchSensIndex = index;
	
		// run the sens script
	inputScript.setTouchSens();
}

function Update()
{
		// check if music is on (and adjust button for it)
	if(DataTransfer.touchSensIndex >= index)
	{
			// check if we still need to switch button state
		if (!isOver)
		{
			buttonScript.changeState(1);
			isOver = true;
		}
	}
	else if (isOver)
	{
			// check if we still need to switch button state
		buttonScript.changeState(0);
		isOver = false;
	}
}

