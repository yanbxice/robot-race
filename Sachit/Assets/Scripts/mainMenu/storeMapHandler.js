var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;

var numMaps : int = 7;
var lastMap : int = 99;

var mapMover : Transform;

var mapRenderer : Renderer;

var mapImages : Material[] = new Material[6];

//var mapName : TextMesh;
var mapNameLoc : UILocalize;
//var mapNames : String[] = new String[8];

//var mapState : TextMesh;
var mapStateLoc : UILocalize;
//var mapStates : String[] = new String[2];

//var mapPrice : TextMesh;
var mapPriceLoc : UILocalize;
//var priceText : String;

//var mapOffer : TextMesh;
var mapOfferLoc : UILocalize;
//var offerText : String;

var buyBtn : Transform;

var menuIndex : int = 53;
var hasChange : boolean = true;

public var lockIcon : GameObject;

function Start()
{
		// set headline color
	//mapName.renderer.material.color = Color(1,1,0,1);
}

function updateScreen()
{
		// are we on the purchase all screen?
	if (_menuHandler.currMap == 6)
	{
			// Display the correct bot name
		//mapName.text = LanguageHandler.mapNames[_menuHandler.currMap];
		mapNameLoc.key = "mapNames" + (_menuHandler.currMap + 1).ToString();
		
			// Offer text
		//mapOffer.text = LanguageHandler.mapOfferText;
		mapOfferLoc.key = "mapOfferText";
		
			// hide map image
		mapMover.localPosition = Vector3(0,-20000,0);
		
			// change Text
		//mapState.text = LanguageHandler.botStates[0];
		mapStateLoc.key = "botStates0";
		
			// hide price text
		//mapPrice.text = " ";
		mapPriceLoc.key = "botStates0";

			// show buy button
		buyBtn.localPosition = Vector3(0,0,0);
	}
	else
	{
			// move map up
		mapMover.localPosition = Vector3(0,0,0);
	
			// assign material if needed
		if (_menuHandler.currMap != lastMap)
		{
				// set skin to 0
			mapRenderer.material = mapImages[_menuHandler.currMap];
			
				// stor last bot
			lastMap = _menuHandler.currMap;
		}
	
			// hide offer text
		//mapOffer.text = " ";
		mapOfferLoc.key = "botStates0";
	
			// Display the correct bot name
		//mapName.text = LanguageHandler.mapNames[_menuHandler.currMap];
		mapNameLoc.key = "mapNames" + (_menuHandler.currMap + 1).ToString();

		
			// update the state text
		if (DataTransfer.trackUnlocks[_menuHandler.currMap])
		{
				// show owned text
			//mapState.text = LanguageHandler.botStates[1];
			mapStateLoc.key = "botStates1";
			
				// hide buy button
			buyBtn.localPosition = Vector3(0,-2000,0);
				
				// hide price text
			//mapPrice.text = " ";
			mapPriceLoc.key = "botStates0";
			
			//Hide lock icon
			lockIcon.active = false;
		}
		else
		{
				// change Text
			//mapState.text = LanguageHandler.botStates[0];
			mapStateLoc.key = "botStates0";
			
				// show buy button
			buyBtn.localPosition = Vector3(0,0,0);
			
				// show price info
			//mapPrice.text = LanguageHandler.mapPrice;
			mapPriceLoc.key = "mapPrice";
			
			//Show lock icon
			lockIcon.active = true;

		}
	
	}	// end check all bots buy
	
		// trigger localize refresh
	NGUI_Handler.locUpdate = true;
	Debug.Log ("storeMap");
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