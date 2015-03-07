// Single Race Button handling

// var settingsHolder : settingsHolder;					// script of our settings holder
var buttonScript : UI_SlicedButton;
var _touchHandler : touchHandler;

var diff : int = 0;
var isActive : boolean = false;							// was the button graphic updated
														// total number of maps
private var isOver : boolean = false;
private var overTimer : float = 0.0;

	// execute Button function
function execute () 
{
			// set diff to easy
		DataTransfer.aiDiff = diff;
		
			// play execute sound
		_touchHandler.isExecuteSound();

// Maps are always unlocked
/*
	if (DataTransfer.trackUnlocks[(DataTransfer.activeLevel-1)] > diff)
	{
			// set diff to easy
		settingsHolder.aiDiff = diff;
		
			// play execute sound
		_touchHandler.isExecuteSound();
	}
*/
}

function over()
{
		// change if needed
	if (!isOver)
	{
			// if the currently selected map is unlocked at this difficulty ... highlight
		//if (DataTransfer.trackUnlocks[(DataTransfer.activeLevel-1)] > diff)
		//{
			buttonScript.changeState(1);
				
				// play over sound
			_touchHandler.isOverSound();
		//}
		//else
		//{	
		//	buttonScript.changeState(2);
		//	
		//		// play deny sound
		//	_touchHandler.isDenySound();
		//}
		
	}
		// set over mode
	isOver = true;
	
		// set over timer
	overTimer = Time.time + 0.2;
		
}

function Update()
{
		// revert over mode
	if (!isActive)
	{
		if(isOver && (Time.time > overTimer))
		{
			buttonScript.changeState(0);
			isOver = false;
		}
	}

		// show diff Buttons ONLY in quick race mode
	if (DataTransfer.currentCircuit != 0)
	{
		transform.localPosition.y = -2000;
	}
	else
	{
		transform.localPosition.y = 0.0;
	}

		// handle button appearance
	if (DataTransfer.aiDiff == diff)
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