static var playerPos : Vector3;
static var noTrans : boolean = true;		// those handle the current desired transformation state ...
static var upTrans : boolean = false;
static var dnTrans : boolean = false;
static var stillUp : boolean = false;			// those are for the playAnim script to finish playing the correct animations ...
static var stillDn : boolean = false;

	// camera settings
static var camPosActual : Vector3 = Vector3(0.0, 2.0, -3.0);				// the actual camera positions in local space ...
static var camTrgtPosActual : Vector3 = Vector3(0.0, 1.5, 0.0);
static var camReset : Vector3 = Vector3(0.0, 3.0, 7.0);

static var transTimer : float;
static var animStarted : boolean;

static var pRank : int;
static var pLap : int;

static var trackProgress : float[] = new float[7];			// bots in ordered fashion store their progress
static var ranking : int[] = new int[7];					// bots in ordered fashin stor their rank
static var robots : int[] = new int[7];						// bots ordered by rank

static var aiSpeedMulti : float = 1.0;						// speed multiplyer for the AI

static var canTransform : boolean = true;
static var gameEnabled : boolean = false;					// on level start game is paused ...

	// when to start the race after level load...
static var startTime : float = 0.0;
static var getReady : boolean = true;						// initially we're in get ready mode


static var dTime : float = 0.0;
static var sysTime : float = 0.0;

	// animation handling flags
static var fastSkate : boolean = false;						// are we skating fast?
static var speedPlane : boolean = false;					// are we on a speedplane?
static var stopped : boolean = false;						// is our robot standing?
static var offRoad : boolean = false;						// are we off road??

	// flags for the inGame menu
static var showStats = true;								// show stats on hud
static var baseMenu = true;									// base menu
static var controlsMenu = false;
static var developerMenu = false;

	// currently active pickup
static var pickupType : int = 0;							// I think this is not needed anymore
// static var aimEnable : boolean = false;

	// waypoint (might be only needed in move ...)
static var switchWp : boolean = false;						// do we need to switch on next loop??
static var hitWpScript : wpAttribs;							// store the next wp script from collider	

	// ai flags init??
static var shortcutProbability : float = 0.25;
static var fullSpeedProbability : float = 0.87;
static var noAiSpeedup : float;								// distance where no speedup for AI is performed

	// race Over
static var raceOver : boolean = false;

	// 
static var fps : int = 0;

function Awake () 
{
	trackProgress[0] = -1000000.0;
	trackProgress[1] = -1000000.0;
	trackProgress[2] = -1000000.0;
	trackProgress[3] = -1000000.0;
	trackProgress[4] = -1000000.0;
	trackProgress[5] = -1000000.0;
	trackProgress[6] = -1000000.0;
	
		// initialize the ranking Array...
	ranking[0] = 0;
	ranking[1] = 1;
	ranking[2] = 2;
	ranking[3] = 3;
	ranking[4] = 4;
	ranking[5] = 5;
	ranking[6] = 6;
	
	camPosActual = Vector3(0, 2, -3);
	
	camTrgtPosActual = Vector3(0, 1.5, 0);
	gameEnabled = false;
	

}