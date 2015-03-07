var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;

var numBots : int = 8;
//var currBot : int = 0;
var lastBot : int = 99;
//var currSkin : int = 0;

var botRotator : Transform;
var botGarage : Transform;
var botMeshes : Transform[] = new Transform[7];

var botRenderers : Renderer[] = new Renderer[7];
var skinDef : Material[] = new Material[7];
var skinA : Material[] = new Material[7];
var skinB : Material[] = new Material[7];
var skinC : Material[] = new Material[7];

//var botName : TextMesh;
//var botNames : String[] = new String[8];
var botNameLoc : UILocalize;

// var botState : TextMesh;
// var botStates : String[] = new String[2];
var botStateLoc : UILocalize;

//var botPrice : TextMesh;
//var priceText : String;
var botPriceLoc : UILocalize;

//var botOffer : TextMesh;
//var offerText : String;
var botOfferLoc : UILocalize;

var buyBtn : Transform;
var skinBtns : Transform;

var menuIndex : int = 51;
var hasChange : boolean = true;

function Start()
{
		// set headline color
	//botName.renderer.material.color = Color(1,1,0,1);
}

function updateScreen()
{

		// make sure that when switching bots we always start with skin 0
	if (_menuHandler.currBot != lastBot)
	{
			// set skin to 0
		_menuHandler.currSkin = 0;
		
			// stor last bot
		lastBot = _menuHandler.currBot;
	}

		// place the correct bot, hide the rest
	for (var i = 0; i < 7; i++)
	{
		if (i == _menuHandler.currBot)
		{
			botMeshes[i].parent = botRotator;
			botMeshes[i].localPosition = Vector3(0,0,0);
			botMeshes[i].localEulerAngles = Vector3(0,0,0);
			botMeshes[i].localScale = Vector3(1,1,1);
		}
		else
		{
			botMeshes[i].parent = botGarage;
			botMeshes[i].localPosition = Vector3(0,0,0);
			botMeshes[i].localEulerAngles = Vector3(0,0,0);
		}
	}

		// if bot is set to 7, show purchase all info
	if (_menuHandler.currBot == 7)
	{
			// Display the correct bot name
		// botName.text = LanguageHandler.botNames[_menuHandler.currBot];
		botNameLoc.key = "botNames" + (_menuHandler.currBot + 1).ToString();

		
			// Offer text
		//botOffer.text = LanguageHandler.botOfferText;
		botOfferLoc.key = "botOfferText1";
		
			// hide skin buttons
		skinBtns.localPosition = Vector3(0,-20000,0);
		
			// change Text
		// botState.text = LanguageHandler.botStates[0];
		botStateLoc.key = "botStates0";
		
			// hide price text
		//botPrice.text = " ";
		botPriceLoc.key = "botPrice0";
		
			// show buy button
		buyBtn.localPosition = Vector3(0,0,0);
	}
	else
	{
			// hide offer text
		//botOffer.text = " ";
		botOfferLoc.key = "botOfferText0";
	
			// Display the correct bot name
		// botName.text = LanguageHandler.botNames[_menuHandler.currBot];	
		botNameLoc.key = "botNames" + (_menuHandler.currBot + 1).ToString();

		

			// set the selected skin
		if (_menuHandler.currSkin == 0)
		{
			botRenderers[_menuHandler.currBot].material = skinDef[_menuHandler.currBot];
		}
		else if (_menuHandler.currSkin == 1)
		{
			botRenderers[_menuHandler.currBot].material = skinA[_menuHandler.currBot];
		}
		else if (_menuHandler.currSkin == 2)
		{
			botRenderers[_menuHandler.currBot].material = skinB[_menuHandler.currBot];
		}
		else
		{
			botRenderers[_menuHandler.currBot].material = skinC[_menuHandler.currBot];
		}
		
			// update the state text
		if (DataTransfer.botUnlocks[_menuHandler.currBot])
		{
				// change Text
			if (_menuHandler.currSkin == 0)
			{
					// show owned text
				//botState.text = LanguageHandler.botStates[1];
				botStateLoc.key = "botStates1";
				
					// hide buy button
				buyBtn.localPosition = Vector3(0,-2000,0);
				
					// hide price text
				//botPrice.text = " ";
				botPriceLoc.key = "botPrice0";
			}
				// handle skin A
			else if (_menuHandler.currSkin == 1)
			{
					// check for unlock
				if(DataTransfer.skinA[_menuHandler.currBot])
				{
						// show message
					//botState.text = LanguageHandler.botStates[1];
					botStateLoc.key = "botStates1";
					
						// hide buy button
					buyBtn.localPosition = Vector3(0,-2000,0);
				}
				else
				{
						// show message
					//botState.text = LanguageHandler.botStates[0];
					botStateLoc.key = "botStates0";
					
						// hide buy button
					buyBtn.localPosition = Vector3(0,0,0);
				}
			}
				// handle skin B
			else if (_menuHandler.currSkin == 2)
			{
					// check for unlock
				if(DataTransfer.skinB[_menuHandler.currBot])
				{
						// show message
					//botState.text = LanguageHandler.botStates[1];
					botStateLoc.key = "botStates1";
					
						// hide buy button
					buyBtn.localPosition = Vector3(0,-2000,0);
				}
				else
				{
						// show message
					//botState.text = LanguageHandler.botStates[0];
					botStateLoc.key = "botStates0";
					
						// hide buy button
					buyBtn.localPosition = Vector3(0,0,0);
				}
			}
				// handle skin C
			else if (_menuHandler.currSkin == 3)
			{
					// check for unlock
				if(DataTransfer.skinC[_menuHandler.currBot])
				{
						// show message
					//botState.text = LanguageHandler.botStates[1];
					botStateLoc.key = "botStates1";
					
						// hide buy button
					buyBtn.localPosition = Vector3(0,-2000,0);
				}
				else
				{
						// show message
					//botState.text = LanguageHandler.botStates[0];
					botStateLoc.key = "botStates0";
					
						// hide buy button
					buyBtn.localPosition = Vector3(0,0,0);
				}
			}
			
				// show skin buttons
			skinBtns.localPosition = Vector3(0,0,0);
		}
		else
		{
				// change Text
			//botState.text = LanguageHandler.botStates[0];
			botStateLoc.key = "botStates0";
			
				// hide skin buttons
			skinBtns.localPosition = Vector3(0,-20000,0);
			
				// show buy button
			buyBtn.localPosition = Vector3(0,0,0);
			
			if (_menuHandler.currSkin == 0)
			{
				//botPrice.text = LanguageHandler.botPrice;
				botPriceLoc.key = "botPrice1";
			}
		}
			
	}	// end check all bots buy
	
		// trigger localize refresh
	NGUI_Handler.locUpdate = true;
	Debug.Log ("storeBot");
		// unflag hasChange
	hasChange = false;	
}


function Update () 
{
		// only update if menu active
	if (_touchHandler.debugMenu == menuIndex)
	{
			// init the current bot display
		if (hasChange)
		{
			updateScreen();
		}
		
			// rotate the active mesh
		botRotator.Rotate(Vector3(0, (-1.0), 0) );
		botRotator.localScale = Vector3(1,1,1);
	
	}
}