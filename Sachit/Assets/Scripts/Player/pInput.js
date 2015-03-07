// ##########################################
//
//	Character control script for robot race
//
//	ToDo:
//
//		- Add inactive state to transform controls (but only when GUI texture is final)
//		
//		DONE - add second timer to transform controls, giving the cameras a few seconds to get in position before transforming again...
//
//		DONE - adapt transform controls for touch steering
//
//		DONE - gradual input for touch steering ....
//
//		- Tweak start delay code placement
//
//		- !!! IMPORTANT !! Try Buttons vie Raycast check instead of complex if Statements! Replace long if/else statements with case
//
//		CHECK MY NOTES ON HANDLING MOVEMENT ... Add after those three:
//			ADD WALL COLLISION AND SPEEDPLANES HANDLING
//			ADD CHECKPOINTS/WAYPOINTS ... !!!
//			TWEAK DEADZONE !!!!
//
//	##########################################

// var teststeering : float = 0.0;

// var fpsCounter : int = 0;
// var fpsTimer : float = 0.0;
// var enableMusic : boolean = true;
var iPhoneCtls : boolean = false;
	// this counter counts active loops ... so hitting controls can only be done after some time ...
var loopCounter : int = 0;
private var nextRaceSlots : int[] = new int[7];
private var nextRacePos : int;

// Level Init stuff ...
var loadScreen : GameObject;
private var guiFlags : GUI_Flags;									// get access to the GUI system

// #####	SETUP VARs	#####

	// define # of ai robots here ... (and instantiate AI automatically....)
var moveScript : pMove;		//player_construct

var aiRobots : int = 0;
var HUD_Cam : Camera;				// the HUD Cam 2D camera

var startMusic : AudioSource;

	// get the button scripts ...
// var HUD_Slide_btn : HUD_SingleButton;		// the HUD button script ...
// var HUD_Pause_btn : HUD_SingleButton;		// the HUD button script ...
// var HUD_Action_btn : HUD_SingleButton;		// the HUD button script ...
// var HUD_Jump_btn : HUD_SingleButton;		// the HUD button script ...

	// HUD state Buttons
private var HUD_Action : boolean = false;		// state of the action button
private var HUD_Jump : boolean = false;			// state of the Jump button

	// var HUD_Pause : boolean = false;
private var HUD_Slide : boolean = false;
//private var pauseTimer : float = 1.0;			// initial pause timer



//!!!!!! -> AI

	// Button timers
private var slideTimer : float = 0.0;			// timer for the slide touch registering .. buttons gehen erst einen cycle nach loslassen aus ...
private var jumpTimer : float = 0.0;			// timer for jump registering (turn jump button off after jump)

	// check for double tap on brake ...
private var lastTouch : float = 0.0;
private var touchTime : float = 0.0;
var nextTouch : float = 0.0;

// var iPhoneCtls = 0;							// are we using the iPhone controls??
var accWheel : boolean = true;				// type of accelerometer steering (wheel or bank)

//	###################################
//	###################################
//	###################################

	// add deadzone and sensitivity to level settings holder
private var deadzone : float = 0.05;			// the deadzone for inputs ...
private var sensitivity : float= 2.0;		// our steering sensitivity
var touchSens : float = 1.0;		// touch sensitivity

	// Screen / Touch handling variables
private var sWidth: float;			// get screen width and height
private var widthThird : float;
private var sHeight: float;
private var invScreenRatio : float = 1.0;
private var itemScale : float = 1.0;

	// touch detection raster
var rasterColOne : float;
var rasterColTwo : float;
var rasterRowHalf : float;
var rasterRowOne : float;
var rasterRowTwo : float;
var rasterRowTop : float;

	// badge display stuff
private var badgesIcons : Transform;
var showEnd : Transform;
var gameBeat : boolean = false;
private var circuitTrn : Transform;
private var circuitScr : HUD_SingleButton;


private var widthRatio: float;			// I'm basing all my GUI textures and touch input on the iPhone 4's resolution of 960 x 640. I'm using a ratio multyplier to adjust to other screens for now
private var heightRatio: float;

private	var doSlide : int = 0;						// flag, do we slide???
private var steerLeft : boolean = true;				// I'm simply adding up the hits on the steering from zero to max. When changing direction, start with 0 again! Fist tap is always a start
private var steerRight : boolean = true;			// I'm simply adding up the hits on the steering from zero to max. When changing direction, start with 0 again! Fist tap is always a start


private var horizTouch : float = 0.0;								// the horiz input for gradual increase ..

	// game enabled ... to pause the game and enter menu ...
// var pausedTime : float = 0.0;								// time we are in pause mode
var startPause : boolean = false;							// the game is paused at the beginning
// private var controlsEnabled : boolean = false;

private var pauseEnterTime : float = 0.0;							// the time we enter pause mode
var gameEnabled : boolean = true;


	// accelerometer input
private var dir : Vector3 = Vector3.zero;					// for handling the acceleration ...
var tiltCam : Transform;									// store the actual camera for tilting...
private var accFilter : float = 0.6;						// accelerometer filtering

	// accelerometer implement manual filter over 3 loops ...
private var currMinus1InputX : float = 0.0;
private var currMinus2InputX : float = 0.0;
private var currMinus1InputZ : float = 0.0;
private var currMinus2InputZ : float = 0.0;

	// Targetting stuff
var playerTrns : Transform;
var myTarget : Transform;
var HUD_Reticule : Transform;
var minimap : Transform;
var viewCamera : Camera;
// var otherBot : Transform[] = new Transform[6];
private var _refHolder : refHolder;
private var _levelSettings : initLevel;
private var assignedPoints : boolean = false;
private var onPodium : boolean = false;						// after the race the points should be ordered ONCE
private var endActive : boolean = false;					// are we already handling post race stuff?
private var endCircuit : boolean = false;					// are we at the end of our circuit??
var endMenu : boolean = false;						// is the end menu active??
private var currIndex : int = 7;							// the currently selected target
private var aquireTarget : boolean = true;					// do we aquire a target??

var useBots : boolean = false;

	// get out infoScript
var publicInfo : getInfo;


	// set all vars that are used locally in the script here already ...
private var closestDist : float = 9999;										// distance to target ...
private var xDist : float;													// target dist from screen center
private var yDist : float;													// reticle height from screen center
private var targetPos : Vector3;											// position of our target


//
//	Internal Vars .. declare here ...
//
	// input(Update) function vars
private var vertInput : float;								// define the input vars first ....
private var horizInput : float;
private var orientationCompensate : float = 1.0;
private var horizHandleSpeed : float = 0.2;					// the speed with which we move towards values (in touch mode) (basically touch sensibility)

	// get the current time and deltaTime !!
private	var pDeltaTime : float;
private	var pTime :float;						

private var allowTransform : boolean;								// can we transform ?

	// Acceleration and tilt handling vars ..
private var zVelocity : float = 0.0;
private var smoothTime : float = 0.1;	
private var tiltAngle : float;


	// ON GUI VARIABLES
private var btnWidth : float;
private var btnHeight : float;
	
private var xPos : float;
private var yPos : float;
	
private var maxSpeed : String;
private var speedPlaneSpeed : String;
private var rotateSpeed : String;
private var maxSlideAngle : String;
private var fullSlideTime : String;
private var accRate : String;
private var decRate : String;
	
private var camHeight : String;

	// end screens handling
private var addCredits : int = 0;
private var _podiumHandler : podiumHandler;


// var playMusic : boolean = false;

//	###############################################
//
// 		player prefs handling
//

function resetPrefs()
{
		// store music state
	PlayerPrefsX.SetBool("playMusic", true);

		// default value is 1 (for true)
	PlayerPrefs.SetInt("useAcc", 1);

		// default value is 2.0
	PlayerPrefs.SetInt("sensitivity", 4);
	
		// touch sens
	PlayerPrefs.SetInt("touchSens", 4);
		
		// store tutorial state
	PlayerPrefsX.SetBool("tutEnable", true);
	PlayerPrefsX.SetBoolArray("tutFinish", [false,false,false,false,false,false,false]);

		// save everything
	PlayerPrefs.Save();
	
		// now reload that stuff
	getPrefs();
}


function unlockAll()
{

		// handle unlocks...
	PlayerPrefsX.SetBoolArray("pickupUnlocks", [true, true, true, true, true, true, true, true, true]);
	PlayerPrefsX.SetBoolArray("botUnlocks", [true, true, true, true, true, true, true]);
	PlayerPrefsX.SetIntArray("trackUnlocks", [3, 3, 3, 3, 3, 3, 3, 3]);
	// PlayerPrefsX.SetBoolArray("circuitUnlocks", [true, true, true, true, true, true, true]);
	PlayerPrefs.SetInt("circuitUnlocks", 6);
	
		// badges
	PlayerPrefsX.SetIntArray("badgesCareer", [1,1,1,1,1,1,1,1,1,1,1]);
	
		// skin handling
	PlayerPrefsX.SetIntArray("currentSkin", [0,0,0,0,0,0,0]);
	PlayerPrefsX.SetBoolArray("skinA", [true, true, true, true, true, true, true]);
	PlayerPrefsX.SetBoolArray("skinB", [true, true, true, true, true, true, true]);
	PlayerPrefsX.SetBoolArray("skinC", [true, true, true, true, true, true, true]);
	
		// save everything
	PlayerPrefs.Save();
		
		// now reload that stuff
	getUnlocks();

}

	// set all prefs for our game ...
function setPrefs()
{
		// store music state
	PlayerPrefsX.SetBool("playMusic", DataTransfer.playMusic);

		// default value is 1 (for true)
	PlayerPrefs.SetInt("useAcc", DataTransfer.useAcc);

		// default value is 2.0
	PlayerPrefs.SetInt("sensitivity", DataTransfer.accSensIndex);
	
		// touch sens
	PlayerPrefs.SetInt("touchSens", DataTransfer.touchSensIndex);
	
		// store tutorial state
	PlayerPrefsX.SetBool("tutEnable", DataTransfer.tutEnable);
	PlayerPrefsX.SetBoolArray("tutFinish", DataTransfer.tutFinish);

		// save everything
	PlayerPrefs.Save();
}


function setUnlocks()
{
		// handle unlocks...
	PlayerPrefsX.SetBoolArray("pickupUnlocks", DataTransfer.pickupUnlocks);
	PlayerPrefsX.SetBoolArray("botUnlocks", DataTransfer.botUnlocks);
	PlayerPrefsX.SetIntArray("trackUnlocks", DataTransfer.trackUnlocks);
	PlayerPrefsX.SetIntArray("storeStats", DataTransfer.storeStats);
	// PlayerPrefsX.SetBoolArray("circuitUnlocks", DataTransfer.circuitUnlocks);
	PlayerPrefs.SetInt("circuitUnlocks", DataTransfer.circuitUnlocks);
	PlayerPrefs.SetInt("credits", DataTransfer.credits);
	
		// badges
	PlayerPrefsX.SetIntArray("badgesCareer", DataTransfer.badgesCareer);
	
		// skin handling
	PlayerPrefsX.SetIntArray("currentSkin", DataTransfer.currentSkin);
	PlayerPrefsX.SetBoolArray("skinA", DataTransfer.skinA);
	PlayerPrefsX.SetBoolArray("skinB", DataTransfer.skinB);
	PlayerPrefsX.SetBoolArray("skinC", DataTransfer.skinC);
	
		// save everything
	PlayerPrefs.Save();
}


