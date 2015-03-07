//
//	This script holds our settings ...
//

// The ReadStats function, that reads in all the stats from the botStats files is executed by the
// touchHandler script for the main menu (for the imported settingsHolder) as well as in the initLevel
// script if NO settingsHolder was passed to the scene from the main Menu (executed locally)

var isMenu : boolean = false;

var playerBot : int = 1;					// initially have vektor selected ...
var activeBot : int = 1;					// the currently active bot

var loadLevel : int = 1;
var activeLevel : int = 1;

var aiDiff : int = 1;						// our difficulty level

var deadzone : float = 0.05;				// deadzone and sensitivity settings
var sensitivity : float = 0.0;

	// store some more info here...
var playerPosition : int = 1;				// basically the spawnPoint to use
var robotPositions : int[] = new int[7];	// the placement of the other robots! 0 means this robot is not available for the race, 8 means this robot is used by the player

var iPhoneCtls : int = 0;

/*
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


function Awake()
{

	if (isMenu)
	{
			// make sure this object is kept when we load a new level
		DontDestroyOnLoad (this);
	}
	
#if UNITY_IPHONE	
	iPhoneCtls = 1;
#endif
}

function ReadStats()
{
		//
		// now read our values from the stats file ...
		//
		
		// Vektor...
	botSpeed[0] = VektorStats.botSpeed;
	botRotation[0] = VektorStats.botRotation;
	botAcc[0] = VektorStats.botAcc;
	botDec[0] = VektorStats.botDec;
	botSpeedpad[0] = VektorStats.botSpeedpad;
	botOffroad[0] = VektorStats.botOffroad;
	carSpeed[0] = VektorStats.carSpeed;
	carRotation[0] = VektorStats.carRotation;
	carAcc[0] = VektorStats.carAcc;
	carDec[0] = VektorStats.carDec;
	carSpeedpad[0] = VektorStats.carSpeedpad;
	carOffroad[0] = VektorStats.carOffroad;
	planeSpeed[0] = VektorStats.planeSpeed;
	planeRotation[0] = VektorStats.planeRotation;
	planeAcc[0] = VektorStats.planeAcc;
	planeDec[0] = VektorStats.planeDec;
	planeSpeedpad[0] = VektorStats.planeSpeedpad;
	planeOffroad[0] = VektorStats.planeOffroad;
	speedRotationDecrease[0] = VektorStats.speedRotationDecrease;
	maxSlideAngle[0] = VektorStats.maxSlideAngle;
	fullSlideTime[0] = VektorStats.fullSlideTime;
	planeRollMulti[0] = VektorStats.planeRollMulti;
	turnCharMulti[0] = VektorStats.turnCharMulti;
	downforce[0] = VektorStats.downforce;
	transformDnTimeshift[0] = VektorStats.transformDnTimeshift;	
	juiceBuildup[0] = VektorStats.juiceBuildup;
	juiceFull[0] = VektorStats.juiceFull;
	
		// iRobot...
	botSpeed[1] = IrobotStats.botSpeed;
	botRotation[1] = IrobotStats.botRotation;
	botAcc[1] = IrobotStats.botAcc;
	botDec[1] = IrobotStats.botDec;
	botSpeedpad[1] = IrobotStats.botSpeedpad;
	botOffroad[1] = IrobotStats.botOffroad;
	carSpeed[1] = IrobotStats.carSpeed;
	carRotation[1] = IrobotStats.carRotation;
	carAcc[1] = IrobotStats.carAcc;
	carDec[1] = IrobotStats.carDec;
	carSpeedpad[1] = IrobotStats.carSpeedpad;
	carOffroad[1] = IrobotStats.carOffroad;
	planeSpeed[1] = IrobotStats.planeSpeed;
	planeRotation[1] = IrobotStats.planeRotation;
	planeAcc[1] = IrobotStats.planeAcc;
	planeDec[1] = IrobotStats.planeDec;
	planeSpeedpad[1] = IrobotStats.planeSpeedpad;
	planeOffroad[1] = IrobotStats.planeOffroad;
	speedRotationDecrease[1] = IrobotStats.speedRotationDecrease;
	maxSlideAngle[1] = IrobotStats.maxSlideAngle;
	fullSlideTime[1] = IrobotStats.fullSlideTime;
	planeRollMulti[1] = IrobotStats.planeRollMulti;
	turnCharMulti[1] = IrobotStats.turnCharMulti;
	downforce[1] = IrobotStats.downforce;
	transformDnTimeshift[1] = IrobotStats.transformDnTimeshift;
	juiceBuildup[1] = IrobotStats.juiceBuildup;
	juiceFull[1] = IrobotStats.juiceFull;
	
		// Truck...
	botSpeed[2] = TruckStats.botSpeed;
	botRotation[2] = TruckStats.botRotation;
	botAcc[2] = TruckStats.botAcc;
	botDec[2] = TruckStats.botDec;
	botSpeedpad[2] = TruckStats.botSpeedpad;
	botOffroad[2] = TruckStats.botOffroad;
	carSpeed[2] = TruckStats.carSpeed;
	carRotation[2] = TruckStats.carRotation;
	carAcc[2] = TruckStats.carAcc;
	carDec[2] = TruckStats.carDec;
	carSpeedpad[2] = TruckStats.carSpeedpad;
	carOffroad[2] = TruckStats.carOffroad;
	planeSpeed[2] = TruckStats.planeSpeed;
	planeRotation[2] = TruckStats.planeRotation;
	planeAcc[2] = TruckStats.planeAcc;
	planeDec[2] = TruckStats.planeDec;
	planeSpeedpad[2] = TruckStats.planeSpeedpad;
	planeOffroad[2] = TruckStats.planeOffroad;
	speedRotationDecrease[2] = TruckStats.speedRotationDecrease;
	maxSlideAngle[2] = TruckStats.maxSlideAngle;
	fullSlideTime[2] = TruckStats.fullSlideTime;
	planeRollMulti[2] = TruckStats.planeRollMulti;
	turnCharMulti[2] = TruckStats.turnCharMulti;
	downforce[2] = TruckStats.downforce;
	transformDnTimeshift[2] = TruckStats.transformDnTimeshift;
	juiceBuildup[2] = TruckStats.juiceBuildup;
	juiceFull[2] = TruckStats.juiceFull;
	
		// Steamball...
	botSpeed[3] = SteamballStats.botSpeed;
	botRotation[3] = SteamballStats.botRotation;
	botAcc[3] = SteamballStats.botAcc;
	botDec[3] = SteamballStats.botDec;
	botSpeedpad[3] = SteamballStats.botSpeedpad;
	botOffroad[3] = SteamballStats.botOffroad;
	carSpeed[3] = SteamballStats.carSpeed;
	carRotation[3] = SteamballStats.carRotation;
	carAcc[3] = SteamballStats.carAcc;
	carDec[3] = SteamballStats.carDec;
	carSpeedpad[3] = SteamballStats.carSpeedpad;
	carOffroad[3] = SteamballStats.carOffroad;
	planeSpeed[3] = SteamballStats.planeSpeed;
	planeRotation[3] = SteamballStats.planeRotation;
	planeAcc[3] = SteamballStats.planeAcc;
	planeDec[3] = SteamballStats.planeDec;
	planeSpeedpad[3] = SteamballStats.planeSpeedpad;
	planeOffroad[3] = SteamballStats.planeOffroad;
	speedRotationDecrease[3] = SteamballStats.speedRotationDecrease;
	maxSlideAngle[3] = SteamballStats.maxSlideAngle;
	fullSlideTime[3] = SteamballStats.fullSlideTime;
	planeRollMulti[3] = SteamballStats.planeRollMulti;
	turnCharMulti[3] = SteamballStats.turnCharMulti;
	downforce[3] = SteamballStats.downforce;
	transformDnTimeshift[3] = SteamballStats.transformDnTimeshift;
	juiceBuildup[3] = SteamballStats.juiceBuildup;
	juiceFull[3] = SteamballStats.juiceFull;
	
		// Podbot...
	botSpeed[4] = PodbotStats.botSpeed;
	botRotation[4] = PodbotStats.botRotation;
	botAcc[4] = PodbotStats.botAcc;
	botDec[4] = PodbotStats.botDec;
	botSpeedpad[4] = PodbotStats.botSpeedpad;
	botOffroad[4] = PodbotStats.botOffroad;
	carSpeed[4] = PodbotStats.carSpeed;
	carRotation[4] = PodbotStats.carRotation;
	carAcc[4] = PodbotStats.carAcc;
	carDec[4] = PodbotStats.carDec;
	carSpeedpad[4] = PodbotStats.carSpeedpad;
	carOffroad[4] = PodbotStats.carOffroad;
	planeSpeed[4] = PodbotStats.planeSpeed;
	planeRotation[4] = PodbotStats.planeRotation;
	planeAcc[4] = PodbotStats.planeAcc;
	planeDec[4] = PodbotStats.planeDec;
	planeSpeedpad[4] = PodbotStats.planeSpeedpad;
	planeOffroad[4] = PodbotStats.planeOffroad;
	speedRotationDecrease[4] = PodbotStats.speedRotationDecrease;
	maxSlideAngle[4] = PodbotStats.maxSlideAngle;
	fullSlideTime[4] = PodbotStats.fullSlideTime;
	planeRollMulti[4] = PodbotStats.planeRollMulti;
	turnCharMulti[4] = PodbotStats.turnCharMulti;
	downforce[4] = PodbotStats.downforce;
	transformDnTimeshift[4] = PodbotStats.transformDnTimeshift;
	juiceBuildup[4] = PodbotStats.juiceBuildup;
	juiceFull[4] = PodbotStats.juiceFull;
	
		// Monobot...
	botSpeed[5] = MonoStats.botSpeed;
	botRotation[5] = MonoStats.botRotation;
	botAcc[5] = MonoStats.botAcc;
	botDec[5] = MonoStats.botDec;
	botSpeedpad[5] = MonoStats.botSpeedpad;
	botOffroad[5] = MonoStats.botOffroad;
	carSpeed[5] = MonoStats.carSpeed;
	carRotation[5] = MonoStats.carRotation;
	carAcc[5] = MonoStats.carAcc;
	carDec[5] = MonoStats.carDec;
	carSpeedpad[5] = MonoStats.carSpeedpad;
	carOffroad[5] = MonoStats.carOffroad;
	planeSpeed[5] = MonoStats.planeSpeed;
	planeRotation[5] = MonoStats.planeRotation;
	planeAcc[5] = MonoStats.planeAcc;
	planeDec[5] = MonoStats.planeDec;
	planeSpeedpad[5] = MonoStats.planeSpeedpad;
	planeOffroad[5] = MonoStats.planeOffroad;
	speedRotationDecrease[5] = MonoStats.speedRotationDecrease;
	maxSlideAngle[5] = MonoStats.maxSlideAngle;
	fullSlideTime[5] = MonoStats.fullSlideTime;
	planeRollMulti[5] = MonoStats.planeRollMulti;
	turnCharMulti[5] = MonoStats.turnCharMulti;
	downforce[5] = MonoStats.downforce;
	transformDnTimeshift[5] = MonoStats.transformDnTimeshift;
	juiceBuildup[5] = MonoStats.juiceBuildup;
	juiceFull[5] = MonoStats.juiceFull;
	
		// Tribot...
	botSpeed[6] = TriStats.botSpeed;
	botRotation[6] = TriStats.botRotation;
	botAcc[6] = TriStats.botAcc;
	botDec[6] = TriStats.botDec;
	botSpeedpad[6] = TriStats.botSpeedpad;
	botOffroad[6] = TriStats.botOffroad;
	carSpeed[6] = TriStats.carSpeed;
	carRotation[6] = TriStats.carRotation;
	carAcc[6] = TriStats.carAcc;
	carDec[6] = TriStats.carDec;
	carSpeedpad[6] = TriStats.carSpeedpad;
	carOffroad[6] = TriStats.carOffroad;
	planeSpeed[6] = TriStats.planeSpeed;
	planeRotation[6] = TriStats.planeRotation;
	planeAcc[6] = TriStats.planeAcc;
	planeDec[6] = TriStats.planeDec;
	planeSpeedpad[6] = TriStats.planeSpeedpad;
	planeOffroad[6] = TriStats.planeOffroad;
	speedRotationDecrease[6] = TriStats.speedRotationDecrease;
	maxSlideAngle[6] = TriStats.maxSlideAngle;
	fullSlideTime[6] = TriStats.fullSlideTime;
	planeRollMulti[6] = TriStats.planeRollMulti;
	turnCharMulti[6] = TriStats.turnCharMulti;
	downforce[6] = TriStats.downforce;
	transformDnTimeshift[6] = TriStats.transformDnTimeshift;
	juiceBuildup[6] = TriStats.juiceBuildup;
	juiceFull[6] = TriStats.juiceFull;
	

}
*/