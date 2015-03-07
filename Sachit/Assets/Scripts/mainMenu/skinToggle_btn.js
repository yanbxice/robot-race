// Single Race Button handling

var buttonScript : UI_SlicedButton;
var _touchHandler : touchHandler;
var _botHandler : _botSelectHandler;

var activeSkin : int = 1;
var isActive : boolean = false;							// was the button graphic updated
														// total number of maps
private var isOver : boolean = false;
private var overTimer : float = 0.0;
private var currState : int = 0;

	// execute Button function
function execute () 
{
		// Toggle between set skin and default
	if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] != activeSkin)
	{
			// flag activeSkin
		DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] = activeSkin;
		
			// handle sound
		if (activeSkin == 1)
		{
			if (!DataTransfer.skinA[DataTransfer.activeBot - 1])
			{
					// play deny sound
				_touchHandler.isDenySound();
			}
			else
			{
					// play execute sound
				_touchHandler.isExecuteSound();
			}
		}
		else if (activeSkin == 2)
		{
			if (!DataTransfer.skinB[DataTransfer.activeBot - 1])
			{
					// play deny sound
				_touchHandler.isDenySound();
			}
			else
			{
						// play execute sound
				_touchHandler.isExecuteSound();
			}
		}
		else if (activeSkin == 3)
		{
			if (!DataTransfer.skinC[DataTransfer.activeBot - 1])
			{
					// play deny sound
				_touchHandler.isDenySound();
			}
			else
			{
					// play execute sound
				_touchHandler.isExecuteSound();
			}
		}
	}
	else
	{
			// revert to default
		DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] = 0;
	}

		// play execute sound in Update function
	// _touchHandler.isExecuteSound();
	
		// update skins and stats...
	_botHandler.updateStats();
}


function buttonGlow()
{
		// if current bot is locked ... show red button
	if (activeSkin == 1)
	{
		if (!DataTransfer.skinA[DataTransfer.activeBot - 1])
		{
			if (currState != 2)
			{
				buttonScript.changeState(2);
				currState = 2;
			}
		}
		else
		{
			if (currState != 1)
			{
					// change the button state
				buttonScript.changeState(1);
				currState = 1;
			}
		}
	}
	else if (activeSkin == 2)
	{
		if (!DataTransfer.skinB[DataTransfer.activeBot - 1])
		{
			if (currState != 2)
			{
				buttonScript.changeState(2);
				currState = 2;
			}
		}
		else
		{
			if (currState != 1)
			{
					// change the button state
				buttonScript.changeState(1);
				currState = 1;
			}
		}
	}
	else if (activeSkin == 3)
	{
		if (!DataTransfer.skinC[DataTransfer.activeBot - 1])
		{
			if (currState != 2)
			{
				buttonScript.changeState(2);
				currState = 2;
			}
		}
		else
		{
			if (currState != 1)
			{
					// change the button state
				buttonScript.changeState(1);
				currState = 1;
			}
		}
	}
}

function over()
{
/*
		// change if needed
	if (!isOver)
	{
			// play over sound
		_touchHandler.isOverSound();
		
			// handle the color to be shown
		if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] == activeSkin)
		{
					// change the button state
				buttonScript.changeState(0);
		}
		else
		{
					// change color if active
				buttonGlow();
		}
		
	}
		// set over mode
	isOver = true;
	
		// set over timer
	overTimer = Time.time + 0.2;
*/
}

function Update()
{
// if our current bot is this skin .. show default (and active)
// else show inactive and this skin
//DataTransfer.activeBot - 1

	if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] == activeSkin)
	{
			// revert over mode
		//if (!isActive)
		//{
				// change the button state
			isActive = true;
			
				// change color if active
			buttonGlow();
		//}
	
	}
	else
	{
			// revert over mode
		if (isActive)
		{
				// change button state
			buttonScript.changeState(0);
			currState = 0;
			isActive = false;
		}
	}

	if(isOver && (Time.time > overTimer))
	{
			// handle the color to revert to
		if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] == activeSkin)
		{
					// change color if active
				buttonGlow();
		}
		else
		{
					// change button state
				buttonScript.changeState(0);
		}
		
		isOver = false;
	}

}