function getUnlocks()
{
		// load the unlock settings
	DataTransfer.pickupUnlocks = PlayerPrefsX.GetBoolArray("pickupUnlocks", [true, false, false, false, true, false, true, false, false], 9);
	DataTransfer.botUnlocks = PlayerPrefsX.GetBoolArray("botUnlocks", [true, true, false, false, false, false, false], 7);
	DataTransfer.trackUnlocks = PlayerPrefsX.GetIntArray("trackUnlocks", [1, 1, 1, 0, 0, 0, 0, 0], 8);
	DataTransfer.storeStats = PlayerPrefsX.GetIntArray("storeStats",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], 70);
	// DataTransfer.circuitUnlocks = PlayerPrefsX.GetBoolArray("circuitUnlocks", [true, true, false, false, false, false, false], 7);
	DataTransfer.circuitUnlocks = PlayerPrefs.GetInt("circuitUnlocks", 1);
	DataTransfer.credits = PlayerPrefs.GetInt("credits", 100);
	
		// badges
	DataTransfer.badgesCareer = PlayerPrefsX.GetIntArray("badgesCareer", [0,0,0,0,0,0,0,0,0,0,0], 11);
	
		// skin handling
	DataTransfer.currentSkin = PlayerPrefsX.GetIntArray("currentSkin", [0,0,0,0,0,0,0], 7);
	DataTransfer.skinA = PlayerPrefsX.GetBoolArray("skinA", [false, false, false, false, false, false, false], 7);
	DataTransfer.skinB = PlayerPrefsX.GetBoolArray("skinB", [false, false, false, false, false, false, false], 7);
	DataTransfer.skinC = PlayerPrefsX.GetBoolArray("skinC", [false, false, false, false, false, false, false], 7);
}


	// get all prefs for our game
function getPrefs()
{
		// store music state
	DataTransfer.playMusic = PlayerPrefsX.GetBool("playMusic", true);

		// default value is the current DataTransfer.useAcc setting
	DataTransfer.useAcc = PlayerPrefs.GetInt("useAcc", 1);

		// default value is the current sensitivity setting
	DataTransfer.accSensIndex = PlayerPrefs.GetInt("sensitivity", 4);
	
		// get touch sensitivity
	DataTransfer.touchSensIndex = PlayerPrefs.GetInt("touchSens", 4);
	
		// store tutorial state
	DataTransfer.tutEnable = PlayerPrefsX.GetBool("tutEnable", true);
	DataTransfer.tutFinish = PlayerPrefsX.GetBoolArray("tutFinish", [false,false,false,false,false,false,false], 7);
	
		// actually update sensitivity settings
	setAccSens();
	setTouchSens();

}


function setBotPlace (startValue : int)
{
		// first bot win is on index 8. Times 4 as we save 4 values per bot!  So setting a win for our bot needs: (9 + ( (DataTransfer.playerBot - 1) * 4) )
	DataTransfer.storeStats[(startValue + ( (DataTransfer.playerBot - 1) * 4) )]++;

		// analytics handling
	if ((DataTransfer.playerBot - 1) == 0)
	{
		if (startValue == 8)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "vektroid", "raceStart");
		}
		else if (startValue == 9)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "vektroid", "first");
		}
		else if (startValue == 10)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "vektroid", "second");
		}
		else if (startValue == 11)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "vektroid", "third");
		}
	}
	else if ((DataTransfer.playerBot - 1) == 1)
	{
		if (startValue == 8)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "zipbot", "raceStart");
		}
		else if (startValue == 9)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "zipbot", "first");
		}
		else if (startValue == 10)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "zipbot", "second");
		}
		else if (startValue == 11)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "zipbot", "third");
		}
	}
	else if ((DataTransfer.playerBot - 1) == 2)
	{
		if (startValue == 8)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "wrekker", "raceStart");
		}
		else if (startValue == 9)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "wrekker", "first");
		}
		else if (startValue == 10)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "wrekker", "second");
		}
		else if (startValue == 11)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "wrekker", "third");
		}
	}
	else if ((DataTransfer.playerBot - 1) == 3)
	{
		if (startValue == 8)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "dabomb", "raceStart");
		}
		else if (startValue == 9)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "dabomb", "first");
		}
		else if (startValue == 10)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "dabomb", "second");
		}
		else if (startValue == 11)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "dabomb", "third");
		}
	}
	else if ((DataTransfer.playerBot - 1) == 4)
	{
		if (startValue == 8)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "podbot", "raceStart");
		}
		else if (startValue == 9)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "podbot", "first");
		}
		else if (startValue == 10)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "podbot", "second");
		}
		else if (startValue == 11)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "podbot", "third");
		}
	}
	else if ((DataTransfer.playerBot - 1) == 5)
	{
		if (startValue == 8)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "speedbot", "raceStart");
		}
		else if (startValue == 9)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "speedbot", "first");
		}
		else if (startValue == 10)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "speedbot", "second");
		}
		else if (startValue == 11)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "speedbot", "third");
		}
	}
	else if ((DataTransfer.playerBot - 1) == 6)
	{
		if (startValue == 8)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "tribot", "raceStart");
		}
		else if (startValue == 9)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "tribot", "first");
		}
		else if (startValue == 10)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "tribot", "second");
		}
		else if (startValue == 11)
		{
				// send analytics
			//Google.analytics.logEvent("stats", "tribot", "third");
		}
	}

}


	// get ready handling
function isReady()
{
		// shot get Ready off
	_refHolder.getReady = false;	// shut this off to disable the getReady animation
	// getReady = false;
			
		// start game enabled loop
	gameEnabled = true;
	_refHolder.gameEnabled = gameEnabled;
}


function runInit()
{
		// enable the start pause
	startPause = true;
	
		// freeze Time (instead of Pause handler)
	Time.timeScale = 0.0;
	
		// pause the game
	gameEnabled = false;
	
		// store the correct time for the start pause
	//pauseEnterTime = 0.0;					// time we enter pause
	
		// set the text to appear
	guiFlags.activeMenu = 1;
}


function Start ()
{		
		// make sure controls are disabled
	DataTransfer.controlsEnabled = false;

		// init att credits
	addCredits = 0;

		// prefOverride
	//resetPrefs();
	//DataTransfer.circuitUnlocks = 2;

		// get our preferences
	getPrefs();

		// get our unlocks
	getUnlocks();
	
	//print ("Credits: " + DataTransfer.credits);
	
		// get the reticle
	HUD_Reticule = GameObject.Find("reticle").GetComponent(Transform) as Transform;
	
		// position the reticule out of view initially...
	HUD_Reticule.localPosition.x = -2150;
	HUD_Reticule.localPosition.y = -2150;
	
		// get the minimap
	minimap = GameObject.Find("minimap_plane").GetComponent(Transform) as Transform;
	
		// get badges icons
	badgesIcons = GameObject.Find("Badges_icons_grp").GetComponent(Transform) as Transform;
	showEnd = GameObject.Find("Beat_grp").GetComponent(Transform) as Transform;
	
		// get circuit icon stuff
	circuitTrn = GameObject.Find("Circuit_unlock_object").GetComponent(Transform) as Transform;
	circuitScr = GameObject.Find("Circuit_unlock_object").GetComponent(HUD_SingleButton) as HUD_SingleButton;
	
		// get the ref holder from our scene
	_refHolder = GameObject.Find("_refHolder").GetComponent(refHolder) as refHolder;
	moveScript._refHolder = _refHolder;

		// store the current levels index
	_refHolder.currLevel = (DataTransfer.trackList[DataTransfer.currentTrack] / 2) - 1;
		

// Debug
// print ("botCount: " + _refHolder.botCount);

		// get the levelInit
	_levelSettings = GameObject.Find("_levelSettings_grp_doNotMove").GetComponent(initLevel) as initLevel;
	
		// get access to the GUI flags system
	guiFlags = GameObject.Find("GUI_Handler").GetComponent(GUI_Flags) as GUI_Flags;
	
		// get podium handler
	_podiumHandler = GameObject.Find("podium_pref").GetComponent(podiumHandler) as podiumHandler;

		// invoke get Ready
	Invoke("isReady", _refHolder.startTime);

		// set the correct values for invoke init...
	startPause = false;							
	gameEnabled = true;
	Time.timeScale = 1.0;

		// invoke init	-	Basically have game NOT paused at the beginning. Then after 0.5 sec. pause it 
		// (so the bots have already landed and started animation)
		// in the pauseManager.js timescale is set to 0 until game is started...
	Invoke("runInit",0.8);
	
		// init unloading unused assets ...
	Invoke("unloadStuff", 0.4);

	

		// disable using GUILayout
	useGUILayout = false;
	
		// Set some initial stuff ....
	Screen.orientation = ScreenOrientation.AutoRotation;
	Screen.autorotateToLandscapeLeft = true;
	Screen.autorotateToLandscapeRight = true;
	Screen.autorotateToPortrait = false;
	Screen.autorotateToPortraitUpsideDown = false;
	
	// Screen.orientation = ScreenOrientation.Landscape;								// set horizontal screen orientation ...

	
		// Screen / Touch handling variables
	sWidth = Screen.width;			// get screen width and height
	sHeight = Screen.height;
	
	widthThird = sWidth / 3.0;
			
	widthRatio = sWidth / 480;			
	heightRatio = sHeight / 320;

		// Check if we are on iPad (so we can scale down our controls)
	invScreenRatio = (sWidth / sHeight) / 1.5f;
	if (invScreenRatio < 1f)
	{
		itemScale = 0.75;
	}
	
		// set our touch detection raster based on resolution
	rasterColOne = (110 * heightRatio * itemScale);
	rasterColTwo = (sWidth - rasterColOne);
	rasterRowHalf = (60 * heightRatio * itemScale);
	rasterRowOne = (120 * heightRatio * itemScale);
	rasterRowTwo = (sHeight - (83 * heightRatio * itemScale));
	rasterRowTop = (sHeight - (40 * heightRatio * itemScale));
	


	
		// set gui values ..
	btnWidth = (sWidth / 5) * 2;
	btnHeight = 30;
	
	xPos = (sWidth / 10) * 3;
	yPos = sHeight /6;
	
		// Timers
	//pauseTimer = Time.time;
	slideTimer = Time.time;
	jumpTimer = Time.time;

		// Adjust the UI for now ...
	doSlide = 0;
	
	publicInfo.noTrans = true;					// set the transform state
	publicInfo.upTrans = false;
	publicInfo.dnTrans = false;
	publicInfo.transTimer = -200.0;

	horizTouch = 0.0;

		// initially, game is paused
	//pauseEnterTime = 0.0;					// time we enter pause
	
		// reset get ready
	_refHolder.raceOver = false;
	
		// store our race start in stats
	DataTransfer.storeStats[0]++;
	
		// send analytics
	//Google.analytics.logEvent("stats", "finishes", "raceStart");
						
		// Store bot race start
	setBotPlace(8);
	
	runTuts();
}


function unloadStuff()
{
	Resources.UnloadUnusedAssets();
}


function runTuts()
{
	if (DataTransfer.tutEnable)
	{
		Invoke("tutSteerA",1.0);
		Invoke("tutSteerB",2.0);
		Invoke("tutPause",4.0);
		Invoke("tutJump",15.0);
		Invoke("tutSlide",25.0);
	}
}


