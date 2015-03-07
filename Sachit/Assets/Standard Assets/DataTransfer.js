// Here we are storing values that we can pass to other levels (I Hope)

	// values for the menu. They are set in play_btn.js
	// when exiting the main menu!!
static var playerBot : int = 1;					// 1initially have vektor selected ...
static var activeBot : int = 1;					// the currently active bot
												// Player pre selection handled in _botSelectHandler
static var loadLevel : int = 1;					// map preselection handled in mapNext_btn.js
static var activeLevel : int = 1;

static var aiDiff : int = 1;							// our difficulty level

	// player position after Race
static var playerPosition : int = 8;			// the player position after the race. This is set in the pMove Waypont section when triggering _refHolder.raceOver

	// race setup stuff
//static var robotPositions : int[] = new int[7];		// the placement of the other robots! 0 means this robot is not available for the race, 8 means this robot is used by the player
static var robotPositions : int[] = [8,2,3,4,0,0,0];	// 8234567the placement of the other robots! 0 means this robot is not available for the race, 8 means this robot is used by the player
static var robotRankTarget : int[] = new int[7];		// here we will store our desired rank per mesh
static var lastRacePos : int = 8;						// this is set after the race in pMove waypoint section ~3540

static var aiLeaders : int[] = new int[4];			// store both lead AI Rivals

	// race progression stuff:
static var botCount : int = 5;
static var robots : int[] = new int[7];			// botConstructs ordered by rank

static var trackList : int [] = new int [9];	// the list of tracks for the current cup (set in menu - levelNumber of loadscreen)
static var currentCircuit : int = 0;			// initially track 0 active (Quickrace)
static var currentTrack : int = 0;				// THIDS IS THE INDEX!!!! on TRACK LIST
static var circuitAdjust : float = 1.0;			// each circuit,in the end the bots aim farther in front of the player

static var botPoints : int[] = new int[7];		// the points of the different bots in the tournament for final ranking

	// unlocks handling 								// the actual unlocks distribution after race is done on continue_btn_scr.js
static var pickupUnlocks : boolean[] = new boolean[9];	// handle unlocked pickups
static var botUnlocks : boolean[] = new boolean[7];		// handle bot unlocks
static var botPrice : float[] = [3000.0, 3000.0, 3000.0, 3000.0, 3000.0, 3000.0, 3000.0];	//The buying price
static var allBots : float = 10000.0;
static var allMaps : float = 2500.0;
static var allItems : float = 2000.0;

	// insert skins here
static var currentSkin : int[] = new int[7];
static var skinPrice : float[] = [0.0, 1000.0, 1500.0, 2000.0];
static var skinA : boolean[] = new boolean[7];
static var skinB : boolean[] = new boolean[7];
static var skinC : boolean[] = new boolean[7];

static var trackUnlocks : int[] = new int[8];	// map unlocks
static var trackPrice : float[] = [1000.0, 1000.0, 1000.0, 1000.0, 1000.0, 1000.0, 1000.0, 1000.0];	// map pricing
static var itemPrice : float[] = [0.0, 500.0, 500.0, 300.0, 0.0, 500.0, 0.0, 500.0, 1000.0];	// map pricing
// static var curcuitUnlocks : boolean[] = new boolean[6];	// circuits unlocks
static var circuitUnlocks : int;
static var credits : int = 100;						// the players credits

	// badges
static var badgesRace : int[] = new int[11];
static var badgesCareer : int[] = new int[11];
static var badgeCount : int = 0;
static var currentBadge : int = 0;

static var damageRace : int[] = new int [11];
static var damageCareer : int[] = new int [11];

static var hitsRace : int[] = new int [11];
static var hitsCareer : int[] = new int [11];

	// stats to track
static var racesStarted : int = 0;						// set in input script's function btnStartLevel()
static var racesFinished : int = 0;
static var racesPlace : int[] = new int[3];
static var circuitPlace : int [] = new int[3];
static var circuitFinished : int = 0;
static var shortcutsTaken : int;
static var perfectRuns : int;
static var juiceSeconds : int;
static var slideSeconds : int;
static var slideBoost : int;
static var pickupsCollected : int;

	// player opccupied (hit by a weapon)
static var playerOccupied = false;

	// steering stuff
static var playMusic : boolean = true;
static var useAcc : int = 1;
static var accSensIndex : int = 4;
static var touchSensIndex : int = 4;

	// password check
static var passwordEntered : boolean = false;

	// delay controls activation
static var controlsEnabled : boolean = false;

	// stats storage
static var juiceTime : float;
static var storeStats : int[] = new int[70];

	// race End flags
static var badgeUpdate : boolean = false;

	// tutorial
static var tutEnable : boolean = true;
static var tutFinish : boolean[] = new boolean[7];
static var currTut : int = 99;
static var tutExit : boolean = false;

	// language
static var lang : int = 0;
static var currPage : int = 0;
static var numPages : int = 0;
//static var locUpdate : boolean = false;
static var accState : String = "accOn";

	// THIS NEEDS TO BE SET BY PLAYER PREFS .. RUN ONLY ONCE
static var initLang : boolean = false;

/* Legend
0 - Total Races
1 - 1st place
2 - 2nd place
3 - 3rd place
4 - Total Circuits
5 - 1st place circuit
6 - 2st place circuit
7 - 3st place circuit
8 - vektor races
9 - vektor 1
10 - vektor 2
11 - vektor 3
12 - irobot races
13 - irobot 1
14 - irobot 2
15 - irobot 3
16 - truk races
17 - truk 1
18 - truk 2
19 - truk 3
20 - steam races
21 - steam 1
22 - steam 2
23 - steam 3
24 - pod races
25 - pd 1
26 - pod 2
27 - pod 3
28 - mono races
29 - mono 1
29 - mono 2
30 - mono 3
31 - tri races
32 - tri 1
33 - tri 2
34 - tri 3
35 - china races
36 - china 1
37 - china 2
38 - china 3
39 - white races
40 - white 1
41 - white 2
42 - whiste 3
43 - edt races
44 - edt 1
45 - edt 2
46 - edt 3
47 - mil races
48 - mil 1
49 - mil 2
50 - mil 3
51 - la races
52 - la 1
53 - la 2
54 - la 3
55 - bio races
56 - bio 1
57 - bio 2
58 - bio 3



*/


