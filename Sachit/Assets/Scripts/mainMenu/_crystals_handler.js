
var loadingCircle : Transform;
var loadingText : Transform;
var loadingCircleCam : Transform;
var loadingTextCam : Transform;
var loadingActive : boolean = false;

var purchaseButtons : Transform;
var purchaseButtonsCam : Transform;
var normLabel : Transform;
var normLabelCam : Transform;
var errorLabel : Transform;
var errorLabelCam : Transform;

var waiting : boolean = true;
var canPurchase : boolean = true;
var hasProducts : boolean = false;

var inApp_Handler : InApp_RR;
var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;

var sentRequest : boolean = false;

//var buttonText : String[] = new String[3] ;
//var buttonLabels : TextMesh[] = new TextMesh[3];
//var buttonLabelsCam : TextMesh[] = new TextMesh[3];

var buttonLocal : UILocalize[] = new UILocalize[3];
var buttonLocalCam : UILocalize[] = new UILocalize[3];


function Start()
{
	//buttonText = LanguageHandler.inAppText;
}


function Update () 
{

		// only work if the menu is active...
	if (_menuHandler.botPurchase || _touchHandler.debugMenu == 58)
	{
				// first send out our requests ...
		if (!sentRequest)
		{
			sentRequest = true;
		
			inApp_Handler.checkCanMakePayment();
		
			inApp_Handler.getProducts();
		
		}
		else
		{
				// if canMakePurchase is still false while we did request the state ... we can't purchase
			if (!inApp_Handler.canMakePurchase && inApp_Handler.purchaseRequested)
			{
				canPurchase = false;
				waiting = false;
			}
			else if (inApp_Handler.gotProducts)
			{
				hasProducts = true;
				waiting = false;
			}
			else if (inApp_Handler.noProducts)
			{
				canPurchase = false;
				waiting = false;
			}
			
				// initialize Loading screen
			if (!loadingActive && waiting)
			{
					// first of all place the loading screen
				loadingCircle.localPosition = Vector3(0,0,0);
				loadingText.localPosition.y = 0;
				loadingCircleCam.localPosition = Vector3(0,0,0);
				loadingTextCam.localPosition.y = 0;
				loadingActive = true;
				
					// and hide the other stuff
				purchaseButtons.localPosition = Vector3(-2000,-2000,0);
				normLabel.localPosition.x = -2000;
				errorLabel.localPosition.x = -2000;
				purchaseButtonsCam.localPosition = Vector3(-2000,-2000,0);
				normLabelCam.localPosition.x = -2000;
				errorLabelCam.localPosition.x = -2000;
			}
				// if for some reason we can't make a purchase
			else if (!canPurchase)
			{
					// hide our loading circle
				loadingCircle.localPosition = Vector3(-2000,-2000,0);
				loadingText.localPosition.y = -20000;
				loadingCircleCam.localPosition = Vector3(-2000,-2000,0);
				loadingTextCam.localPosition.y = -2000;
				loadingActive = false;
				
					// show our error screen
				purchaseButtons.localPosition = Vector3(-2000,-2000,0);
				normLabel.localPosition.x = -2000;
				errorLabel.localPosition.x = 0;
				purchaseButtonsCam.localPosition = Vector3(-2000,-2000,0);
				normLabelCam.localPosition.x = -2000;
				errorLabelCam.localPosition.x = 0;
			}
				// purchase is possible
			else if (hasProducts)
			{
					// hide our loading circle
				loadingCircle.localPosition = Vector3(-2000,-2000,0);
				loadingText.localPosition.y = -20000;
				loadingCircleCam.localPosition = Vector3(-2000,-2000,0);
				loadingTextCam.localPosition.y = -2000;
				loadingActive = false;
				
					// show our error screen
				purchaseButtons.localPosition = Vector3(0,0,0);
				normLabel.localPosition.x = 0;
				errorLabel.localPosition.x = -2000;
				purchaseButtonsCam.localPosition = Vector3(0,0,0);
				normLabelCam.localPosition.x = 0;
				errorLabelCam.localPosition.x = -2000;
				
					// adjust labels of our buttons 
					/*
				buttonLabels[0].text = buttonText[0] + inApp_Handler.priceSort[0];
				buttonLabels[1].text = buttonText[1] + inApp_Handler.priceSort[1];
				buttonLabels[2].text = buttonText[2] + inApp_Handler.priceSort[2];
				
				buttonLabelsCam[0].text = buttonText[0] + inApp_Handler.priceSort[0];
				buttonLabelsCam[1].text = buttonText[1] + inApp_Handler.priceSort[1];
				buttonLabelsCam[2].text = buttonText[2] + inApp_Handler.priceSort[2];
				*/
				
					// adjust our labels NGUI
				buttonLocal[0].key = "inAppText1";
				buttonLocal[0].suffix = inApp_Handler.priceSort[0];
				buttonLocal[1].key = "inAppText2";
				buttonLocal[1].suffix = inApp_Handler.priceSort[1];
				buttonLocal[2].key = "inAppText3";
				buttonLocal[2].suffix = inApp_Handler.priceSort[2];
				
				buttonLocalCam[0].key = "inAppText1";
				buttonLocalCam[0].suffix = inApp_Handler.priceSort[0];
				buttonLocalCam[1].key = "inAppText2";
				buttonLocalCam[1].suffix = inApp_Handler.priceSort[1];
				buttonLocalCam[2].key = "inAppText3";
				buttonLocalCam[2].suffix = inApp_Handler.priceSort[2];
				
								
					// trigger localize refresh
				NGUI_Handler.locUpdate = true;
				Debug.Log ("crystals:handler");
					
			}
		}	
	}
	else if (loadingActive)
	{
		loadingCircle.localPosition = Vector3(-2000,-2000,0);
		loadingText.localPosition.y = -20000;
		loadingCircleCam.localPosition = Vector3(-2000,-2000,0);
		loadingTextCam.localPosition.y = -2000;
		loadingActive = false;
	}
	
		// if active, rotate the loading circle ...
	if (loadingActive)
	{
		loadingCircle.Rotate(Vector3(0,-2,0));
		loadingCircleCam.Rotate(Vector3(0,-2,0));
	}

}