function tutSteerA()
{
	if (DataTransfer.tutEnable)
	{
		if (!DataTransfer.tutFinish[0])
		{
			DataTransfer.tutExit = false;
			DataTransfer.currTut = 0;
			startTutorial();
		}
	}
}
function tutSteerB()
{
	if (DataTransfer.tutEnable)
	{
		if (!DataTransfer.tutFinish[1])
		{
			DataTransfer.tutExit = false;
			DataTransfer.currTut = 1;
			startTutorial();
		}
	}
}
function tutPause()
{
	if (DataTransfer.tutEnable)
	{
		if (!DataTransfer.tutFinish[2])
		{
			DataTransfer.tutExit = false;
			DataTransfer.currTut = 2;
			startTutorial();
		}
	}
}
function tutJump()
{
	if (DataTransfer.tutEnable)
	{
		if (!DataTransfer.tutFinish[5])
		{
			DataTransfer.tutExit = false;
			DataTransfer.currTut = 5;
			startTutorial();
		}
	}
}
function tutSlide()
{
	if (DataTransfer.tutEnable)
	{
		if (!DataTransfer.tutFinish[4])
		{
			DataTransfer.tutExit = false;
			DataTransfer.currTut = 4;
			startTutorial();
		}
	}
}

function getTarget()
{
				// we need to find a new target .. reset the index	
			currIndex = 7;
			
				// init the closest Dist to some superhigh number
			closestDist = 9999.9;
				
			for (var bot = 1; bot <= _refHolder.botCount; bot++)
			{
					// for each bot get their pos in camera space
				targetPos = viewCamera.WorldToScreenPoint(_refHolder.allConstructs[bot].position  + Vector3(0,1.3,0));
				
				// print ("Bot No. " + bot + " has distX: " + targetPos.x + ", distY: " + targetPos.y + ", distZ: " + targetPos.z + "!!!");
			 	
					// the shouldn't be too close to the player (blast radius)
				if (targetPos.z > 0)
				{
						// if bot could be in view, do a raycast to him...
						// .. or no .. get the zDistance and if it is below 300 units consider it a target!

						// is our bot in range?
					if(targetPos.z < 500)
					{
							// get the bots position in player local space to see if it is in a 45 degree cone from the player
						// var localPos = playerTrns.InverseTransformPoint(_refHolder.allConstructs[bot].position);
						
							// now check if we are inside a 90 degree cone (if our z (depth) value is smaller than 
							// our x value, the player is outside the cone (simple math ;) .. same concept as 
							// waypoint magnitude handling)) .. else it is no target.
						// if (Mathf.Abs(localPos.z) > Mathf.Abs(localPos.x))
						// {
								// get our x dist from center
							xDist = Mathf.Abs(targetPos.x - (sWidth / 2));
							
								// get our y dist from center
							yDist = Mathf.Abs(targetPos.y - (sHeight / 2));
	
								// is our bot INSIDE the screen?? Alternatively, check if our bot is INSIDE the center two quarters
							if((xDist < (sWidth/4)) )
							{
									// check if we are the smallest of all
								if (xDist <= closestDist)
								{
										// if we are the closest
									closestDist = xDist;
									currIndex = bot;
								}
							}
						// }
					}
				}
			}

			
				// set has target on moveScript
			if (currIndex == 7)
			{
				moveScript.hasTarget = false;
			}
			else
			{
				moveScript.hasTarget = true;
				
					// now pass the current target to the moveScript
				moveScript.aimTarget = _refHolder.allConstructs[currIndex];
				moveScript.aimIndex = currIndex;
			}
}


