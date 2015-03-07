// Single Race Button handling

var buttonScript : UI_SlicedButton;			// race type selector
var isOver : boolean = false;					// here isOver is used to check if music state is already changed
var wasOver : boolean = false;
var inputScript : pInput;
//var tutText : TextMesh;
var tutLocalized : UILocalize;
var inTutorial : boolean = false;

var Overlay_A_anim : HUD_SingleButton;
var Overlay_B_anim : HUD_SingleButton;

private var firstRun : boolean = true;


function Start()
{	
		// get our button script
	buttonScript = (transform.GetComponent(UI_SlicedButton) as UI_SlicedButton); 
	
	inputScript = GameObject.Find("Player_Construct").GetComponent(pInput) as pInput;
	
	// check if music is on (and adjust button for it)
	if(DataTransfer.tutEnable)
	{
			buttonScript.changeState(1);
			//tutText.text = LanguageHandler.buttonText[14];
			tutLocalized.key = "tutOn";
				// direct update to button
			tutLocalized.Localize();
	}
	else
	{
			buttonScript.changeState(0);
			//tutText.text = tutText.text = LanguageHandler.buttonText[15];
			tutLocalized.key = "tutOff";
				// direct update to button
			tutLocalized.Localize();
	}
}



	// execute Button function
function execute () 
{
		// Toggle music
	//DataTransfer.currTut = 99;
	
	DataTransfer.tutEnable = !DataTransfer.tutEnable;
	
	
	if (DataTransfer.tutEnable)
	{
		DataTransfer.tutFinish = [false, false, false, false, false, false, false];
		inputScript.runTuts();
	}
	else
	{
		DataTransfer.tutFinish = [true, true, true, true, true, true, true];
		Overlay_A_anim.playAnim = false;
		Overlay_B_anim.playAnim = false;
	}
	
	if (inTutorial)
	{
		inputScript.btnResume();
		Overlay_A_anim.playAnim = false;
		Overlay_B_anim.playAnim = false;
	}
}

function over()
{
	wasOver = true;

		// change if needed
	if(DataTransfer.tutEnable)
	{
		buttonScript.changeState(0);
		//tutText.text = tutText.text = LanguageHandler.buttonText[15];
		tutLocalized.key = "tutOff";
			// direct update to button
			tutLocalized.Localize();
	}
	else
	{
		buttonScript.changeState(1);
		//tutText.text = LanguageHandler.buttonText[14];
		tutLocalized.key = "tutOn";
			// direct update to button
		tutLocalized.Localize();
	}
	
}

function Update()
{
		// only if tut active
	if (!inputScript.gameEnabled)
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
					//tutText.text = LanguageHandler.buttonText[14];
					tutLocalized.key = "tutOn";
						// direct update to button
					tutLocalized.Localize();
					//Debug.Log ("tut_btn_scr");
				}
			}
			else
			{
					// check if we still need to switch button state
				if (buttonScript.currState == 1)
				{
					buttonScript.changeState(0);
					//tutText.text = LanguageHandler.buttonText[15];
					tutLocalized.key = "tutOff";
						// direct update to button
					tutLocalized.Localize();
					//Debug.Log ("tut_btn_scr");
				}
			}
		}
	}

}

