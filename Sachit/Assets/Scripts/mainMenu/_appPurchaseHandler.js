
var loadingCircle : Transform;
var loadingText : Transform;
var loadingCircleCam : Transform;
var loadingTextCam : Transform;
var loadingActive : boolean = false;

var normLabel : Transform;
//var label : TextMesh;
var labelLoc : UILocalize;
var continueBtn : Transform;
var normLabelCam : Transform;
//var labelCam : TextMesh;
var labelCamLoc : UILocalize;
var continueBtnCam : Transform;

var inApp_Handler : InApp_RR;
var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;

var sentRequest : boolean = false;

function Start()
{

}

function startPurchase()
{
		// find what we need to purchase
		
	if (_touchHandler.purchaseSum > 40000)
	{

			// buy our stuff
		inApp_Handler.buyItem(inApp_Handler.priceIndex[2]);
		
			// set to sentRequest
		sentRequest = true;
	}
	else if (_touchHandler.purchaseSum > 10000)
	{
		// buy our stuff
		inApp_Handler.buyItem(inApp_Handler.priceIndex[1]);
		
			// set to sentRequest
		sentRequest = true;
	}
	else if (_touchHandler.purchaseSum > 4000)
	{
			// buy our stuff
		inApp_Handler.buyItem(inApp_Handler.priceIndex[0]);
		
			// set to sentRequest
		sentRequest = true;
	}
	
	
			
}


function Update () 
{

		// only work if the menu is active...
	if ((_touchHandler.debugMenu == 57) || (_menuHandler.botResult) )
	{
				// first if we come from another menu (normal purchases if we had enough money)
		if (!sentRequest)
		{
				// hide stuff
			loadingCircle.localPosition = Vector3(-2000,-2000,0);
			loadingText.localPosition.y = -20000;
			loadingCircleCam.localPosition = Vector3(-2000,-2000,0);
			loadingTextCam.localPosition.y = -20000;
			loadingActive = false;
			
				// show info and button
			continueBtn.localPosition.x = 0.0;
			normLabel.localPosition.x = 0.0;
			//label.text = LanguageHandler.inAppSuccess;
			continueBtnCam.localPosition.x = 0.0;
			normLabelCam.localPosition.x = 0.0;
			//labelCam.text = LanguageHandler.inAppSuccess;
				//NGUI set label
			labelLoc.key = "inAppSuccess";
			labelCamLoc.key = "inAppSuccess";
				// trigger localize refresh
			NGUI_Handler.locUpdate = true;
			
				// clear the purchase sum
			_touchHandler.purchaseSum = 0.0;
		}
		else
		{
				// initialize Loading screen
			if (!inApp_Handler.purchaseSuccess && !inApp_Handler.purchaseFailCancel)
			{
				if (!loadingActive)
				{
						// first of all place the loading screen
					loadingCircle.localPosition = Vector3(0,0,0);
					loadingText.localPosition.y = 0;
					loadingCircleCam.localPosition = Vector3(0,0,0);
					loadingTextCam.localPosition.y = 0;
					loadingActive = true;
					
						// and hide the other stuff
					normLabel.localPosition.x = -2000;
					normLabelCam.localPosition.x = -2000;
					continueBtn.localPosition.x = -2000.0;
					continueBtnCam.localPosition.x = -2000.0;
				}
			}
			else if (inApp_Handler.purchaseFailCancel)
			{
				//Debug.Log("Fail Called");
				loadingCircle.localPosition = Vector3(-2000,-2000,0);
				loadingText.localPosition.y = -20000;
				loadingCircleCam.localPosition = Vector3(-2000,-2000,0);
				loadingTextCam.localPosition.y = -20000;
				loadingActive = false;
				
					// show info and button
				continueBtn.localPosition.x = 0.0;
				normLabel.localPosition.x = 0.0;
				//label.text = LanguageHandler.inAppFailed;
				continueBtnCam.localPosition.x = 0.0;
				normLabelCam.localPosition.x = 0.0;
				//labelCam.text = LanguageHandler.inAppFailed;
				
					//NGUI set label
				labelLoc.key = "inAppFailed";
				labelCamLoc.key = "inAppFailed";
					// trigger localize refresh
				NGUI_Handler.locUpdate = true;
				
					// clear the purchase sum
				_touchHandler.purchaseSum = 0.0;
				
			}
			else if (inApp_Handler.purchaseSuccess)
			{
				//Debug.Log("Success Called");
				loadingCircle.localPosition = Vector3(-2000,-2000,0);
				loadingText.localPosition.y = -20000;
				loadingCircleCam.localPosition = Vector3(-2000,-2000,0);
				loadingTextCam.localPosition.y = -20000;
				loadingActive = false;
				
					// show info and button
				continueBtn.localPosition.x = 0.0;
				normLabel.localPosition.x = 0.0;
				//label.text = LanguageHandler.inAppSuccess;
				continueBtnCam.localPosition.x = 0.0;
				normLabelCam.localPosition.x = 0.0;
				//labelCam.text = LanguageHandler.inAppSuccess;
				
					//NGUI set label
				labelLoc.key = "inAppSuccess";
				labelCamLoc.key = "inAppSuccess";
					// trigger localize refresh
				NGUI_Handler.locUpdate = true;

					// add Money
				PlayerPrefs.SetInt("credits", (DataTransfer.credits + _touchHandler.purchaseSum));
					// save everything
				PlayerPrefs.Save();
					// now reload that stuff
				_touchHandler.getUnlocks();
				
					// store purchase to analytics
				if (_touchHandler.purchaseSum > 40000)
				{
					Google.analytics.logEvent("purchase", "SUCCESS", "50.000");
				}
				else if (_touchHandler.purchaseSum > 14000)
				{
					Google.analytics.logEvent("purchase", "SUCCESS", "15.000");
				}
				else if (_touchHandler.purchaseSum > 4000)
				{
					Google.analytics.logEvent("purchase", "SUCCESS", "5.000");
				}
				
					// clear the purchase sum
				_touchHandler.purchaseSum = 0.0;
			}
		}	
	}
	else if (loadingActive)
	{
		loadingCircle.localPosition = Vector3(-2000,-2000,0);
		loadingText.localPosition.y = -20000;
		loadingCircleCam.localPosition = Vector3(-2000,-2000,0);
		loadingTextCam.localPosition.y = -20000;
		loadingActive = false;
	}
	
		// if active, rotate the loading circle ...
	if (loadingActive)
	{
		loadingCircle.Rotate(Vector3(0,-2,0));
		loadingCircleCam.Rotate(Vector3(0,-2,0));
	}

}