function Update() 
{
		// if we are in start mode
	if (startPause)
	{
		//nch
		//DEBUG
		#if !UNITY_IPHONE
			// check if we pressed a button
		if(Input.GetMouseButtonDown(0))
		{	
			btnStartLevel();
		}
		#endif
		
		//nch
		#if UNITY_IPHONE
		if ( Input.touchCount > 0 )
		{
      		btnStartLevel();
        }
		#endif
		//DEBUG END
	}

	// else if (!_refHolder.podiumBlack)
		// if race NOT over
	else if(!_refHolder.raceOver)
	{
	
			// if tutorials are enabled ...
		if (DataTransfer.tutEnable)
		{
			
		}
	
		// used only for non Pause controls	// controls enabled loop
		//if (DataTransfer.controlsEnabled)
		//{
	
			//var vertInput : float;								// define the input vars first ....
			//var horizInput : float;
		
			//var horizHandleSpeed : float = 0.2;					// the speed with which we move towards values (in touch mode) (basically touch sensibility)
			
				
				// get the current deltaTime !!
			pDeltaTime = Time.deltaTime;							// Get the time ONCE
			pTime = Time.time - _refHolder.pausedTime;			//subtract the time we spent in pause mode
			// pTime = Time.time;
			//_refHolder.pausedTime = pausedTime;					// save our paused time
			
				// write last deltaTime to vault for output
			DataVault.dTime = pDeltaTime;
			DataVault.sysTime = pTime;
				
				// check if we may transform (like over abyss we may not...)
			allowTransform = publicInfo.canTransform;	
		
		
			if(gameEnabled)
			{
			// Start Game Enabled code block
		
				//		-> put into function ... setup InvokeRepeat
				//	###################################
				// 		Test Targeting Code ..
				//
			
				if(moveScript.aimEnable)
				{
						// for levels without AI for now add this flag
					if(useBots)
					{
							// This is run once, to initalize repeating pattern ...
						if (!aquireTarget)
						{
								// set the flag
							aquireTarget = true;
							
								// invoke repeat every 0.4 seconds
							InvokeRepeating("getTarget",0.0, 0.2);
							
								// position the reticule out of view initially...
							HUD_Reticule.localPosition.x = -2150;
							HUD_Reticule.localPosition.y = -2150;
						}
						
							// Now adjust the reticle in every frame ...
							// if we found NO target
						if (currIndex == 7)
						{
									// position the reticule out of view...
							HUD_Reticule.localPosition.x = -2150;
							HUD_Reticule.localPosition.y = -2150;
						}
						else
						{
								// get the bot position and 1.3 units up, so that the reticle is not to his feet
							targetPos = viewCamera.WorldToScreenPoint(_refHolder.allConstructs[currIndex].position + Vector3(0,1.3,0));
			
								// check if we are at the total rim of the screen (2 pixels), if so hide the reticle
							if ((targetPos.x < (sWidth/4)) || (targetPos.x > ((sWidth/4)*3)) )
							{
									// position the reticule out of view...
								HUD_Reticule.localPosition.x = -2150;
								HUD_Reticule.localPosition.y = -2150;
							}
							else
							{
								//print ("Our Target is: " + _refHolder.allConstructs[currIndex] + " currently at: X - " + targetPos.x + " Y - " +targetPos.y);
								//Debug.Log ("Aim");
								// if we're not at the rim .. place our reticle.
								var hudX : float =  -((targetPos.x / sWidth) * 480);
								var hudY : float = (320 - ((targetPos.y / sHeight) * 320));
								
								//print ("Width: " + sWidth + " Heigth: " + sHeight + " || hudX: " + hudX + " hudY:" +hudY );
								
										// position the reticule...
								HUD_Reticule.localPosition.x = Mathf.Lerp(HUD_Reticule.localPosition.x, hudX, 0.7);
								HUD_Reticule.localPosition.y = Mathf.Lerp(HUD_Reticule.localPosition.y, hudY, 0.7);
							}
						}	
						
					}	// end use bots loop
					
				}
				else if(aquireTarget)
				{
			
							// cancel invoke
						CancelInvoke("getTarget");
					
							// reset the reticle
						aquireTarget = false;
						HUD_Reticule.localPosition.x = -2150;
						HUD_Reticule.localPosition.y = -2150;
			
				}
				
				//
				// 		End Targetting test code
				//	###################################
		
		
					
						// Do we have the iPhone controls enabled?
	//DEBUG
					//if (!iPhoneCtls)
					//{	
	//nch
	//DEBUG
	#if !UNITY_IPHONE
						
										// pause button should even work at the beginning ...
						if(Input.GetButton  ("Pause"))
						{
								// set Pause Button state
							// HUD_Pause_btn.changeState(1);
							
							gameEnabled = false;										// set the pause mode flag
							_refHolder.gameEnabled = gameEnabled;
							pauseEnterTime = Time.time - _refHolder.pausedTime;
								
								// pause time ...
							Time.timeScale = 0.0;
							
								// pause music
							if (DataTransfer.playMusic)
							{
								startMusic.Pause();
							}
							
						}
					
			// controls enabled loop
		if (DataTransfer.controlsEnabled)
		{
					//	##############################
					//
					//		Add mouse steering ???
					
					
		//				if(pTime > startTime)
		//				{
						// stat code to delay race start (for countdown etc..)			
													
								// get the input values from the set keys
							vertInput = Input.GetAxis("Vertical");		
							horizInput = Input.GetAxis("Horizontal");
				
								// #####   HANDLE JUMP   #####
								// #####   HANDLE JUMP   #####
								// #####   HANDLE JUMP   #####
							if (Input.GetButton ("Jump"))
							{
								if (!HUD_Jump)
								{		// if button not yet active ... else don't change hud
									
										// change the jump button
									//HUD_Jump_btn.changeState(1);
									HUD_Jump = true;
								}
								//moveScript.applyJump(pTime);
								moveScript.applyJump();
							}else if (HUD_Jump){/*HUD_Jump_btn.changeState(0);*/ HUD_Jump = false;}
							
							
								// #####   HANDLE Action   #####
								// #####   HANDLE Action   #####
								// #####   HANDLE Action   #####
							if (Input.GetButton ("Action"))
							{
								if (!HUD_Action)
								{		// if button not yet active ... else don't change hud
									
										// NO! Buttons are changed elsewhere ... change the Action button
									// HUD_Action_btn.changeState(1);
									HUD_Action = true;
								}
								moveScript.applyPickup();
							//}else if (HUD_Action){HUD_Action_btn.changeState(0); HUD_Action = false;}
							}else if (HUD_Action){HUD_Action = false;}					
							
								// #####   HANDLE Slide   #####
								// #####   HANDLE Slide   #####
								// #####   HANDLE Slide   #####						
							if (Input.GetButton ("Slide"))
							{											// getButton returns true as long the button is pressed
								slideTimer = pTime + .05;	// add a little more than one cycle to the timer (so that one dropped register doesn't jitter everything)
								if (!HUD_Slide)
								{		// if button not yet active ... else don't change hud
										
										// change the Slide button
									// HUD_Slide_btn.changeState(1);
									HUD_Slide = true;
								}
								doSlide = 1;
							}else if (HUD_Slide && (slideTimer < pTime)){ /* HUD_Slide_btn.changeState(0);*/ doSlide = 0; HUD_Slide = false;}
							
								// #####   HANDLE Juice   #####
								// #####   HANDLE Juice   #####
								// #####   HANDLE Juice   #####
							if (Input.GetButton ("Juice"))
							{
									// execute juice IF allowed
								if (moveScript.juiceLeft >= moveScript.juiceFull)
								{
									moveScript.burnJuice();
								}
							}	
		//				// end start delay code ...
						//}
		
		// end controls enabled loop
		}
	
	//DEBUG				
	#endif  	
	//DEBUG
					//}
					//else
					//{
	//nch
	//DEBUG
	#if UNITY_IPHONE
		
		//	#######################################
		//
		//		If iPhone Controls enabled
		
		
		
		//				if(pTime > startTime)
		//				{
						// Touch controls delay code ... set here to delay all but pause mode
						
							vertInput = 1.0;									// set fwd input to 1 (as iPhone has no acceleration control and if breaking reset it to -1 per update)
							
							
				//	######################################
				//
				//		Acc input
				
								// get screen orientation compensation
							if (Screen.orientation == ScreenOrientation.LandscapeRight)
							{
								orientationCompensate = -1.0;
							}
							else
							{
								orientationCompensate = 1.0;
							}
									
		
								// get accelerometer input anyway (for tiltRotation) (outputs 1 at 90 degree angles)
							dir.x = -Input.acceleration.y;					
							dir.y = -Input.acceleration.y;
							
								// clamp acceleration vector to unit sphere
							if (dir.sqrMagnitude > 1)
								dir.Normalize();
		
								// smooth the input over the last 3 frames ... (fCurr*0.7 + f-1 * 0.5 + f-2 * 0.3)
							//currMinus1Input
							currMinus2InputX = currMinus1InputX;
							currMinus1InputX = dir.x;						// get the actual input
							
		
							
								// calc the average with emphasis on current ...
							dir.x = currMinus1InputX * 0.6 + currMinus2InputX * 0.4;
							
								// if bankTurning enabled...
							if (!accWheel)
							{
								currMinus2InputZ = currMinus1InputZ;
								currMinus1InputZ = dir.y;						// get the actual input
								
								dir.y = currMinus1InputZ * 0.6 + currMinus2InputZ * 0.4;
							}
								// values for tiltSmooth
							zVelocity = 0.0;
							smoothTime = 0.1;	
								// first of all get our screen tilt ...
							tiltAngle = Mathf.Clamp((dir.x * -90), -7.0, 7.0);		// 15 degree tilt is max -> -90 as it is in inverse direction
							
								// adjust for orientation
							tiltAngle = tiltAngle * orientationCompensate;
							
								// and tilt the camera smoothly ...
							//tiltCam.localEulerAngles.z = Mathf.SmoothDampAngle(tiltCam.localEulerAngles.z, tiltAngle, zVelocity, smoothTime);
							tiltCam.localEulerAngles.z = Mathf.LerpAngle(tiltCam.localEulerAngles.z, tiltAngle, smoothTime);
								
								// now clean the input and apply correct curve...
							// dir.x = Mathf.Lerp(inputDir, dir.x, accFilter);
		
						
				//	Acc Input End
				//
				//	#########################################
						
		//				// end first touch delay block
		//				}
							
							// ##############################
							//
							// start Touch input code
							
							// init touch as 0.0
						horizInput = 0.0;
							
						for(var touch: Touch in Input.touches)
						{
						  	var pos: Vector2 = touch.position;		// get the touch input and it's position
						 	//var currPhase = touch.phase;			// get the touch phase once ..
		
		
								// Pause button (outside delay code)
							// if((pos.x > (40 * widthRatio)) && (pos.x < (78 * widthRatio)) && (pos.y > (237 * heightRatio)) && (pos.y < (278 * heightRatio)))
							if( (pos.x < rasterColOne) && (pos.y > rasterRowTwo) && (pos.y < rasterRowTop) )
							{
									// change Pause button ..
								// HUD_Pause_btn.changeState(1);
												
								gameEnabled = false;							// set the pause mode flag
								_refHolder.gameEnabled = gameEnabled;
								// WRONG pausedTime = pausedTime + pTime;		// for time dependant functions to work, the actual scripts need to work with a continous time stream! Store and subtract the time spent in pause mode ...
								pauseEnterTime = Time.time - _refHolder.pausedTime;
								
									// pause time ...
								Time.timeScale = 0.0;
								
									// pause music
								if (DataTransfer.playMusic)
								{
									startMusic.Pause();
								}
							}
							
			// controls enabled loop
		if (DataTransfer.controlsEnabled)
		{
		
		//					if(pTime > startTime)
		//					{
							// Second touch delay block (we needed to isolate the pause button)
		
		
								// check screen as grid ... our touch inputs have 3 columns and 2 lines (excluding the pause button above ...)
								// (110 * heightRatio * itemScale) | (sWidth - (110 * heightRatio * itemScale)) | ((237 * heightRatio) * itemScale)
									// Check for first column (Action and touch steering)
								//if(pos.x < (110 * widthRatio))
								
								if ( (pos.y < rasterRowTwo) && (pos.y > rasterRowOne) )
								{
									if(pos.x < widthThird)
									{
											// ######	HANDLE TouchLeft	######
											// ######	HANDLE TouchLeft	######
											// ######	HANDLE TouchLeft	######
											
										horizInput = -1;
									}
									else if(pos.x > (widthThird * 2.0) )
									{
											// ######	HANDLE TouchRight	######
											// ######	HANDLE TouchRight	######
											// ######	HANDLE TouchRight	######		
											
										horizInput = 1;
									}
								}								
								else if(pos.x < rasterColOne)
								{
										//check for touch action
									//if (pos.y < (100 * heightRatio))
									if (pos.y < rasterRowHalf)
									{
											// ######	HANDLE Juice	######
											// ######	HANDLE Juice	######
											// ######	HANDLE Juice	######
		
											// execute juice IF allowed
										if (moveScript.juiceLeft >= moveScript.juiceFull)
										{
											moveScript.burnJuice();
										}
									}
									else if (pos.y < rasterRowOne)
									{
											// ######	HANDLE Action	######
											// ######	HANDLE Action	######
											// ######	HANDLE Action	######
		
											// execute the pickup
										moveScript.applyPickup();
									}
									/*
									else if(pos.y < rasterRowTwo)
									{
											// ######	HANDLE TouchLeft	######
											// ######	HANDLE TouchLeft	######
											// ######	HANDLE TouchLeft	######
											
										horizInput = -1;
									}
									*/
								}
		
									// check for middle column
								else if(pos.x < rasterColTwo)
								{
									if (pos.y < rasterRowOne)
									{
											// ######	HANDLE Slide	######
											// ######	HANDLE Slide	######
											// ######	HANDLE Slide	######
		
										lastTouch = touchTime;
										touchTime = pTime;
								/*		
											// check for double tap
										if(((touchTime - lastTouch) > 0.05 ) && ((touchTime - lastTouch) < 0.5 ))
										{
											print("Double Tap! Brake set!!");
										}
								*/		
		
										slideTimer = pTime + .01;	// add a little more than one cycle to the timer (so that one dropped register doesn't jitter everything)
										if (!HUD_Slide)
										{		// if button not yet active ... else don't change hud
			
												// change the Slide button
											// HUD_Slide_btn.changeState(1);
											HUD_Slide = true;
										}
										doSlide = 1;
									}
		
										// I could add the midscreen Jump here!!!!
								}
								
									// check Right column
								else if(pos.x > rasterColTwo)
								{
									if (pos.y < rasterRowOne)
									{
											// ######	HANDLE Jump	######
											// ######	HANDLE Jump	######
											// ######	HANDLE Jump	######
										
										jumpTimer = pTime + 0.1;
										if (!HUD_Jump)
										{		// if button not yet active ... else don't change hud
			
												// set a quick timer for the jump button
											
												// change the jump button
											//HUD_Jump_btn.changeState(1);
											HUD_Jump = true;
										}
										moveScript.applyJump();
									}
									/*
									else if (pos.y < rasterRowTwo)
									{
											// ######	HANDLE TouchRight	######
											// ######	HANDLE TouchRight	######
											// ######	HANDLE TouchRight	######		
											
										horizInput = 1;
									}
									*/
										// correct column but wrong height recover Jump buttonhere
									else if (HUD_Jump)
									{  
										//HUD_Jump_btn.changeState(0); 
										HUD_Jump = false;
									}
								}
									// recover Jump again, if completely wrong column
								else if (HUD_Jump)
								{  
									//HUD_Jump_btn.changeState(0); 
									HUD_Jump = false;
								}
								
		
							
		//					// END second delay Block!
		//					}
		
		
		// END controls enabled loop
		}
						  
						}
						
		//				if(pTime > startTime)
		//				{
						// Second touch delay block (we needed to isolate the pause button)
			
								// Now, at the end: if accelerometer off - set the correct steering ...
							if (DataTransfer.useAcc == 1)
							{													// IF Acceleration is set ON .. get readout the accelerometer!!!
									// set input to accelerometer output
								// horizInput = dir.x;								// if no touch input use acceleration, else touch overrides...
								if (accWheel)
								{
									horizInput = dir.x;
								}
								else
								{
									horizInput = dir.y;
								}
								
					// ##############################
					// 
					//	Deadzone and brake handling ...
					//
					//
								
					
										
										// apply deadzone for input ... | We're dealing with the horiz. input only, as this iPhone Version has no vert input controls ...
									var absHorizInput: float = (Mathf.Abs(horizInput));
									// horizInput = teststeering;	
									
										// Deadzone handling ...
									if (absHorizInput < deadzone)
									{
										horizInput = 0;			// we're inside the deadzone ... set horiz input to 0;
									}
									else
									{
											// check if our input is pos or neg
										var horizSign = Mathf.Sign(horizInput);
										
											// normalize remaining input between 0 and 1. This is the least sensitive setting ...
										horizInput = (absHorizInput - deadzone) / (1 - deadzone);
																			
											// Now .. apply our input curve and sensitivity ...	(nx^2) -> gives a nice curve
										horizInput = Mathf.Clamp01(sensitivity * horizInput ) * horizSign;
										
										// Quadratic curve is too unresponsive in the beginning...   horizInput = Mathf.Clamp01(sensitivity * horizInput * horizInput) * horizSign;
									}
					
		
								
					// 
					//	Deadzone and brake handling END!!
					//
					// ##############################
					
									// if in accelerometer steering ...
									// ...adjust for orientation
								horizInput = horizInput * orientationCompensate;
							
							
							
							
							}	
								// if in touch steering mode ...	
							else
							{
							/*
									// will soon be set seperately
								if (sensitivity <= 0.5)
								{
									touchSens = (1/0.5);
								}
								else
								{
									touchSens = (1/ sensitivity);
								}
							*/
									// Now (only if in non Accelerometer mode) calculate our values ...
								if (horizInput == 1)
								{								// the target was set to 1 by touching the control above ...
										// manual add instead of moveTowards ...
									horizTouch = Mathf.MoveTowards(horizTouch, 1.0, 2.0 * touchSens * pDeltaTime);				
								}
								else if (horizInput == -1)
								{								// the other direction ..
									horizTouch = Mathf.MoveTowards(horizTouch, -1.0, 2.0 * touchSens * pDeltaTime);
								}
								else if (horizTouch != 0) 
								{								// not 1 and not -1, must be 0. Check if our horizTouch is already 0... | basically no touch input, as then it would be 1 or -1
									horizTouch = Mathf.MoveTowards(horizTouch, 0.0, ( 1.0 * touchSens * pDeltaTime));	
									horizTouch = 0.0;
								}
							
								horizInput = horizTouch;		// set the correct touch!!
		
							}
		//				// end third touch delay block
		//				}
	//DEBUG
					// end iPhone input Check
					//}	
	#endif
					
		//			if(pTime > startTime)
		//			{
					// FINAL touch delay block (we needed to isolate the pause button)	
						
							// Sliding code revert if nothing pressed ...
						if (HUD_Slide && (slideTimer < pTime))
						{
							// HUD_Slide_btn.changeState(0); 
							doSlide = 0; 
							HUD_Slide = false;
						} //still sliding, button released, no touches..
						
							// Jump button revert if nothing pressed 
		
						if (HUD_Jump && (jumpTimer < pTime))
								{  
									//HUD_Jump_btn.changeState(0); 
									HUD_Jump = false;
								}
		
		//			// end start delay code ...
		//			}
		
		
					// NOW! Run the move function of the move script passing the current dTime, horizInput and vertInput;
				// moveScript.moveCharacter(pDeltaTime, pTime, vertInput, horizInput, doSlide );
				publicInfo.vertInput = vertInput;
				publicInfo.horizInput = horizInput;
				publicInfo.doSlide = doSlide;
				
		
		
		
		
		
			// seems to run faster ...
			// GC here .. test every 20 instead of 30 frames ?? or maybe 60 ??
						// Run garbage Collect...
					if(Time.frameCount % 60 == 0)
					{
						// kill gc for now...  or NOT   
						 System.GC.Collect();
					}
				
					
		/*
				// END Manual Control Loop
				}
		*/		
				
			// END Game Enabled Loop
			}
			else
			{
			// we're in pause (menu) mode
				
			
			// end Pause mode
			}
			
		// end controls enabled loop
		}
		
	// Replaces with loop in non Pause areas// end game not over loop
	//}
	
	//else if (_refHolder.raceOver && guiFlags.activeMenu != 20)
	else if ( (guiFlags.activeMenu != 20) && !(gameBeat && (guiFlags.activeMenu == 11) ) )
	{

		loopCounter++;
		
			// flag podium active
		if (_podiumHandler.stagePrepared)
		{
				// set podium active
			guiFlags.activeMenu = 11;
		}
	
		 // initialize end handling as we kicked OnGui
		if (!endActive)
		{
			endActive = true;
			
				// hide reticle
			HUD_Reticule.localPosition.x = -2150;
			HUD_Reticule.localPosition.y = -2150;
			
				// hide minimap
			minimap.localPosition.x = -5000;
			minimap.localPosition.y = -5000;
			
				// run end handling ONCE automatically
			btnContinue();
		}
	//nch
		#if !UNITY_IPHONE
		if (loopCounter > 8)
		{
				// check if we pressed a button
			if(Input.GetMouseButtonUp(0))
			{	
				//if(nextTouch < Time.time)
				//{
						// setup next interval
					//nextTouch = Time.time + 1.0;
					
						// use continue button
	      			btnContinue();
	      		//}
			}
		}
		#endif
	//nch
		#if UNITY_IPHONE
		if (loopCounter > 8)
		{
			for(var etouch: Touch in Input.touches)
			{
				var currPhase = etouch.phase;
			
					// go forward only if releasing screen
				if(TouchPhase.Ended == currPhase)
				{
						// setup next interval
					//nextTouch = Time.time + 1.0;
					loopCounter = 0;
					
						// use continue button
	      			btnContinue();
				}
			}
		}
		#endif
	}

}












