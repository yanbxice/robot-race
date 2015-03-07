// ##########################################
//
//	Level init script
//
//		This script initializes the level.
//		You can specify number of AI robots, placement of robots and corresponding meshes ..
//
//	##########################################

//
//	ai transTime needs to be replaced by transUpTime
//

// #####	SETUP VARs	#####

	// the settings brought from the menu..
private var loadSettings : GameObject;

	// use iPhone controls??
//var iPhoneCtls = 0;						// are we using the iPhone controls??
var wrongDirEnable : boolean = true;

	// Access the spawnpoints directly
var spawnPoints : Transform[] = new Transform[7];

	// access the player construct transform and set directly to it's spawnpoint..
var playerTrns : Transform;

	// Access the ai constructs and robot meshes
// --- First 2 replace by all Constructs ...	

var playerConstruct : GameObject;									// the player GO
var aiConstructs : GameObject[] = new GameObject[6];				// the ai constructs
var robotMeshes : GameObject[] = new GameObject[7];					// the robot meshes
var robotHips : Transform[] = new Transform[7];
// var robotRenderes : GameObject[] = new GameObject[7];				// the robot Renderer holders (for bounding box query)
// var aiHudIndicators : GameObject[] = new GameObject[6];				// the HUD indicators
var robotUsed : boolean[] = new boolean[7];							// is the indexed robot used?

// WILL BE REPLACED WITH REFHOLDER
var allConstructs : Transform[] = new Transform[7];					// ordered array of all robot transforms, for AI targetting

	// Set Player position and according robot meshes...
var playerPosition : int = 1;			// basically the spawnPoint to use
var playerRobot : int = 1;				// the robot mesh to use ...
	
											// I'll leave those open for now .. later on they will be set to private and modified by the robot selection, and how the player qualifies in the race ..
var robotPositions : int[] = new int[7];	// the placement of the other robots! 0 means this robot is not available for the race, 8 means this robot is used by the player

	// gravity and speedplane settings
var gravity = -15.0;							// in m/sÂ²
// in stat Files...    var speedPlaneSpeed = 45.0;						// SpeedPlane Contact
var speedPlaneTime = 5.0;						// speedplane boost in sec.


	// camera location setting...
var nCamPos : Vector3 = Vector3(0, 2.5, -3);					// the cam locations in robot mode ....
var nCamTrgtPos : Vector3 = Vector3(0, 1.5, 0);
var uCamPos : Vector3 = Vector3(0, 1.1, -2);				// the cam locations in robot mode ...
var uCamTrgtPos : Vector3 = Vector3(0, 0.5, 0);
var dCamPos : Vector3 = Vector3(0, 0.9, -1.5);				// the cam locations in robot mode ...
var dCamTrgtPos : Vector3 = Vector3(0, 0.5, 0);
var camTransTime : float = 2.0;								// time the camera change for transforms takes ...

var startCam : Vector3 = Vector3(0, 2, -4);					// the initial starting position of our camera

	// WP Vars...
var waypoint : Transform;									// the first waypoint ... needs to be set!!

var switchDist : float = 15.0;								// when to switch to next WP
var aiSwitchDist : float = 4.0;								// when to switch to next WP
var raceLaps : int = 3;										// how many laps the race has
var endzone : float = 700.0;								// length of zone before finishline where AI won'd accelerate extra

	// the time before race starts ...
var startTimer : float = 0.0;								// in seconds
private var startTime : float;								// time index when to start (set in start function)

	// adjust the colliders for all bots..
private var skateHeight : float = 1.1;						// the height of the raycast senders. back down to 1 on iPhone ..
private var carHeight : float = 0.5;
private var planeHeight : float = 0.1;

	// deadzone setting
private var deadzone : float = 1.5;			// deadzone for AI
	
	
	// transformed time for all bots:
var transTime : float = 4.0;
// var transDnTime : float = 1.0;			// time for car mode
var transUpTime : float = 5.0;				// time for plane mode
	
//var useLocal : boolean = false;				// do we use the local settings holder?
//var settingsHolderScr : settingsHolder; 	// store the settings Holder script

var updateMaterial : _updateMaterial;


