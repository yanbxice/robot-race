/*

Vertical Slide code!!!!

7	-	debug menu (GUI only)
0	-	vektor
1	-	irobot
2	-	Truk
3	-	steamball
4	-	podbot
5	-	monobot
6	-	tribot


>7	-	Touch detection enabled
8	-	atmBase
9	-	baseMenu (incl. stats resetting)
10	-	atmCircuits

11	-	Shop Root
12	-	Bot Shop Root
13	-	Map Shop Root
14	-	Pickup Shop Root

20	-	Help Menu
21	-	Options
22	-	Credits
23	-	Stats
24	-	Language screen

27 	-	Reminder screen
28	-	Language popUp


30	-	Tutorial Menu
31	-	History
32	-	Tutorial


40	-	Badge Menu

50	-	Store Menu
51	-	Bot Store

53	-	Map Store
54	-	Pickup Store

57	-	RESULT SCREEN
58	-	purchase screen
59	-	confirm screen

60	-	mapMenu

70	-	botMenu / Swipe Menu (Char selection)

80	-	playMenu

90  -   buyVerification

99  -  	restore purchase
*/

private var lastState : int = 99;				// to manage states we need to know if something has changed
var _touchHandler : touchHandler;				// the touch handler where we store the current state
var _botSelect : _botSelectHandler;
var unlockMeter : _unlockMeter;
var unlocksLive : boolean = false;

	// anim nodes we need..
var camAnim : Animation;					// camera animations
var setAnim : Animation;					// animation of the scene surroundings
var mapAnim : Animation;
var capAnim : Animation;
var statsAnim : Animation;
var botFeatureAnim : Animation;
var bot1Anim : Animation;
var bot2Anim : Animation;
var bot3Anim : Animation;
var bot4Anim : Animation;
var bot5Anim : Animation;
var bot6Anim : Animation;
var bot7Anim : Animation;
var botShineAnim : Animation;
var letterbox : Animation;
var letterboxOn : boolean = false;

	// map screen parenting transforms
var rrLogo : Transform;
var mapScreen : Transform;
var mapScreenPos : Transform;

	// bot turntable (to rotate 90)
var botFeature : Transform;

	// transforms we need
var baseMenu : Transform;

var atmBase : Transform;
var atmCircuits : Transform;
var atmStore : Transform;
var atmOptions : Transform;
var atmHelp : Transform;
var atmBadges : Transform;
var atmTutorial : Transform;
var atmHistory : Transform;
var atmTutScreen : Transform;
var atmCredits : Transform;
var atmStats : Transform;
var atmLanguage : Transform;

var storeConfirm : Transform;
var storeCrystals : Transform;
var storeRobots : Transform;
var storeMaps : Transform;
var storeItems : Transform;
var storeResult : Transform;

var demoScreen : Transform;


var botMenu : Transform;
var botStats : Transform;

var mapMenu : Transform;
var playMenu : Transform;

var initMenu : Transform;

var stateChange : boolean = false;

	// enable our purchase menus
var botConfirm : boolean = false;
var botConfirmMenu : Transform;
var botPurchase : boolean = false;
var botPurchaseMenu : Transform;
var botResult : boolean = false;
var botResultMenu : Transform;

	// handle to our reminder screen
var reminderMenu : Transform;
var reminderOn : boolean = false;

	// handle language selection
var initLangMenu : Transform;
var initLangOn : boolean = false;

	// badge screen handling
var badgeScreen : boolean = false;
var badgeMenu : Transform;
var currBadge : int = 0;

	// store handling
var currBot : int = 0;
var currSkin : int = 0;
var currItem : int = 0;
var currMap : int = 0;
var buyBot : boolean = false;
var buyAllBots : boolean = false;
var buySkin : boolean = false;
var buyMap : boolean = false;
var buyAllMaps : boolean = false;
var buyItem : boolean = false;
var buyAllItems : boolean = false;

var purchaseType : int = 0;

var isDemo : boolean = false;

function Start ()
{
		// parent the map screens to the animated scene pos..
	rrLogo.parent = mapScreenPos;
	mapScreen.parent = mapScreenPos;
}