// ##########################################
//
//	GUI STUFF

function btnStartLevel()
{
		// enable controls
	//DataTransfer.controlsEnabled = true;

	gameEnabled = true;
	_refHolder.gameEnabled = gameEnabled;
	startPause = false;
	_refHolder.pausedTime = Time.time;										// initially, all the time we spend here .. is paused
	System.GC.Collect();
	Destroy(loadScreen);
	Destroy(GameObject.Find("loadScreen_killMe_root"));
			
		// restart Time
	Time.timeScale = 1.0;
		
		// start music
	if(DataTransfer.playMusic)
	{
			// if enabled, start music
		startMusic.Play();
	}
	
		// set Stats for races started:
	DataTransfer.racesStarted ++;
	
		// enable HUD
	guiFlags.activeMenu = 0;
}


function btnMainMenu()
{
		// we didn't hit replay, so store our unlocks
		// save our unlocks for good
	//setUnlocks();

		// reset assigned points value before exit
	assignedPoints = false;
					
		// DataTransferBotPoints should be reset now as we are exiting to main menu afterwards.
	DataTransfer.botPoints[0] = 0;
	DataTransfer.botPoints[1] = 0;
	DataTransfer.botPoints[2] = 0;
	DataTransfer.botPoints[3] = 0;
	DataTransfer.botPoints[4] = 0;
	DataTransfer.botPoints[5] = 0;
	DataTransfer.botPoints[6] = 0;

		// reEnable game
	gameEnabled = true;
	_refHolder.gameEnabled = gameEnabled;

		// restart Time
	Time.timeScale = 1.0;
		
		// get and destroy the settings holders ..
	var	impHolder = GameObject.Find("_rr_settings_holder");
	var	localHolder = GameObject.Find("_rr_settings_holder_local");
	Destroy(impHolder);
	Destroy(localHolder);
						
		// now load our menu
	Application.LoadLevel(0);
	
		
}


function startTutorial()
{

	gameEnabled = false;							// set the pause mode flag
	_refHolder.gameEnabled = gameEnabled;

	//
	//	REMEMBER TO SET A TUT VALUE FOR currTut BEFORE RUNNING THIS
	//

	pauseEnterTime = Time.time - _refHolder.pausedTime;
						
		// pause time ...
	Time.timeScale = 0.0;
								
		// pause music
	if (DataTransfer.playMusic)
	{
		startMusic.Pause();
	}
}


function btnResume()
{
	System.GC.Collect();
	gameEnabled = true;
	_refHolder.gameEnabled = gameEnabled;
	_refHolder.pausedTime = Time.time - pauseEnterTime;		// pausedEnter time is race time without prior pause times
	
		// disable tutorial
	DataTransfer.currTut = 99;
	
		// continue music if enabled
	if (DataTransfer.playMusic)
	{
		startMusic.Play();
	}
	
		// reset menu setings
	DataVault.baseMenu = true;
	DataVault.developerMenu = false;
	DataVault.controlsMenu = false;
		// change Pause button back ...
	// HUD_Pause_btn.changeState(0);
							
		// unPause time
	Time.timeScale = 1.0;
				
		// store our prefs...
	setPrefs();
	setUnlocks();
}




function toggleWheel()
{
	if (accWheel)
	{
		accWheel = false;
	}
	else
	{
		accWheel = true;
	}
}


function setAccSens()
{
		// set our sensitivity
	sensitivity = 0.5 * DataTransfer.accSensIndex;
}

function setTouchSens()
{
		// set our sensitivity
	touchSens = (0.5 * DataTransfer.touchSensIndex);
}


function nextCircuitTrack()
{


		// store next race placement
	DataTransfer.robotPositions = nextRaceSlots;
	DataTransfer.playerPosition = nextRacePos + 1;
		
		// set the next track as current
	DataTransfer.currentTrack++;
				
		// now load next level
	Application.LoadLevel(DataTransfer.trackList[DataTransfer.currentTrack]);
}


