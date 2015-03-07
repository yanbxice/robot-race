// Single Race Button handling

var buttonScript : UI_SlicedButton;			// race type selector
var isOver : boolean = false;					// here isOver is used to check if music state is already changed
var wasOver : boolean = false;


function Start()
{
	
		// get our button script
	buttonScript = (transform.GetComponent(UI_SlicedButton) as UI_SlicedButton); 
	
		// set initial system
	if(DataTransfer.playMusic)
	{
		isOver = false;
	}
	else
	{
		isOver = true;
	}
}


	// execute Button function
function execute () 
{
		// Toggle music
	DataTransfer.playMusic = !DataTransfer.playMusic;
}

function over()
{
	wasOver = true;
	
		// change if needed
	if(DataTransfer.playMusic)
	{
		buttonScript.changeState(0);
		isOver = false;
	}
	else
	{
		buttonScript.changeState(1);
		isOver = true;
	}
		
}

function Update()
{
		// update only if menu active...
	if (wasOver)
	{		// basically one loop delay before switching back
		wasOver = false;
	}
	else
	{
			// check if music is on (and adjust button for it)
		if(DataTransfer.playMusic)
		{
				// check if we still need to switch button state
			if (!isOver)
			{
				buttonScript.changeState(1);
				isOver = true;
			}
		}
		else
		{
				// check if we still need to switch button state
			if (isOver)
			{
				buttonScript.changeState(0);
				isOver = false;
			}
		}
	}
}

