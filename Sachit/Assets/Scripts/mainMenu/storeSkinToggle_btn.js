// Single Race Button handling

var buttonScript : UI_SlicedButton;
var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;
var _botHandler : storeBotHandler;

var activeSkin : int = 1;
var isActive : boolean = false;							// was the button graphic updated
														// total number of maps
private var isOver : boolean = false;
private var overTimer : float = 0.0;
private var currState : int = 0;

public var lockIcon : GameObject;
public var skinPrice : GameObject;

	// execute Button function
function execute () 
{
	var uiLocalize : UILocalize;
		// Toggle between set skin and default
	if (_menuHandler.currSkin != activeSkin)
	{
			// flag activeSkin
		_menuHandler.currSkin = activeSkin;
		
			// handle sound
		if (activeSkin == 1)
		{
			if (!DataTransfer.skinA[_menuHandler.currBot])
			{
					// play deny sound
				_touchHandler.isDenySound();
				skinPrice.active = true;
				uiLocalize = skinPrice.GetComponent("UILocalize");
				uiLocalize.key = "itemStates9";
			}
			else
			{
					// play execute sound
				_touchHandler.isExecuteSound();
				skinPrice.active = false;
			}
		}
		else if (activeSkin == 2)
		{
			if (!DataTransfer.skinB[_menuHandler.currBot])
			{
					// play deny sound
				_touchHandler.isDenySound();
				skinPrice.active = true;
				uiLocalize = skinPrice.GetComponent("UILocalize");
				uiLocalize.key = "itemStates1";
			}
			else
			{
					// play execute sound
				_touchHandler.isExecuteSound();
				skinPrice.active = false;
			}
		}
		if (activeSkin == 3)
		{
			if (!DataTransfer.skinC[_menuHandler.currBot])
			{
					// play deny sound
				_touchHandler.isDenySound();
				skinPrice.active = true;
				uiLocalize = skinPrice.GetComponent("UILocalize");
				uiLocalize.key = "itemStates5";
			}
			else
			{
					// play execute sound
				_touchHandler.isExecuteSound();
				skinPrice.active = false;
			}
		}
	}
	else
	{
			// revert to default
		_menuHandler.currSkin = 0;
	}

		// update screen
	_botHandler.hasChange = true;
}


function buttonGlow()
{
		// if current bot is locked ... show red button
	if (activeSkin == 1)
	{
		if (!DataTransfer.skinA[_menuHandler.currBot])
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
		if (!DataTransfer.skinB[_menuHandler.currBot])
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
		if (!DataTransfer.skinC[_menuHandler.currBot])
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

}

function Update()
{
// if our current bot is this skin .. show default (and active)
// else show inactive and this skin
//DataTransfer.activeBot - 1

	if (_menuHandler.currSkin == activeSkin)
	{

				// change the button state
			isActive = true;
			
				// change color if active
			buttonGlow();

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
	
	if(activeSkin == 1)
	{
		if(DataTransfer.skinA[_menuHandler.currBot])
		{
			lockIcon.active = false;
		}
		else
		{
			lockIcon.active = true;
		}
	}
	else if(activeSkin == 2)
	{
		if(DataTransfer.skinB[_menuHandler.currBot])
		{
			lockIcon.active = false;
		}
		else
		{
			lockIcon.active = true;
		}
	}
	else if(activeSkin == 3)
	{
		if(DataTransfer.skinC[_menuHandler.currBot])
		{
			lockIcon.active = false;
		}
		else
		{
			lockIcon.active = true;
		}
	}

/*
	if(isOver && (Time.time > overTimer))
	{
			// handle the color to revert to
		if (DataTransfer.currentSkin[_menuHandler.currBot] == activeSkin)
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
*/
}