/*
	// stats...
	// Add some stats per robot here as variables, that get loaded into the level instead of
	// being read from the stats file (but ideally only if using the imported and not the local
	// level init file)
var botSpeed : float[] = new float[7];
var botRotation : float[] = new float[7];
var botAcc : float[] = new float[7];
var botDec : float[] = new float[7];
var botSpeedpad : float[] = new float[7];
var botOffroad : float[] = new float[7];
var carSpeed : float[] = new float[7];
var carRotation : float[] = new float[7];
var carAcc : float[] = new float[7];
var carDec : float[] = new float[7];
var carSpeedpad : float[] = new float[7];
var carOffroad : float[] = new float[7];
var planeSpeed : float[] = new float[7];
var planeRotation : float[] = new float[7];
var planeAcc : float[] = new float[7];
var planeDec : float[] = new float[7];
var planeSpeedpad : float[] = new float[7];
var planeOffroad : float[] = new float[7];
var speedRotationDecrease : float[] = new float[7];
var maxSlideAngle : float[] = new float[7];
var fullSlideTime : float[] = new float[7];
var planeRollMulti : float[] = new float[7];
var turnCharMulti : float[] = new float[7];
var downforce : float[] = new float[7];
var transformDnTimeshift : float[] = new float[7];

	// the added juice stats
var juiceBuildup : float[] = new float[7];
var juiceFull : float[] = new float[7];


var vektorStats : VektorStats;
var irobotStats : IrobotStats;
var truckStats : TruckStats;
var steamballStats : SteamballStats;
var podbotStats : PodbotStats;
var monoStats : MonoStats;
var triStats : TriStats;

function ReadStats()
{
		//
		// now read our values from the stats file ...
		//
		
		// Vektor...
	botSpeed[0] = vektorStats.botSpeed;
	botRotation[0] = vektorStats.botRotation;
	botAcc[0] = vektorStats.botAcc;
	botDec[0] = vektorStats.botDec;
	botSpeedpad[0] = vektorStats.botSpeedpad;
	botOffroad[0] = vektorStats.botOffroad;
	carSpeed[0] = vektorStats.carSpeed;
	carRotation[0] = vektorStats.carRotation;
	carAcc[0] = vektorStats.carAcc;
	carDec[0] = vektorStats.carDec;
	carSpeedpad[0] = vektorStats.carSpeedpad;
	carOffroad[0] = vektorStats.carOffroad;
	planeSpeed[0] = vektorStats.planeSpeed;
	planeRotation[0] = vektorStats.planeRotation;
	planeAcc[0] = vektorStats.planeAcc;
	planeDec[0] = vektorStats.planeDec;
	planeSpeedpad[0] = vektorStats.planeSpeedpad;
	planeOffroad[0] = vektorStats.planeOffroad;
	speedRotationDecrease[0] = vektorStats.speedRotationDecrease;
	maxSlideAngle[0] = vektorStats.maxSlideAngle;
	fullSlideTime[0] = vektorStats.fullSlideTime;
	planeRollMulti[0] = vektorStats.planeRollMulti;
	turnCharMulti[0] = vektorStats.turnCharMulti;
	downforce[0] = vektorStats.downforce;
	transformDnTimeshift[0] = vektorStats.transformDnTimeshift;	
	juiceBuildup[0] = vektorStats.juiceBuildup;
	juiceFull[0] = vektorStats.juiceFull;
	
		// iRobot...
	botSpeed[1] = irobotStats.botSpeed;
	botRotation[1] = irobotStats.botRotation;
	botAcc[1] = irobotStats.botAcc;
	botDec[1] = irobotStats.botDec;
	botSpeedpad[1] = irobotStats.botSpeedpad;
	botOffroad[1] = irobotStats.botOffroad;
	carSpeed[1] = irobotStats.carSpeed;
	carRotation[1] = irobotStats.carRotation;
	carAcc[1] = irobotStats.carAcc;
	carDec[1] = irobotStats.carDec;
	carSpeedpad[1] = irobotStats.carSpeedpad;
	carOffroad[1] = irobotStats.carOffroad;
	planeSpeed[1] = irobotStats.planeSpeed;
	planeRotation[1] = irobotStats.planeRotation;
	planeAcc[1] = irobotStats.planeAcc;
	planeDec[1] = irobotStats.planeDec;
	planeSpeedpad[1] = irobotStats.planeSpeedpad;
	planeOffroad[1] = irobotStats.planeOffroad;
	speedRotationDecrease[1] = irobotStats.speedRotationDecrease;
	maxSlideAngle[1] = irobotStats.maxSlideAngle;
	fullSlideTime[1] = irobotStats.fullSlideTime;
	planeRollMulti[1] = irobotStats.planeRollMulti;
	turnCharMulti[1] = irobotStats.turnCharMulti;
	downforce[1] = irobotStats.downforce;
	transformDnTimeshift[1] = irobotStats.transformDnTimeshift;
	juiceBuildup[1] = irobotStats.juiceBuildup;
	juiceFull[1] = irobotStats.juiceFull;
	
		// Truck...
	botSpeed[2] = truckStats.botSpeed;
	botRotation[2] = truckStats.botRotation;
	botAcc[2] = truckStats.botAcc;
	botDec[2] = truckStats.botDec;
	botSpeedpad[2] = truckStats.botSpeedpad;
	botOffroad[2] = truckStats.botOffroad;
	carSpeed[2] = truckStats.carSpeed;
	carRotation[2] = truckStats.carRotation;
	carAcc[2] = truckStats.carAcc;
	carDec[2] = truckStats.carDec;
	carSpeedpad[2] = truckStats.carSpeedpad;
	carOffroad[2] = truckStats.carOffroad;
	planeSpeed[2] = truckStats.planeSpeed;
	planeRotation[2] = truckStats.planeRotation;
	planeAcc[2] = truckStats.planeAcc;
	planeDec[2] = truckStats.planeDec;
	planeSpeedpad[2] = truckStats.planeSpeedpad;
	planeOffroad[2] = truckStats.planeOffroad;
	speedRotationDecrease[2] = truckStats.speedRotationDecrease;
	maxSlideAngle[2] = truckStats.maxSlideAngle;
	fullSlideTime[2] = truckStats.fullSlideTime;
	planeRollMulti[2] = truckStats.planeRollMulti;
	turnCharMulti[2] = truckStats.turnCharMulti;
	downforce[2] = truckStats.downforce;
	transformDnTimeshift[2] = truckStats.transformDnTimeshift;
	juiceBuildup[2] = truckStats.juiceBuildup;
	juiceFull[2] = truckStats.juiceFull;
	
		// Steamball...
	botSpeed[3] = steamballStats.botSpeed;
	botRotation[3] = steamballStats.botRotation;
	botAcc[3] = steamballStats.botAcc;
	botDec[3] = steamballStats.botDec;
	botSpeedpad[3] = steamballStats.botSpeedpad;
	botOffroad[3] = steamballStats.botOffroad;
	carSpeed[3] = steamballStats.carSpeed;
	carRotation[3] = steamballStats.carRotation;
	carAcc[3] = steamballStats.carAcc;
	carDec[3] = steamballStats.carDec;
	carSpeedpad[3] = steamballStats.carSpeedpad;
	carOffroad[3] = steamballStats.carOffroad;
	planeSpeed[3] = steamballStats.planeSpeed;
	planeRotation[3] = steamballStats.planeRotation;
	planeAcc[3] = steamballStats.planeAcc;
	planeDec[3] = steamballStats.planeDec;
	planeSpeedpad[3] = steamballStats.planeSpeedpad;
	planeOffroad[3] = steamballStats.planeOffroad;
	speedRotationDecrease[3] = steamballStats.speedRotationDecrease;
	maxSlideAngle[3] = steamballStats.maxSlideAngle;
	fullSlideTime[3] = steamballStats.fullSlideTime;
	planeRollMulti[3] = steamballStats.planeRollMulti;
	turnCharMulti[3] = steamballStats.turnCharMulti;
	downforce[3] = steamballStats.downforce;
	transformDnTimeshift[3] = steamballStats.transformDnTimeshift;
	juiceBuildup[3] = steamballStats.juiceBuildup;
	juiceFull[3] = steamballStats.juiceFull;
	
		// Podbot...
	botSpeed[4] = podbotStats.botSpeed;
	botRotation[4] = podbotStats.botRotation;
	botAcc[4] = podbotStats.botAcc;
	botDec[4] = podbotStats.botDec;
	botSpeedpad[4] = podbotStats.botSpeedpad;
	botOffroad[4] = podbotStats.botOffroad;
	carSpeed[4] = podbotStats.carSpeed;
	carRotation[4] = podbotStats.carRotation;
	carAcc[4] = podbotStats.carAcc;
	carDec[4] = podbotStats.carDec;
	carSpeedpad[4] = podbotStats.carSpeedpad;
	carOffroad[4] = podbotStats.carOffroad;
	planeSpeed[4] = podbotStats.planeSpeed;
	planeRotation[4] = podbotStats.planeRotation;
	planeAcc[4] = podbotStats.planeAcc;
	planeDec[4] = podbotStats.planeDec;
	planeSpeedpad[4] = podbotStats.planeSpeedpad;
	planeOffroad[4] = podbotStats.planeOffroad;
	speedRotationDecrease[4] = podbotStats.speedRotationDecrease;
	maxSlideAngle[4] = podbotStats.maxSlideAngle;
	fullSlideTime[4] = podbotStats.fullSlideTime;
	planeRollMulti[4] = podbotStats.planeRollMulti;
	turnCharMulti[4] = podbotStats.turnCharMulti;
	downforce[4] = podbotStats.downforce;
	transformDnTimeshift[4] = podbotStats.transformDnTimeshift;
	juiceBuildup[4] = podbotStats.juiceBuildup;
	juiceFull[4] = podbotStats.juiceFull;
	
		// Monobot...
	botSpeed[5] = monoStats.botSpeed;
	botRotation[5] = monoStats.botRotation;
	botAcc[5] = monoStats.botAcc;
	botDec[5] = monoStats.botDec;
	botSpeedpad[5] = monoStats.botSpeedpad;
	botOffroad[5] = monoStats.botOffroad;
	carSpeed[5] = monoStats.carSpeed;
	carRotation[5] = monoStats.carRotation;
	carAcc[5] = monoStats.carAcc;
	carDec[5] = monoStats.carDec;
	carSpeedpad[5] = monoStats.carSpeedpad;
	carOffroad[5] = monoStats.carOffroad;
	planeSpeed[5] = monoStats.planeSpeed;
	planeRotation[5] = monoStats.planeRotation;
	planeAcc[5] = monoStats.planeAcc;
	planeDec[5] = monoStats.planeDec;
	planeSpeedpad[5] = monoStats.planeSpeedpad;
	planeOffroad[5] = monoStats.planeOffroad;
	speedRotationDecrease[5] = monoStats.speedRotationDecrease;
	maxSlideAngle[5] = monoStats.maxSlideAngle;
	fullSlideTime[5] = monoStats.fullSlideTime;
	planeRollMulti[5] = monoStats.planeRollMulti;
	turnCharMulti[5] = monoStats.turnCharMulti;
	downforce[5] = monoStats.downforce;
	transformDnTimeshift[5] = monoStats.transformDnTimeshift;
	juiceBuildup[5] = monoStats.juiceBuildup;
	juiceFull[5] = monoStats.juiceFull;
	
		// Tribot...
	botSpeed[6] = triStats.botSpeed;
	botRotation[6] = triStats.botRotation;
	botAcc[6] = triStats.botAcc;
	botDec[6] = triStats.botDec;
	botSpeedpad[6] = triStats.botSpeedpad;
	botOffroad[6] = triStats.botOffroad;
	carSpeed[6] = triStats.carSpeed;
	carRotation[6] = triStats.carRotation;
	carAcc[6] = triStats.carAcc;
	carDec[6] = triStats.carDec;
	carSpeedpad[6] = triStats.carSpeedpad;
	carOffroad[6] = triStats.carOffroad;
	planeSpeed[6] = triStats.planeSpeed;
	planeRotation[6] = triStats.planeRotation;
	planeAcc[6] = triStats.planeAcc;
	planeDec[6] = triStats.planeDec;
	planeSpeedpad[6] = triStats.planeSpeedpad;
	planeOffroad[6] = triStats.planeOffroad;
	speedRotationDecrease[6] = triStats.speedRotationDecrease;
	maxSlideAngle[6] = triStats.maxSlideAngle;
	fullSlideTime[6] = triStats.fullSlideTime;
	planeRollMulti[6] = triStats.planeRollMulti;
	turnCharMulti[6] = triStats.turnCharMulti;
	downforce[6] = triStats.downforce;
	transformDnTimeshift[6] = triStats.transformDnTimeshift;
	juiceBuildup[6] = triStats.juiceBuildup;
	juiceFull[6] = triStats.juiceFull;
	

}




function setAiStats (robot : int, aiMoveScript : aiMove)
{

		// New way using the settingsHolder
	aiMoveScript.botSpeed = botSpeed[robot];
	aiMoveScript.botRotation = botRotation[robot];
	aiMoveScript.botAcc = botAcc[robot];
	aiMoveScript.botDec = botDec[robot];
	aiMoveScript.botSpeedpad = botSpeedpad[robot];
	aiMoveScript.botOffroad = botOffroad[robot];

	aiMoveScript.planeSpeed = planeSpeed[robot];
	aiMoveScript.planeRotation = planeRotation[robot];
	aiMoveScript.planeAcc = planeAcc[robot];
	aiMoveScript.planeDec = planeDec[robot];
	aiMoveScript.planeSpeedpad = planeSpeedpad[robot];
	aiMoveScript.planeOffroad = planeOffroad[robot];

	aiMoveScript.carSpeed = carSpeed[robot];
	aiMoveScript.carRotation = carRotation[robot];
	aiMoveScript.carAcc = carAcc[robot];
	aiMoveScript.carDec = carDec[robot];
	aiMoveScript.carSpeedpad = carSpeedpad[robot];

		
	aiMoveScript.speedRotationDecrease = speedRotationDecrease[robot];
	aiMoveScript.maxSlideAngle = maxSlideAngle[robot];
	aiMoveScript.fullSlideTime = fullSlideTime[robot];
	aiMoveScript.planeRollMulti = planeRollMulti[robot];
	
	aiMoveScript.turnCharMulti = turnCharMulti[robot];
		
	aiMoveScript.downforce = downforce[robot];
	aiMoveScript.transformDnTimeshift = transformDnTimeshift[robot];
	
		// the added juice stats
	aiMoveScript.juiceBuildup = juiceBuildup[robot];
	aiMoveScript.juiceFull = juiceFull[robot];


}


function setPlayerStats (robot : int, pInputScript : pInput, pMoveScript : pMove)
{

		// New way using the settingsHolder
	pMoveScript.botSpeed = botSpeed[robot - 1];
	pMoveScript.botRotation = botRotation[robot - 1];
	pMoveScript.botAcc = botAcc[robot - 1];
	pMoveScript.botDec = botDec[robot - 1];
	pMoveScript.botSpeedpad = botSpeedpad[robot - 1];
	pMoveScript.botOffroad = botOffroad[robot - 1];

	pMoveScript.planeSpeed = planeSpeed[robot - 1];
	pMoveScript.planeRotation = planeRotation[robot - 1];
	pMoveScript.planeAcc = planeAcc[robot - 1];
	pMoveScript.planeDec = planeDec[robot - 1];
	pMoveScript.planeSpeedpad = planeSpeedpad[robot - 1];
	pMoveScript.planeOffroad = planeOffroad[robot - 1];

	pMoveScript.carSpeed = carSpeed[robot - 1];
	pMoveScript.carRotation = carRotation[robot - 1];
	pMoveScript.carAcc = carAcc[robot - 1];
	pMoveScript.carDec = carDec[robot - 1];
	pMoveScript.carSpeedpad = carSpeedpad[robot - 1];

		
	pMoveScript.speedRotationDecrease = speedRotationDecrease[robot - 1];
	pMoveScript.maxSlideAngle = maxSlideAngle[robot - 1];
	pMoveScript.fullSlideTime = fullSlideTime[robot - 1];
	pMoveScript.planeRollMulti = planeRollMulti[robot - 1];
	
	pMoveScript.turnCharMulti = turnCharMulti[robot - 1];
		
	pMoveScript.downforce = downforce[robot - 1];
	pMoveScript.transformDnTimeshift = transformDnTimeshift[robot - 1];
	
		// the added juice stats
	pMoveScript.juiceBuildup = juiceBuildup[robot - 1];
	pMoveScript.juiceFull = juiceFull[robot - 1];
	

}

*/

