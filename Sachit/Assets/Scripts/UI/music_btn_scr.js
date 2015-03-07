// Single Race Button handling

var buttonScript : UI_SlicedButton;			// race type selector
var isOver : boolean = false;					// here isOver is used to check if music state is already changed
var wasOver : boolean = false;
private var firstRun : boolean = true;

function Start()
{	
		// get our button script
	buttonScript = (transform.GetComponent(UI_SlicedButton) as UI_SlicedButton); 
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
	}
	else
	{
		buttonScript.changeState(1);
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
				if (buttonScript.currState == 0)
				{
					buttonScript.changeState(1);
				}
			}
			else
			{
					// check if we still need to switch button state
				if (buttonScript.currState == 1)
				{
					buttonScript.changeState(0);
				}
			}
		}
		

}

