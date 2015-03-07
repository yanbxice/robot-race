// Single Race Button handling

var inputScript : touchHandler;						// the animation node (CamAnim)
var buttonScript : UI_SlicedButton;			// race type selector
var isOver : boolean = false;					// here isOver is used to check if music state is already changed
var wasOver : boolean = false;
var accText : TextMesh;
var translator : NGUI_Translator;

function Start()
{
		// get our settings holder
	inputScript = GameObject.Find("_mainMenu_code").GetComponent(touchHandler) as touchHandler; 

		// get our button script
	buttonScript = (transform.GetComponent(UI_SlicedButton) as UI_SlicedButton); 
	
		// get our translator script
	translator = transform.GetComponent(NGUI_Translator) as NGUI_Translator;
	

		// init grapihics
	if(DataTransfer.useAcc == 1)
	{
		buttonScript.changeState(1);
		// accText.text = LanguageHandler.buttonText[17];
		DataTransfer.accState = "accOn";
			// trigger localize refresh
		NGUI_Handler.locUpdate = true;
		isOver = true;
	}
	else
	{
		buttonScript.changeState(0);
		// accText.text = LanguageHandler.buttonText[18];
		DataTransfer.accState = "accOff";
			// trigger localize refresh
		NGUI_Handler.locUpdate = true;
		isOver = false;
	}
	
}

	// execute Button function
function execute () 
{

		// start the game
	inputScript.toggleAcc();
}

function over()
{
	wasOver = true;
	
		// change if needed
	if(DataTransfer.useAcc == 1)
	{
		buttonScript.changeState(0);
		//accText.text = LanguageHandler.buttonText[18];
		DataTransfer.accState = "accOff";
			// trigger localize refresh
		NGUI_Handler.locUpdate = true;
		isOver = false;
	}
	else
	{
		buttonScript.changeState(1);
		//accText.text = LanguageHandler.buttonText[17];
		DataTransfer.accState = "accOn";
			// trigger localize refresh
		NGUI_Handler.locUpdate = true;
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
		if(DataTransfer.useAcc == 1)
		{
				// check if we still need to switch button state
			if (!isOver)
			{
				buttonScript.changeState(1);
				//accText.text = LanguageHandler.buttonText[17];
				DataTransfer.accState = "accOn";
					// trigger localize refresh
				NGUI_Handler.locUpdate = true;
				isOver = true;
				Debug.Log ("optionsAcc");
			}
		}
		else
		{
				// check if we still need to switch button state
			if (isOver)
			{
				buttonScript.changeState(0);
				//accText.text = LanguageHandler.buttonText[18];
				DataTransfer.accState = "accOff";
					// trigger localize refresh
				NGUI_Handler.locUpdate = true;
				isOver = false;
				Debug.Log ("optionsAcc");
			}
		}
	}
}