function postRaceProcessor()
{
		// pause music
	if (DataTransfer.playMusic)
	{
		//startMusic.Pause();
	}


		// handle post race earned badges
	if (DataTransfer.damageRace[10] == 0)
	{
			// earn badge Nimble MAchine (0)
		DataTransfer.badgesRace[0]++;
		DataTransfer.badgesCareer[0]++;
		DataTransfer.badgeCount++;		
		
			// send analytics
		//Google.analytics.logEvent("stats", "badges", "nimbleMachine");
	}				
	if (DataTransfer.damageRace[9] == 0)
	{
			// earn badge Untouchable (1)
		DataTransfer.badgesRace[1]++;
		DataTransfer.badgesCareer[1]++;
		DataTransfer.badgeCount++;
		
			// send analytics
		//Google.analytics.logEvent("stats", "badges", "untouchable");
	}				
	if (DataTransfer.damageRace[7] == 0)
	{
			// earn badge Never Mine (8)
		DataTransfer.badgesRace[8]++;
		DataTransfer.badgesCareer[8]++;
		DataTransfer.badgeCount++;
		
			// send analytics
		//Google.analytics.logEvent("stats", "badges", "neverMine");
	}
	
		// reinit addcredits at 0
	addCredits = 0;
	
		// handle badge info
	if (DataTransfer.badgeCount > 0)
	{
			// mark that we have an unlock
		//guiFlags.hasUnlock = true;
		
			// Unlock message
		//guiFlags.trackUnlocks += ("You have earned " + DataTransfer.badgeCount + " Badges: \n\n");
		
			// give money for badges
		switch (_refHolder.aiDiff)
		{
			case 0:
					if (DataTransfer.badgesRace[0] > 0)
					{
						//guiFlags.trackUnlocks += ("Nimble Machine \n");
						addCredits += 15;
					}
					if (DataTransfer.badgesRace[1] > 0)
					{
						//guiFlags.trackUnlocks += ("Untouchable \n");
						addCredits += 25;
					}
					if (DataTransfer.badgesRace[2] > 0)
					{
						//guiFlags.trackUnlocks += ("Dangerous Equipment \n");
						addCredits += 10;
					}
					if (DataTransfer.badgesRace[3] > 0)
					{
						//guiFlags.trackUnlocks += ("Iron Fist \n");
						addCredits += 15;
					}
					if (DataTransfer.badgesRace[4] > 0)
					{
						//guiFlags.trackUnlocks += ("High Speed \n");
						addCredits += 5;
					}
					if (DataTransfer.badgesRace[5] > 0)
					{
						//guiFlags.trackUnlocks += ("Full Speed \n");
						addCredits += 20;
					}
					if (DataTransfer.badgesRace[6] > 0)
					{
						//guiFlags.trackUnlocks += ("High Five Speed \n");
						addCredits += 10;
					}
					if (DataTransfer.badgesRace[7] > 0)
					{
						//guiFlags.trackUnlocks += ("Full Sky \n");
						addCredits += 25;
					}
					if (DataTransfer.badgesRace[8] > 0)
					{
						//guiFlags.trackUnlocks += ("Never Mine \n");
						addCredits += 5;
					}
					if (DataTransfer.badgesRace[9] > 0)
					{
						//guiFlags.trackUnlocks += ("Heavy Metal \n");
						addCredits += 5;
					}
					if (DataTransfer.badgesRace[10] > 0)
					{
						//guiFlags.trackUnlocks += ("Full Metal \n");
						addCredits += 20;
					}
				break;
			case 1:
					if (DataTransfer.badgesRace[0] > 0)
					{
						//guiFlags.trackUnlocks += ("Nimble Machine \n");
						addCredits += 20;
					}
					if (DataTransfer.badgesRace[1] > 0)
					{
						//guiFlags.trackUnlocks += ("Untouchable \n");
						addCredits += 35;
					}
					if (DataTransfer.badgesRace[2] > 0)
					{
						//guiFlags.trackUnlocks += ("Dangerous Equipment \n");
						addCredits += 15;
					}
					if (DataTransfer.badgesRace[3] > 0)
					{
						//guiFlags.trackUnlocks += ("Iron Fist \n");
						addCredits += 20;
					}
					if (DataTransfer.badgesRace[4] > 0)
					{
						//guiFlags.trackUnlocks += ("High Speed \n");
						addCredits += 10;
					}
					if (DataTransfer.badgesRace[5] > 0)
					{
						//guiFlags.trackUnlocks += ("Full Speed \n");
						addCredits += 30;
					}
					if (DataTransfer.badgesRace[6] > 0)
					{
						//guiFlags.trackUnlocks += ("High Five Speed \n");
						addCredits += 15;
					}
					if (DataTransfer.badgesRace[7] > 0)
					{
						//guiFlags.trackUnlocks += ("Full Sky \n");
						addCredits += 35;
					}
					if (DataTransfer.badgesRace[8] > 0)
					{
						//guiFlags.trackUnlocks += ("Never Mine \n");
						addCredits += 10;
					}
					if (DataTransfer.badgesRace[9] > 0)
					{
						//guiFlags.trackUnlocks += ("Heavy Metal \n");
						addCredits += 10;
					}
					if (DataTransfer.badgesRace[10] > 0)
					{
						//guiFlags.trackUnlocks += ("Full Metal \n");
						addCredits += 30;
					}
				break;
			case 2:
					if (DataTransfer.badgesRace[0] > 0)
					{
						//guiFlags.trackUnlocks += ("Nimble Machine \n");
						addCredits += 30;
					}
					if (DataTransfer.badgesRace[1] > 0)
					{
						//guiFlags.trackUnlocks += ("Untouchable \n");
						addCredits += 50;
					}
					if (DataTransfer.badgesRace[2] > 0)
					{
						//guiFlags.trackUnlocks += ("Dangerous Equipment \n");
						addCredits += 20;
					}
					if (DataTransfer.badgesRace[3] > 0)
					{
						//guiFlags.trackUnlocks += ("Iron Fist \n");
						addCredits += 30;
					}
					if (DataTransfer.badgesRace[4] > 0)
					{
						//guiFlags.trackUnlocks += ("High Speed \n");
						addCredits += 15;
					}
					if (DataTransfer.badgesRace[5] > 0)
					{
						//guiFlags.trackUnlocks += ("Full Speed \n");
						addCredits += 40;
					}
					if (DataTransfer.badgesRace[6] > 0)
					{
						//guiFlags.trackUnlocks += ("High Five Speed \n");
						addCredits += 20;
					}
					if (DataTransfer.badgesRace[7] > 0)
					{
						//guiFlags.trackUnlocks += ("Full Sky \n");
						addCredits += 50;
					}
					if (DataTransfer.badgesRace[8] > 0)
					{
						//guiFlags.trackUnlocks += ("Never Mine \n");
						addCredits += 15;
					}
					if (DataTransfer.badgesRace[9] > 0)
					{
						//guiFlags.trackUnlocks += ("Heavy Metal \n");
						addCredits += 15;
					}
					if (DataTransfer.badgesRace[10] > 0)
					{
						//guiFlags.trackUnlocks += ("Full Metal \n");
						addCredits += 40;
					}
				break;									
		}
	}



		// make sure in our next circuit the endzone is shorter (more difficult)
	DataTransfer.circuitAdjust = DataTransfer.circuitAdjust * 1.1;

		// first set the points for the first 5 bots AND Pass those to our GUI_Flags also...
	DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[6]]] += 10;
		guiFlags.racePoints[_refHolder.botMeshes[_refHolder.robots[6]]] = 10;
		guiFlags.circuitPoints[_refHolder.botMeshes[_refHolder.robots[6]]] = DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[6]]];
			// store mesh in correct slot, if player set to 8
		nextRaceSlots[0] = _refHolder.botMeshes[_refHolder.robots[6]] + 1;
		if(_refHolder.robots[6] == 0)
		{
			nextRaceSlots[0] = 8;
			nextRacePos = 0;
		}
			// store podium info
		guiFlags.podiumBots[0] = _refHolder.botMeshes[_refHolder.robots[6]];
		
	DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[5]]] += 8;
		guiFlags.racePoints[_refHolder.botMeshes[_refHolder.robots[5]]] = 8;
		guiFlags.circuitPoints[_refHolder.botMeshes[_refHolder.robots[5]]] = DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[5]]];
			// store mesh in correct slot, if player set to 8
		nextRaceSlots[1] = _refHolder.botMeshes[_refHolder.robots[5]] + 1;
		if(_refHolder.robots[5] == 0)
		{
			nextRaceSlots[1] = 8;
			nextRacePos = 1;
		}
			// store podium info
		guiFlags.podiumBots[1] = _refHolder.botMeshes[_refHolder.robots[5]];
		
	DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[4]]] += 5;
		guiFlags.racePoints[_refHolder.botMeshes[_refHolder.robots[4]]] = 5;
		guiFlags.circuitPoints[_refHolder.botMeshes[_refHolder.robots[4]]] = DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[4]]];
			// store mesh in correct slot, if player set to 8
		nextRaceSlots[2] = _refHolder.botMeshes[_refHolder.robots[4]] + 1;
		if(_refHolder.robots[4] == 0)
		{
			nextRaceSlots[2] = 8;
			nextRacePos = 2;
		}
			// store podium info
		guiFlags.podiumBots[2] = _refHolder.botMeshes[_refHolder.robots[4]];
		
		// if we have at least 4 racers
	if (_refHolder.botCount > 2)
	{
		DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[3]]] += 3;
			guiFlags.racePoints[_refHolder.botMeshes[_refHolder.robots[3]]] = 3;
			guiFlags.circuitPoints[_refHolder.botMeshes[_refHolder.robots[3]]] = DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[3]]];
				// store mesh in correct slot, if player set to 8
			nextRaceSlots[3] = _refHolder.botMeshes[_refHolder.robots[3]] + 1;
			if(_refHolder.robots[3] == 0)
			{
				nextRaceSlots[3] = 8;
				nextRacePos = 3;
			}
				// store podium info
			guiFlags.podiumBots[3] = _refHolder.botMeshes[_refHolder.robots[3]];
	}
	
		// if we have at least 5 racers
	if (_refHolder.botCount > 3)
	{
		DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[2]]] += 1;
			guiFlags.racePoints[_refHolder.botMeshes[_refHolder.robots[2]]] = 1;
			guiFlags.circuitPoints[_refHolder.botMeshes[_refHolder.robots[2]]] = DataTransfer.botPoints[_refHolder.botMeshes[_refHolder.robots[2]]];
				// store mesh in correct slot, if player set to 8
			nextRaceSlots[4] = _refHolder.botMeshes[_refHolder.robots[2]] + 1;
			
			//
			// We currently have a max of 4 bots ... lower bots can't be the player
			/*
			if(_refHolder.robots[2] == 0)
			{
				nextRaceSlots[4] = 8;
				nextRacePos = 4;
			}
			*/
				// store podium info
			guiFlags.podiumBots[4] = _refHolder.botMeshes[_refHolder.robots[2]];
	}
	
			// currently fill last 2 slots with 0
		nextRaceSlots[5] = 0;
		nextRaceSlots[6] = 0;
		
			// store podium info
		guiFlags.podiumBots[5] = _refHolder.botMeshes[_refHolder.robots[1]];
		guiFlags.podiumBots[6] = _refHolder.botMeshes[_refHolder.robots[0]];

