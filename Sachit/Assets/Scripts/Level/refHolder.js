//
//	This script holds references to all we need ...
//

var levelSettings : initLevel;

var startColor : Color = Color(1,1,1,1);
// bot transforms


// NOT NEEDED AS ALREADY SET ON levelInit!! var allConstructsGO : GameObject[] = new GameObject[7];				// ordered array of all robot transforms, for AI targetting
var allConstructs : Transform[] = new Transform[7];					// ordered array of all robot transforms, for AI targetting

// bot getInfos
var allGetInfo : getInfo[] = new getInfo[7];					// ordered array of all robot transforms, for AI targetting

// weapon pool
var allIsotope : Transform[] = new Transform[7];
var allIsotopeScr : mineDeploy[] = new mineDeploy[7];
var allIsotope2 : Transform[] = new Transform[7];
var allIsotopeScr2 : mineDeploy[] = new mineDeploy[7];
var allIsotope3 : Transform[] = new Transform[7];
var allIsotopeScr3 : mineDeploy[] = new mineDeploy[7];


var allBada : Transform[] = new Transform[7];
var allBadaScr : wallDeploy[] = new wallDeploy[7];
var allBada2 : Transform[] = new Transform[7];
var allBadaScr2 : wallDeploy[] = new wallDeploy[7];
var allBada3 : Transform[] = new Transform[7];
var allBadaScr3 : wallDeploy[] = new wallDeploy[7];



var allMissle : Transform[] = new Transform[7];
var allMissleScr : missleShoot[] = new missleShoot[7];

var allSkyshot : Transform[] = new Transform[7];
var allSkyshotScr : skyshotBeam[] = new skyshotBeam[7];

var allLeaderShot : Transform[] = new Transform[7];
var allLeaderShotScr : skyshotBeam[] = new skyshotBeam[7];

// explosion pool
var allExplosions : Transform[] = new Transform[7];
var allExplosionScr : explosionTrigger[] = new explosionTrigger[7];

// AI settings
var aiSpeedMod : float = 1.0;									// global speed enhancer for ai
var aiRandomize : float = 0.01;									// random waypoint offset (maybe not needed)
var spreadMulti : float = 0.5;									// do the bots follow their inividual spread??
var aiTurnAdjust : float = 1.0;									// mobility (turning)

// ai rubber band stuff
var rubberSlowdownRate : float = 0.02;															// the max ammount we reduce our speed each loop
var rubberLength : float = 250.0;																// the length of our buffer zone. Beyond use min/max values
var rubberFlexOffset : float = 0.5;																// the ammount of flex - basically how much to we add/subtract from 1
var rubberTurnMulti : float = 0.5;																// the ammount we reduce this value for our turn adjust
var rubberAiMulti : float = -0.6;																// the ammount we reduce this value for ai accurracy
var rubberOffset : float = 0.0;																	// move the slowdown more to the front, or back
var rubberBackBoost : float = 0.07;
var rubberViewMaxSpeed : float = 1.36;															// the max speed bots have when in front of us (in view) - set so that slowest bot
																								// is still faster than the fastest bot normally.

// difficulty level
var aiDiff : int = 1;											// set to normal difficulty (0 - easy, 1 - normal, 2 - hard)
var currLevel : int = 0;										// the level index (so we can access it when needed ...)

/*
// Sound effects
var isotopeSound : AudioClip;
var badaboomSound : AudioClip;
var speedSound : AudioClip;
var jumpSound : AudioClip;
var transformSound : AudioClip;
var explosionSound : AudioClip;
var virusSound : AudioClip;
*/

var botSpread : float[] = new float[6];							// this holds the Spread .. so that our bots don't clump the middle of the track
var trackProgress : float[] = new float[7];						// this will hold the track progress of our bots ...
var ranking : int[] = new int[7];								// botConstructs in ordered fashion store their rank (0 based: 0 first place)
var robots : int[] = new int[7];								// botConstructs ordered by rank (0 based. 6 - first place)
var botMeshes : int[] = new int[7];								// this will hold the actual mesh index of each botConstruct
var pRank : int;												// player rank
var pLap : int;													// player lap
var botCount : int = 7;											// number of bots in race

	// last progress before finish change
var fullTrack : float = 0.0;

	// lap times
var Lap1times : float[] = new float[7];
var Lap2times : float[] = new float[7];
var Lap3times : float[] = new float[7];
var Lap0times : float[] = new float[7];							// this stores the start time

var getReady : boolean = true;
var gameEnabled : boolean = true;								// is the game in Pause mode
var raceOver : boolean = false;

var podiumStart : boolean = false;								// start handling podium stuff
var podiumBlack : boolean = false;								// start doing stuff, as the screen is black
var podiumActive : boolean = false;								// are we in podium mode?

	// Those here are handled in the pMove and aiMove scripts 
	// in the Waypoint handling where raceOver is set. They are 
	// the definite order in which bots come through the finish line
var finishedCount : int = 0;
var finishRanking : int[] = new int[7];							// botConstructs in ordered fashion store their final rank after passing finish line

var orderedBots : int[] = new int[7];
var meshConstruct : int[] = new int[7];

var pausedTime : float = 0.0;									// time we spent in pause mode
var startTime : float = 0.0;

function Awake () 
{
		// get our start time
	startTime = levelSettings.startTimer;

		// initialize our constructs 
	allConstructs[0] = levelSettings.playerConstruct.GetComponent(Transform) as Transform;
	 
	for (var construct = 1; construct < 7; construct++)
	{
		allConstructs[construct] = levelSettings.aiConstructs[construct - 1].GetComponent(Transform) as Transform;
		
			// init Track Progress to supersmall value
		trackProgress[construct - 1] = - 9000;
	}

		// get our getInfo nodes ...
	for (var index = 0; index < 7; index++)
	{
		allGetInfo[index] = allConstructs[index].GetComponent(getInfo) as getInfo;
	}
	
		// init ordered bots array
	orderedBots = [0, 1, 2, 3, 4, 5, 6];


}

