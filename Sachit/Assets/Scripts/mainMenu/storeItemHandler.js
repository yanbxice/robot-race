var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;
var _buttonScr : HUD_SingleButton;

var numItems : int = 10;
var lastItem : int = 99;

var itemMover : Transform;

//var itemName : TextMesh;
var itemNameLoc : UILocalize;
//var itemNames : String[] = new String[10];

//var itemDescription : TextMesh;
var itemDescLoc : UILocalize;
//var itemDescriptions : String[] = new String[9];

//var itemState : TextMesh;
var itemStateLoc : UILocalize;
//var itemStates : String[] = new String[2];

//var itemOffer : TextMesh;
var itemOfferLoc : UILocalize;
//var offerText : String;

//var itemOwned : TextMesh;
var itemOwnedLoc : UILocalize;

var buyBtn : Transform;

var menuIndex : int = 54;
var hasChange : boolean = true;

var itemLock : GameObject;

function Start()
{
		// set headline color
	//itemName.renderer.material.color = Color(1,1,0,1);
}

function updateScreen()
{

		// are we on the purchase all screen?
	if (_menuHandler.currItem == 9)
	{
			// Display the correct item name
		//itemName.text = LanguageHandler.itemNames[_menuHandler.currItem];	
		itemNameLoc.key = "itemNames" + (_menuHandler.currItem + 1).ToString();
		
			// Offer text
		//itemOffer.text = LanguageHandler.itemOffer;
		itemOfferLoc.key = "itemOffer";
		
			// hide item image
		itemMover.localPosition = Vector3(0,-20000,0);
		
			// change Text
		//itemState.text = LanguageHandler.itemStates[0];
		itemStateLoc.key = "itemStates1";
		
			// hide price text
		// itemDescription.text = " ";
		itemDescLoc.key = "itemDescriptions0";
		//itemOwned.text = LanguageHandler.botStates[0];
		itemOwnedLoc.key = "botStates0";

			// show buy button
		buyBtn.localPosition = Vector3(0,0,0);
	}
	else
	{
			// move map up
		itemMover.localPosition = Vector3(0,0,0);
	
	
			// hide offer text
		//itemOffer.text = " ";
		itemOfferLoc.key = "itemDescriptions0";
	
			// Display the correct item name
		//itemName.text = LanguageHandler.itemNames[_menuHandler.currItem];	
		itemNameLoc.key = "itemNames" + (_menuHandler.currItem + 1).ToString();

			// show correct description
		// itemDescription.text = LanguageHandler.itemDescriptions[_menuHandler.currItem];
		itemDescLoc.key = "itemDescriptions" + (_menuHandler.currItem + 1).ToString();
		
			// update the state text
		if (DataTransfer.pickupUnlocks[_menuHandler.currItem])
		{
				// show owned text
			//itemState.text = LanguageHandler.itemStates[0];
			itemStateLoc.key = "itemStates1";
			
				// show color image
			_buttonScr.changeState(_menuHandler.currItem * 2);
				
				// hide buy button
			buyBtn.localPosition = Vector3(0,-2000,0);
			
			//itemOwned.text = LanguageHandler.botStates[1];
			itemOwnedLoc.key = "botStates1";
			
			//Hide item lock
			itemLock.active = false;

		}
		else
		{
				// change Text
			//itemState.text = LanguageHandler.itemStates[_menuHandler.currItem];
			itemStateLoc.key = "itemStates" + (_menuHandler.currItem + 1).ToString();
			
			//itemOwned.text =  LanguageHandler.botStates[0];
			itemOwnedLoc.key = "botStates0";
			
				// show buy button
			buyBtn.localPosition = Vector3(0,0,0);
			
				// show grey image
			_buttonScr.changeState( (_menuHandler.currItem * 2) + 1 );
			
			//Show item lock
			itemLock.active = true;
		}
	
	}	// end check all bots buy
	
		// trigger localize refresh
	NGUI_Handler.locUpdate = true;
	Debug.Log ("storeITEM");
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
	}
}