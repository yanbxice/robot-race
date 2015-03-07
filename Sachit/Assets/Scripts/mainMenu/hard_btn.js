// Single Race Button handling

var settingsHolder : settingsHolder;					// script of our settings holder
var buttonScript : HUD_SingleButton;

var isActive : boolean = false;							// was the button graphic updated
														// total number of maps

	// execute Button function
function execute () 
{
		// set diff to easy
	settingsHolder.aiDiff = 2;

}

function over()
{

}

function Update()
{
	if (DataTransfer.currentCircuit != 0)
	{
		transform.localPosition.y = -2000;
	}
	else
	{
		transform.localPosition.y = 0.08;
	}
	
		// handle button appearance
	if (settingsHolder.aiDiff == 2)
	{
			// if button not yet active .. set it to active
		if (!isActive)
		{
			buttonScript.changeState(1);
			isActive = true;
		}
	}
	else
	{
			// if button still active .. deactivate
		if (isActive)
		{
			buttonScript.changeState(0);
			isActive = false;
		}
	}
}