function Awake () 
{
		// read our stats ...
	// ReadStats();

	// print ("Race Type: " + DataTransfer.currentCircuit);
#if UNITY_IPHONE
			// Disable screen dimming
		Screen.sleepTimeout = 0.0f;
		
#endif
		//
		// setup all physics ignore settings
		//
		
	// ignore trigger layers
	Physics.IgnoreLayerCollision(14,14,true);
	
		// ignore Floor Layers
	Physics.IgnoreLayerCollision(14,8,true);
	
		// ignore player Layers
	Physics.IgnoreLayerCollision(14,10,true);
	
		//
		//	END Physics ignore
		//

/*
		// get our settings holder
	loadSettings = GameObject.Find("_rr_settings_holder");
	
	
	if(loadSettings == null)
	{								// if we're not passing one from the menu take the local one
		loadSettings = GameObject.Find("_rr_settings_holder_local");
		useLocal = true;
	}
	settingsHolderScr = (loadSettings.GetComponent(settingsHolder) as settingsHolder);  
	*/
		// handle the ai setting...
	var _refHolder = GameObject.Find("_refHolder");
	var _refHolderScr = (_refHolder.GetComponent(refHolder) as refHolder); 
	
	_refHolderScr.aiDiff = DataTransfer.aiDiff;
	
	var guiHolder = GameObject.Find("GUI_Handler");
	var guiFlags = (guiHolder.GetComponent(GUI_Flags) as GUI_Flags); 
	
		// find the update metrial item
	updateMaterial = GameObject.Find("_materialHandler").GetComponent(_updateMaterial) as _updateMaterial; 
	
		// update material
	updateMaterial.doUpdate();
	
		// remove item
	Destroy(GameObject.Find("_materialHandler"));
	
	// DEBUG
	//print ("Player Position: " + DataTransfer.playerPosition);
	
	if (DataTransfer.playerPosition == 8)
	{
		DataTransfer.playerPosition = 1;
	}
	
	/*
		// if we are using the local settings holder, import the stats from our files
	if(useLocal)
	{
		
			// if this is the first track of circuit testing, init values..
		if (DataTransfer.currentTrack == 0)
		{
				// if we are using the local settigs holder, make sure everything works
			//DataTransfer.playerBot = settingsHolderScr.playerBot;										// get the player bot type from our settings
			//DataTransfer.playerPosition = settingsHolderScr.playerPosition;
				// force 4 bots again
			DataTransfer.robotPositions = [8,2,5,4,0,0,0];
			DataTransfer.robotRankTarget = [8,2,3,0,1,5,4];
			DataTransfer.botCount = _refHolderScr.botCount;
			
				// currentOverride
			//DataTransfer.currentCircuit = 2;
			//DataTransfer.circuitUnlocks = 2;
			
				// initialize Circuit testing ...
			DataTransfer.trackList[0] = 2;
			DataTransfer.trackList[1] = 0;
			DataTransfer.trackList[2] = 0;
			DataTransfer.trackList[3] = 0;

		}
	}
	*/
		// now delete Level items based on difficulty
	if (_refHolderScr.aiDiff < 2)
	{
			// remove Hard mode obstacles
		var hardBarriers = GameObject.Find("difficulty_hard");
		
		if (hardBarriers != null)
		{
			Destroy(hardBarriers);
		}
		
		// remove Hard mode obstacles
		hardBarriers = GameObject.Find("diff_hard");
		
		if (hardBarriers != null)
		{
			Destroy(hardBarriers);
		}
				
	}
	
	if (_refHolderScr.aiDiff < 1)
	{
		var medBarriers = GameObject.Find("difficulty_med");
		
		if (medBarriers != null)
		{
			Destroy(medBarriers);
		}
		
		medBarriers = GameObject.Find("diff_med");
		
		if (medBarriers != null)
		{
			Destroy(medBarriers);
		}

	}
	
		// now delete objects that should be removed with higher difficulty
	if (_refHolderScr.aiDiff > 0)
	{
		var belowMed = GameObject.Find("diff_below_Med");
		
		if (belowMed != null)
		{
			Destroy(belowMed);
		}
	}
	
	if (_refHolderScr.aiDiff > 1)
	{
		var belowHard = GameObject.Find("diff_below_Hard");
		
		if (belowHard != null)
		{
			Destroy(belowHard);
		}
	}
	
		// now based on our selected robot .. fill in the other slots...
	playerRobot = DataTransfer.playerBot;										// get the player bot type from our settings
	playerPosition = DataTransfer.playerPosition;								// get the stored player position
	
		// reset the badges counter for this race
	DataTransfer.badgesRace = [0,0,0,0,0,0,0,0,0,0,0];
	DataTransfer.hitsRace = [0,0,0,0,0,0,0,0,0,0,0];
	DataTransfer.damageRace = [0,0,0,0,0,0,0,0,0,0,0];
	DataTransfer.badgeCount = 0;
	
		// robotPositions = DataTransfer.robotPositions;

		
		// get the iPhone ctls settings...
	// iPhoneCtls = settingsHolderScr.iPhoneCtls;

//
//
//	EDIT - take stored value ... count bots ...
//		
		// go through each Robot Positions and check that the player and bots are correctly set! This is basically an override
		// for the setting coming from the main menu (or local settings holder). If the level is not OK for AI, Force NOT using it.
	
	robotPositions = DataTransfer.robotPositions;
	
	for (var bot = 0; bot < 7; bot++)
	{
	/* OLD STUFF
	
			// if we have our players index .. set slot to 8 (0 based array -> (pos-1) 8 means player, 0 means blank)
		if(bot == (playerPosition - 1))
		{		// set the players position slot to use the player, no matter what
			robotPositions[bot] = 8;
		}
		else if (robotPositions[bot] == 0)
		{		// this is a track without ai do nothing here
			robotPositions[bot] = 0;
		}
		else 
		{									// if the track has ai .. get the positions from our menu ...
			robotPositions[bot] = DataTransfer.robotPositions[bot];
		}
	*/
		
		
			// while our loop is running .. init the robotUsed Array
		robotUsed[bot] = false;																	// we will only set the used bots to true .. all others are already false
	}

		// set gravity from our global file...
	gravity = GlobalStats.gravity;

	
// !!!
// !!!	DO THIS FOR ALL OUR BOTS!!!
// !!! 	
		// get access to the players pMove script
	var pMoveScript : pMove = (playerConstruct.GetComponent(pMove) as pMove);					// we need to cast as type for iPhone ...
	var pAnimScript : pAnim = (playerConstruct.GetComponent(pAnim) as pAnim);					// we need to cast as type for iPhone ...
	var pInputScript : pInput = (playerConstruct.GetComponent(pInput) as pInput);				// we need to cast as type for iPhone ...

		// enable iPhone Controls
	//pInputScript.iPhoneCtls = iPhoneCtls;
	
		// set the start time
	//_refHolder.startTime = startTimer;
	
		// level wrong direction handling
	pMoveScript.wrongDirEnable = wrongDirEnable;
	
		// get the players deadzone / sensitivity
	// pInputScript.deadzone = settingsHolderScr.deadzone;
	// pInputScript.sensitivity = settingsHolderScr.sensitivity;
			
	pMoveScript.transUpTime = transUpTime;
	
		// set the initial Camera position
	DataVault.camPosActual = startCam;
	
		// set the camera values..
	pMoveScript.nCamPos = nCamPos;
	pMoveScript.nCamTrgtPos = nCamTrgtPos;
	pMoveScript.uCamPos = uCamPos;
	pMoveScript.uCamTrgtPos = uCamTrgtPos;
	pMoveScript.dCamPos = dCamPos;
	pMoveScript.dCamTrgtPos = dCamTrgtPos;
	pMoveScript.camTransTime = camTransTime;

		// set the player spawn position ...
	pMoveScript.spawnPoint = spawnPoints[(playerPosition - 1)];
	
		// move player into position
	playerTrns.position = spawnPoints[(playerPosition - 1)].position;
	playerTrns.rotation = spawnPoints[(playerPosition - 1)].rotation;
	
		// set gravity and speedplane settings
	pMoveScript.gravity = gravity;
	pMoveScript.speedPlaneTime = speedPlaneTime;

		// get the robot mesh and anim node ...
	var robotMesh : GameObject = robotMeshes[(playerRobot - 1)];
		pMoveScript.charMesh = (robotMesh.GetComponent(Transform) as Transform);
		pMoveScript.charIndex = (playerRobot - 1);											// store the players mesh index (so we knowwhich robot he is)
		_refHolderScr.botMeshes[0] = (playerRobot - 1);										// store the players botMesh in the refHolder
		pMoveScript.localHip = robotHips[(playerRobot - 1)];								// the local hip for shadow pos
		pAnimScript.play = (robotMesh.GetComponent(Animation) as Animation);
		
		// flag the player bot as true
	robotUsed[(playerRobot - 1)] = true;
/*
		// set the rest of the global stuff ..
	pMoveScript.maxDownforce = GlobalStats.maxDownforce;
	pMoveScript.idleDownforce = GlobalStats.idleDownforce;
//	pMoveScript.hoverDownforce = GlobalStats.hoverDownforce;
	pMoveScript.nHoverMaxDist = GlobalStats.nHoverMaxDist;
	pMoveScript.nHoverHeight = GlobalStats.nHoverHeight;
	pMoveScript.uHoverMaxDist = GlobalStats.uHoverMaxDist;
	pMoveScript.uHoverHeight = GlobalStats.uHoverHeight;
	pMoveScript.dHoverMaxDist = GlobalStats.dHoverMaxDist;
	pMoveScript.transformHeightSpeed = GlobalStats.transformHeightSpeed;

	pMoveScript.hoverMinDist = GlobalStats.hoverMinDist;
	
	pMoveScript.jumpSpeed = GlobalStats.jumpSpeed;
	pMoveScript.jumpPause = GlobalStats.jumpPause;
	
	pMoveScript.collisionSpeedDecrease = GlobalStats.collisionSpeedDecrease;
//	pMoveScript.collisionTurnSpeed = GlobalStats.collisionTurnSpeed;
		
	pMoveScript.hoverForce = GlobalStats.hoverForce;
*/
//	###################################################
//
//
//
//	
		// set the waypoint stuff
	pMoveScript.waypoint = waypoint;
	pMoveScript.raceLaps = raceLaps;														// This should probably be set from the menu!
	pMoveScript.endzone = endzone;
	
		// set the correct collider settings
	pMoveScript.skateHeight = skateHeight;
	pMoveScript.carHeight = carHeight;
	pMoveScript.planeHeight = planeHeight;
	
		
		// set the correct stats file for the player ...
	// setPlayerStats (playerRobot, pInputScript, pMoveScript);

// #########################
//

		// Next handle the AI entities ...

		// define script vars ..
	var aiMoveScript : aiMove;
	var aiAnimScript : aiAnim;

		// init counters ...
	var deleteConstruct : int = 6;													// everytime a robot is NOT used, I delete a construct, starting from the last...
	var activeConstruct : int = 0;													// everytime I use a robot I set it to the next available construct.

		// count the bots we are placing, so we always hae the correct botCount!!!
	var countBots : int = 0;
	var addFromPlayer : int = 1;
		
		// start counting at 1, as Player is always construct 1
	for(var i = 0; i < 7; i++)
	{
		if (robotPositions[i] == 0)
		{																			// current slot is not used .. delete it
			// Destroy(aiHudIndicators[deleteConstruct]);								// destroy the HUD indicator for the deleted construct
			Destroy(aiConstructs[deleteConstruct - 1]);									// destroy the last construct
			
				// destroy the unused weapons
			var killObject : GameObject;
			
			killObject = GameObject.Find("explosion_" + deleteConstruct);
				Destroy(killObject);
			killObject = GameObject.Find("isotopePrefab_" + deleteConstruct);
				Destroy(killObject);
			killObject = GameObject.Find("isotopePrefab_" + deleteConstruct + ".1");
				Destroy(killObject);
			killObject = GameObject.Find("isotopePrefab_" + deleteConstruct + ".2");
				Destroy(killObject);
			killObject = GameObject.Find("wallMine_" + deleteConstruct);
				Destroy(killObject);
			killObject = GameObject.Find("wallMine_" + deleteConstruct + ".1");
				Destroy(killObject);
			killObject = GameObject.Find("wallMine_" + deleteConstruct + ".2");
				Destroy(killObject);
			killObject = GameObject.Find("missleBase_" + deleteConstruct);
				Destroy(killObject);
			killObject = GameObject.Find("Skyblast_" + deleteConstruct);
				Destroy(killObject);
			killObject = GameObject.Find("LeaderShot_" + deleteConstruct);
				Destroy(killObject);
			
					
			deleteConstruct--;														// decrease last construct index
		}
		else if (robotPositions[i] == 8)
		{
				// add one slot to _refHolder.botMeshes until we have the player.. then use the actual index
			addFromPlayer--;
			if (addFromPlayer < 0)
			{
				addFromPlayer = 0;
			}
		}
		else
		{																										// set all for the current robot
				// count bots
			countBots++;
			
				// get access to the scripts ...
			aiMoveScript = (aiConstructs[activeConstruct].GetComponent(aiMove) as aiMove);						// we need to cast as type for iPhone ...
			aiAnimScript = (aiConstructs[activeConstruct].GetComponent(aiAnim) as aiAnim);						// we need to cast as type for iPhone ...


				// set the player spawn position ...
			aiMoveScript.spawnPoint = spawnPoints[i];														// robotPositions[i] index is the actual spawnpoint for the bot stored in robotPositions[position]
			
				//	!!!!!!!
				//
				//	Increase i here +1(in botMeshes), as we never put an AI into construct 0
				
				// get the robot mesh and anim node ...
			robotMesh = robotMeshes[robotPositions[i] - 1];													// i is the number of the current spawn point position (pos 0 - 6)... robotPositions[] array contains robot number (0 for none, 8 for player) -> robots are 1 based, robotMeshes is 0 based -> -1
				aiMoveScript.charMesh = (robotMesh.GetComponent(Transform) as Transform);
				aiMoveScript.charIndex = robotPositions[i] - 1;												// get the robots mesh index
				_refHolderScr.botMeshes[i + addFromPlayer] = robotPositions[i] - 1;											// store the constructs botMesh in the refHolder
				aiMoveScript.localHip = robotHips[robotPositions[i] - 1];									// the local hip for shadow pos
				aiAnimScript.play = (robotMesh.GetComponent(Animation) as Animation);
			
				// flag the used bot as true ..
			robotUsed[robotPositions[i] - 1] = true;
				
				
				
				// level wrong direction handling

				
			
				// set the waypoint stuff
			aiMoveScript.waypoint = waypoint;

				// trans up time
			aiMoveScript.transUpTime = transUpTime;
			
				// set gravity and speedplane settings
			aiMoveScript.gravity = gravity;
			aiMoveScript.speedPlaneTime = speedPlaneTime;
			
				// set the correct collider settings
			aiMoveScript.skateHeight = skateHeight;
			aiMoveScript.carHeight = carHeight;
			aiMoveScript.planeHeight = planeHeight;
				
				// in the end .. increase construct counter ..
			activeConstruct++;
		}
	}
	
		// set the correct bot count
	DataTransfer.botCount = countBots;
	_refHolderScr.botCount = DataTransfer.botCount;								// get the correct bot count!!
	guiFlags.numBots = DataTransfer.botCount;									// store the number of bots
	
		// pass the number of ai robots to game ..
	pInputScript.aiRobots = activeConstruct;
	
		// delete unused robot meshes
	for(var kill = 0; kill < 7; kill++)
	{
		if (robotUsed[kill] == false)
		{
			Destroy(robotMeshes[kill]);												// destroy the model
		}
	}

// move player into position
	playerTrns.position = spawnPoints[(playerPosition - 1)].position;
	playerTrns.rotation = spawnPoints[(playerPosition - 1)].rotation;

// Check settings
// print ("Circuit: " + DataTransfer.currentCircuit);

		// free up stuff from unused resources
	var outVal = Resources.UnloadUnusedAssets;

}