// Single Race Button handling

var inputScript : pInput;						// the animation node (CamAnim)
var buttonScript : UI_SlicedButton;			// race type selector
//var buttonText : TextMesh;
//var buttonLocalized : UILocalize;
var buttonLocalized : UILocalize;
var isOver : boolean = false;					// here isOver is used to check if music state is already changed

function Start()
{
		// get our settings holder
	var playerConstruct = GameObject.Find("Player_Construct");
	inputScript = (playerConstruct.GetComponent(pInput) as pInput); 

		// get our button script
	buttonScript = (transform.GetComponent(UI_SlicedButton) as UI_SlicedButton); 
	

		// init grapihics
	if(DataTransfer.useAcc == 1)
	{
		buttonScript.changeState(1);
		//buttonText.text = LanguageHandler.buttonText[17];
		buttonLocalized.key = "accOn";
			// direct update to button
		buttonLocalized.Localize();
		//NGUI_Handler.locUpdate = true;
		
		
		isOver = true;
	}
	else
	{
		buttonScript.changeState(0);
		//buttonText.text = LanguageHandler.buttonText[18];
		buttonLocalized.key = "accOff";
			// direct update to button
		buttonLocalized.Localize();
		//NGUI_Handler.locUpdate = true;
		isOver = false;
	}
	
}

function toggleAcc()
{
	if (DataTransfer.useAcc == 1)
	{
		DataTransfer.useAcc = 0;
	}
	else
	{
		DataTransfer.useAcc = 1;
	}
}


	// execute Button function
function execute () 
{

		// start the game
	toggleAcc();
}

function over()
{
		// change if needed
	if (!isOver)
	{
		buttonScript.changeState(1);
	}
	else
	{
		buttonScript.changeState(0);
	}
		
}

function Update()
{
	// update only if menu active...
	if (!inputScript.gameEnabled)
	{
		
			// check if music is on (and adjust button for it)
		if(DataTransfer.useAcc == 1)
		{
				// check if we still need to switch button state
			if (!isOver)
			{
				buttonScript.changeState(1);
				//buttonText.text = LanguageHandler.buttonText[17];
				buttonLocalized.key = "accOn";
					// direct update to button
				buttonLocalized.Localize();
				//NGUI_Handler.locUpdate = true;
				isOver = true;
				
			}
		}
		else
		{
				// check if we still need to switch button state
			if (isOver)
			{
				buttonScript.changeState(0);
				//buttonText.text = LanguageHandler.buttonText[18];
				buttonLocalized.key = "accOff";
					// direct update to button
				buttonLocalized.Localize();
				//NGUI_Handler.locUpdate = true;
				isOver = false;
				
			}
		}
	}
}

