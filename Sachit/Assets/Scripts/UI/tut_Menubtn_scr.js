// Single Race Button handling

var buttonScript : UI_SlicedButton;			// race type selector
var isOver : boolean = false;					// here isOver is used to check if music state is already changed
var wasOver : boolean = false;
private var firstRun : boolean = true;
var tutTextMesh : TextMesh;
var _touchHandler : touchHandler;

var Localize : UILocalize; 

function Start()
{	
		// get our button script
	buttonScript = (transform.GetComponent(UI_SlicedButton) as UI_SlicedButton); 
	
	_touchHandler = GameObject.Find("_mainMenu_code").GetComponent(touchHandler) as touchHandler;
	
	if(DataTransfer.tutEnable)
	{
			buttonScript.changeState(1);
			//tutTextMesh.text = LanguageHandler.buttonText[14];
			
				// NGUI Localization
			try Localize.key = "tutOn"; catch (err);
				// trigger localize refresh
			NGUI_Handler.locUpdate = true;
			
	}
	else
	{
			buttonScript.changeState(0);
			//tutTextMesh.text = LanguageHandler.buttonText[15];
			
				// NGUI Localization
			try Localize.key = "tutOff"; catch (err) ;
				// trigger localize refresh
			NGUI_Handler.locUpdate = true;
	}
}



	// execute Button function
function execute () 
{
		// Toggle music
	DataTransfer.tutEnable = !DataTransfer.tutEnable;
	
	if (DataTransfer.tutEnable)
	{
		DataTransfer.tutFinish = [false, false, false, false, false, false, false];
		//tutTextMesh.text = LanguageHandler.buttonText[14];
		
			// NGUI Localization
		try Localize.key = "tutOn"; catch (err);
			// trigger localize refresh
		NGUI_Handler.locUpdate = true;
	}
	else
	{
		DataTransfer.tutFinish = [true, true, true, true, true, true, true];
		//tutTextMesh.text = LanguageHandler.buttonText[15];
		
			// NGUI Localization
		try Localize.key = "tutOff"; catch (err);
			// trigger localize refresh
		NGUI_Handler.locUpdate = true;
	}

}

function over()
{
	wasOver = true;
	
		// change if needed
	if(DataTransfer.tutEnable)
	{
		buttonScript.changeState(0);
		//tutTextMesh.text = LanguageHandler.buttonText[15];
		
			// NGUI Localization
		try Localize.key = "tutOff"; catch (err);
			// trigger localize refresh
		NGUI_Handler.locUpdate = true;
	}
	else
	{
		buttonScript.changeState(1);
		//tutTextMesh.text = LanguageHandler.buttonText[14];
		
			// NGUI Localization
		try Localize.key = "tutOn"; catch (err);
			// trigger localize refresh
		NGUI_Handler.locUpdate = true;
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
			if(DataTransfer.tutEnable)
			{
					// check if we still need to switch button state
				if (buttonScript.currState == 0)
				{
					buttonScript.changeState(1);
					//tutTextMesh.text = LanguageHandler.buttonText[14];
					
						// NGUI Localization
					try Localize.key = "tutOn"; catch (err);
						// trigger localize refresh
					NGUI_Handler.locUpdate = true;
					Debug.Log ("tut_Menubtn_scr");
				}
			}
			else
			{
					// check if we still need to switch button state
				if (buttonScript.currState == 1)
				{
					buttonScript.changeState(0);
					//tutTextMesh.text = LanguageHandler.buttonText[15];
					
						// NGUI Localization
					try Localize.key = "tutOff"; catch (err);
						// trigger localize refresh
					NGUI_Handler.locUpdate = true;
					Debug.Log ("tut_Menubtn_scr");
				}
			}
		}
		

}