//print ("NextRaceSlots1: " + nextRaceSlots[0]);
//print ("NextRaceSlots2: " + nextRaceSlots[1]);
//print ("NextRaceSlots3: " + nextRaceSlots[2]);
//print ("NextRaceSlots4: " + nextRaceSlots[3]);
//print ("NextRaceSlots5: " + nextRaceSlots[4]);
//print ("NextRaceSlots6: " + nextRaceSlots[5]);
//print ("NextRaceSlots7: " + nextRaceSlots[6]);

				//
				// Manual credit calculation! Add the skin unlock calculation in here, too!!!
				//


		// init quick race handler as false
	guiFlags.isQuick = true;
	
	switch (DataTransfer.currentCircuit)
	{
			case 0:
						// set quick race handler as true
					guiFlags.isQuick = false;
						// Quick Race
					if (_refHolder.robots[6] == 0)
					{
							// Assign points based on difficulty
						switch (_refHolder.aiDiff)
						{
							case 0:
									addCredits += 75;
								break;
							case 1:
									addCredits += 150;
								break;
							case 2:
									addCredits += 200;
								break;									
						}
						
							// Store Win
						DataTransfer.storeStats[1]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "first");
						
							// Store bot Win
						setBotPlace(9);	
					}
					else if (_refHolder.robots[5] == 0)
					{
							// Assign points based on difficulty
						switch (_refHolder.aiDiff)
						{
							case 0:
									addCredits += 60;
								break;
							case 1:
									addCredits += 100;
								break;
							case 2:
									addCredits += 140;
								break;									
						}
							// Store Win
						DataTransfer.storeStats[2]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "second");
						
							// Store bot Win
						setBotPlace(10);	
					}
					else if (_refHolder.robots[4] == 0)
					{
							// Assign points based on difficulty
						switch (_refHolder.aiDiff)
						{
							case 0:
									addCredits += 40;
								break;
							case 1:
									addCredits += 60;
								break;
							case 2:
									addCredits += 80;
								break;									
						}
							// Store Win
						DataTransfer.storeStats[3]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "third");
						
							// Store bot Win
						setBotPlace(11);
					}
				break;
						
			case 1:
						// Toasted Cup
					if (_refHolder.robots[6] == 0)
					{
						addCredits += 100;
						
							// Store Win
						DataTransfer.storeStats[1]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "first");
						
							// Store bot Win
						setBotPlace(9);
						
					}
					else if (_refHolder.robots[5] == 0)
					{
						addCredits += 80;
						
							// Store Win
						DataTransfer.storeStats[2]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "second");
						
							// Store bot Win
						setBotPlace(10);
					}
					else if (_refHolder.robots[4] == 0)
					{
						addCredits += 50;
						
							// Store Win
						DataTransfer.storeStats[3]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "third");
						
							// Store bot Win
						setBotPlace(11);
					}
				break;
					
			case 2:
						// Connected Cup
					if (_refHolder.robots[6] == 0)
					{
						addCredits += 150;
						
							// Store Win
						DataTransfer.storeStats[1]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "first");
						
							// Store bot Win
						setBotPlace(9);
					}
					else if (_refHolder.robots[5] == 0)
					{
						addCredits += 120;
						
							// Store Win
						DataTransfer.storeStats[2]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "second");
						
							// Store bot Win
						setBotPlace(10);
					}
					else if (_refHolder.robots[4] == 0)
					{
						addCredits += 75;
						
							// Store Win
						DataTransfer.storeStats[3]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "third");
						
							// Store bot Win
						setBotPlace(11);
					}
				break;
				
			case 3:
						// Offline Cup
					if (_refHolder.robots[6] == 0)
					{
						addCredits += 200;
						
							// Store Win
						DataTransfer.storeStats[1]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "first");
						
							// Store bot Win
						setBotPlace(9);
					}
					else if (_refHolder.robots[5] == 0)
					{
						addCredits += 160;
						
							// Store Win
						DataTransfer.storeStats[2]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "second");
						
							// Store bot Win
						setBotPlace(10);
					}
					else if (_refHolder.robots[4] == 0)
					{
						addCredits += 100;
						
							// Store Win
						DataTransfer.storeStats[3]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "third");
						
							// Store bot Win
						setBotPlace(11);
					}
				break;
			
			case 4:
						// Short Cup
					if (_refHolder.robots[6] == 0)
					{
						addCredits += 300;
							
							// Store Win
						DataTransfer.storeStats[1]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "first");
						
							// Store bot Win
						setBotPlace(9);
					}
					else if (_refHolder.robots[5] == 0)
					{
						addCredits += 200;
						
							// Store Win
						DataTransfer.storeStats[2]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "second");
						
							// Store bot Win
						setBotPlace(10);
					}
					else if (_refHolder.robots[4] == 0)
					{
						addCredits += 125;
						
							// Store Win
						DataTransfer.storeStats[3]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "third");
						
							// Store bot Win
						setBotPlace(11);
					}
				break;
				
			case 5:
						// Wired Cup
					if (_refHolder.robots[6] == 0)
					{
						addCredits += 350;
						
							// Store Win
						DataTransfer.storeStats[1]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "first");
						
							// Store bot Win
						setBotPlace(9);
					}
					else if (_refHolder.robots[5] == 0)
					{
						addCredits += 200;
						
							// Store Win
						DataTransfer.storeStats[2]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "second");
						
							// Store bot Win
						setBotPlace(10);
					}
					else if (_refHolder.robots[4] == 0)
					{
						addCredits += 125;
						
							// Store Win
						DataTransfer.storeStats[3]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "third");
						
							// Store bot Win
						setBotPlace(11);
					}
				break;
				
			case 6:
						// Shocking Cup
					if (_refHolder.robots[6] == 0)
					{
						addCredits += 400;
						
							// Store Win
						DataTransfer.storeStats[1]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "first");
						
							// Store bot Win
						setBotPlace(9);
					}
					else if (_refHolder.robots[5] == 0)
					{
						addCredits += 280;
						
							// Store Win
						DataTransfer.storeStats[2]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "second");
						
							// Store bot Win
						setBotPlace(10);
					}
					else if (_refHolder.robots[4] == 0)
					{
						addCredits += 175;
						
							// Store Win
						DataTransfer.storeStats[3]++;						
						
							// send analytics
						//Google.analytics.logEvent("stats", "finishes", "third");
						
							// Store bot Win
						setBotPlace(11);
					}
				break;
	}
	// Debug
	//print ("Credits earned:" + addCredits);	
		
		// pass point info over to something we can access in GUI_manager (for our text messages)
		// player Rank
	guiFlags.playerRank = _refHolder.ranking[0];
	
	// Debug
	//print ("Player Rank: " + _refHolder.ranking[0]);
	
		// calculate time based on player time (to fill times for bots that have not finished yet)
	var timePerDist : float = (_refHolder.Lap1times[0] + _refHolder.Lap2times[0] + _refHolder.Lap3times[0]) / _refHolder.fullTrack;
	
		// pass bot count to gui functions....
	guiFlags.botCount = _refHolder.botCount;
		
		// lap times
	for (var currSlot = 0; currSlot <= _refHolder.botCount; currSlot++)
	{	
			// if the current bot has finished the race
		if (_refHolder.Lap3times[currSlot] > 30)
		{
			// old by rank guiFlags.Lap1Time[currSlot] = _refHolder.Lap1times[_refHolder.robots[6 - currSlot]];
		guiFlags.Lap1Time[_refHolder.botMeshes[currSlot]] = _refHolder.Lap1times[currSlot];
		guiFlags.Lap2Time[_refHolder.botMeshes[currSlot]] = _refHolder.Lap2times[currSlot];
		guiFlags.Lap3Time[_refHolder.botMeshes[currSlot]] = _refHolder.Lap3times[currSlot];
		
		}
			// else bot hasn't finished yet
		else
		{
			
				// get the current progress vas the player progress
			var progressDiff : float = _refHolder.fullTrack - _refHolder.trackProgress[currSlot];
			
				// now calculate a round time based on the player time and the dist we are behind and the player time to finish...
			guiFlags.Lap3Time[_refHolder.botMeshes[currSlot]] = (progressDiff * timePerDist) + (_refHolder.Lap1times[0] + _refHolder.Lap2times[0] + _refHolder.Lap3times[0]);
			
				// fill the rest with zeros
			guiFlags.Lap1Time[_refHolder.botMeshes[currSlot]] = 0.0;
			guiFlags.Lap2Time[_refHolder.botMeshes[currSlot]] = 0.0;
			
				// failsafe
			if (guiFlags.Lap3Time[_refHolder.botMeshes[currSlot]] <= (_refHolder.Lap1times[0] + _refHolder.Lap2times[0] + _refHolder.Lap3times[0]) )
			{
				guiFlags.Lap3Time[_refHolder.botMeshes[currSlot]] = (_refHolder.Lap1times[0] + _refHolder.Lap2times[0] + _refHolder.Lap3times[0]) + 0.2;
			}
		}
	}
	
		// pass the credits we've earned to the GUI function
	guiFlags.playerCredits = addCredits;
	
		// store the players meshIndex
	guiFlags.playerMesh = _refHolder.botMeshes[0];

		// Handle credits
	DataTransfer.credits += addCredits;
	
		//
		//
		// handle circuit order
		
		// initialize an Array with the correct robot order, as is also used by the trackProgress array
	var orderdPoints : int[] = new int[7];
		
		// Fill the vaultProgress Array ..
		// vaultProgress = _refHolder.trackProgress;							// Doing this seems to create a reference as the ref Holder is sorted, too
	orderdPoints[0] = DataTransfer.botPoints[0];
	orderdPoints[1] = DataTransfer.botPoints[1];
	orderdPoints[2] = DataTransfer.botPoints[2];
	orderdPoints[3] = DataTransfer.botPoints[3];
	orderdPoints[4] = DataTransfer.botPoints[4];
	orderdPoints[5] = DataTransfer.botPoints[5];
	orderdPoints[6] = DataTransfer.botPoints[6];
					
		// now sort the robots by distance traveled ... (last first ...)
	System.Array.Sort(orderdPoints, _refHolder.orderedBots);							// yeah!! 

/*	
		//
		//	Since now our botPoints are ordered by botMesh and therefore the ordered Points are ordered by mesh
		//	AND _refHolder.orderedBots hold the botMeshes in ordered fashion we need a way to get the construct per mesh ..
		//
	
		// now get the construct per botMesh
	
	
	for (var testMesh = 0; testMesh < 7; testMesh++)
	{
		for (var testConstruct = 0; testConstruct < 7; testConstruct++)
		{
			if((DataTransfer.robotPositions[testConstruct] - 1) == testMesh)
			{
				_refHolder.meshConstruct[testMesh] = testConstruct;
			}
			else if (DataTransfer.robotPositions[testConstruct] == 8)
			{
					// player slot
				_refHolder.meshConstruct[testMesh] = 0;
			}
		}
	}
*/

	//
	//	CIRCUIT UNLOCK HANDLING
	//

	//IF THIS WAS THE LAST RACE OF THE CIRCUIT
		
		// below I replaced 0 (player construct) with _refHolder.botMeshes[0] (player mesh, as ordered bots is using that!!)
	
	if (DataTransfer.trackList[DataTransfer.currentTrack + 1] == 0)
	{
			// flag end of circuit
		endCircuit = true;
		
			// if we are NOT on the podium
		if (_refHolder.orderedBots[6] == _refHolder.botMeshes[0] || _refHolder.orderedBots[5] == _refHolder.botMeshes[0] || _refHolder.orderedBots[4] != _refHolder.botMeshes[0])
		{
			//print ("We are on podium");
			if (DataTransfer.currentCircuit != 0)
			{
		
				if (_refHolder.orderedBots[6] == _refHolder.botMeshes[0])
				{
						// Store circuit Win
					DataTransfer.storeStats[5]++;	
					
					if (DataTransfer.currentCircuit == 1)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "firstToasted");
					}
					else if (DataTransfer.currentCircuit == 2)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "firstConnected");
					}
					else if (DataTransfer.currentCircuit == 3)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "firstOffline");
					}
					else if (DataTransfer.currentCircuit == 4)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "firstShort");
					}
					else if (DataTransfer.currentCircuit == 5)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "firstWired");
					}
					else if (DataTransfer.currentCircuit == 6)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "firstShocking");
					}
						
				}
				else if (_refHolder.orderedBots[5] == _refHolder.botMeshes[0])
				{
						// Store circuit Win
					DataTransfer.storeStats[6]++;	
					
					if (DataTransfer.currentCircuit == 1)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "secondToasted");
					}
					else if (DataTransfer.currentCircuit == 2)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "secondConnected");
					}
					else if (DataTransfer.currentCircuit == 3)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "secondOffline");
					}
					else if (DataTransfer.currentCircuit == 4)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "secondShort");
					}
					else if (DataTransfer.currentCircuit == 5)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "secondWired");
					}
					else if (DataTransfer.currentCircuit == 6)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "secondShocking");
					}
				}
				else
				{
						// Store circuit Win
					DataTransfer.storeStats[7]++;
					
					if (DataTransfer.currentCircuit == 1)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "thirdToasted");
					}
					else if (DataTransfer.currentCircuit == 2)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "thirdConnected");
					}
					else if (DataTransfer.currentCircuit == 3)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "thirdOffline");
					}
					else if (DataTransfer.currentCircuit == 4)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "thirdShort");
					}
					else if (DataTransfer.currentCircuit == 5)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "thirdWired");
					}
					else if (DataTransfer.currentCircuit == 6)
					{
							// send analytics
						//Google.analytics.logEvent("stats", "circuits", "thirdShocking");
					}
				}
			}
			
			onPodium = true;	
		}
		
		var unlockedCircuit : boolean = false;
			
			// HANDLE CUP UNLOCK !!!!!
			// if we have won the cup, and it was the last race in the cup unlock the next one
		if (_refHolder.orderedBots[6] == _refHolder.botMeshes[0])
		{
				
		
		
				// UNLOCK NEXT DIFFICULTY !!!!
				// if we have won a quickRace .. unlock current map at next diff
			if (DataTransfer.currentCircuit == 0)
			{
	
			
			}
				// final circuit
			else if (DataTransfer.currentCircuit == 6)
			{
				if (DataTransfer.circuitUnlocks == 6)
				{
					gameBeat = true;
					DataTransfer.circuitUnlocks++;
					//print ("gameBeat");
				
						// send analytics
					//Google.analytics.logEvent("stats", "circuits", "beatGame");
				}
			}
				// no Quickrace ... circuit
			else if (DataTransfer.circuitUnlocks < (DataTransfer.currentCircuit + 1))
			{
				//Tell GameCenter that the next circuit has been unlocked
				//Doing this before incrementing because 1 is default value.
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.circuits.ach"+DataTransfer.circuitUnlocks,100.0);
					// unlock the next circuit
				DataTransfer.circuitUnlocks++;
				unlockedCircuit = true;
				guiFlags.hasUnlock = true;
				
					// init message
				// guiFlags.trackUnlocks += ("\nYou have unlocked: \n");
			}

			//
			// unlock the maps that belong to the next circuit
				
	// print ("unlocked: " + DataTransfer.circuitUnlocks);
					// unlockOverride
				//unlockedCircuit = true;
				//guiFlags.hasUnlock = true;
				//DataTransfer.circuitUnlocks = 2;
			if (unlockedCircuit)
			{
					// handle circuit unlocks
				switch (DataTransfer.circuitUnlocks)
				{
						// circuit 1 is always unlocked!!
						// HERE: check if the single maps aren't already bought
						//
						//	ADD UNLOCK MAPS (IF ANY).
						//
					case 2:
							//guiFlags.trackUnlocks = LanguageHandler.circuitNames[1];
							guiFlags.trackUnlocks = "circuitNames2";
								// set correct image
							circuitScr.changeState(1);
						break;
					case 3:
							//guiFlags.trackUnlocks = LanguageHandler.circuitNames[2];
							guiFlags.trackUnlocks = "circuitNames3";
								// set correct image
							circuitScr.changeState(2);
						break;
					case 4:
							//guiFlags.trackUnlocks = LanguageHandler.circuitNames[3];
							guiFlags.trackUnlocks = "circuitNames4";
								// set correct image
							circuitScr.changeState(3);
						break;
					case 5:
							//guiFlags.trackUnlocks = LanguageHandler.circuitNames[4];
							guiFlags.trackUnlocks = "circuitNames5";
								// set correct image
							circuitScr.changeState(5);
						break;
					case 6:
							//guiFlags.trackUnlocks = LanguageHandler.circuitNames[5];
							guiFlags.trackUnlocks = "circuitNames6";
								// set correct image
							circuitScr.changeState(4);
						break;
				}
			}
		}
	// end last circuit lap check
	}