function updateMenus()
{
		// get the current state
	var currState : int = _touchHandler.debugMenu;

	if (isDemo)
	{	
			// DEMO CONFIRMATION
		if (currState == 90)
		{
			demoScreen.localPosition.z = 0.09;		
		}
		else 
		{
			demoScreen.localPosition.z = -2.0;
		}
	}
	
		// Language Menu
	if (currState == 24)
	{
			// show menu screen
		atmLanguage.localPosition = Vector3(0,0,0);	
	}
	else
	{
			// hide menu
		atmLanguage.localPosition = Vector3(0,-2000,0);	
	}
	
		// Reminder screen
	if (currState == 27)
	{
		reminderMenu.localPosition = Vector3(0,0,0.3);
	}
	else
	{
		reminderMenu.localPosition = Vector3(0,0,-2);
	}
	
	// Lang screen
	if (currState == 28)
	{
		initLangMenu.localPosition = Vector3(0,0,0.3);
	}
	else
	{
		initLangMenu.localPosition = Vector3(0,0,-2);
	}

	
		// BASE MENU
	if ((currState == 9) && (badgeScreen))
	{
			// hide menu
		baseMenu.localPosition = Vector3(0,-20000,0);
	
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
		//badgeMenu.localPosition = Vector3(0,0,0.3);
	}
	else if ((currState == 9) && (botPurchase))
	{
			// hide menu
		baseMenu.localPosition = Vector3(0,-20000,0);
	
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,0.3);
		//badgeMenu.localPosition = Vector3(0,0,-2);
	}
	else if ((currState == 9) && (botConfirm))
	{
			// hide menu
		baseMenu.localPosition = Vector3(0,-20000,0);
	
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,0.3);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,-2);
		//badgeMenu.localPosition = Vector3(0,0,-2);
	}
	else if ((currState == 9) && (botResult))
	{
			// hide menu
		baseMenu.localPosition = Vector3(0,-20000,0);
	
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,0.3);
		//badgeMenu.localPosition = Vector3(0,0,-2);
	}
	else if (currState == 9)
	{
		reminderOn = false;
		initLangOn = false;
	
		baseMenu.localPosition = Vector3(0,0,0);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
		
			// hide purchase menus
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
		//badgeMenu.localPosition = Vector3(0,0,-2);
		
			// reInit our unlock meter
		if (!unlocksLive)
		{
			unlockMeter.checkUnlocks();
			unlocksLive = true;
		}
		
			// if we're coming back from atm, or badges
		if ( (lastState == 8) || _touchHandler.atmActive )
		{
			camAnim.Play("atm2base");
			_touchHandler.atmActive = false;
		}
			// if we're coming back from Play menu
		else if (lastState == 80)
		{
			mapAnim.Play("deActivate");
			botFeatureAnim.Play("deActivate");
			
			bot1Anim["deActivate"].time = 0.1;
			bot1Anim.Play("deActivate");
			bot2Anim["deActivate"].time = 0.05;
			bot2Anim.Play("deActivate");
			bot3Anim["deActivate"].time = 0.2;
			bot3Anim.Play("deActivate");
			bot4Anim["deActivate"].time = 0.0;
			bot4Anim.Play("deActivate");
			bot5Anim["deActivate"].time = 0.17;
			bot5Anim.Play("deActivate");
			bot6Anim["deActivate"].time = 0.12;
			bot6Anim.Play("deActivate");
			bot7Anim["deActivate"].time = 0.22;
			bot7Anim.Play("deActivate");
			botShineAnim["deActivate"].time = 0.3;
			botShineAnim.Play("deActivate");
		}
	}
	else
	{
			// if not used, hide this menu
		baseMenu.localPosition = Vector3(0,-20000,0);
		
			// set unlocsLive to inactive so that they are reupdated next time ..
		if (unlocksLive)
		{
			unlocksLive = false;
		}
	}

	
		// ATM BASE MENU
	if (currState == 8)
	{
		atmBase.localPosition = Vector3(0,0,0);
		
			// if we're coming back from mainMenu
		if (lastState == 9)
		{
			camAnim.Play("base2atm");
			
				// place botRoot correctly
			botFeature.localEulerAngles.y = 270;
		}
		else if (lastState == 70)
		{
			camAnim.Play("bot2atm");
			statsAnim["deActivate"].time = 0.166;
			statsAnim.Play("deActivate");
			botFeatureAnim.Play("deActivate");
			
			bot1Anim["deActivate"].time = 0.1;
			bot1Anim.Play("deActivate");
			bot2Anim["deActivate"].time = 0.05;
			bot2Anim.Play("deActivate");
			bot3Anim["deActivate"].time = 0.2;
			bot3Anim.Play("deActivate");
			bot4Anim["deActivate"].time = 0.0;
			bot4Anim.Play("deActivate");
			bot5Anim["deActivate"].time = 0.17;
			bot5Anim.Play("deActivate");
			bot6Anim["deActivate"].time = 0.12;
			bot6Anim.Play("deActivate");
			bot7Anim["deActivate"].time = 0.22;
			bot7Anim.Play("deActivate");
			botShineAnim["deActivate"].time = 0.3;
			botShineAnim.Play("deActivate");
			
			// hide map screen
			setAnim.Play("Bots2Map");
			//capAnim.Play("capDn");
		}
	}
	else
	{
			// if not used, hide this menu
		atmBase.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM HELP MENU
	if (currState == 20)
	{
		atmHelp.localPosition = Vector3(0,0,0);
		
			// if we're coming back from mainMenu
		if (lastState == 9)
		{
			camAnim.Play("base2atm");
		}
	}
	else
	{
			// if not used, hide this menu
		atmHelp.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM Tutorial MENU
	if (currState == 30)
	{
		atmTutorial.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		atmTutorial.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM HISTORY MENU
	if (currState == 31)
	{
		atmHistory.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		atmHistory.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM TutScreen MENU
	if (currState == 32)
	{
		atmTutScreen.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		atmTutScreen.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM Credits MENU
	if (currState == 22)
	{
		atmCredits.localPosition = Vector3(0,0,0);
		if (!letterboxOn)
		{
			letterboxOn = true;
			letterbox.Play("letterbox");			
		}
	}
	else
	{
			// if not used, hide this menu
		atmCredits.localPosition = Vector3(0,-20000,0);
		if (letterboxOn)
		{
			letterboxOn = false;
			letterbox.Play("letterboxOut");			
		}
	}
	
		// ATM Stats MENU
	if (currState == 23)
	{
		atmStats.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		atmStats.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM Options MENU
	if (currState == 21)
	{
		atmOptions.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		atmOptions.localPosition = Vector3(0,-20000,0);
	}


		// ATM BADGE MENU
	if (currState == 40)
	{
		atmBadges.localPosition = Vector3(0,0,0);
		
			// if we're coming back from mainMenu
		if (lastState == 9)
		{
			camAnim.Play("base2atm");
		}
	}
	else
	{
			// if not used, hide this menu
		atmBadges.localPosition = Vector3(0,-20000,0);
	}

	
		// ATM CIRCUIT MENU
	if (currState == 10)
	{
		atmCircuits.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		atmCircuits.localPosition = Vector3(0,-20000,0);
	}
	
	
		
		// ATM STORE MENU
	if (currState == 50)
	{

		atmStore.localPosition = Vector3(0,0,0);
		
			// if we're coming back from mainMenu
		if (lastState == 9)
		{
			camAnim.Play("base2atm");
		}
		else if (reminderOn)
		{
			reminderOn = false;
			camAnim.Play("base2atm");
		}
	}
	else
	{
			// if not used, hide this menu
		atmStore.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM ROBOTSTORE MENU
	if (currState == 51)
	{
		storeRobots.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		storeRobots.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM MAPSTORE MENU
	if (currState == 53)
	{
		storeMaps.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		storeMaps.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM ITEMSTORE MENU
	if (currState == 54)
	{
		storeItems.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		storeItems.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM CRYSTALS MENU
	if (currState == 58)
	{
		storeCrystals.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		storeCrystals.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM Confirm MENU
	if (currState == 59)
	{
		storeConfirm.localPosition = Vector3(0,0,0);
	}
	else
	{
			// if not used, hide this menu
		storeConfirm.localPosition = Vector3(0,-20000,0);
	}
	
		// ATM Result MENU
	if (currState == 57)
	{
		storeResult.localPosition = Vector3(0,0,0);
	}
	else
	{
		storeResult.localPosition = Vector3(0,-20000,0);
	}
	
	
		// BOT SELECT MENU
	if ( (botPurchase) && (currState == 70) )
	{
			// hide menus
		botMenu.localPosition = Vector3(0,-20000,0);
		botStats.localPosition = Vector3(0,-20000,0);
		
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,0.3);
	}
	else if ( (botConfirm) && (currState == 70) )
	{
			// hide menus
		botMenu.localPosition = Vector3(0,-20000,0);
		botStats.localPosition = Vector3(0,-20000,0);
		
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,0.3);
		botResultMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
	}
	else if ( (botResult) && (currState == 70) )
	{
			// hide menus
		botMenu.localPosition = Vector3(0,-20000,0);
		botStats.localPosition = Vector3(0,-20000,0);
		
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,0.3);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
	}
	else if (currState == 70)
	{
		botMenu.localPosition = Vector3(0,0,0);
		botStats.localPosition = Vector3(0,0,0);
		
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
		
		if ( (lastState == 10) || (lastState == 8) )
		{
				// coming from ATM
			camAnim.Play("atm2bot");
			statsAnim["activate"].time = 0.166;
			statsAnim.Play("activate");
			botFeatureAnim.Play("activate");
			
			bot1Anim["activate"].time = 0.1;
			bot1Anim.Play("activate");
			bot2Anim["activate"].time = 0.05;
			bot2Anim.Play("activate");
			bot3Anim["activate"].time = 0.2;
			bot3Anim.Play("activate");
			bot4Anim["activate"].time = 0.0;
			bot4Anim.Play("activate");
			bot5Anim["activate"].time = 0.17;
			bot5Anim.Play("activate");
			bot6Anim["activate"].time = 0.12;
			bot6Anim.Play("activate");
			bot7Anim["activate"].time = 0.22;
			bot7Anim.Play("activate");
			botShineAnim["activate"].time = 0.3;
			botShineAnim.Play("activate");
			
				// hide map screen
			setAnim.Play("Map2Bots");
			//capAnim.Play("capUp");
			
				
				// place botRoot correctly
			botFeature.localEulerAngles.y = 270;
		}
		else if (lastState == 60)
		{
				// coming from map menu
			camAnim.Play("map2bot");
			mapAnim.Play("deActivate");
			statsAnim["activate"].time = 0.166;
			statsAnim.Play("activate");
			/*
			botFeatureAnim.Play("activate");
			
			bot1Anim["activate"].time = 0.1;
			bot1Anim.Play("activate");
			bot2Anim["activate"].time = 0.05;
			bot2Anim.Play("activate");
			bot3Anim["activate"].time = 0.2;
			bot3Anim.Play("activate");
			bot4Anim["activate"].time = 0.0;
			bot4Anim.Play("activate");
			bot5Anim["activate"].time = 0.17;
			bot5Anim.Play("activate");
			bot6Anim["activate"].time = 0.12;
			bot6Anim.Play("activate");
			bot7Anim["activate"].time = 0.22;
			bot7Anim.Play("activate");
			botShineAnim["activate"].time = 0.3;
			botShineAnim.Play("activate");
			*/
			
			setAnim.Play("Map2Bots");
			//capAnim.Play("capUp");
			
				// place botRoot correctly
			botFeature.localEulerAngles.y = 270;
		}
		
			// update stats and buttons
		_botSelect.updateStats();
	}
	else if(currState == 8)
	{
			// if not used, hide this menu
		botMenu.localPosition = Vector3(0,-20000,0);
		// botStats.localPosition = Vector3(0,-20000,0);
		
		// botConfirmMenu.localPosition = Vector3(0,0,-2);
		// botPurchaseMenu.localPosition = Vector3(0,0,-2);
	}
	else
	{
			// if not used, hide this menu
		botMenu.localPosition = Vector3(0,-20000,0);
		// HIDE FOR ANIM botStats.localPosition = Vector3(0,-20000,0);
		
		// botConfirmMenu.localPosition = Vector3(0,0,-2);
		// botPurchaseMenu.localPosition = Vector3(0,0,-2);
	}



	
		// MAP SELECT MENU
	if ( (botPurchase) && (currState == 60) )
	{
			// hide menus
		mapMenu.localPosition = Vector3(0,-20000,0);
		
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,0.3);
	}
	else if ( (botConfirm) && (currState == 60) )
	{
			// hide menus
		mapMenu.localPosition = Vector3(0,-20000,0);
		
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,0.3);
		botResultMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
	}
	else if ( (botResult) && (currState == 60) )
	{
			// hide menus
		mapMenu.localPosition = Vector3(0,-20000,0);
		
			// show purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,0.3);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
	}
	else if (currState == 60)
	{
		mapMenu.localPosition = Vector3(0,0,0);
		
			// hide the purchase menu
		botConfirmMenu.localPosition = Vector3(0,0,-2);
		botResultMenu.localPosition = Vector3(0,0,-2);
		botPurchaseMenu.localPosition = Vector3(0,0,-2);
		
		if (lastState == 70)
		{
				// coming from Bots
			camAnim.Play("bot2map");
			mapAnim.Play("activate");
				// alter start time
			statsAnim["deActivate"].time = 0.166;
			statsAnim.Play("deActivate");
			
				// show map screen
			setAnim.Play("Bots2Map");
			//capAnim.Play("capDn");
			
				
				// place botRoot 90 degrees
			botFeature.localEulerAngles.y = 30;
		}
	}
	else
	{
			// if not used, hide this menu
		mapMenu.localPosition = Vector3(0,-20000,0);
	}
	
		// PLAY MENU
	if (currState == 80)
	{
		playMenu.localPosition = Vector3(0,0,0);
		
		if (lastState == 60)
		{
				// coming from Maps
			camAnim.Play("map2base");
		}
		else if (lastState == 70)
		{
				// coming from botScreen (circuit)
			camAnim.Play("bot2base");
			mapAnim.Play("activate");
			setAnim.Play("Bots2Map");
			
			statsAnim["deActivate"].time = 0.166;
			statsAnim.Play("deActivate");
			
				// place botRoot 90 degrees
			botFeature.localEulerAngles.y = 30;
			//capAnim.Play("capDn");
		}
	}
	else
	{
			// if not used, hide this menu
		playMenu.localPosition = Vector3(0,-20000,0);
	}


		// in the end, update our lastState
	lastState = _touchHandler.debugMenu;
}


function Update () 
{
		// whenever we have a change, update
	if ((_touchHandler.debugMenu != lastState) || stateChange )
	{
		updateMenus();
		stateChange = false;
	}

}