/* OLD
		// pass the bots in rank order over ...
	guiFlags.podiumBots[0] = _refHolder.botMeshes[ _refHolder.orderedBots[6] ];
	guiFlags.podiumBots[1] = _refHolder.botMeshes[ _refHolder.orderedBots[5] ];
	guiFlags.podiumBots[2] = _refHolder.botMeshes[ _refHolder.orderedBots[4] ];
	guiFlags.podiumBots[3] = _refHolder.botMeshes[ _refHolder.orderedBots[3] ];
	guiFlags.podiumBots[4] = _refHolder.botMeshes[ _refHolder.orderedBots[2] ];
	
		// pass the constructs in correct order
	guiFlags.podiumConstructs[0] = _refHolder.orderedBots[6];
	guiFlags.podiumConstructs[1] = _refHolder.orderedBots[5];
	guiFlags.podiumConstructs[2] = _refHolder.orderedBots[4];
	guiFlags.podiumConstructs[3] = _refHolder.orderedBots[3];
	guiFlags.podiumConstructs[4] = _refHolder.orderedBots[2];
*/

/*
Use Race sorting .. set above
	
		// pass the bots in rank order over ...
	guiFlags.podiumBots[0] = _refHolder.orderedBots[6];
	guiFlags.podiumBots[1] = _refHolder.orderedBots[5];
	guiFlags.podiumBots[2] = _refHolder.orderedBots[4];
	guiFlags.podiumBots[3] = _refHolder.orderedBots[3];
	guiFlags.podiumBots[4] = _refHolder.orderedBots[2];
*/	
		// pass the constructs in correct order
	//guiFlags.podiumConstructs[0] = _refHolder.meshConstruct[_refHolder.orderedBots[6]];
	//guiFlags.podiumConstructs[1] = _refHolder.meshConstruct[_refHolder.orderedBots[5]];
	//guiFlags.podiumConstructs[2] = _refHolder.meshConstruct[_refHolder.orderedBots[4]];
	//guiFlags.podiumConstructs[3] = _refHolder.meshConstruct[_refHolder.orderedBots[3]];
	//guiFlags.podiumConstructs[4] = _refHolder.meshConstruct[_refHolder.orderedBots[2]];
	
		// decide ... store here or on exit (in case we hit replay)
		// save our unlocks for good
	setUnlocks();				
}

	
function endContinueDecide()
{
//print ("endContinueDecide started! On Podium Value: " + onPodium);

		// first check if this is the last level in the Circuit (IF so, the next level to load would be 0)
	// if (DataTransfer.trackList[DataTransfer.currentTrack + 1] == 0)
	if(endCircuit)
	{
			// if we are NOT on the podium
		if (!onPodium)
		{
				// if we are not on the podium, continue goes to the endLevel menu
			//endCircuit = true;
			
				// hide debug menu
			guiFlags.activeMenu = 10;
			
			showEndMenu();
			
			//print ("Last map but not on Podium -> start EndMenu");
		}
			// if we have not started the podium sequence yet
		else if (!_refHolder.podiumStart)
		{
				// flag end of circuit
			//endCircuit = true;
			
			if (gameBeat)
			{
					// we have beat the game. Show dialog first
				showEnd.localPosition = Vector3(0,0,5);
			}
			
				// for now just enable podium mode..	(which is handled in the podium handler)
			_refHolder.podiumStart = true;
			
				// inform the GUI handler that we are going into podium mode
			// do in GUI_Manager state 10 (so that text is deleted) guiFlags.activeMenu = 11;
			
			//print ("Last map but Started Podium -> start EndMenu");
		}
	}
		// not the final map in the circuit -> no Podium shown -> go to next map
	else
	{
			// show endLevel menu, but continue should call below:
		Debug.Log("End");
		endCircuit = false;
		
			// hide debug menu
		guiFlags.activeMenu = 10;
			
		showEndMenu();
		
		print ("Not last map, so no podium -> start EndMenu");
	}
}


function showEndMenu ()
{
		// shows the end menu!!
	guiFlags.activeMenu = 20;
	
		// set flag to show end menu
	endMenu = true;

	//print ("show End Menu Called!!! ");
	
}


	// continue menu progression (Always calles if screen tapped (or continue button hit))
function btnContinue () 
{
		// first post race touch
	if (!assignedPoints)
	{
			// set first Menu (player lap times / later add badges here
		guiFlags.activeMenu = 2;
		//print ("active Menu set to 2");
		
			// Set assignedPoints to true
		assignedPoints = true;

			// runthe post race calculations ...
		postRaceProcessor();
	}
	else
	{
			// after initial run enable menu navigation
		switch (guiFlags.activeMenu)
		{
				// first Run -> enable race summary
			case 2:
						// enable race summary
					guiFlags.activeMenu = 3;
					//print ("active Menu set to 3");
					
						// do rest of needed stuff
				break;
			
			case 3:
						// check if we have unlocks
					
						// if not go to podium, else go to unlock screen
						
						// for now just go into debug mode
						if (guiFlags.hasUnlock == true)
						{
								// if we have unlocks go to unlock screen
							guiFlags.activeMenu = 4;
							
								// show the image
							circuitTrn.localPosition.y = -7.0;
							// DEBUG
							//print ("UNLOCKS!!!");
						}
						else
						{		// else to debug menu
							guiFlags.activeMenu = 9;
							
								// show the badges screen
							badgesIcons.localPosition.y = 0.0;
							DataTransfer.badgeUpdate = true;
							
								// hide the image
							circuitTrn.localPosition.y = 20000.0;
						}
					//print ("active Menu set to 10");
					
				break;
				
			case 4:

						// for now just go into badge mode
					// DEBUG
					guiFlags.activeMenu = 9;
					
						// show the badges screen
					badgesIcons.localPosition.y = 0.0;
					DataTransfer.badgeUpdate = true;
					
						// hide the image
					circuitTrn.localPosition.y = 20000.0;
					//print ("active Menu set to 10");
					
				break;
				
			case 9:
						// wait for touch after decide
					guiFlags.activeMenu = 10;
					//print ("active Menu set to 10");
						
						// hide the badges screen
					badgesIcons.localPosition.y = -2000.0;
					DataTransfer.badgeUpdate = false;
					
						// handle the continue decision
					endContinueDecide();
				break;	
				
			case 10:
						// decide what to do
						// this is basically the pause mode for endContinueDecide. If we show the podium, 
						// we go to 11 until it is ready. Otherwise we just show the menu
					//print ("active Menu still at 10");
				break;
				
			case 11:
			
						// if the podium is already active
					if (_refHolder.podiumActive)
					{
								// we tapped the screen in podium mode -> Show the endLevel menu
						showEndMenu();
						//print ("active Menu set to 10");
					}
				break;
				
			case 20:
						//print ("Handle exit!! This sould not work with just touching the screen!!!!");
				
						// handle level exit on continue button
					if (endCircuit)
					{
					
							// make sure this is called only ONCE (change MENU)
						guiFlags.activeMenu = 999;
						
							// exit if last race of circuit (or quickrace)
						btnMainMenu();
						//print ("Main Menu Called");
					}
					else
					{
							// make sure this is called only ONCE (change MENU)
						guiFlags.activeMenu = 999;
					
							// go to next circuit if not last race of circuit
						nextCircuitTrack();
					}
				break;
		}
	}


}


function OnGUI_deactivated()
{			
//if((pos.x < rasterColOne) && (pos.y > rasterRowTwo) && (pos.y < (rasterRowTwo + (40 * itemScale) ) ) )
GUI.Box(Rect(rasterColOne, (40 * heightRatio * itemScale),50,50),("PAUSE"));

																		// temp code for the in game menu
/*
	if (guiFlags.activeMenu == 9)
	{											
			//
			// Race summary
			//
			
			// Info:
			//	In _refHolder I am storing the robots in a ordered array that contains their rank (Ranking[0] is the rank of the player construct) (in correct order)
			//	The robots ordered by their rank where the array contains the index of the robot in the current rank (Robots[0] is index of the last robot) (in reversed order)
			// 	The mesh index for each robot (botMeshes[0] is the mesh index of the current selected player robot)
			
			
			// Get our bot names
		var botNames : String[] = new String[7];
		botNames[0] = "Vektor";
		botNames[1] = "iRobot";
		botNames[2] = "Truck";
		botNames[3] = "Steamball";
		botNames[4] = "PodBot";
		botNames[5] = "MonoBot";
		botNames[6] = "TriBot";
			
			
			// Spalten
		GUI.Box(Rect(((sWidth / 4) * 1),10 ,((sWidth / 4) * 1),30),("Lap 1"));
		GUI.Box(Rect(((sWidth / 4) * 2),10 ,((sWidth / 4) * 1),30),("Lap 2"));
		GUI.Box(Rect(((sWidth / 4) * 3),10 ,((sWidth / 4) * 1),30),("Lap 3"));

		for (var currLine = 0; currLine < 7; currLine++)
		{
			var currRank : int = 6 - currLine;
			
				// check if we are at the player position (rankings are in inverse order)
			if (currLine == _refHolder.ranking[0])
			{
				GUI.color = Color.red;
			}
			else
			{
				GUI.color = Color.white;
			}
			
				// now draw the lines ...
			GUI.Box(Rect((10),((sHeight / 10) * (currLine + 1.5)) ,(((sWidth / 5) * 1) - 20),25),(botNames[_refHolder.botMeshes[_refHolder.robots[currRank]]]));
			
				// now draw the times ...
			GUI.Box(Rect(((sWidth / 4) * 1),((sHeight / 10) * (currLine + 1.5)) ,((sWidth / 4) * 1),25), " " + _refHolder.Lap1times[_refHolder.robots[currRank]] + " sec.");
			GUI.Box(Rect(((sWidth / 4) * 2),((sHeight / 10) * (currLine + 1.5)) ,((sWidth / 4) * 1),25), " " + _refHolder.Lap2times[_refHolder.robots[currRank]] + " sec.");
			GUI.Box(Rect(((sWidth / 4) * 3),((sHeight / 10) * (currLine + 1.5)) ,((sWidth / 4) * 1),25), " " + _refHolder.Lap3times[_refHolder.robots[currRank]] + " sec.");
		}
		
	}
	*/
}
