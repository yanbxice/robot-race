// line 2189 Slowdown added!!!!
// ##########################################
//
//	Character control script for robot race
//
// 	Version 0.5
//
//	Changes:
//		- remove gravity and rely on downforce | added grav back in, but till in downforce dir.
//
//	ToDo:
//
//		- add new wall collisions using Raycasts !!!!
//
//		- Add Speedplanes support
//
//		DONE - optimize hover handling: put camera pivot controls to camera script -> Maybe set an int and pass it to the cam or input  script?? (both are player specific)
//									set conditionals up so that every condition is checked once only (e.g. rotation etc...)
//
//		- for touch steering, introduce gradual input over 1 sec (not directly full turnspeed)
//
//		DONE - for rotations.. add a bit of rotation to the object just for visual feedback
//
//		DONE - move character only once ... apply the rest to a system of empty gameobjects
//			-> Create a transform construct for each character .. have 2 prefabs, one for player, one sligtly different(no cam points etc) for AI
//			-> add the robots as prefabs into the scene, get them connected to the script (as Transform or Gameobject)
//			-> Then perform steps on them and at the end of the move function transform them correctly
//
//		Lots of things still on my list .. I'll update here once I get the time ..
//
//		CHECK MY NOTES ON HANDLING MOVEMENT ... Add after those three:
//			ADD WALL COLLISION AND SPEEDPLANES HANDLING
//			ADD CHECKPOINTS/WAYPOINTS ... !!!
//			ADD DEADZONE
//
//	##########################################

//	!!!!!!!!!!!!!!!!!!!!!
//	!!!!!!!!!!!!!!!!!!!!!
//
//	CharRoot.localEulerAngles disabled for performance (Slide)
//
//	!!!!!!!!!!!!!!!!!!!!!
//	!!!!!!!!!!!!!!!!!!!!!


private var inContact : boolean = false;
// #####	SETUP VARs	#####
private var wrongDirEnable : boolean = true;
	// refholder ... to access other bots and weapons ...
var _refHolder : refHolder;
private var isoDrop : int = 0;			// we can now drop 3 mines per type at one time -- this is the counter
private var badaDrop : int = 0;

var playerMoveScr : pMove;									// the player move script

var botIndex : int;											// the index of our robot

var spawnPoint : Transform;									// the spawnpoint for the player
var waypoint : Transform;							// this will hold the current waypoint script (to reset player on next wp after drop)

	// pickup access and handling vars
// var pickupScript : pickupHandling;		// script to handle the pickups
private var pickupType : int = 0;		// initial pickup type for now set to jump
private var lastPickup : int = 0;		// to ensure we'Re not getting the same pickup twice in a row
private var nextPickup : float = 0.0;	// timer for pickup activation

var charController : CharacterController;			// let's try again to use the character controller .. but only for collisions, not for ground contact
//var charCollider : SphereCollider;		// our collider

var animScript : aiAnim;						// The animation script for the character ...		-> player_construct
var charMesh : Transform;						// iRobot_Player
var charIndex : int;							// the mesh index
var charRoot : Transform;						// The root node (needed for sliding)				// player_root
var charOffset : Transform;						// The node to add additional transforms to our character....	// player_offset
var rayCastSender : Transform;					// rayCastSender
var playerTrns : Transform;						// none

//var frontRaySender : Transform;			// those 2 nodes are used for ground align. I check the distance to the ground with them, then align myself correctly ...
//var sideRaySender : Transform;
//var frontRayHit : RaycastHit;
//var sideRayHit : RaycastHit;

// var playerAlign : Transform;

private var frontHeight : float;
private var topAlignPos : Vector3;
private var fwdAngle : float;

private var sideHeight : float;
private var sideAlignPos : Vector3;
private var sideAngle : float;

var obstacleScanner : Transform;				// the point from which we scan for obstacles
var jumpScanDist : Transform;
var mineScanDist : Transform;
var aiVault : aiVault;
var levelInit : initLevel;						// access to the level init script, which holds all bot references ...

	// better way to handle char scaling ...
var charScaler : Transform;				// this node is used to scale the bot (via animation)
var charScalerAnim : Animation;			// the anim node for the char scaler ...

private var slideGoal : float = 0;
private var animState : int = 0;		// we don'T want to call skateSlow all the time, so whever we change anim away from skateslow, set to 0, else set to 1 (so that skate slow is only started once - it'S looping ...)

var blobShadow : Transform;				// the blob shadow plane ...								//blobShadow
var botRenderer : Renderer;				// the bots render node
var localHip : Transform;					// the hip position variable
var localHipPos : Vector3;
// var botMesh : GameObject;				// the robots center of gravity ( from bbox center)


var precision = 0.001;				// precisionValue
var gravity = -15.0;					// in m/s²
											// maybe introduce normal gravity after .. 1 sec fall??? But not now, since we have no tracks where we can fall OFF the track ..


	// Implement juice
var juiceLeft : float = 0.0;

// ##### used values .. could be private ...
private var offRoad = 0.7;
// private var isOffroad : boolean = false;					// are we offRoad?
private var maxSpeed = 35.0;
private var speedPlaneSpeed = 45.0;							// SpeedPlane Contact
var speedPlaneTime = 4.0;									// speedplane boost in sec.
private var speedPlaneExit : float;							// time at which to exit speedplane mode
private var speedState : boolean = false;					// is speedplane speed on? 

	// rotation and slide handling
private var rotateSpeed = 120.0;				// Angle per second?
var speedRotationDecrease = 0.2;

//var maxSlideAngle = 90.0;				// maximum angle we can slide off move direction	|	For the script to work, this needs to be between 0 and 180
//var fullSlideTime = 0.6;					// time it takes at FULL side slide to reach maxAngle ...
private var slideAngle = 0.0;		// variable to hold the combined slide angles (to apply in later cycles ...) 
private var slideSign = 1.0;			// var to store the sign of the actual slide rotation
private var slideTimer = 0.0;		// in order to not suffer fluctuating iPhone input add a timer ...
private var slideDuration = 0.0;	// how long have we been sliding??
private var slideCooldown = 0.0;

private var slideSpeedup = 0.0;						// how long have we been sliding?
private var slideCountStart : boolean = false;		// did we stop sliding, need to restart counting time ..
private var slideSpeedMin = 1.5;					// minimum time at which to speedup

private	var rollAngle : float;					// the roll angle multiplier for plane mode

private var planeMode : boolean = false;		// flag to check if we are in plane mode (used to run code only ONCE whenever we transform)
private var normalMode : boolean = true;		// flag to check if we are in normal mode .. used to execute code only ONCE

//var planeRollMulti = 8.0;				// the fraction of our steering rotation we want to roll!
private var rollAmmount = 0;		// the initial roll angle - updates how much roll to add in plane mode ...

//var turnCharMulti = 2.0;				// ammount to turn the model even if not sliding
var slideRevertDampen : float = 0.7;			// the multi that defines how much of the slide direction is taken back when reverting from sliding (not 100% in slide dir but like 90%)

	// acceleration handling
var accRate = 25.0;					// in m/s²
var decRate = 30.0;					// in m/s²

	// 	hover handling
var hoverRayHit : RaycastHit;						// we're shooting a ray down to check for the ground ... this stores the hit info ...
// var hazardRayHit : RaycastHit;						// our collision ray

var hoverRayMask = 1<<8;							// the layer mask for the hover ray ..
var barrierMask = 1<<16;							// set bitmask for collision ray
var mineMask = 1<<17;								// bitmask for the mine layer

// the hazard mask should be chacked together with the mineMask (for jump only ... we do not evade barriers, only jump them)
var hazardMask = barrierMask | mineMask;

//var downforce = -10.0;				// the force pushing down at max Speed ... (wie bodenhaftung bei Auto... speed und flügel drücken runter ..)
// var maxDownforce = -60;			// maximum downforce when falling ...
//var idleDownforce = -10.0;			// the downforce when standing ...
//var hoverDownforce = -5.0;			// the initial downforce when we leave the ground ..

private var hoverMaxDist : float;			// the maximum hover distance (basically the length of the raycast check)

private var currDownforce : float;
private var trgtDownforce : float;

// +3.0 -> to be on the safe side with our speeds... for now I set the Raycast sender up 3 units above the characters feet, so 3.0 means - feet on the ground (so that gravity from one cycle to the next wont slip player through ground)
//var nHoverMaxDist = 3.25;			// the "normal" or robot mode hover height
//var nHoverHeight = 3.1;
//var uHoverMaxDist = 12.0;			// the "up" or plane mode hover height
//var uHoverHeight = 11.1;
//var dHoverMaxDist = 3.25;			// the "down" or car mode hover height
var dHoverHeight = 3.1;

//var transformHeightSpeed = 4.0;	// speed with which we increase our height when transforming
var transformDnTimeshift = 0.3;		// transforming back down from plane mode starts a bit earlyer, because we don't want the animation to play ON the ground....
var transDnMaxDelay = 1.0;				// time we delay resetting the max dist down (char is simply falling now.. and we don't want him uncontrolled)
//var hoverMinDist = 0.1;			// the minimum hover distance (this basically means we're hitting the ground)


// #########################
//	Add to stat files ...
//
//var hoverForce : float = 10.0;					// Force bigger than gravPull to enable hover in plane mode
private var hoverHitDist : float = 0.0;			// store the last hit distance


	// Jump Vars ...
//var jumpSpeed = 15.0;
//var jumpPause = 1.3;			// time between jumps ...

private var airborne : boolean = true;						// are we airborne ??
private var airTime;
private var airTimeBuffer : float = 0.1;						// time buffer to add ...

	// collision handling

var skateHeight : float = 1.35;	// the height of the raycast senders.
var carHeight : float = 0.6;
var planeHeight : float = 0.2;
private var actHeight : float = 1.35;


//var collisionSpeedDecrease: float = 0.8;						// factor to which speed decreases...#
//var collisionTurnSpeed: float = 15.0;							// maximum turn angle per loop per collision

	// we should turn to the next waypoint  in like .5 seconds .. 
	// Waypoints need pointers to next and prev waypoints 
	//  .. also special handles like: Jump Needed (long scripted Jumps)
	//  ... shortcut possible etc.

	// #####	Handled later on .... especially smoothing...
var canJump = true;

	// movement timers	Not needed on iPhone where we have no backwards driving ...
private var lastJump = 0.0;		// time when next jump is possible
private var isJumping = 0;		// check if we are currently jumping ...
private var grounded = 0;		// are we grounded??

	// more acceleration handling ....
var targetSpeed = 0.0;
private var currSpeedAdd = 0.0;
var currSpeed = 0.0;

	// rotation variables
private var currRotSpeed = 120.0;
private var actSpeed = 0.0;				// variable for clamping the deceleration .... maybe just use min/max speeds?


	// The current move direction in x-z
private var moveDirection = Vector3(0,0,0);

	// The  move speed
private var moveSpeed = 0.0;
private var rotationInput = 0.0;

private var isControllable = true;





// WP Vars...
private var switchWp : boolean = false;						// do we switch waypoint??
private var lapChange : boolean = false;					// have we changed the lap recently?
private var wpAimNode : Transform;
var wpDistPos : Vector3;									// this will hold the position we use to calculate player distance to waypoint ...
private var pRank : int;

// Access Lap and pos buttons

var tProgress : float;								// the position index of the robot ...
private var playerProgress : float;							// the players progress
private var nextProgress : float;							// get the next robots progress (or ours again if we are first)
private var lapCount : int = 0;								// number of completed laps
private var wpDist : float = 0.0;							// our Distance ...
private var botFinished : boolean = false;					// if our bot crossed the finish line, set a super high but ordered trackPassed value (to keep sorting correct)

var raceLaps : int = 3;										// how many laps the race has
private var endzone : float = 700.0;								// length of zone before finishline where AI won'd accelerate extra
private var noAiSpeedup : float;							// here we'll store at which distance to stop speeding up AI (end of last lap)

private var lastWpIndex : int = -99;						// last collision waypoint index
private var segLen : float;									// waypoint segment length
private var wpSpeedup : float = 1;							// the current waypoints speed multiplier
private var trackPassed : float = 0.0;						// the distance traveled so far

	// special occasions ..
// private var overAbyss : boolean = false;					// are we over an abyss
private var shadowHeight : float = 0.1;						// our shadow height
// private var allowHover : boolean = true;					// set if hover allowed... (abyss only when in plane mode)
private var wpScript : wpAttribs;							// this will hold the current waypoint script (to reset player on next wp after drop)
private var trackLen : float;								// length of complete track

	// Abyss timers ... OPTIMIZE???
	// -> one will specify the time after hitting the abyss, how long we fall, the other will specify how long we must wait on the other side until we can continue
private var abyssResetTime : float = 2.0;					// time till reset and stop
private var abyssStopTime : float = 3.5;					// time till slow mode
private var abyssSlowTime : float =	5.0;					// time till normal operations
private var abyssHitTime : float = -60.0;					// time at which we hit the abyss
private var abyssDrop : boolean = false;					// flag, so we don't contiously reset the time while over abyss ...
private var abyssResetting : boolean = false;				// are we still handling our resetting ...

	// robot collision speedup
var backColl : boolean = false;								// were we hit from behind last loop??
private var backCollSpeedboost : float = 1.3;				// multi for hit from behind..

	// add transform timer here for jumpgate handling
var transUpTime : float = 4.0;
var hitJumpGate : boolean = false;							// since we're handling collisions in a seperate function, I'm setting a bool Value when a gate was hit, that will initialize setting the correct transformed time on entering the move function
var longJump : boolean = false;

	// wrong direction timer
private var wrongDirReset : float = 3.0;					// after 4 seconds in wrong direction reset player
private var wrongDirDisplay : float = 0.3;					// after 0.5 seconds display wrong direction
private var wrongDirTimer : float = 0.0;
private var wrongDirActive : boolean = false;				
private var wrongDirEngaged : boolean = false;				// I want to make sure that when going back and hitting another waypoint (thus changing dist does not directly cancel our backMovement ...)
var wpOldDist : float = 0.0;								// last loops track progress (to compare with current for wrong dir checking)

	// get access to the weapon prefabs
// var mineIsotope : mineDeploy;
// var mineBadaboom : mineDeploy;
// var cruiseMissle : missleShoot;
// var skyShot : GameObject;
var shield : Transform;
var shieldHeight : Transform;
private var playWarning : boolean = false;


	// get the weapon sounds...
var isotopeSound : AudioClip;
var badaboomSound : AudioClip;
var speedSound : AudioClip;
var jumpSound : AudioClip;
var transformSound : AudioClip;
var explosionSound : AudioClip;
var virusSound : AudioClip;

	
	// weapon Flags and timers
private var shieldSet : boolean = false;
private var shieldPosed : boolean = true;
var shieldAnim : Animation;
private var managedEvade : boolean = false;			// did we evade missle or skyshot??

private var virusTurnMulti : float = 1.0;			// turn multi for virus infection

	// flag for stuff to run only once ...
private var mineHit : boolean;
private var infected : boolean = false;
private var isotopeHit : boolean = false;


var autoPilot = true;
private var hyperspace = false;
private var hyperspaceTime : float = 0.0;

	// weapon effect timer
private var effectTimer : float;
private var stopTimer : float;
private var slowTimer : float;

	// is aiming enabled?
// var aimTarget : Transform;				// the current target
var aimIndex : int;						// the index of our target!! (to use with refHolder)
private var hasTarget : boolean = true;		// do we have a target??

	// store the current waypoints aimtarget (in case we go automatic)
var wpPos : Vector3;

	// get our attached getInfo script (this will be used to distribute values to other scripts ..)
var publicInfo : getInfo;
var playerInfo : getInfo;


//
// define all runtime generated vars here already ...
//
	// get our rotation to ground normal ..
private var fromRotation : Quaternion;
private var toRotation : Quaternion;

		// get our normals to average our surface alignment
private var currNormal : Vector3;
//private var lastNormal : Vector3;
//private var preNormal : Vector3;
// var avgNormal : Vector3;

	// get our time handlers ...
private var dTime : float;
private var currTime : float;
		

//
//
//
//


	// to test how our AI handling is working, test with setting the distance manually ...
var manDist : float = 0.0;	

	// get our current input ..
var vertInput : float = 1.0;
var place : int;
private var horizInput : float = 1.0;
private var doSlide : int;

	// add our handlers for getReady (we'Re active but no movement and no steering and playing getReady)
private var startHoriz : float = 0.0;			// use speedMod for vert movement

private var dir : Vector3 = Vector3(0,0,0);							// for handling the acceleration ...
		
	// are we braking?
private var brakesActive : boolean = false;
	
	// turn calculation vars for autopilot
private var wp3D : Vector3;
				
	// holder for the optimal offset to use, based on alt or next selection
var bestOffset : float;
var nextWidth : float;

	// reset point after drop
private var abyssRespawn : Transform;

	// rotation handling vars
private var rotateAmmount : float;								// The rotation ammount from current inputs
private var collRotate : float;									// the collision turnrate
private var turnValue : float;									// this is for visual feedback when turning the character.. (but only the model)
private var currRotation : float = 0.0;							// will hold the current roatation below ..
private var prevSlideAngle : float = 0.0;						// will hold the rotation rest below
private var rotateValue : Vector3;	
		
	// local slide vars ...
private var localSlideTime : float = BotStats.fullSlideTime[charIndex];				// I want the slide to be based on input slightly:	
	
	// acceleration handling local vars
private var offRoadMulti : float = 1.0;							// set to 1 first	
				
	// skyshot offset from player
private var shotPos : float;

	// gravity handling local vars ...
private var gravComp : float;
private var upForce : float;
private var lastDownforce : float;
	
	// ranking local vars (rankSort function ...)
private var ranking : int[] = new int[7];						// initialize the ranklist

	// invoke repeat timers ...
private var wrongDirInterval : float = 0.8;
private var rankSortInterval : float = 0.5;

	// players offset value
var segOffset : float;

private var nextBot : int;												// values to get the next bot dist for the spread adjust
private var nextRank : int;
var doAvoid : boolean = false;									// do we avoid obstacles??
var doJump : boolean = false;									// do we jump if we can also turn??  
var weaponAvoid : boolean = false;								// do we avoid mines?
var goRight : boolean = false;									// do we turn left or right

private var diffShortcut : float = 1.0;									// difficulty multiplier for shortcut usage
private var diffJuiceMulti : float = 1.0;								// difficulty based juice handling
private var diffWeaponUse : float = 1.0;
private var spreadAdjust : float = 1.0;									// based on dist to next player adjust our spread towards optimal route or spread

private var aiWpMulti : float = 1.0;									// ai offset multiplier	-	set by wp
private var wpTurnMulti : float = 1.3;									// waypoint turn multiplier
private var hasOffense : boolean = false;								// has offensive weapon
private var hasMine : boolean = false;									// has mine
private var dropTest : float;											// random value to check weapon drop probability

					// AI related vars ... Turning remove the 25 m
		private var wpMagnitude :float;
		private var increaseDist : float = 65.0;	// this is the value at which we increase the turnrate to make the turn, including the 25m the wpPos is behind the actual waypoint
		private var slideDist : float =  20.0;		// at this distance we start a slide until we are too close to the waypoint.
		private var slideExit : float = 3.0;
		private var slideInput : float = 1.0;		// if calculated horiz input above this, add slide
		
			// waypoint offset handling (AI)	-> Set aiRandomize to 0.01 - 0.005! Just offset			
		private var aiAccurracy : float = 0.5;		//0.75 // ai goal for waypoint accurracy	-	adjusted at in diff settings
		private var aiRandomize : float = 0.01;		//1.0 - Randomize waypoint position (needed with spread???) - should only be a slight offset for Randomize
		private var wpClamp : float = 0.75;
		private var spreadMulti : float = 0.7;		// 0.7 the multiplier for the bots spread on track, so they don't occupy all the same space global value
		private var currSpread : float = 1 / (botIndex + 1);		// aquire the spread only on wp changes (even if the actual)
		
			// global ai speed increase
		private var aiSpeedMod : float = 1.0;
		
//	####################################
//
	// FOR AI TWEAK THOSE SETTINGS .. (waypoint calc)
	// segOffset = Mathf.Clamp((bestOffset+ ((Random.value - 0.5) * aiWpMulti * aiAccurracy * aiRandomize) + (spreadMulti * _refHolder.botSpread[botIndex - 1] * aiWpMulti)), -wpClamp, wpClamp);
	
	// turning:
	// horizInput = (wp3D.x / wpMagnitude) * wpTurnMulti * aiTurnMulti * aiTurnAdjust;
//
//	#####################################	
			
			// adjust for actual Player max speed (Multiplier)
		private var aiPlayerCompensation : float = 1.0;
		private var aiPlayerMax : float = 1.0;
		private var aiPlayerMin : float = 1.0;
		private var aiMaxVisSpeed : float = 1.0;
		private var aiPlayerLead : float = 300.0;			// initially, how far in front of the player tries the first rival to be??
		private var aiPlayerTail : float = 100.0;			// initially how far in front do the tail bots try to get?
		private var aiPlayerClose : float = 15.0;			// this bot tries to stay close to our player at all times
		private var diffCloseAdjust : float = 1.0;
		private var diffTailAdjust : float = 1.0;
		private var aiPlayerBuffer : float = 10.0;			// the buffer for our speedup
		private var aiPlayerBoost : float = 130.0;			// if we are WAY behind our goal, boost our speed 	was 150
		private var aiRivalSwitchDist : float = 50.0;		// at which dist to swith ai rivals					was 75
		private var diffLeadAdjust : float = 1.0;			// difficulty adjust for Leader pos
		private var aiAccRate : float = 1.0;				// acceleration rate based on ai
		private var aiDecRate : float = 1.0;
		private var aiSpeedCutoff : float = 48.0;
		private var aiBoostMax : float = 1.0;
		private var aiBoostAdjust : float = 1.0;			// increase in speedpad Speed
		private var aiMaxMod : float = 1.0;					// adjust our max speeds and aiAdjust based on diff
	
		private var aiTailOffset : float = -100.0;			// where does our rear bot try to end
		private var aiCloseOffset : float = -15.0;			// close bot tries to stay close
		private var aiFirstOffset : float = 50.0;
		private var distBackIndex : int = 2;				// the index of the rear bot that gets dist handling (targeted at 3rd or 4th place?!)
		private var aiJuicePosMod : float = 1.0;
		private var aiJuiceFillMod : float = 1.0;			// increase the fillrate of our juice based on position
		private var aiAccurPosMod : float = 1.0;			// accurracy of bot steering ... (smaller is better)
		private var aiPosShortcutMod : float = 1.0;			// adjust the shortcut usage probability
		private var aiPlayerSpeedup : float = 0.1;			// speedup rate
		private var aiPlayerPosEvadeMod : float = 1.0;		// adjust based on current standing if we evade or not
		private var wpDecision : float;
		
			// calc current multiplier (based on the distance to player)
		var currMulti : float;	
		
			// aiValues
		private var aiTurnAdjust : float = 1.0;		// this is basically the turn accurracy of the AI! Set globally!
		
			// ai Diff adjust
		var vertTrgt : float = 1.0;			// ai target speed based on position set in getAiSpeed function...
		private var turnGoal : float = 1.0;			// ai goal for tunspeed adjustment
		private var posDiff : float;
		var nextDiff : float;
		private var aiTurnMulti : float = 1.0;		// ai Multiplier for turnspeed set in getAiSpeed function...
		
		// private var aiShortcutMulti : float = 1.0;	// modifier for shortcut usage (set high probability if behind...)
		
			// ai speed adjust values (set from _refHolder values at start)
		private var rubberSlowdownRate : float = 0.02;							// the max ammount we reduce our speed each loop

			// setup a variable for simple difficulty based decisions 
		private var diffRandomDecision : float = 1.0;			// used for random tests
		private var diffRubberSlowdown : float = 1.0;			// difficulty adjust slowdown rate of leading bots (if easy, reduce speed faster etc.)
		private var diffJumpVal : float = 0.4;					// difficulty setting for jump over
		private var diffWeapAvoidVal : float = 0.3;				// difficulty setting for avoid weapon by steering

		
		
			// set the deadzone around the player
		//private var rubberDeadzone : float = 5.0;				// deadzone around the player
		private var spreadDeadzone : float = 200.0;				// the deadzone at which we change from optimal to spread 
		private var soloSpreadMulti : float = 0.8;				// when alone on track increase accurracy, if close to others adjust so that aiAccurracy x spreadMulti reaches 1

			// scan distance (for obstacles)
		// Handled by transform ...	private var obstacleScanDist : float = 8.0;				// scan dist
		private var obstacleScanRadius : float = 1.0;			// the radius of our sphere cast
		// private var obstacleJumpDist : float = 4.0;				// when to jump

				// TEMP
		var checkTransforms : boolean = true;
		var hasAction : boolean= true;				// might be an int that is increased with each event ... decreased with each event closing

	//add a global speed modifier...
var speedMod : float = 0.0;
// private var planeSlowdown : float = 1.0;
private var wasHit : boolean = false;				// were we hit by something?
private var skyshotHitCalled : boolean = false;

	// hit angle handling triggered by only collisionEnter (not Stay)
private var hitAngle : float = 0.0;

	// collision bounce test..
var sideBounce : float = 0.0;				// here we check our collision bounce
var speedBounce : float = 0.0;
private var bounceRevert : float = 80.0;

/*
private var bounceThreshold : float = 0.7;
private var bounceMax : float = 12.0;
*/

	// obstacle handling
var hasObstacle : boolean = false;					// do we need to check for obstacles in front
var jumpCall : boolean = false;
var closingMine : boolean = false;					// are we closing in on a mine?

private var sideBoost : float = 0.0;
private var sideSpeed : float = 17.0;

	// Lap times
private var raceTime : float = 0.0;


//	##################################################
//
//	Start Function Code...
//
//


function isReady()
{
		// prepare to run normal animation
	animState = 0;			// .. and set animState to 0 so that the skateSlow is called again
	
		// enable the movement multipliers...
	speedMod = 1.0;

	startHoriz = 1.0;
}


	// handle wrong direction - to be used with invoke repeat ...
function checkWrongDir()
{
			// ############################
			//
			// Handle wrong direction

	if (!wrongDirEnable)
	{
			// do nothing
	}
	else if (lapCount > 0)
	{		// if race has started .. start checking
		
			// are we facing away from waypoint (not just slightly but wp is at least 2m behind us ...)
		if (wp3D.z < -2.0)
		{
				// we are moving back
			if((wrongDirTimer + wrongDirDisplay) < currTime)
			{
				if(!wrongDirEngaged)
				{
					wrongDirEngaged = true;
				}
			}
			if ((wrongDirTimer + wrongDirReset) < currTime)
			{													// time to reset us ..
					// store our current position
				var resetPos : Vector3 = playerTrns.position;
				
					// get the angle to our wpDistPos
				// var resetDirection : Vector3 = wpDistPos - playerTrns.position;
				var resetDirection : Vector3 = waypoint.position - playerTrns.position;
				var resetAngle : float = Vector3.Angle(resetDirection, playerTrns.TransformDirection(Vector3(0,0,1)));
				
					// align player to new direction
				playerTrns.Rotate(0, resetAngle, 0);
				
					// reset our stored quaternion for the rotate function ...
				toRotation = playerTrns.rotation;
				
					// reset Timer
				wrongDirTimer = currTime;
				
					// reset Speed etc...
				currSpeed = 0.0;
			}
		}
		else
		{	// we are not moving backwards...
			if(wrongDirEngaged)
			{
					// if we were going back and hit a new waypoint .. and now our trackpassed has changed in first loop to be bigger .. don't directly cancel wrongDir out out
					// give one try (as in next loop the dist should still decrease)
				wrongDirEngaged = false;
				
			}
			else
			{
				wrongDirTimer = currTime;
			}
		}
	}
}		



function beginDamage(speed : float, currMod : float, effectTime : float)
{
	// print ("Damaged: " + botIndex + " at speed: " + speed);

		// if hit, exit speedPlane
	speedPlaneExit = 0.0;
	
		// if hit reset juice loader
	//juiceLeft = 0.0;
	
		// flag that we were hit...
	wasHit = true;
	
		// set the current effect speed ...
	speedMod = speed;

		// play hit animation
	animScript.playHit();
	
		// set the damage effect timer
	effectTimer = currTime + effectTime;
	
		// reduce the actual speed
	currSpeed = currSpeed * currMod;


		// check special occassions ...
	if (isotopeHit)
	{
			// play the shrink animation
		charScalerAnim.Play("scaleDn");
	
/*
			// shrink if needed ..
		charMesh.localScale = Vector3(0.5, 0.5, 0.5);
		blobShadow.localScale = Vector3(0.1, 0.1, 0.1);
*/
	}

}


function endDamage()
{
		// reset speed modifier
	speedMod = 1.0;

		
		// flag skishot hit cancelled
	skyshotHitCalled = false;
	
		// set back to skate slow
	publicInfo.stopped = false;
	animState = 0;									// so that playSkateSlow gets played next loop
	
		// flag end of hit
	wasHit = false;
	
		// check special occassions ...
	if (isotopeHit)
	{		
			// shut isotope off
		isotopeHit = false;
		
			// play the grow animation
		charScalerAnim.Play("scaleUp");
/*		
			// scale up! Replace that with an animated parent node!!!
		charMesh.localScale = Vector3(1.0, 1.0, 1.0);
		blobShadow.localScale =Vector3(0.2, 0.2, 0.2);
*/
	}
	
	if (infected)
	{
		infected = false;
	}
}


function skyshotPlayer()
{
		// handle evasion decision ...
		// check if we are braking 
	if(weaponAvoid)
	{ 
			// handle skyshot avoid ...
		shotPos = -3.0;  
		 	
		 	//instead of using the brake, just slow us down till the ray hits... 
		 	
		 	// if hit, exit speedPlane
		speedPlaneExit = 0.0;
	
			// flag that we were hit...
		wasHit = true;
	
			// set the current effect speed ...
		speedMod = 0.6;								//slow down a sec, as evading would require braking

	
			// set the damage effect timer
		effectTimer = currTime + 1.8;
	}
	else if (shieldSet)
	{
		shotPos = -3.0;
		shieldDisable();
	}
	else
	{

		shotPos = 3.0;
	}
					
		// instantiate the ray
	_refHolder.allSkyshot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, -(hoverHitDist - 2.5), shotPos)) + playerTrns.position);
	_refHolder.allSkyshotScr[botIndex].setTag = "playerSky";
	_refHolder.allSkyshotScr[botIndex].doFire();
	
	
}



function leadershotPlayer()
{
		// handle evasion decision ...
		// check if we are braking 
	if(weaponAvoid)
	{ 
			// handle skyshot avoid ...
		shotPos = -3.0;  
		 	
		 	//instead of using the brake, just slow us down till the ray hits... 
		 	
		 	// if hit, exit speedPlane
		speedPlaneExit = 0.0;
	
			// flag that we were hit...
		wasHit = true;
	
			// set the current effect speed ...
		speedMod = 0.6;								//slow down a sec, as evading would require braking

			// set the damage effect timer
		effectTimer = currTime + 1.8;
	}
	else if (shieldSet)
	{
		shotPos = -3.0;
		shieldDisable();
	}
	else
	{	
		shotPos = 3.0;

	}
					
		// instantiate the ray
	_refHolder.allLeaderShot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, -(hoverHitDist - 2.5), shotPos)) + playerTrns.position);
	_refHolder.allLeaderShotScr[botIndex].setTag = "playerLeader";
	_refHolder.allLeaderShotScr[botIndex].doFire();

}


function skyshotFire()
{
		// handle evasion decision ...
		// check if we are braking 
	if(weaponAvoid)
	{ 
			// handle skyshot avoid ...
		shotPos = -3.0;  
		 	
		 	// if hit, exit speedPlane
		// speedPlaneExit = 0.0;
	
			// flag that we were hit...
		wasHit = true;
	
			// set the current effect speed ...
		speedMod = 0.6;

			// set the damage effect timer
		effectTimer = currTime + 1.8;
	}
	else if (shieldSet)
	{
		shotPos = -3.0;
		shieldDisable();
	}
	else
	{

		shotPos = 3.0;
	}
					
		// instantiate the ray
	_refHolder.allSkyshot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, -(hoverHitDist - 2.5), shotPos)) + playerTrns.position);
	_refHolder.allSkyshotScr[botIndex].setTag = "sky";
	_refHolder.allSkyshotScr[botIndex].doFire();
	
	
}


function leadershotFire()
{
		// handle evasion decision ...
		// check if we are braking 
	if(weaponAvoid)
	{ 
			// handle skyshot avoid ...
		shotPos = -3.0;  
		 	
		 	// if hit, exit speedPlane
		// speedPlaneExit = 0.0;
	
			// flag that we were hit...
		wasHit = true;
	
			// set the current effect speed ...
		speedMod = 0.6;
	
			// set the damage effect timer
		effectTimer = currTime + 1.8;
	}
	else if (shieldSet)
	{
		shotPos = -3.0;
		shieldDisable();
	}
	else
	{				
		shotPos = 3.0;
	}
					
		// instantiate the ray
	//_refHolder.allLeaderShot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, 0, shotPos)) + playerTrns.position);
	_refHolder.allLeaderShot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, -(hoverHitDist - 2.5), shotPos)) + playerTrns.position);
	_refHolder.allLeaderShotScr[botIndex].setTag = "leader";
	_refHolder.allLeaderShotScr[botIndex].doFire();
	

}


function skyshotHit()
{
	if (skyshotHitCalled)
	{
			// set back to skate slow
		publicInfo.stopped = false;
		animState = 0;									// so that playSkateSlow gets played next loop
		
			// invoke the damage manually so not to play the damage anim again
		//beginDamage(0.4, 0.4, 2.0);
		
			// flag that we were hit...
		wasHit = true;
		
			// set the current effect speed ...
		speedMod = 0.2;

		
			// set the damage effect timer
		effectTimer = currTime + 2.0;
	}
}


function shieldEnable()
{
	if (!shieldSet)
	{
		/*	
		if(publicInfo.dnTrans)
		{
			shieldHeight.localPosition.y = carHeight;
		}
		else if(publicInfo.upTrans)
		{
			shieldHeight.localPosition.y = planeHeight;
		}
		else
		{
			shieldHeight.localPosition.y = skateHeight;
		}
		*/
		
			// sheild height
		shieldHeight.localPosition.y = actHeight;		
		
			// set shield visible
		shieldSet = true;
		effectTimer = currTime + 40.0;
					
			// play animations ...
		shieldAnim.Play("expand");	
		shieldAnim.CrossFadeQueued("active", 0.3, QueueMode.CompleteOthers);
	}
}


function shieldDisable()
{
	shieldSet = false;
				
		// start FadeAway anim early
	shieldAnim.Play("collapse");
}



	// reset after drop							
function abyssReset()
{
		// reset the player position ..
	playerTrns.position = abyssRespawn.position;			// position the player correctly
	playerTrns.rotation = abyssRespawn.rotation;
	currSpeed = 0.0;									// we dropped. Set our speed to 0
	currDownforce = 0.0;								// we were falling FAST! Reset our downforce

		// set anim handler to stopped ..
	publicInfo.stopped = true;
					
		// start the stopped animation
	animScript.playSkateSlow();
	// DEBUG
	//	print ("Called Line abyssReset");
	animState = 6;										// set to stand
	
		// set the speed multi to 0.0
	speedMod = 0.0;
		
		// Invoke the slow mode
	Invoke("abyssSlow", abyssStopTime);
}

	// start slow after drop
function abyssSlow()
{
		// reenable the skate slow
	publicInfo.stopped = false;
	animState = 0;									// so that playSkateSlow gets played next loop
	
		// set speedMod to 0.4 and set the eventTimer
	speedMod = 0.4;

	effectTimer = abyssSlowTime;
	wasHit = true;
}



function setAiSpeedRange()
{
		// init aiPlayerCompensation as 1 (no change)
	aiPlayerCompensation = 1.0;
	
		// prevent division by zero
	if (maxSpeed != 0)
	{
		aiPlayerCompensation = playerMoveScr.maxSpeed / maxSpeed;
	}
	
	// aiMaxMod is NEW in build 1.02

		// now, based on our bots speed, decide what the max should be
		// max speed should NEVER be slower than the actual bot Speed and max 1.3 x player Speed
		// min Speed should never be faster than the actual botSpeed and min 0.8 x player Speed
		// add a diff offset of around 0.05
	if ( maxSpeed < (playerMoveScr.maxSpeed * 1.25 * aiMaxMod) )
	{
		aiPlayerMax = aiPlayerCompensation * 1.25 * aiMaxMod;
	}
	else
	{		// this is only for much faster bots than player, use 1 (the bot speed)
		aiPlayerMax = 1.0;
	}
	
	if ( maxSpeed > (playerMoveScr.maxSpeed * 0.7 * aiMaxMod ) )
	{
		aiPlayerMin = aiPlayerCompensation * 0.7 * aiMaxMod;
	}
	else
	{		// this is only for much slower bots than player
		aiPlayerMin = 1.0;
	}
	
		// Now get the maximum speed when in view
	if ( maxSpeed < (playerMoveScr.maxSpeed * 1.1 * aiMaxMod) )
	{
		aiMaxVisSpeed = aiPlayerCompensation * 1.1 * aiMaxMod;
	}
	else
	{		// this is only for much faster bots than player, use 1 (the bot speed)
		aiMaxVisSpeed = 1.0;
	} 
	
		// Now get the maximum boost speed
	if ( maxSpeed < (playerMoveScr.speedPlaneSpeed * 1.1 * aiMaxMod) )
	{
		aiBoostMax = (playerMoveScr.speedPlaneSpeed / speedPlaneSpeed) * 1.1 * aiMaxMod;
	}
	else
	{		// this is only for much faster bots than player, use 1 (the bot speed)
		aiBoostMax = 1.0;
	} 

}


function Start ()
{	
		// get access to the playerinfo
	playerInfo = GameObject.Find("Player_Construct").GetComponent(getInfo) as getInfo;
	

		// test parenting the mesh back unter the player
	charMesh.parent = charScaler;
	charMesh.localPosition = Vector3(0,0,0);
	charMesh.localEulerAngles = Vector3(0,0,0);
	
		// get the char mesh renderer...
		// get the char mesh renderer...
	botRenderer = charMesh.GetComponentInChildren(Renderer);
	// botRenderer = botMesh.GetComponentInChildren(Renderer);
	
		// store the current mesh index in the getInfo script
	publicInfo.meshIndex = charIndex;

		// get access to refholder
	_refHolder = GameObject.Find("_refHolder").GetComponent(refHolder) as refHolder;
	
		
		// connect the _refHolder to the animscript
	animScript._refHolder = _refHolder;
	animScript.publicInfo = publicInfo;
	
		// invoke get Ready exit function
	Invoke("isReady", _refHolder.startTime);
	
		// invoke the wrong Dir function repeating ..
	if(wrongDirEnable)
	{
		InvokeRepeating("checkWrongDir", 0.5, wrongDirInterval);
	}

		// Get the player transform ....
	playerTrns = transform;
	
		// set initial stat settings ...
	maxSpeed = BotStats.botSpeed[charIndex];
	rotateSpeed = BotStats.botRotation[charIndex];
	accRate = BotStats.botAcc[charIndex];
	decRate = BotStats.botDec[charIndex];
	speedPlaneSpeed = BotStats.botSpeedpad[charIndex];
	offRoad = BotStats.botOffroad[charIndex];
	
		// again set trsnformed state
	publicInfo.dnTrans = false;		// Reset the flags 
	publicInfo.upTrans = false;
	publicInfo.noTrans = true;

		// init the character on the spawnpoint ...
	playerTrns.position = spawnPoint.position;
	playerTrns.rotation = spawnPoint.rotation;
	
	moveDirection = playerTrns.TransformDirection(Vector3(0,0,1));
	lastJump = 0.0;				// get the time
	
		// also set our rigidbody to freeze rotation
	//charController.freezeRotation = true;
	//charController.useGravity = false;
	

		// the distance is needed .. otherwise the ray stops on the first collider, even if it is the wrong layer ...
	Physics.Raycast (rayCastSender.position, playerTrns.TransformDirection (Vector3(0,-1,0)), hoverRayHit, 50.0, hoverRayMask);
	hoverHitDist = hoverRayHit.distance;						// store the initial distance 

		// init the three buffer normals...
	//preNormal = hoverRayHit.normal;						// move stored vectors one frame back
	//lastNormal = hoverRayHit.normal;
	currNormal = hoverRayHit.normal;
	
	trgtDownforce = GlobalStats.idleDownforce;								// initially NO Speed, NO Downforce

	hoverMaxDist = GlobalStats.nHoverMaxDist;								// set the initial hover settings...
	
	speedPlaneExit = -speedPlaneTime;							// we don't want to start in boost mode
	
	hoverRayMask = 1<<8;	
	barrierMask = 1<<16;									// set bitmask for collision ray
	mineMask = 1<<17;									// bitmask for the mine layer
	
		// the hazard mask should be chacked together with the mineMask (for jump only ... we do not evade barriers, only jump them)
	hazardMask = barrierMask | mineMask;
	
		// set the correct transform flags
	rollAngle = 0.0;											// the roll angle multiplier for plane mode
	planeMode = false;
	normalMode = true;

		// set the ray senders to correct height
	actHeight = skateHeight;		
	
		// set character controller height
	//charCollider.center.y = 0.7;
	shieldHeight.localPosition.y = actHeight;

		// set some flags for abyss handling
	// overAbyss = false;	
	shadowHeight = 0.1;				
	// allowHover = true;			

	nextPickup = 0.0;											// init the next Pickuptimer ..		

	
		// set the distance for the last lap no AI speedup zone....
	wpScript = (waypoint.GetComponent(wpAttribs) as wpAttribs); 
	
		// get our aimNode at the beginning
	wpAimNode = wpScript.aimVector;
	
	
// ###################################
//
//	As long as we have no seperate Waypoint function .. set initial wpPos here

				// get our reset settings
			abyssRespawn = wpScript.dropRespawn;
			abyssStopTime = wpScript.dropTimer;										// time till slow mode
			abyssSlowTime =	abyssStopTime + 1.5;									// time we are slow after reset ...
			
				// get the airTime stored in the current waypoint
			transUpTime = wpScript.airTimer;
			aiWpMulti = wpScript.aiMulti;
			wpTurnMulti = wpScript.wpTurnMulti;										// turn enhancment
			
				// handle our Offset and get the wpPos for this segment .. based on best offset
			segOffset = Mathf.Clamp((bestOffset+ ((Random.value - 0.5) * aiAccurracy * aiWpMulti * aiRandomize) + (spreadMulti * _refHolder.botSpread[botIndex - 1] * aiWpMulti)), -wpClamp, wpClamp);

			
			publicInfo.wpOffset = segOffset;

				// test with actual wpPlane! Still Jitter Test without offset for now???
			wpPos = (waypoint.TransformDirection(Vector3((segOffset * nextWidth), 0, 0.0)) + waypoint.position);
	
		
//
//
// ##################################	

	trackLen = wpScript.fullLen;								// get the track len from the first waypoint ...

	lastWpIndex = -9999;										// as I'm checking that waypoints are not triggered twice in one pass, change the index away from first wp

		// these should only be set after start ..init to some value first ...
	segLen = wpScript.segLen;									// get the initial segLen
	wpSpeedup = wpScript.speedAdjust;							// get the initial waypoints speed boost

	
// getAI initial DIFFICULTY Settings	
	place = DataTransfer.robotRankTarget[charIndex];	// for vis
	
		// get AI speed every  second ...
	InvokeRepeating("getAiSpeed", 0.05, 1.0);
	
		// get the current AI settings from the refHolder
	aiSpeedMod = _refHolder.aiSpeedMod;
	aiRandomize = _refHolder.aiRandomize;
	spreadMulti = _refHolder.spreadMulti;
	aiTurnAdjust = _refHolder.aiTurnAdjust;
	
	// rubberSlowdownRate = _refHolder.rubberSlowdownRate;
	// rubberLength = _refHolder.rubberLength;
	// rubberFlexOffset = _refHolder.rubberFlexOffset;
	// rubberTurnMulti = _refHolder.rubberTurnMulti;
	// rubberAiMulti = _refHolder.rubberAiMulti;
	// rubberOffset = _refHolder.rubberOffset;
	// rubberBackBoost = _refHolder.rubberBackBoost;
	// rubberViewMaxSpeed = _refHolder.rubberViewMaxSpeed;

		// get access to player script ...
	playerMoveScr = GameObject.Find("Player_Construct").GetComponent(pMove) as pMove;
	
		// get our max speed ranges (based on player and current bot max speeds at the current transform state)
	setAiSpeedRange();
	
		//Store our both lead AI indices initially
	if (DataTransfer.robotRankTarget[charIndex] == 0)
	{
		DataTransfer.aiLeaders[0] = charIndex;
		DataTransfer.aiLeaders[1] = botIndex;
	}
	else if (DataTransfer.robotRankTarget[charIndex] == 1)
	{
		DataTransfer.aiLeaders[2] = charIndex;
		DataTransfer.aiLeaders[3] = botIndex;
	}
	

//
//
//	THIS SEEMS TO BE WRONG!! IF THE PLAYER IS SLOWER, THE speedDiffCheck IS NEGATIVE, SO IT
//	IS ALWAYS SMALLER THAN ANY POS VALUE..
//
//	BASE THE aiPlayerCompensation ON IT'S FIRST VALUE (below 1 of player is slower, above one if player is faster)
//
//
//

	var diffEndMulti : float = 1.0;					// endzone multi
	
		// get some values based on the actual trackLen
	//aiPlayerLead = trackLen / 3.0;					// first player should try and lead by 1/3 of map
	//aiPlayerTail = trackLen / 10.0;

		// set some difficulty based values
	if (_refHolder.aiDiff == 0)
	{					// Easy
		diffRandomDecision = 0.9;
		diffShortcut = 0.7;						// super low shortcut probability
		//diffSpeedMulti = 0.8;						// was 0.8
		//diffTurnMulti = 0.9;
		//diffAccurrMulti	= 1.0;					// this is used to increase spread if close to next bot back to 1 (with aiAccurracy)
		//diffRubberOffset = (rubberLength * 0.3);	// increase rubberOffset by 50 %
		diffRubberSlowdown = 1.2;					// slowdown twice as fast 2.0
		aiAccurracy = 0.9;
		diffJumpVal = 0.6;
		diffWeapAvoidVal = 0.3;
		diffJuiceMulti = 0.8;						// set to 60% of waypoint setting
		diffWeaponUse = 1.0;
		diffLeadAdjust = 1.0;
		diffTailAdjust = 0.6;
		diffCloseAdjust = 0.8;
		aiCloseOffset = aiCloseOffset * 1.1;
		aiTailOffset = aiTailOffset * 1.3;
		aiFirstOffset = aiFirstOffset * -0.1;						// At the end aim at a pos 10 m behind player
		aiPlayerBuffer = aiPlayerBuffer * 1.4;
		diffEndMulti = 1.5;
		aiPlayerSpeedup = aiPlayerSpeedup * 0.8;
		aiMaxMod = 1.0;
		
			// reduce speedMod
		aiSpeedMod = aiSpeedMod * 1.05;
	}
	else if (_refHolder.aiDiff == 1)
	{					// Normal
		diffRandomDecision = 1.0;
		diffShortcut = 1.2;						// increase shortcut probability by 500 %
		//diffSpeedMulti = 1.1;						// was 1.1
		//diffTurnMulti = 1.4;
		//diffAccurrMulti = 1.667;					// this is used to increase spread if close to next bot back to 1 (with aiAccurracy)
		//diffRubberOffset = - (rubberLength * 0.3);	// decrease rubberOffset by 50 %
		diffRubberSlowdown = 1.0;					// slowdown 25% slower
		aiAccurracy = 0.7;							// increase accurr.
		diffJumpVal = 0.75;
		diffWeapAvoidVal = 0.45;
		diffJuiceMulti = 1.0;						// set to 100% of waypoint setting
		diffWeaponUse = 1.0;
		diffLeadAdjust = 1.4;
		diffTailAdjust = 1.0;
		diffCloseAdjust = 1.0;
		aiCloseOffset = aiCloseOffset * 0.9;
		aiTailOffset = aiTailOffset * 0.9;
		aiFirstOffset = aiFirstOffset * 0.9;						// At the end aim at a pos 50 m in front of player
		aiPlayerBuffer = aiPlayerBuffer * 1.4;
		diffEndMulti = 1.0;
		aiPlayerSpeedup = aiPlayerSpeedup * 1.0;
		aiMaxMod = 1.1;
		
			// increase speedMod
		aiSpeedMod = aiSpeedMod * 1.10;
	}
	else
	{					// Hard
		diffRandomDecision = 1.0;
		diffShortcut = 1.7;							// increase shortcut probability by 500 %
		//diffSpeedMulti = 1.1;						// was 1.1
		//diffTurnMulti = 1.4;
		//diffAccurrMulti = 1.667;					// this is used to increase spread if close to next bot back to 1 (with aiAccurracy)
		//diffRubberOffset = - (rubberLength * 0.3);	// decrease rubberOffset by 50 %
		diffRubberSlowdown = 0.8;					// slowdown 25% slower
		aiAccurracy = 0.5;							// increase accurr.
		diffJumpVal = 0.90;
		diffWeapAvoidVal = 0.55;
		diffJuiceMulti = 1.2;						// set to 100% of waypoint setting
		diffWeaponUse = 1.2;
		diffLeadAdjust = 1.7;
		diffTailAdjust = 1.2;
		diffCloseAdjust = 1.1;
		aiCloseOffset = aiCloseOffset * 0.7;
		aiTailOffset = aiTailOffset * 0.7;
		aiFirstOffset = aiFirstOffset * 1.2;						// At the end aim at a pos 50 m in front of player
		aiPlayerBuffer = aiPlayerBuffer * 1.2;
		diffEndMulti = 0.8;
		aiPlayerSpeedup = aiPlayerSpeedup * 1.3;
		aiMaxMod = 1.17;
		
			// increase speedMod
		aiSpeedMod = aiSpeedMod * 1.12;
	}
	
	/*
	
	//
	//	ACTUAL SETTINGS
	
			// set some difficulty based values
	if (_refHolder.aiDiff == 0)
	{					// Easy
		diffRandomDecision = 0.7;
		diffShortcut = 0.5;						// super low shortcut probability
		//diffSpeedMulti = 0.8;						// was 0.8
		//diffTurnMulti = 0.9;
		//diffAccurrMulti	= 1.0;					// this is used to increase spread if close to next bot back to 1 (with aiAccurracy)
		//diffRubberOffset = (rubberLength * 0.3);	// increase rubberOffset by 50 %
		diffRubberSlowdown = 1.4;					// slowdown twice as fast 2.0
		aiAccurracy = 1.0;
		diffJumpVal = 0.4;
		diffWeapAvoidVal = 0.2;
		diffJuiceMulti = 0.8;						// set to 60% of waypoint setting
		diffWeaponUse = 1.0;
		diffLeadAdjust = 0.9;
		diffTailAdjust = 0.6;
		diffCloseAdjust = 0.8;
		aiCloseOffset = aiCloseOffset * 1.3;
		aiTailOffset = aiTailOffset * 1.6;
		aiFirstOffset = aiFirstOffset * -0.3;						// At the end aim at a pos 10 m behind player
		aiPlayerBuffer = aiPlayerBuffer * 2.0;
		diffEndMulti = 1.5;
		aiPlayerSpeedup = aiPlayerSpeedup * 0.8;
		
			// reduce speedMod
		aiSpeedMod = aiSpeedMod * 0.95;
	}
	else if (_refHolder.aiDiff == 1)
	{					// Normal
		diffRandomDecision = 0.9;
		diffShortcut = 1.0;						// increase shortcut probability by 500 %
		//diffSpeedMulti = 1.1;						// was 1.1
		//diffTurnMulti = 1.4;
		//diffAccurrMulti = 1.667;					// this is used to increase spread if close to next bot back to 1 (with aiAccurracy)
		//diffRubberOffset = - (rubberLength * 0.3);	// decrease rubberOffset by 50 %
		diffRubberSlowdown = 1.1;					// slowdown 25% slower
		aiAccurracy = 0.8;							// increase accurr.
		diffJumpVal = 0.65;
		diffWeapAvoidVal = 0.3;
		diffJuiceMulti = 1.0;						// set to 100% of waypoint setting
		diffWeaponUse = 1.0;
		diffLeadAdjust = 1.2;
		diffTailAdjust = 1.0;
		diffCloseAdjust = 1.0;
		aiCloseOffset = aiCloseOffset * 1.0;
		aiTailOffset = aiTailOffset * 1.0;
		aiFirstOffset = aiFirstOffset * 1.0;						// At the end aim at a pos 50 m in front of player
		aiPlayerBuffer = aiPlayerBuffer * 1.6;
		diffEndMulti = 1.0;
		aiPlayerSpeedup = aiPlayerSpeedup * 1.0;
		
			// increase speedMod
		aiSpeedMod = aiSpeedMod * 1.07;
	}
	else
	{					// Hard
		diffRandomDecision = 1.0;
		diffShortcut = 1.5;							// increase shortcut probability by 500 %
		//diffSpeedMulti = 1.1;						// was 1.1
		//diffTurnMulti = 1.4;
		//diffAccurrMulti = 1.667;					// this is used to increase spread if close to next bot back to 1 (with aiAccurracy)
		//diffRubberOffset = - (rubberLength * 0.3);	// decrease rubberOffset by 50 %
		diffRubberSlowdown = 0.9;					// slowdown 25% slower
		aiAccurracy = 0.6;							// increase accurr.
		diffJumpVal = 0.85;
		diffWeapAvoidVal = 0.5;
		diffJuiceMulti = 1.2;						// set to 100% of waypoint setting
		diffWeaponUse = 1.2;
		diffLeadAdjust = 1.5;
		diffTailAdjust = 1.2;
		diffCloseAdjust = 1.1;
		aiCloseOffset = aiCloseOffset * 0.8;
		aiTailOffset = aiTailOffset * 0.8;
		aiFirstOffset = aiFirstOffset * 1.3;						// At the end aim at a pos 50 m in front of player
		aiPlayerBuffer = aiPlayerBuffer * 1.3;
		diffEndMulti = 0.8;
		aiPlayerSpeedup = aiPlayerSpeedup * 1.3;
		
			// increase speedMod
		aiSpeedMod = aiSpeedMod * 1.12;
	}
	
	*/

		// calculate our maximum allowed speed based on our slowest bots speed
		// cutoff speed based on slowest bot!!!
	// aiSpeedCutoff = 26.0 * (1.0 + rubberFlexOffset) * diffSpeedMulti * aiSpeedMod;

		// set our  new rubber offset
	//rubberOffset = rubberOffset + diffRubberOffset;




//	!!!!!!
//	Move to getinfo or DataVault ...
//
		// define the area where no ai speedup will be performed
	noAiSpeedup = ((trackLen * raceLaps) - (endzone * diffEndMulti * DataTransfer.circuitAdjust));	
	//print ("noAISpeedup: " + noAiSpeedup);

botRenderer.material.color = _refHolder.startColor;
}



	// revert to normal from car			
function transFromCar()
{
		// set flags
	publicInfo.noTrans = true;
	publicInfo.upTrans = false;
	publicInfo.dnTrans = false;
	
		// shut off rollAngle (only from plane)
	rollAngle = 0.0;

		// until autonomous anim function, play transform back animation
	animScript.playTransBack();													
	animState = 0;
					
		// get the correct height
	actHeight = skateHeight;
	
		// init shield height change
	shieldPosed = false;
		
		// set charController height instead ...
	//charCollider.center.y = actHeight;
	shieldHeight.localPosition.y = actHeight;
					
		// set robot stat settings ...
	maxSpeed = BotStats.botSpeed[charIndex];
	rotateSpeed = BotStats.botRotation[charIndex];
	accRate = BotStats.botAcc[charIndex];
	decRate = BotStats.botDec[charIndex];
	speedPlaneSpeed = BotStats.botSpeedpad[charIndex];
	offRoad = BotStats.botOffroad[charIndex];
	
		// set the speed modifier for plane mode back to 1
	// planeSlowdown = 1.0;
}


	// revert to normal from Plane			
function transFromPlane()
{
		// set flags
	publicInfo.noTrans = true;
	publicInfo.upTrans = false;
	publicInfo.dnTrans = false;

		// until autonomous anim function, play transform back animation
	animScript.playTransBack();													
	animState = 0;
	
		// shot off rollAngle (only from plane)
	rollAngle = 0.0;
					
		// get the correct height
	actHeight = skateHeight;
	
		// init shield height change
	shieldPosed = false;
		
		// set charController height instead ...
	//charCollider.center.y = actHeight;
	shieldHeight.localPosition.y = actHeight;
					
		// set robot stat settings ...
	maxSpeed = BotStats.botSpeed[charIndex];
	rotateSpeed = BotStats.botRotation[charIndex];
	accRate = BotStats.botAcc[charIndex];
	decRate = BotStats.botDec[charIndex];
	speedPlaneSpeed = BotStats.botSpeedpad[charIndex];
	offRoad = BotStats.botOffroad[charIndex];
	
		// from plane:
	hoverMaxDist = GlobalStats.nHoverMaxDist;	

		// longJump off
	longJump = false;
	
		// set the speed modifier for plane mode back to 1
	// planeSlowdown = 1.0;
}


	// transform to plane			
function transToPlane()
{
		// set flags
	publicInfo.noTrans = false;
	publicInfo.upTrans = true;
	publicInfo.dnTrans = false;

		// set rollAngle and reset downforce (so that we rise directly)
	rollAngle = BotStats.planeRollMulti[charIndex];
	currDownforce = 0.0;
	
		// set the correct heigth
	actHeight = planeHeight;
	
		// init shield height change
	shieldPosed = false;
						
		// adjust char controller height
	//charCollider.center.y = actHeight;
	shieldHeight.localPosition.y = actHeight;
		
		// init the transform up animation
	animScript.playTransUp();		// Start animation
	animState = 7;

					
		// set plane stats ...
	maxSpeed = BotStats.planeSpeed[charIndex];
	rotateSpeed = BotStats.planeRotation[charIndex];
	accRate = BotStats.planeAcc[charIndex];
	decRate = BotStats.planeDec[charIndex];
	speedPlaneSpeed = BotStats.planeSpeedpad[charIndex];
	offRoad = BotStats.planeOffroad[charIndex];
	
		// set the max hover dist to stay in control (like grounded)
	hoverMaxDist = GlobalStats.uHoverMaxDist;	
	
		// set the timer
	publicInfo.transTimer = currTime + transUpTime;					// set the transformed time ...
	
		// check for speed right after the trans Timer should end (so we don't have to check every loop)
	//Invoke("checkTransform", (transUpTime + 0.1));
	
		// set the speed modifier for plane mode back to 1
	// planeSlowdown = 1.0;
}


	// transform to car			
function transToCar()
{
		// set flags
	publicInfo.noTrans = false;
	publicInfo.upTrans = false;
	publicInfo.dnTrans = true;

		// set rollAngle and reset downforce (so that we rise directly)
	rollAngle = 0.0;
	currDownforce = 0.0;
	
		// set the correct heigth
	actHeight = carHeight;
	
		// init shield height change
	shieldPosed = false;
						
		// adjust char controller height
	//charCollider.center.y = actHeight;
	shieldHeight.localPosition.y = actHeight;
		
		// init the transform up animation
	animScript.playTransDn();		// Start animation
	animState = 8;
					
		// set car stats ...
	maxSpeed = BotStats.carSpeed[charIndex];
	rotateSpeed = BotStats.carRotation[charIndex];
	accRate = BotStats.carAcc[charIndex];
	decRate = BotStats.carDec[charIndex];
	speedPlaneSpeed = BotStats.carSpeedpad[charIndex];
	offRoad = BotStats.carOffroad[charIndex];
	
		// set the max hover dist to stay in control (like grounded)
	hoverMaxDist = GlobalStats.nHoverMaxDist;	
	
		// set the speed modifier for plane mode back to 1
	// planeSlowdown = 1.0;
}




function speedSlide(duration : float)
{
	// run fuction as long as OVER speedpad and set speed
	// currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod * planeSlowdown;
	currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod;
	
		// set the exit time
	speedPlaneExit = currTime + duration;

		// first hit run once
	if (!speedState)
	{
		
			// set flags
		speedState = true;
		
			// public flag
		publicInfo.speedPlane = true;
	}
}

function speedHit()
{
		// run fuction as long as OVER speedpad and set speed
	currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod;
	
		// set the exit time
	speedPlaneExit = currTime + speedPlaneTime;

		// first hit run once
	if (!speedState)
	{
			// set flags
		speedState = true;

			// public flag
		publicInfo.speedPlane = true;
	}
}


function burnJuice()
{
		// the button visuals are handled ON the juice button by the HUD_juiceLoader script!!!!

		// if juice not yet active
	if (!publicInfo.juiceActive)
	{
			// info
		// Debug.Log("burning Juice");
	
			// set our two juice flags
		publicInfo.juiceActive = true;

			//
			// change our animation and speed stuff just like on the speedpad..
		
			// run fuction as long as OVER speedpad and set speed
		currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod;
	}
}



function startMissle ()
{
		// deploy missle 2 m in front of player
	_refHolder.allMissle[botIndex].position = (playerTrns.position + playerTrns.TransformDirection(Vector3(0, 1.5, 2.0)));
	_refHolder.allMissle[botIndex].rotation = playerTrns.rotation;
					
		// run targetting
	_refHolder.allMissleScr[botIndex].LockOn(aimIndex, waypoint, publicInfo.wpOffset);
}


function missleJump()
{
		// if we are in avoidWeapon mode, jump (over missle)
	if (weaponAvoid)
	{
		applyJump();
	}
}


function startBadaboom ()
{
		// place correct mine
	switch(badaDrop)
	{
		case 0:
					// place mine correctly
				_refHolder.allBada[botIndex].position = playerTrns.position;
				_refHolder.allBada[botIndex].rotation = playerTrns.rotation;
				_refHolder.allBadaScr[botIndex].activate();
				
					// adjust mine counter
				badaDrop = 1;
			break;
			
		case 1:
					// place mine correctly
				_refHolder.allBada2[botIndex].position = playerTrns.position;
				_refHolder.allBada2[botIndex].rotation = playerTrns.rotation;
				_refHolder.allBadaScr2[botIndex].activate();
				
					// adjust mine counter
				badaDrop = 2;
			break;
			
		case 2:
					// place mine correctly
				_refHolder.allBada3[botIndex].position = playerTrns.position;
				_refHolder.allBada3[botIndex].rotation = playerTrns.rotation;
				_refHolder.allBadaScr3[botIndex].activate();
				
					// adjust mine counter
				badaDrop = 0;
			break;
	}
}

function startIsotope ()
{
		// start the correct isotope
	switch(isoDrop)
	{
			
		case 0:
					// place mine correctly
				_refHolder.allIsotope[botIndex].position = playerTrns.position;
				_refHolder.allIsotope[botIndex].rotation = playerTrns.rotation;
				_refHolder.allIsotopeScr[botIndex].activate();
				
					// increase mine counter
				isoDrop = 1;
			break;
			
		case 1:
					// place mine correctly
				_refHolder.allIsotope2[botIndex].position = playerTrns.position;
				_refHolder.allIsotope2[botIndex].rotation = playerTrns.rotation;
				_refHolder.allIsotopeScr2[botIndex].activate();
				
					// increase mine counter
				isoDrop = 2;
			break;
			
		case 2:
					// place mine correctly
				_refHolder.allIsotope3[botIndex].position = playerTrns.position;
				_refHolder.allIsotope3[botIndex].rotation = playerTrns.rotation;
				_refHolder.allIsotopeScr3[botIndex].activate();
				
					// increase mine counter
				isoDrop = 0;
			break;
	}
}

// getAI realtime DIFFICULTY Settings	

function getAiSpeed()
{

//
//	ACTION CHECK
//
		// get the current max speeds for this loop
	setAiSpeedRange();

		// Check if we should avoid obstacles... add position influence, too
	if (Random.value < diffRandomDecision)
	{
		doAvoid = true;
	}
	else
	{
		doAvoid = false;
	}

		// Check if we should jump obstacles...
	if (Random.value < (diffJumpVal * aiPlayerPosEvadeMod) )
	{
		doJump = true;
	}
	else
	{
		doJump = false;
	} 


 		// Check if we should evade weapons...
	if (Random.value < (diffWeapAvoidVal * aiPlayerPosEvadeMod) )
	{
		weaponAvoid = true;
	}
	else
	{
		weaponAvoid = false;
	}

//
//	END ACTION CHECK
//		

		

//
// Stray from ideal line calc
//

		//check how we differ from the next bot
	nextDiff = Mathf.Abs(nextProgress - tProgress);
		
		// calc the spread value -> This will increase accurracy when away from other bots, but decrease if close to other bots 
		// (so that he sticks more to his spread offset) up to eliminating the effect of aiAccurracy
	if (nextDiff > spreadDeadzone)
	{
			// if we're far enough from next player, use ideal line (other multis still apply)
		spreadAdjust = soloSpreadMulti;	// keep at least 0.5 (not superstraight)
	}
	else
	{
			// if we near the next bot ... spread out (clamp between 0 and 1)
		// spreadAdjust = Mathf.Clamp( ((1 - (nextDiff/spreadDeadzone)) * diffAccurrMulti), soloSpreadMulti, diffAccurrMulti);
		
			// simpler: IF close to other bots, just set to 1 (no adjustment)
		spreadAdjust = 1.0;
	}
//
//	END Spread adjust
//	

	
// DEBUG only:
//	posDiff = manDist;		// this is to test if our rubber band functions like it should!!
	
		
		//check how we differ from the player position in track dist...
	posDiff = tProgress - playerProgress;

		//calculate our progress on Track in a 1 to 0 multiplier
	var trackPosMulti : float = Mathf.Clamp01(1 - (tProgress / noAiSpeedup));
					
		// check our settings for NO AI Speedup					
	if (lapCount == 0)
	{						// don't speedup if we have not crossed the start line
		vertTrgt = 1.0;
		turnGoal = 1.0;
		// aiAccurracy= 1.0;
		
		aiPosShortcutMod = 0.0;		// at start and finish don't use shortcuts
	}	
	

//
// NEW HANDLING BASED ON TARGET POSITIONS and target position in front of player based on Mario Cart Patent
//

		
		// check if we are targetted to be first
	else if (DataTransfer.robotRankTarget[charIndex] == 0)
	{

			//
			//	IF LEAD TARGET BEHIND, SWITCH TARGET PLACE 1 AND 2
			// handle switch dist
			
		if ((tProgress - _refHolder.trackProgress[DataTransfer.aiLeaders[3]]) >  aiRivalSwitchDist)
		{
									// DEBUG
									//print ("SWITCHING!!!");
			
				// do the switch
			DataTransfer.robotRankTarget[charIndex] = 1;
			// print ("Switched Value: " + DataTransfer.robotRankTarget[charIndex]);
			DataTransfer.robotRankTarget[DataTransfer.aiLeaders[2]] = 0;
			
			DataTransfer.aiLeaders[0] = DataTransfer.aiLeaders[2];
			DataTransfer.aiLeaders[1] = DataTransfer.aiLeaders[3];
			DataTransfer.aiLeaders[2] = charIndex;
			DataTransfer.aiLeaders[3] = botIndex;
		
		}
			
			//	END LEAD TARGET BEHIND, SWITCH TARGET PLACE 1 AND 2
			//
	
	
									// DEBUG
									// print ("BOT No. " + botIndex + "is set as second!!");
	
			// adjust our player lead over the course of the race
		// var progressLeadAdjust : float = Mathf.Clamp( (aiPlayerLead * (1 - (tProgress / noAiSpeedup))), 0, aiPlayerLead ) - aiFirstOffset;
		var progressLeadAdjust : float = (aiPlayerLead * trackPosMulti * diffLeadAdjust) + (aiFirstOffset * (1- trackPosMulti));
		
			// print ("Distance: " + posDiff + " TargetPos: " + progressLeadAdjust + " combined Value: " + (progressLeadAdjust - aiPlayerBuffer));
		 
									// DEBUG
									// print ("BOT No. " + botIndex + " progressLeadAdjust: " + progressLeadAdjust);
			
			// If we are WAAAYYY behind player, add extra speed bost
		if ( posDiff < (progressLeadAdjust - aiPlayerBuffer - aiPlayerBoost ) )
		{
			// vertTrgt = Mathf.Clamp(vertTrgt + aiPlayerSpeedup, aiPlayerMin, (aiPlayerMax * 1.3) );
			vertTrgt = aiPlayerMax * 1.4;
			aiBoostAdjust = aiBoostMax;
			aiJuicePosMod = 1.4;
			aiJuiceFillMod = 3.0;
			aiAccurPosMod = 0.8;
			aiPosShortcutMod = 2.8;
			aiPlayerPosEvadeMod = 1.4;
			aiAccRate = 2.0;
			aiDecRate = 0.5;
			
			//print ("Superspeed!!!" + " VertTrgt: " + vertTrgt + " SpeedMod:" + speedMod);
		}
		
			// IF NOT FIRST BOT, USE RANK SPEED DETERMINATION
		else if ( posDiff < (progressLeadAdjust - aiPlayerBuffer ) )
		{								// we are behind our target rank - Accelerate
			//vertTrgt = Mathf.Clamp(vertTrgt + aiPlayerSpeedup, aiPlayerMin, (aiPlayerMax) );
			vertTrgt = aiPlayerMax;
			aiBoostAdjust = aiBoostMax;
			aiJuicePosMod = 1.4;
			aiJuiceFillMod = 2.0;
			aiAccurPosMod = 0.9;
			aiPosShortcutMod = 1.6;
			aiPlayerPosEvadeMod = 1.2;
			aiAccRate = 1.5;
			aiDecRate = 1.0;
			// DEBUG
			// print ("VertTrgt: " + vertTrgt);
			//print ("Speed!!!" + " VertTrgt: " + vertTrgt + " SpeedMod:" + speedMod);
			
		}
		else if (posDiff > (progressLeadAdjust + aiPlayerBuffer ) )
		{								// we are too far in front - Decelerate
		
			vertTrgt = aiPlayerMin;
			aiBoostAdjust = 0.85;
			aiJuicePosMod = 0.5;
			aiJuiceFillMod = 0.4;
			juiceLeft = 0.0;			// deactivate juice if too fast
			aiAccurPosMod = 1.25;
			aiPosShortcutMod = 0.9;
			aiPlayerPosEvadeMod = 0.5;
			aiAccRate = 0.5;
			aiDecRate = 1.5;
			//print ("Slow!!!" + " VertTrgt: " + vertTrgt + " SpeedMod:" + speedMod);
		}
		else
		{								// we are in our buffer zone - stadard speed

			vertTrgt = 1.0;
			aiBoostAdjust = 1.0;
			aiJuicePosMod = 1.0;
			aiJuiceFillMod = 1.0;
			aiAccurPosMod = 1.0;
			aiPosShortcutMod = 1.0;
			aiPlayerPosEvadeMod = 1.0;
			aiAccRate = 1.0;
			aiDecRate = 1.0;
			//print ("Normal!!!" + " VertTrgt: " + vertTrgt + " SpeedMod:" + speedMod);
		}
		
										// DEBUG
										// vertTrgt = vertTrgt * 0.5;
	}

//
//	Targetted ad 2nd place (close)
//
		// check if we are 2nd targeted
	else if (DataTransfer.robotRankTarget[charIndex] == 1 )
	{

		var progressCloseAdjust : float = (aiPlayerClose * trackPosMulti * diffCloseAdjust) + (aiCloseOffset * (1- trackPosMulti));

			// If we are WAAAYYY behind player, add extra speed bost
		if ( posDiff < (progressCloseAdjust - aiPlayerBuffer - (aiPlayerBoost * 0.5) ) )
		{

			//vertTrgt = Mathf.Clamp(vertTrgt + aiPlayerSpeedup, aiPlayerMin, (aiPlayerMax * 1.3) );
			vertTrgt = aiPlayerMax * 1.4;
			aiBoostAdjust = aiBoostMax;
			aiJuicePosMod = 1.15;
			aiJuiceFillMod = 2.0;
			aiAccurPosMod = 0.8;
			aiPosShortcutMod = 1.8;
			aiPlayerPosEvadeMod = 1.4;
			aiAccRate = 2.0;
			aiDecRate = 0.5;
		}
		
			// IF NOT at our target position..
		else if ( posDiff < (progressCloseAdjust - (aiPlayerBuffer * 0.7) ) )
		{								// we are behind our target rank - Accelerate

			//vertTrgt = Mathf.Clamp(vertTrgt + aiPlayerSpeedup, aiPlayerMin, (aiPlayerMax) );
			vertTrgt = aiPlayerMax;
			aiBoostAdjust = aiBoostMax;
			aiJuicePosMod = 1.1;
			aiJuiceFillMod = 1.4;
			aiAccurPosMod = 0.9;
			aiPosShortcutMod = 1.6;
			aiPlayerPosEvadeMod = 1.2;
			aiAccRate = 1.5;
			aiDecRate = 1.0;
			// DEBUG
			// print ("VertTrgt: " + vertTrgt);
		}
		else if (posDiff > (progressCloseAdjust + (aiPlayerBuffer * 0.7) ) )
		{								// we are to far in front - Decelerate

			vertTrgt = aiPlayerMin;
			aiBoostAdjust = 0.85;
			aiJuicePosMod = 0.5;
			aiJuiceFillMod = 0.4;
			juiceLeft = 0.0;			// deactivate juice if too fast
			aiAccurPosMod = 1.2;
			aiPosShortcutMod = 0.8;
			aiPlayerPosEvadeMod = 0.5;
			aiAccRate = 0.5;
			aiDecRate = 1.5;
		}
		else
		{								// we are in our buffer zone - stadard speed

			vertTrgt = 1.0;
			aiBoostAdjust = 1.0;
			aiJuicePosMod = 1.0;
			aiJuiceFillMod = 1.0;
			aiAccurPosMod = 1.0;
			aiPosShortcutMod = 1.0;
			aiPlayerPosEvadeMod = 1.0;
			aiAccRate = 1.0;
			aiDecRate = 1.0;
		}
		
										// DEBUG
										// vertTrgt = vertTrgt * 0.5;
	}

//
//	END Targetted at 2nd place (close)
//

//
// Targetted at Last place (maybe switch with above (determine for 3 bot races (Player + 2 AI)))
//

		// check if we are targetted to be Last for now!! stay close to or behind player
	// else if (DataTransfer.robotRankTarget[charIndex] == distBackIndex)
	else if (DataTransfer.robotRankTarget[charIndex] == (_refHolder.botCount - 1) )
	{
									// DEBUG
									// print ("BOT No. " + botIndex + "is Top!!");
	
			// adjust our player lead over the course of the race
		//var progressThirdAdjust : float = Mathf.Clamp( (aiPlayerLead * (1 - (tProgress / noAiSpeedup))), 0, aiPlayerLead ) - aiThirdOffset;
		var progressTailAdjust : float = (aiPlayerTail * trackPosMulti * diffTailAdjust) + (aiTailOffset * (1- trackPosMulti));
		
		
									// DEBUG
									// print ("BOT No. " + botIndex + " progressTailAdjust: " + progressTailAdjust);
			
			// If we are WAAAYYY behind player, add extra speed bost
		if ( posDiff < (progressTailAdjust - aiPlayerBuffer - aiPlayerBoost ) )
		{
			//vertTrgt = Mathf.Clamp(vertTrgt + aiPlayerSpeedup, aiPlayerMin, (aiPlayerMax * 1.3) );
			vertTrgt = aiPlayerMax * 1.4;
			aiBoostAdjust = aiBoostMax;
			aiJuicePosMod = 1.15;
			aiJuiceFillMod = 2.0;
			aiAccurPosMod = 0.8;
			aiPosShortcutMod = 1.8;
			aiPlayerPosEvadeMod = 1.4;
			aiAccRate = 2.0;
			aiDecRate = 0.5;
		}
		
			// IF NOT at our target position..
		else if ( posDiff < (progressTailAdjust - aiPlayerBuffer ) )
		{								// we are behind our target rank - Accelerate
			//vertTrgt = Mathf.Clamp(vertTrgt + aiPlayerSpeedup, aiPlayerMin, (aiPlayerMax) );
			vertTrgt = aiPlayerMax;
			aiBoostAdjust = aiBoostMax;
			aiJuicePosMod = 1.1;
			aiJuiceFillMod = 1.4;
			aiAccurPosMod = 0.9;
			aiPosShortcutMod = 1.6;
			aiPlayerPosEvadeMod = 1.2;
			aiAccRate = 1.5;
			aiDecRate = 1.0;
			// DEBUG
			// print ("VertTrgt: " + vertTrgt);
		}
		else if (posDiff > (progressTailAdjust + aiPlayerBuffer ) )
		{								// we are to far in front - Decelerate
			vertTrgt = aiPlayerMin;
			aiBoostAdjust = 0.85;
			aiJuicePosMod = 0.5;
			aiJuiceFillMod = 0.4;
			juiceLeft = 0.0;			// deactivate juice if too fast
			aiAccurPosMod = 1.2;
			aiPosShortcutMod = 0.8;
			aiPlayerPosEvadeMod = 0.5;
			aiAccRate = 0.5;
			aiDecRate = 1.5;
		}
		else
		{								// we are in our buffer zone - standard speed
			vertTrgt = 1.0;
			aiBoostAdjust = 1.0;
			aiJuicePosMod = 1.0;
			aiJuiceFillMod = 1.0;
			aiAccurPosMod = 1.0;
			aiPosShortcutMod = 1.0;
			aiPlayerPosEvadeMod = 1.0;
			aiAccRate = 1.0;
			aiDecRate = 1.0;
		}
		
										// DEBUG
										// vertTrgt = vertTrgt * 0.5;
	}

		// IF NOT FIRST BOT, USE RANK SPEED DETERMINATION
	else if (DataTransfer.robotRankTarget[charIndex] < pRank)
	{								// we are behind our target rank - Accelerate
		// var adjustMulti : float = (DataTransfer.robotRankTarget[charIndex]) * 0.05;
		// vertTrgt = Mathf.Clamp(vertTrgt + aiPlayerSpeedup, aiPlayerMin, (aiPlayerMax) );
		vertTrgt = aiPlayerMax;
		aiBoostAdjust = aiBoostMax;
		aiJuicePosMod = 1.15;
		aiJuiceFillMod = 1.6;
		aiAccurPosMod = 0.9;
		aiPosShortcutMod = 1.6;
		aiPlayerPosEvadeMod = 1.2;
		aiAccRate = 1.5;
		aiDecRate = 1.0;
		// DEBUG
		// print ("Bot: " + botIndex + " VertTrgt: " + vertTrgt);
	}
	else if (DataTransfer.robotRankTarget[charIndex] > pRank)
	{								// we are to far in front - Decelerate
		vertTrgt = aiPlayerMin;
		aiBoostAdjust = 0.85;
		aiJuicePosMod = 0.8;
		aiJuiceFillMod = 0.5;
		juiceLeft = 0.0;			// deactivate juice if too fast
		aiAccurPosMod = 1.2;
		aiPosShortcutMod = 0.8;
		aiPlayerPosEvadeMod = 0.5;
		aiAccRate = 0.5;
		aiDecRate = 1.5;
	}
	else
	{								// we are at our place - stadard speed
		vertTrgt = 1.0;
		aiBoostAdjust = 1.0;
		aiJuicePosMod = 1.0;
		aiJuiceFillMod = 1.0;
		aiAccurPosMod = 1.0;
		aiPosShortcutMod = 1.0;
		aiPlayerPosEvadeMod = 1.0;
		aiAccRate = 1.0;
		aiDecRate = 1.0;
	}

	
	// DEBUG
	// print ("BOT No. " + botIndex + " adjusted vertTrgt to: " + vertTrgt);
	
		// now, whatever speed we have set, at the end of the game, clamp max speed
	if (tProgress >= noAiSpeedup)
	{						// if we are in final phase (noAiSpeedup zone) Clamp 1.0 (actually 1.0 to aiPlayerCompensation)
		vertTrgt = Mathf.Clamp(vertTrgt, aiPlayerMin, aiPlayerCompensation * 1.2);
		aiJuicePosMod = 0.85;
		aiJuiceFillMod = 0.9;
		aiPosShortcutMod = 0.65;
		aiPlayerPosEvadeMod = 0.8;
		turnGoal = 1.0;
		// aiAccurracy= 1.0;
		
		//DEBUG
		// print ("BOT No. " + botIndex + " endAdjust vertTrgt to: " + vertTrgt);
		
		//aiShortcutMulti = 0.0;		// at start and finish don't use shortcuts
	}
		// don't boost off at beginning of race
	else if (tProgress < 100.0)
	{
		vertTrgt = Mathf.Clamp(vertTrgt, aiPlayerMin, (1 + Mathf.Clamp01(0.2 * (tProgress/ 100.0) ) ) );
	}

// END NEW HANDLING BASED ON TARGET POSITIONS
//



		// Now continue with our multiplyer setup

		// if in front of player, respect visMaxSpeed
	if (posDiff < 0)
	{
		vertTrgt = Mathf.Clamp(vertTrgt, 0.0, aiMaxVisSpeed);
	}
	
		// increase our vertTrgt by our aiSpeedMod
	vertTrgt = vertTrgt * aiSpeedMod;
	
		// add the static speed modifier
	vertInput = vertTrgt;
	

// DEBUG
//
//	Test slower slowdown as they pop!!
//	

	// Is the slowdown not sufficiently handled by the deceleration settings??
		// I don`t care if they kick in the afterburner behind me .. but they should slow down slowly, once they pass me
	if(vertInput > vertTrgt)
	{		// as this function is called at a set interval, we can control how fast ai slows down
		vertInput -= rubberSlowdownRate * diffRubberSlowdown;
	}
	else
	{
			// add the static speed modifier
		vertInput = vertTrgt;
	}

	
	aiTurnMulti = turnGoal;


					
	// DEBUG
	// vertInput = 0.2;
	// print("Robot: " + botIndex + " has place: " + pRank + " and vertInput: " + vertInput + " at posDiff: " + posDiff + " and noAiSpeedup: " + noAiSpeedup);
	// print("Robot: " + botIndex + " has place: " + pRank + " and vertTrgt: " + vertTrgt + " at posDiff: " + posDiff);
	
		// handle our Offset and get the wpPos for this segment .. based on best offset
	// remove randomness here .. segOffset = Mathf.Clamp((bestOffset+ ((Random.value - 0.5) * aiAccurracy * aiWpMulti * aiRandomize) + (spreadMulti * currSpread * aiWpMulti * spreadAdjust)), -wpClamp, wpClamp);
	segOffset = Mathf.Clamp((bestOffset + ((Random.value - 0.5) * aiWpMulti * aiRandomize * aiAccurPosMod) + (currSpread * spreadMulti * aiWpMulti * spreadAdjust * aiAccurracy)), -wpClamp, wpClamp);
/*																								currSpread - the current spread set by pMove function (distributes all bots)
																								spreadMulti - global Value set on _refHolder
																								aiWpMulti - Waypoint accurracy
																								spreadAdjust - accurracy based on distance to next bot
																								aiAccurracy - set by difficulty
	print ("#### stuff ####");
	print ("spreadMulti: " + spreadMulti);
	print ("currSpread: " + currSpread);
	print ("aiWpMulti: " + aiWpMulti);
	print ("spreadAdjust: " + spreadAdjust);
	print ("aiAccurracy: " + aiAccurracy);
*/
		// set evade direction
	goRight = false;
	if (segOffset <= 0)
	{
		goRight = true;
	}

		// store our offset
	publicInfo.wpOffset = segOffset;
	
		// wpPos = (waypoint.TransformDirection(Vector3(0, 0, 25.0)) + waypoint.position);
	wpPos = (waypoint.TransformDirection(Vector3((segOffset * nextWidth), 0, 0.0)) + waypoint.position);
		

}
				
				
	// function that handles pickup collection
function handlePickup ()
{
		// get a random value
	var randomValue : float = Random.value;
	
	//	####################
	//
	//		Handle pickup distribution manually ...
	
				// if we are first or second ... only mines .../shield
	// if we are first...
	if (pRank < 1)
	{
		switch (true)
		{
				
				// Virus
			case (randomValue < PickupRatios.firstVirus):
						// set to Virus
					pickupType = 1;
					//print ("virus");
				break;
				
				// Missle
			case (randomValue < PickupRatios.firstMissle):
						// set to Missle
					pickupType = 2;
					//print ("miss");
				break;
				
				// Hyperspace
			case (randomValue < PickupRatios.firstHyper):
						// set to Hyperspace
					pickupType = 3;
					//print ("hyper");
				break;
				
				// badaboom
			case (randomValue < PickupRatios.firstBada):
						// set to badaboom
					pickupType = 4;
					//print ("bada");
				break;
				
				// shield
			case (randomValue <= PickupRatios.firstShield):
				
						// set to shield
					pickupType = 5;
					//print ("shield");
				break;
							
				// Skyshot	
			case (randomValue <= PickupRatios.firstSkyshot):
						// set to skyblast if no break before
					pickupType = 6;
					//print ("sky");
				break;
				
				// isotope
			case (randomValue < PickupRatios.firstIso):
						// set to isotope
					pickupType = 7;
					//print ("iso");
				break;			
				
				// speed
			case (randomValue < PickupRatios.firstSpeed):
						// set to speed
					pickupType = 8;
					//print ("speed");
				break;
				
				// Leader Shot
			case (randomValue < PickupRatios.firstLeaderShot):
						// set to speed
					pickupType = 9;
				break;
		}
	}
	
		// if we are mid ...
	else if (pRank < _refHolder.botCount-1)
	{
		switch (true)
		{
				
				// Virus
			case (randomValue < PickupRatios.midVirus):
						// set to Virus
					pickupType = 1;
					//print ("virus");
				break;
				
				// Missle
			case (randomValue < PickupRatios.midMissle):
						// set to Missle
					pickupType = 2;
					//print ("miss");
				break;
				
				// Hyperspace
			case (randomValue < PickupRatios.midHyper):
						// set to Hyperspace
					pickupType = 3;
					//print ("hyper");
				break;
				
				// badaboom
			case (randomValue < PickupRatios.midBada):
						// set to badaboom
					pickupType = 4;
					//print ("bada");
				break;
				
				// shield
			case (randomValue <= PickupRatios.midShield):
				
						// set to shield
					pickupType = 5;
					//print ("shield");
				break;
							
				// Skyshot	
			case (randomValue <= PickupRatios.midSkyshot):
						// set to skyblast if no break before
					pickupType = 6;
					//print ("sky");
				break;
				
				// isotope
			case (randomValue < PickupRatios.midIso):
						// set to isotope
					pickupType = 7;
					//print ("iso");
				break;			
				
				// speed
			case (randomValue < PickupRatios.midSpeed):
						// set to speed
					pickupType = 8;
					//print ("speed");
				break;
				
				// Leader Shot
			case (randomValue < PickupRatios.midLeaderShot):
						// set to speed
					pickupType = 9;
				break;
		}
	}
	
		// if we are last ... 
	else
	{
		switch (true)
		{
				
				// Virus
			case (randomValue < PickupRatios.lastVirus):
						// set to Virus
					pickupType = 1;
					//print ("virus");
				break;
				
				// Missle
			case (randomValue < PickupRatios.lastMissle):
						// set to Missle
					pickupType = 2;
					//print ("miss");
				break;
				
				// Hyperspace
			case (randomValue < PickupRatios.lastHyper):
						// set to Hyperspace
					pickupType = 3;
					//print ("hyper");
				break;
				
				// badaboom
			case (randomValue < PickupRatios.lastBada):
						// set to badaboom
					pickupType = 4;
					//print ("bada");
				break;
				
				// shield
			case (randomValue <= PickupRatios.lastShield):
				
						// set to shield
					pickupType = 5;
					//print ("shield");
				break;
							
				// Skyshot	
			case (randomValue <= PickupRatios.lastSkyshot):
						// set to skyblast if no break before
					pickupType = 6;
					//print ("sky");
				break;
				
				// isotope
			case (randomValue < PickupRatios.lastIso):
						// set to isotope
					pickupType = 7;
					//print ("iso");
				break;			
				
				// speed
			case (randomValue < PickupRatios.lastSpeed):
						// set to speed
					pickupType = 8;
					//print ("speed");
				break;
				
				// Leader Shot
			case (randomValue < PickupRatios.lastLeaderShot):
						// set to speed
					pickupType = 9;
				break;
		}
	}	
// DEBUG
//	pickupType = 6;
	
		//enable aiming
	if (pickupType == 1 || pickupType == 2 || pickupType == 6 || pickupType == 9)
	{
		hasOffense = true;	
		hasMine = false;				
	}
	else if (pickupType == 3 || pickupType == 5)
	{
		hasOffense = false;	
		hasMine = false;
			
			// execute applyPickup (Shield or Hyperspace)
		applyPickup();
	}
	else
	{
		hasOffense = false;	
		hasMine = true;				
	}
			
}

	// function that handles pickup Usage ...
function applyPickup ()
{
//DEBUG
//Debug.Log ("AI Pickup Called: " + pickupType + "at rank: " + pRank);

		// we need a timer here as one spacebar tap fires the script 6 times ...
	if(nextPickup <= currTime)
	{
		nextPickup = currTime + 1.0;
		hasTarget = true;
		
			// define targetting variables ...
		var fireTest : float;								// test value for firing test
		var fireStep : float;								// ratio steps for comparison
		var aimLoop : int;									// aim loop counter

// aipickupOverride
// pickupType = 1;

		switch (pickupType)
		{
			case 0:
				break;
			case 1:
				// Virus

						// check that we are NOT the first one 
					if (pRank > 0)
					{
							// firing decision test ...
						fireTest = Random.value;		// the ratio to test
						fireStep = 1 / pRank;			// get even ratio steps per opponent in front of you (if you are third, pRank is 2 - 2 bots are in front of you, so ration is 1/2 = 0.5)
						
							// based on test, decide which bot to shoot ...
						for (aimLoop = 1; aimLoop <= pRank; aimLoop++)
						{
							if (fireTest <= (fireStep * aimLoop))
							{
								aimIndex = _refHolder.robots[(6 - (aimLoop - 1))];
							}
						}
						
							// if the player is in front of the current bot, increase probability of firing on him
						if (_refHolder.ranking[0] < pRank)
						{
							if (Random.value > 0.8)
							{
									// if player in front of bot, with 20% probability swap target to player bot. (Make difficulty based)
								aimIndex = 0;
							}
						}
					}
						// we are on first place - don't fire
					else
					{
							//No target ... don't deploy ..
						hasTarget = false;
					}
// aitargetOverride
// aimIndex = 0;
					if(hasTarget)
					{
						if (( (aimIndex == 0) && (DataTransfer.playerOccupied || !playerInfo.noTrans || (_refHolder.ranking[0] > pRank) ) ))
						{
						//print ("Virus occupied");
								// do nothing, we have targeted the player but it is not safe to hit him yet
							//Debug.Log ("AI Player Unsafe: Virus");
						}
						else
						{
								// infect targeted player
							_refHolder.allGetInfo[aimIndex].infection(false);
	
								// play Attack animation
							animScript.playAttack();
							
								// reset our item
							pickupType = 0;
						}
					}
				break;
				
			case 2:
				// Missle
						// check that we are NOT the first one 
					if (pRank > 0)
					{
							// firing decision test ...
						fireTest = Random.value;		// the ratio to test
						fireStep = 1 / pRank;			// get even ratio steps per opponent in front of you (if you are thirs, pRank is 2 - 2 bots are in front of you, so ration is 1/2 = 0.5)
						
							// based on test, decide which bot to shoot ...
						for (aimLoop = 1; aimLoop <= pRank; aimLoop++)
						{
							if (fireTest <= (fireStep * aimLoop))
							{
								aimIndex = _refHolder.robots[(6 - (aimLoop - 1))];		// .robots Array is inverse (first place is [6])
							}
						}
						
							// if the player is in front of the current bot, increase probability of firing on him
						if (_refHolder.ranking[0] < pRank)
						{
							if (Random.value > 0.8)
							{
									// if player in front of bot, with 20% probability swap target to player bot. (Make difficulty based)
								aimIndex = 0;
							}
						}
					}
						// we are on first place - don't fire
					else
					{
							//No target ... don't deploy ..
						hasTarget = false;
					}
										
					if(hasTarget)
					{
						if (( (aimIndex == 0) && (DataTransfer.playerOccupied || !playerInfo.noTrans || (_refHolder.ranking[0] > pRank) ) ))
						{
						//print ("Missle occupied");
						}
						else
						{
								// play Attack animation
							animScript.playAttack();
							
								// I want to deploy while the animation has started .. so .
							Invoke("startMissle", 0.4);	
							
								// reset our item
							pickupType = 0;
						}
					}
				break;
				
			case 3:
				// Hyperspace
					// autoPilot = true;
					hyperspace = true;
					
						// set our max hyperspace time to 30 sec for now
					hyperspaceTime = currTime + 20.0;
					
						// in case we are in a jump, set jump info to off
					publicInfo.jumping = false;
					isJumping = 0;
					airborne = false;
						
//-> getInfo
						// check if we are in normal mode first ...
					publicInfo.dnTrans = false;		// Reset the flags 
					publicInfo.upTrans = true;
					publicInfo.noTrans = false;
//-> getInfo					
						// set the transform timer (that will trigger the transformation)	
					publicInfo.transTimer = currTime + transUpTime;			// set the transformed time ...
					
						// set the effect timer
					effectTimer = currTime + 20.0;		// Hyperspace rund 20 sec or until we are top rank!
					
					
						// reset our item
					pickupType = 0;
				break;
				
			case 4:
				// Badaboom
				
						// play Attack animation
					animScript.playAttack();
					
						// fire delayed
					Invoke("startBadaboom", 0.4);
					
						// reset our item
					pickupType = 0;

				break;
			case 5:
				// Shield
					
					shieldEnable();
					
						// reset our item
					pickupType = 0;
				break;
			case 6:
				// Skyblast
				
						// check that we are NOT the first one 
					if (pRank > 0)
					{
							// firing decision test ...
						fireTest = Random.value;		// the ratio to test
						fireStep = 1 / pRank;			// get even ratio steps per opponent in front of you (if you are thirs, pRank is 2 - 2 bots are in front of you, so ration is 1/2 = 0.5)
						
							// based on test, decide which bot to shoot ...
						for (aimLoop = 1; aimLoop <= pRank; aimLoop++)
						{
							if (fireTest <= (fireStep * aimLoop))
							{
								aimIndex = _refHolder.robots[(6 - (aimLoop - 1))];
							}
						}
						
							// if the player is in front of the current bot, increase probability of firing on him
						if (_refHolder.ranking[0] < pRank)
						{
							if (Random.value > 0.8)
							{
									// if player in front of bot, with 20% probability swap target to player bot. (Make difficulty based)
								aimIndex = 0;
							}
						}
					}
						// we are on first place - don't fire
					else
					{
							//No target ... don't deploy ..
						hasTarget = false;
					}

					if (hasTarget)
					{
						if (( (aimIndex == 0) && (DataTransfer.playerOccupied || !playerInfo.noTrans || (_refHolder.ranking[0] > pRank) ) ))
						{
								// do nothing, we have targeted the player but it is not safe to hit him yet
								//print ("Skyblast occupied! OccupiedVal: " + DataTransfer.playerOccupied + " !noTransVal: " + !playerInfo.noTrans + " ranking attacker: " + pRank + " ranking me: " + _refHolder.ranking[0]);
						}
						else
						{
								// play Attack animation
							animScript.playAttack();
							
								// fire ray ..
							//aimTarget.SendMessage("skyshot");
							_refHolder.allGetInfo[aimIndex].skyshot(false);
							
								
								// reset our item
							pickupType = 0;
						}
					}

				break;
			case 7:
				// Isotope
				
						// play Attack animation
					animScript.playAttack();
						
						// start delayed
					Invoke("startIsotope", 0.4);
					
						// reset our item
					pickupType = 0;

				break;
				
			case 8:
						// Speed
					
						// enable speed
					speedHit();
						
						// reset our item
					pickupType = 0;
				break;
				
			case 9:
						// Leader Shot
					if(_refHolder.robots[6] != botIndex)
					{										// If we are not the race leader....
															// The Race leader: aimIndex = _refHolder.robots[0]
						if ( (_refHolder.robots[6] == 0) && ( DataTransfer.playerOccupied || !playerInfo.noTrans))
						{
								// do nothing, we have targeted the player but it is not safe to hit him yet
						}
						else
						{
								// set state to attack
							publicInfo.playerState = 7;
												
								// play Attack animation
							animScript.playAttack();
							
								// send skyblast to the race leader
							_refHolder.allGetInfo[_refHolder.robots[6]].leadershot(false);
		
								// reset our item
							pickupType = 0;
						}
					}
				break;
		}

	}
}



function infection (fromPlayer : boolean)
{
	if (hyperspace)
	{
		// do nothing! You're immune
	}
	else if (shieldSet)
	{
			// shield protects
		shieldDisable();
	}
	else
	{
				// enable infection
			infected = true;
			
				// if hit reset juice loader
		//juiceLeft = 0.0;
					
				// star damage dealing
			beginDamage(0.9, 1.0, 6.0);
			
				// display hit info forplayer if needed
			if (fromPlayer)
			{
				playerMoveScr.startHitFeedback(charIndex, 1);
				
				// DEBUG
				// print ("Infection Called for: " + botIndex);
			}
	}
}



function skyshot (fromPlayer : boolean)
{
	if (hyperspace)
	{
		// do nothing! You're immune
	}
	else if (shieldSet)
	{
			// shield protects
		shieldDisable();
	}
	else
	{
		if(fromPlayer)
		{
				// start firing in 2.0 sec.
			Invoke("skyshotPlayer", 2.0);	
		}
		else
		{
				// start firing in 2.0 sec.
			Invoke("skyshotFire", 2.0);	
		}
	}
}


function leadershot (fromPlayer : boolean)
{
	if (hyperspace)
	{
		// do nothing! You're immune
	}
	else if (shieldSet)
	{
			// shield protects
		shieldDisable();
	}
	else
	{
		if(fromPlayer)
		{
				// start firing in 2.0 sec.
			Invoke("leadershotPlayer", 2.0);	
		}
		else
		{
				// start firing in 2.0 sec.
			Invoke("leadershotFire", 2.0);	
		}
	}
}

	// show missle warning!
function missleWarning()
{			
	if(!playWarning)
	{
		// Handle warning here
	}
}


	// exit missle warning
function missleWarningExit()
{
	if(playWarning)
	{
		// handle warnign exit here
	}
}


function missleImpact(playerMissle : boolean)
{
	if (hyperspace)
	{
		// do nothing! You're immune
	}
	else if (shieldSet)
	{
		shieldDisable();
	}
	else
	{
			// start damage handling ...
		beginDamage (0.2, 0.2, 4.0);
		
		if (playerMissle)
		{
			playerMoveScr.startHitFeedback(charIndex, 2);
			// DEBUG
				//print ("Missle Called for: " + botIndex);
		}
	}
}


	// leave this in as the default action for now. If pickup collected use that ...
function applyJump ()
{

	if (isControllable)
	{
	

		//if (controller.isGrounded - in active range ... AND we're not transformed Up or Dn)
		if ((hoverHitDist >= GlobalStats.hoverMinDist) && (hoverHitDist <= hoverMaxDist) && (publicInfo.noTrans))
		{
			if ((lastJump + 0.8) < currTime)
			{														// check if enough time has passed to jump again
				currDownforce = GlobalStats.jumpSpeed;
					// store initial JumpOffTime
				lastJump = currTime;					// specify time for next jump
				isJumping = 1;							// set jumping flag
				airborne = true;
				animScript.playJump();
				animState = 4;		
					
					// broadcast jump!!
				publicInfo.jumping = true;
				
					// message
				// Debug.Log("Jump Called");
			}
		}
		// add to JumpSpeed for a given number of seconds if button held ....
	}
}

// ####################################
// ####################################
//
//	Move Character Code	
	

function Update()
{

	// Podium handling condition
	if (!_refHolder.podiumBlack)
	{
	
	// check if the race is over (and we need to exit weapons)
	if (_refHolder.raceOver)
	{
		if (isotopeHit)
		{		
				// shut isotope off
			isotopeHit = false;
					
				// play the grow animation
			charScalerAnim.Play("scaleUp");
		}
	}
	
		// Check if we are in pause mode ...
	if(_refHolder.gameEnabled)
	{

			// store the players progress
		playerProgress = _refHolder.trackProgress[0];
	
			// get our time handlers ...
		dTime = Time.deltaTime;									// Get the time ONCE
		currTime = Time.time - _refHolder.pausedTime;			//subtract the time we spent in pause mode	
		
		dir = Vector3(0,0,0);										// for handling the acceleration ...
		
			// are we braking?
		brakesActive = false;		
			
			// get our current rank
		pRank = _refHolder.ranking[botIndex];
		
			// do some stuff only every other frame..
		
		var even : boolean = true;
		
		if(Time.frameCount % 2 == 0)
		{
			even = true;
		}
		else
		{
			even = false;
		}
			
			//
			// get the next robots progress
			//
			
		// ranking[botIndex] -> the current rank of our robot.
		// robots[someRank] -> the botIndex of the robot currently on rank someRank
		// trackProgress[botIndex] -> the progress of the bot with the index botIndex
		
			// get the next bots rank. If we are currently first, just set next progress to our progress (which will result in 0 dist -> ideal line)
		nextRank = _refHolder.ranking[botIndex];
		
			// check if we are first. If not, get the next bots index
		if (nextRank > 0)
		{
			nextRank = nextRank -1;
		}
		
			// get the next bots index !! OOps .. the robots array is ordered in the wroing direction.
		nextBot = _refHolder.robots[6 - nextRank];
				
			// get the next bots progress
		nextProgress  = _refHolder.trackProgress[nextBot];
		
			//
			// END get next bot progress
			//
		
			// adjust shield height if not set
		if (!shieldPosed)
		{
			shieldHeight.localPosition.y = Mathf.MoveTowards(shieldHeight.localPosition.y, actHeight, dTime);
			if (Mathf.Abs(shieldHeight.localPosition.y - actHeight) < 0.02)
			{
				shieldPosed = true;
			}
		}


			// TEMP
		// var checkTransforms : boolean = true;
		// var hasAction : boolean= true;				// might be an int that is increased with each event ... decreased with each event closing

//	######################################################
//
//	AUTO PILOT CODE
//
						
				// get our hit waypoint in local space (as also needed for wrong dir, outside autopilot loop)..
			wp3D = playerTrns.InverseTransformPoint(wpPos);
			wp3D.y = 0.0;										// remove height from equasion
				
			if(autoPilot)
			{
			// vertInput = 1.0;	

					// DISTANCE BASED
					// ai adjust speed every 5 frames ... (10??)

					// Orient to the next Waypoint (instantly)
		
					//	######################################################################################
					//
					// Step 1: Get the wayPoint in local Player space (and as Vector2 -> only x,z position)
				
					
					// get our magnitude
				wpMagnitude = wp3D.magnitude;
				
					// test getting an input value from the waypoint (to use in our function below) NICE AND SMOOTH!! ;)
				horizInput = (wp3D.x / wpMagnitude) * wpTurnMulti * aiTurnMulti * aiTurnAdjust;
	
					// no sliding normally
				doSlide = 0;
				
								// if close enough enable slide AND angle big enough to make sense ... horizInput of 0.5 is reached if waypoint at 45 deg angle ..
				// if(wpMagnitude < (slideDist) && Mathf.Abs(horizInput) > slideInput )
				if( Mathf.Abs(horizInput) > 1.0 )
				{
					if (slideCooldown < currTime)
					{
							// just before the waypoint we want to exit the slide otherwise set it...
						if(wpMagnitude > slideExit)
						{
							doSlide = 1;
						}
					}
				}
				
					// now based on the distance to the waypoint, we might need to force higher turnrates ... create a multiplier based on that..
				if(wpMagnitude < (increaseDist))
				{
						// adjust the turn rate in relation to distance .. if the waypoint is close we need to increase steering, but never above 1/-1
					horizInput = Mathf.Clamp((horizInput * (increaseDist / wpMagnitude)), -1.0, 1.0);
				} 
				

			// DEBUG
			//doAvoid = false;
						// sphere cast version
					if (doAvoid)
					{
				/*
							// Check if a mine is in range!! Use a capsule cast for it. If so Avoid???
							// Then check for JumpDistCheck for hazard and mine layers!!
							// Then check for mine (as we would avoid them)
							// 1. THEN Check if we are in jump range! That's it! No Tags nothing.
							
						//Simplify evasion!!! If weapon avoid -> steer if jum active jump!!
						// Do so!
						
							// a hit object
						//var scanHit : RaycastHit;
							// If we are in weapon avoid mode AND in evadeMode (not Jump): Check for mines only, as those are the only ones we evade.
						if (even && weaponAvoid)
						{
									// if (Physics.CheckCapsule (obstacleScanner.position, mineScanDist.position, obstacleScanRadius, mineMask))
							if (Physics.CheckCapsule (obstacleScanner.position, mineScanDist.position, (obstacleScanRadius * vertInput * 0.9), hazardMask))
							//if (Physics.Raycast ((playerTrns.position + playerTrns.TransformDirection (Vector3(0,0.7,0))), playerTrns.TransformDirection (Vector3(0,0,1)), scanHit, 16.0, hazardMask))
							{
								//if (scanHit.distance > 9.5)
								//{
							
									sideBoost = -sideSpeed;
									if (goRight)
									{
										sideBoost = sideSpeed;
									}
								//}
							}		
							else
							{
								sideBoost = 0.0;
							}
						}
						else
						{
							sideBoost = 0.0;
						}
						
						// Check jump Distance
						if(!even && doJump)
						{
								// now check for jumping - barriers are always jumped if doAvoid, mines only if doJump active
							if (Physics.CheckCapsule (obstacleScanner.position, jumpScanDist.position, (obstacleScanRadius * vertInput * 0.9), hazardMask))
							//if (Physics.Raycast ((playerTrns.position + playerTrns.TransformDirection (Vector3(0,0.7,0))), playerTrns.TransformDirection (Vector3(0,0,1)), 10.0, hazardMask))
							{
									// if an obstacle is found, jump
								sideBoost = 0.0;
								applyJump();
							}
						}	
						
				*/
							// handle obstacle evasion
						if (hasObstacle)
						{
							sideBoost = -sideSpeed;
							if (goRight)
							{
								sideBoost = sideSpeed;
							}
						}
						else
						{
							sideBoost = 0.0;
						}
						
							// Handle jumping
						if (jumpCall)
						{
							if (doJump || weaponAvoid)
							{
								sideBoost = 0.0;
								applyJump();
								jumpCall = false;
							}
						}
					}
					else
					{
							// if not in avoid mode, disable all flags
				//		closingMine = false;
						hasObstacle = false;
						jumpCall = false;
					}

				
					//
					//	END avoid handling
					//

					// ####################################################
					//
					//	Hyperspace handling ...
					//
				if(hyperspace)
				{
				
						// check if we need to shut autopilot off ... (enable a timer afterwards)
					if ((pRank == 0) || (hyperspaceTime < currTime))
					{	
							// shut hyperspace off
						hyperspace = false;
						
							// if we are in a long jump, continue transformed ... otherwise revert
						if(!longJump)
						{
								//transform back
							transFromPlane();
						}
						else 
						{
								// if in a long Jump, extend our timer
							publicInfo.transTimer = currTime + transUpTime;
						}
						
							// leave speedpad mode enabled when reverting
						speedPlaneExit = currTime + (speedPlaneTime/2);
						
							// set flags
						speedState = true;
						publicInfo.speedPlane = true;
					}
					else
					{
							// if not transforming back, extend timer till next loop... no longer needed
						// publicInfo.transTimer = currTime + 0.3;
						
							// increase turnrate
						horizInput = horizInput * 3;
					}
				}

			}

			// Add a threshold so that too small rotations are not executed (jitter)
			//if(horizInput < 0.01)
			//{
			//	horizInput = 0;
			//}
			

	

// end autopilot code NEW!!! (hopefully faster)
//
//	END AUTO PILOT CODE
//
//	######################################################




// ####################################
// ####################################			
// is something out of the ordinary happening?? (hit, abyss, etc...)
			// use the hasAction here ...
		if (currTime > effectTimer )
		{
				// if shield active... deactivate
			if(shieldSet)
			{
				shieldDisable();
			}
			
				// if hit active ... deactivate
			if (wasHit)
			{
				endDamage();
			}
		
		}	

						
		// ####################################		
		// ####################################
		//	
		//	Virus hit ... maybe add to an invoke function ...
		
		if (infected)
		{
				// ai turning goes insane ..
			if(Time.frameCount % 10 == 0)
			{
					// set the virus turn offset -> more to actual rotation but even down to other dir ...
				virusTurnMulti = (Random.value - 0.3) * 4;
			}
			horizInput = horizInput + virusTurnMulti;
		}


// START HERE FOR GROUND CHECK
//
// ######################################
// ######################################
		
		
		
				// do a RaycastCheck DOWN (Track alignment ...)   -   Ray is sent from 3 units up (to compensate possibility of being inside the ground after 1 loop...)
				// the distance is needed (50.0).. otherwise the ray stops on the first collider, even if it is the wrong layer ...
			if (Physics.Raycast (rayCastSender.position, playerTrns.TransformDirection (Vector3(0,-1,0)), hoverRayHit, 50.0, hoverRayMask))
			{																															// add a ray length here ..
				
				// allowHover = true;											// set if hover allowed... (abyss only when in plane mode)
				hoverHitDist = hoverRayHit.distance;						// store the hit distance ...
		
					// #####################################
					//
					// add abyss handling
					
				if (hoverRayHit.collider.CompareTag("abyss"))
				{
						// if over abyss, shadow far down
					shadowHeight = -5000.0;
				}
				else
				{
						// else shadow up
					shadowHeight = 0.2;
				}
							
				var hoverLift : float;
					// hover height handling direct raise (basically when the feet would otherwise move through the ground)
				
					// This works this way, as car and skate have the same minimal distance from ground .. (where the feet touch the ground ..)
				// if ((hoverHitDist) < nHoverHeight)
/*
					// if we are sticking in the ground .. release us
				if ((hoverHitDist) <= 3.0)
				{		// Change THIS to "slide" up/down on the normal
						
						// adjust hover height
					hoverLift = 3.0 - hoverHitDist;	// nHoverHeight was hoverHeight in other conditional
					playerTrns.Translate(Vector3(0, hoverLift, 0));		// Move the player up the required ammount
				}
*/

					// add offRoad handling in ...
				
					// Set offroad Multi ...
				offRoadMulti = 1.0;
				if (hoverRayHit.collider.CompareTag("offRoad"))
				{
					offRoadMulti = offRoad;
				}						
		
					// get our current height out (for our missle etc.)
				publicInfo.currHeight = hoverHitDist;
			// END Raycast Check
			}
		
				// if no RC hit set out of range
			else
			{
					// set off controlled dist
				hoverHitDist = hoverMaxDist + 1.0;
			}
//
//	Insert movement code in ground RC check
//
				
		//	#############################################################
		//	#####	Check if we are in control (not too high above ground)
		//
		// 	In control loop
				
					// if we are in control (not falling/Jumping...)
				if ((hoverHitDist >= GlobalStats.hoverMinDist) && (hoverHitDist <= hoverMaxDist))
				{													// This is problematic ... is grounded seems to NOT be stable enough - we need a broader zone defined as "grounded"... Try using a raycast instead ....
																	// we actually use the raycast from the last loop ... 
		//print ("Dist: " + hoverHitDist);
						// if we are too low in ground .. Jump
					if (hoverHitDist < 2.8)
					{
						applyJump();
					}
		
					// Start normal controls code | No autopilot
		
		//	######################################################
		//	######################################################
		//			
		// #####   HANDLE ROTATION   #####
		
						// Disable speedRotation adjust for now
						currRotSpeed = rotateSpeed - (( moveSpeed / speedPlaneSpeed ) * speedRotationDecrease * rotateSpeed);	// change to handle boostSpeeds ...
							
							// make rotation not 100% same each frame .. (test - less tearing?)
						// currRotSpeed = rotateSpeed + ((Random.value - 0.5) * 2.0);
						
							// #####   HANDLE Sliding and Rotation   #####
							// Now we need to handle Sliding .. for now, just divert rotations from out transform to the Geometry. Add a timer later to lessen the sliding effect
							
							// first calculate the ammount to rotate from the input ...
						rotateAmmount = horizInput * startHoriz * currRotSpeed * dTime;					// The rotation ammount from current inputs
						turnValue = BotStats.turnCharMulti[charIndex] * rotateAmmount;					// this is for visual feedback when turning the character.. (but only the model)
						currRotation = 0.0;																// will hold the current roatation below ..
						prevSlideAngle = 0.0;															// will hold the rotation rest below
						
		
							// #####   HANDLE PLANE MODE ROLL   #####
						rollAmmount = Mathf.MoveTowards(rollAmmount, ((-rollAngle) * horizInput * 4), 100.0 * dTime);										// set the rollAmmount here based on the rollAngle set earlyer
							
							// now calculate the ammount we need to revert our rotation from collisions this updateLoop
						collRotate = Mathf.MoveTowards(0.0, hitAngle, 270 * dTime);						// basically this lets us rotate towards move direction with 180 deg per sec
						
							// remove the ammount we have already rotated from what we need ...
						hitAngle = hitAngle - collRotate;
						
						
				
							// is the slide button pressed?
						if (doSlide && !wasHit && !airborne && (slideDuration < 0.8))
						{
						/*
								// Check once if we're recording slide time
							if (!slideCountStart)
							{
								slideCountStart = true;													// while keeping in doSlide mode .. don't reset our timer
								slideSpeedup = currTime + speedPlaneTime;								// if you slide for our speedpad speed time .. autoFire
							}
								
								// if sliding the max time (speedPad time) auto speedup
							else if (slideCountStart)
							{
								if (currTime > slideSpeedup)
								{
									slideCountStart = false;												// we're just speeding up ... restart counter ..
									speedHit();																// speedup
								}
							}
						*/	

							slideTimer = currTime + 0.1;															// short breaker for fluctuating input
							
														
								// store our slide goal..
							slideGoal = 0;
							localSlideTime = BotStats.fullSlideTime[charIndex];												// I want the slide to be based on input slightly:
							
							
							//	###############################################
							//
							//	NOW! First check if we want to slide, and in which direction ...
							
							// AI does not speedslide ... we only use it for visual reasons
							
							if(Mathf.Abs(horizInput) <= 0.1)
							{								// input inside deadzone ...
								/*	
								if(animState == 2)
								{		// we're sliding Right
									slideGoal = BotStats.maxSlideAngle[charIndex] * 0.8;
								}
								else if(animState == 3)
								{		// we're sliding Left	
									slideGoal = -BotStats.maxSlideAngle[charIndex] * 0.8;
								}
								else
								{		
								*/
										// we're not sliding in any direction
									vertInput = 0.3;		// no steering, no active slide .. slow down to 30 %
									slideGoal = 0.0;		// so our slide goal is 0
								//}
								
									// set the brake to active
								brakesActive = true;
								
									// else change nothing ... at least for now
							}
							else if (horizInput > 0)
							{								// positive input (right)
									// set the brake flag inactive..
								brakesActive = false;
								
								// increase slide duration
							slideDuration += dTime;
							
									// we're NOT in slideLeft mode, so we can jump right into slide Right
								//if(animState != 3)
								//{
										// are we fast enough to slide??
									if(currSpeed >= (maxSpeed * 0.3))
									{
											// set our mode flag
										if (animState != 2)
										{
											animState = 2;
											animScript.playSkateRight();
												
												// reset slide duration
											//slideDuration = 0.0;
										}
					
											// new SlideAngle setting
										slideGoal = BotStats.maxSlideAngle[charIndex] * 0.8;
									}
								/*
								}
								else if (horizInput > 0.3)
								{							// when we cross the treshold, move over into slideRight
									animState = 2;
								}
								else 
								{											// we're still sliding in the other direction, but haven't hit threshold ...
									animState = 3;							// still slide left
									slideGoal = -BotStats.maxSlideAngle[charIndex] * 0.8;		// still other side slideAngle
									animScript.playSkateLeft();
								}
								*/
							}
							else
							{								// negative input (left)
									// set the brake flag inactive..
								brakesActive = false;
								
								// increase slide duration
							slideDuration += dTime;
									
									// we're NOT in slideRight mode
								//if(animState != 2)
								//{
								
										// are we fast enough to slide??
									if(currSpeed >= (maxSpeed * 0.3))
									{
											// set our mode flag
										if (animState != 3)
										{
											animState = 3;
											animScript.playSkateLeft();
											
											// reset slide duration
											//slideDuration = 0.0;
										}
				
											// new Slide Angle setting
										slideGoal = -BotStats.maxSlideAngle[charIndex] * 0.8;
									}
								/*
								}
								else if (horizInput < -0.3)
								{							// when we cross the treshold, move over into slideLeft
									animState = 3;
								}
								else 
								{											// we're still sliding in the other direction, but haven't hit threshold ...
									animState = 2;							// still slide right
									slideGoal = BotStats.maxSlideAngle[charIndex] * 0.8;		// still other side slideAngle
									animScript.playSkateRight();
								}
								*/
							}
							
								// add our current input into the mix! Unfortunately I have to do it before the LERP. Won't work otherwise :(
							slideGoal += BotStats.maxSlideAngle[charIndex] * 0.2 * horizInput;
							
								// Now run our actual turning code ...
							// slideAngle = Mathf.MoveTowards(slideAngle, slideGoal, ((BotStats.maxSlideAngle / BotStats.fullSlideTime) * dTime) );
							slideAngle = Mathf.Lerp(slideAngle, slideGoal, (1/BotStats.fullSlideTime[charIndex] * dTime) );
				
				
								// add our final slide bit based on actual input to the Lerped slideAngle and rotate...
							//charRoot.localEulerAngles = Vector3(0, slideAngle, 0);																	// Rotate the Character ...
				
				
								// Apply our visual Offset (just to see the character turning)
							charOffset.localEulerAngles = Vector3(0, turnValue, rollAmmount);
										
										
								// if we have been sliding too long ... play normal skate animation (so that bot's don't look too static
							if (slideDuration > 0.8)
							{
									// after 1.2 seconds of continous sliding, play skate anim
								animState = 1;
								animScript.playSkateSlow();
								
								slideCooldown = currTime + 1.5;
								// DEBUG
								//	print ("Called Line 3576");
							}		
							
						  		// Now add the normal controls rotation ...
						  	//rotateValue = (Vector3.up * rotateAmmount);
							//playerTrns.Rotate(rotateValue);		
							
								// set our rotation using the ground normal, too...
							// !!! playerTrns.rotation = toRotation * Quaternion.Euler(0, rotateAmmount + collRotate, 0);
						}
						else
						{			// no slide button pressed...
						/*
								// if we were already counting slide time
							if (slideCountStart)
							{
									// reset the slide speedup timer
								slideCountStart = false;
								
									// check how long we were sliding
								var slideTime = currTime - slideSpeedup + speedPlaneTime;
								
									// if sliding longer than slideSpeedMin seconds (min) speedup
								if (slideTime >= slideSpeedMin)
								{
									speedSlide(slideTime);
								}
							}
						*/
								// set the brake flag inactive..
							brakesActive = false;
						
				//	!!!
				//	!!!
				//	!!!		
								// For now add this also to our autopilot loop until I have time do think this through
							if((publicInfo.noTrans))
							{
								if (animState == 1)
								{
									animScript.playSkateSlow();
									// DEBUG
									//print ("Called Line 3618");
									
										// for safety reset the speed HUD here again
									// HUD_Speed.changeState(7);
									
									animState = 99;								// means we have run playSkateSlow twice
								}
								
								if((animState == 0) || (animState == 2) || (animState == 3))
								{
									animScript.playSkateSlow();
									animState = 1;
									// DEBUG
									//print ("Called Line 3631");
									
								}
							}		
				
								
						  if (slideTimer < currTime)
						  {													// just a buffer timer so we don't drop right out of our slide
							if (slideAngle == 0)
							{
		//!!!							// apply our visual offset
								charOffset.localEulerAngles = Vector3(0, turnValue, rollAmmount);													// rotate the offset Node (Visual only)
		
									// get our normal rotation value and apply it
							 	//rotateValue = (Vector3.up * rotateAmmount);
								//playerTrns.Rotate(rotateValue);																						// based on angles per second ...
							
									// set our rotation using the ground normal, too...
								// !!! playerTrns.rotation = toRotation * Quaternion.Euler(0, rotateAmmount + collRotate, 0);
							}
							else
							{
										
									// Store our current slideAngle and lerp our rotation towards 0
								prevSlideAngle = slideAngle;																						// Store the current abs slide angle for later use
								
									// I'm hardcoding a speed in for the revert! It should take 0.3 seconds to revert
								slideAngle = Mathf.MoveTowards(slideAngle, 0.0, ((BotStats.maxSlideAngle[charIndex] / 0.3) * dTime));																							// get the abs value of the slide angle
								
									// now calc the exact ammount we have turned (needed as this will added to the transforms rotation) !!! We might want to remove or add 10% (test) easing a bit back (not entirely in facing direction)
								currRotation = (prevSlideAngle - slideAngle);															// get the difference and apply the correct sign
						
									// apply the Lerped slide angle ..
								//charRoot.localEulerAngles = Vector3(0, slideAngle, 0);													// Rotate our charRoot back to 0
								
									// apply the offset rotation
								charOffset.localEulerAngles = Vector3(0, turnValue, rollAmmount);													// rotate the offset Node (Visual only)
								
									// get the correct rotate ammound, including compensation for our slide
								// rotateAmmount += currRotation * slideRevertDampen;																					// Add the correct rotate Value to rotate Ammount (so that we reach 0) for our character Controller	
								rotateAmmount = currRotation * slideRevertDampen;	// revert 																						// Add the correct rotate Value to rotate Ammount (so that we reach 0) for our character Controller	
								
									// apply our rotation
							 	//rotateValue = (Vector3.up * rotateAmmount);
								//playerTrns.Rotate(rotateValue);												// based on angles per second ...
								
									// set our rotation using the ground normal, too...
								// !!! playerTrns.rotation = toRotation * Quaternion.Euler(0, rotateAmmount + collRotate, 0);
								
									// while slide not over, and not transformed .. continue calling skateSlow
								if(publicInfo.noTrans)
								{
								// DEBUG
								//print ("Called Line 3684");
									animScript.playSkateSlow();
									animState = 0;
								}
							}
						  }
							
						}
				
			
					// ###########################################
					//
					// #####   HANDLE ACCELERATION / SPEED   #####
	// DEBUG
	// vertInput = 0.2;
						// If we are moving forward ...			
					if (vertInput > 0)
					{
								// we're gradually checking faster possible speeds and if needed increase targetspeed in one loop
								
								//
								// Check if we are allowed to boost our speed in any way, if so reset the targetspeed ...
							
															
								// Set the correct target Sped ... 
							targetSpeed = vertInput * maxSpeed * wpSpeedup * offRoadMulti * speedMod;						// get current Target Speed ... (meaning the maximum Speed for the goven controller input)
								
								
								// Clamp Speed at Speedplane Speed
							//targetSpeed = Mathf.Clamp(targetSpeed, 0.0, speedPlaneSpeed);
								
								// Rear collision handling ...
							if(backColl)
							{																					// we were hit from behind ...
								backColl = false;
								currSpeed = currSpeed * backCollSpeedboost;
								targetSpeed = targetSpeed * backCollSpeedboost;									// speedup after hit...
							}
				
								// handle speedplane speed only if needed ...
							if (speedState)
							{
								if (speedPlaneExit > currTime)
								{
										// set our target speed ...
									targetSpeed = speedPlaneSpeed  * offRoadMulti * speedMod * aiBoostAdjust;
									
										// until autonomous anim playback: check if we have called playSkateSlow for fast skate already
									if (!airborne && (animState != 9) && (animState != 3) && (animState != 2) && (publicInfo.noTrans))
									{																				// if we are NOT in skateFast mode .. play skateSlow function and set value.. ONCE
										animState = 9;
										animScript.playSkateSlow();
										// DEBUG
										//print ("Called Line 3736");
									}
								}
								else
								{		// if our time is over, disable our flag and speed handling
									publicInfo.speedPlane = false;
									speedState = false;
								
										// revert to normal skate again (ONCE)
									if (!airborne && (animState == 9))
									{																				// if we are NOT in skateFast mode .. play skateSlow function and set value.. ONCE
										animState = 0;
									}
								}
							}
							
								//
							// handle juice only if needed ...
						if (publicInfo.juiceActive)
						{										// we are in juice active state
						
								// as long as there is juice left
							if (juiceLeft > 0)
							{
							// DEBUG
							// print ("Robot: " + botIndex + " burning juice!");
							
									// decreace juiceLeft
								juiceLeft = Mathf.Clamp((juiceLeft - dTime), 0.0, BotStats.juiceFull[charIndex]);
								
									// set our target speed ...
								targetSpeed = speedPlaneSpeed  * offRoadMulti * speedMod * aiBoostAdjust;
								
									// until autonomous anim playback: check if we have called playSkateSlow for fast skate already
								if (!airborne && (animState != 9) && (animState != 3) && (animState != 2) && (publicInfo.noTrans))
								{																				// if we are NOT in skateFast mode .. play skateSlow function and set value.. ONCE
									animState = 9;
									animScript.playSkateSlow();
									// DEBUG
									//print ("Called Line 3775");
								}
							}
							else
							{		// if our time is over, disable our flag and speed handling
								publicInfo.juiceActive = false;
							
									// revert to normal skate again (ONCE)
								if (!airborne && (animState == 9))
								{																				// if we are NOT in skateFast mode .. play skateSlow function and set value.. ONCE
									animState = 0;
								}
							}
						}
						else if (juiceLeft < BotStats.juiceFull[charIndex])
						{										// adjust the juice timer if juice is not active
						
								// if we burned juice, fill it up again
							juiceLeft = Mathf.Clamp((juiceLeft + (BotStats.juiceBuildup[charIndex] * dTime * aiJuiceFillMod)), 0.0, BotStats.juiceFull[charIndex]);
						}

							
								// if we're not in hyperspace, clamp our speed here to the max allowed ai Speed
								// DIFFICULTY 
							targetSpeed = Mathf.Clamp(targetSpeed, 0.0, aiSpeedCutoff);
						
								// Hyperspace Speedup!!!
							if (hyperspace)
							{
								targetSpeed = speedPlaneSpeed * 1.5;
							}
		
		
								// Handle the complete forward motion .....
							if (currSpeed == targetSpeed)
							{	
								// if our current Speed is the target Speed do nothing
								currSpeedAdd = 0;
							}
							else if (currSpeed < targetSpeed)
							{																											// We need to accelerate ...
								// currSpeedAdd = accRate * vertInput;														// only calculate the current acceleration if needed ....
									// since the vertInput gets really high, don't use it to judge how much to accelerate
								currSpeedAdd = accRate * aiAccRate;
								currSpeed += currSpeedAdd * dTime;														// Increase the current Speed ...
								currSpeed = Mathf.Clamp(currSpeed, 0, targetSpeed);
							} 
							else if (currSpeed > targetSpeed)
							{																											// we'Re too fast! Slow down ...  
								// actSpeed = currSpeed;
								currSpeedAdd = decRate * aiDecRate;																		// deceleration is not dependant on the controller input as it is the slowDown Rate with NO force applied (the other would be braking, handled by negative input...)
								currSpeed -= currSpeedAdd * dTime;
								currSpeed = Mathf.Clamp(currSpeed, 0, (speedPlaneSpeed * wpSpeedup));
							}
					}
						// only for keyboard mode
					else 
					{					// No input ....
							if (currSpeed > 0)
							{																											// we'Re too fast! Slow down ...  
								// actSpeed = currSpeed;
								currSpeedAdd = decRate * aiDecRate;																		// deceleration is not dependant on the controller input as it is the slowDown Rate with NO force applied (the other would be braking, handled by negative input...)
								currSpeed -= currSpeedAdd * dTime;
								currSpeed = Mathf.Clamp(currSpeed, 0, (speedPlaneSpeed * wpSpeedup));
							}
					}
					
					// DEBUG
					//			if (botIndex == 1)
					//			{
					//				print ("Robot: " + botIndex + " at PosDiff: " + posDiff + " with vertTrgt: " + vertTrgt + " and resulting Input: " + vertInput + " has speed of: " + targetSpeed);
					//			}
							
					moveSpeed = currSpeed;
					trgtDownforce = BotStats.downforce[charIndex] * (currSpeed / speedPlaneSpeed) + GlobalStats.idleDownforce;							// full downforce is reached at max speed ... get a ratio in relatin to currSpeed
			
			
						// HANDLE GRAVITY
						//
						
					// if first touchdown after Jump ... change animation and reset isJumping
					if (airborne)
					{

							// Check if we had time to actually jump ...
						if ((lastJump + 0.1) < currTime)
						{
							airborne = false;							// reset the jumping flag
							currDownforce = GlobalStats.idleDownforce;		// first ground contact after Jump -> set init value ...
							if (isJumping)								// if in a real Jump ... rechange anim
							{
									isJumping = 0;
									animScript.playSkateSlow();			// this is run only once, so no need to check state...
									// DEBUG
									//print ("Called Line 3868");
									animState = 1;
									
										// broadcast Jump end
									publicInfo.jumping = false;
									
										// play land animation
									animScript.playLand();
							}
						}
					}
					else if(!publicInfo.upTrans)
					{
							// if we are on the ground, no need to move our rigidbody down 
						//currDownforce = 0.0;
						currDownforce = 0.9 * GlobalStats.idleDownforce;																	// when we are on ground reset downforce to full! first cycle after Jump, we're still on ground but in airborne mode...
					}
					else
					{			// we need to handle our gravity in hover mode ...
			//!!!!!! -> AI	
							// store the gravityComponent
						gravComp = (trgtDownforce + gravity);
						
						upForce = ( GlobalStats.hoverForce * (1 - (hoverHitDist / GlobalStats.uHoverHeight)) );
						lastDownforce = currDownforce;
			
							// apply up force for hover mode
						currDownforce = upForce;
						
							// apply normal gravity ...
						if (currDownforce > GlobalStats.maxDownforce)
						{											// if we are jumping ... we need to reduce the downforce back to negative values ..
							currDownforce += gravComp * dTime;		// downforce AND gravity influence character when airborne...
						}
						else currDownforce = GlobalStats.maxDownforce;
						
							// now smooth the value ...									transformHeightSpeed
						currDownforce = Mathf.SmoothStep(lastDownforce, currDownforce, 10.0 * dTime);	// works nicely!! / was 10.0
						
							// NOTE: I could change this .. I could make the current downforce and upForce add to each other. and have the upForce be the full strength of
							// 		my maxDownforce for the first half of the height (would never drop below). and reduce against 0 from the second half to top height.
							//		someting like: currDownforce += upForce * dTime (where upforce is -maxDownforce for first half, and goes against 0 for second half)
							//		and then add grav back: currDownforce += gravComp
							//		and I probably would have to set curr Downforce to 0 on transform (otherwise it would take some time before the upforce is bigger than downforce ..)
					
							// start downtransform at same time as fall now
							
					}
				
				//
				//	#####	Check if we are in control END! Else follows ...
				//
				}
				
				
				else
				{		
				//	
				//	#####################################
				//		No rc hit in range .. we're falling ...
				//
				
						// if controller is NOT in range -> Add timer after JumpOff			.. WE'RE IN THE AIR !!!!
						// set airborne mode to true (we've left the ground)
			
							// Check downforce
						// if (currDownforce > trgtDownforce)								// this was without adding in on downforce when falling ...
						if (currDownforce > GlobalStats.maxDownforce)
						{																					// if we are jumping ... we need to reduce the downforce back to negative values ..
							// currDownforce += trgtDownforce * dTime;								// this was still using the downfrce to move down when falling. I want to ignore the downforce while in Jump mode and use my gravity instead ....
							currDownforce += (trgtDownforce + gravity) * dTime;		// downforce AND gravity influence character when airborne...
						}
						else currDownforce = GlobalStats.maxDownforce;						// if we are already at downforce .. be happy!
				// !!!	This was trgtDownforce before | else currDownforce = maxDownforce;						// if we are already at downforce .. be happy!
			
						if (!airborne)
						{																		// if this is the first after jump cycle ...
							airborne = true;												// flag airborne mode
						}
						
						// now calculate the ammount we need to revert our rotation from collisions this updateLoop
						collRotate = Mathf.MoveTowards(0.0, hitAngle, 270 * dTime);						// basically this lets us rotate towards move direction with 180 deg per sec
						
							// remove the ammount we have already rotated from what we need ...
						hitAngle = hitAngle - collRotate;
						
						// if we're in the air, we can't steer, so set our rotate value to 0
						rotateAmmount = 0.0;
						
							// test minimal steering while in air
						rotateAmmount = horizInput * startHoriz * 40.0 * dTime;
			
				}




	//NORMAL MODE			
					// get our current rotation
				fromRotation = playerTrns.rotation;

					// normal align rotation code
				toRotation = Quaternion.LookRotation (hoverRayHit.normal, playerTrns.TransformDirection (Vector3(0,0,1)));		// First get the correct Quaternion Orientation to the normal
				toRotation = toRotation * Quaternion.Euler(-90, 0, 180);																									// Now change the orientation that the actual front AIMS front

					// get our rotation value
				// toRotation = Quaternion.Lerp (fromRotation, toRotation, 0.33);					// 0.1 - align to ground normal ...
				playerTrns.rotation = toRotation * Quaternion.Euler(0, rotateAmmount + collRotate, 0);
				
				
	//NORMAL MODE END

				
				//	#####################################
				//
				//	Shadow planeCode...
		
					// Align the shadowplane to ground...
				//blobShadow.rotation = toRotation;
				
				var addHeight : float = 0.0;
				if (hoverHitDist > 5)
				{
					addHeight = -2000;
				}
				
				blobShadow.position = hoverRayHit.point + blobShadow.TransformDirection(Vector3(0, (shadowHeight + addHeight), 0));	// orientation does not change, so just point and distance in blobshadows local space needed -> one less transformation that moving and then moving up

	// Recheck Fixed Update for Physics

					// now move our bounce forces to 0
				sideBounce = Mathf.MoveTowards(sideBounce, 0.0, bounceRevert * dTime);								// side bounce will be set on collision and 
				speedBounce = Mathf.MoveTowards(speedBounce, 0.0, bounceRevert * dTime);	

					// Calculate actual motion including bounce
				moveDirection = Vector3 ((sideBounce + sideBoost), 0.0, moveSpeed + speedBounce);					// get the move Direction with the forward movement ... 
	
					// get move direction for our character controller
				moveDirection = playerTrns.TransformDirection(moveDirection) + Vector3(0, currDownforce, 0);		// set the forward Vector correctly in world space

	// FAILSAFE DOWNFORCE

							// if we are not jumping, or in plane Mode no positive Downforce
						if ( (!isJumping) && (!publicInfo.upTrans) )
						{
							if (moveDirection.y > (0.2 * GlobalStats.idleDownforce) )
							{
								moveDirection.y = 0.4 * GlobalStats.idleDownforce;
							}
						}



					// Move
				charController.Move(moveDirection * dTime);

					// get the max width -> use for scaling the shadow ..	
					
				inContact = true;
			
			/* no RC HIt handled above and set to falling mode
			}
			
			
			else
			{	
				// #####################################
				//
				// if NO HIT (out of range, no control)
				
				if (inContact)
				{
					//print ("Lost Contact at:" + playerTrns.position);
					inContact = false;
				}
		
				hoverHitDist = 0.0;				// set to zero
				
				//Debug.Log ("No Contact");
				
				// Move
				charController.Move(moveDirection * dTime);
			}
			*/
			
	
			
		// END GROUND CHECK
		//
		// ######################################
		// ######################################
		

				// now, that the player is in the correct position, we can place the shadow under the characters bounding box center
			localHipPos = playerTrns.InverseTransformPoint(localHip.position);
			blobShadow.localPosition.x = localHipPos.x;
			blobShadow.localPosition.z = localHipPos.z;
		
		
			
		// #######################################
		//
		// WP handling START
		
				// First check if we need to switch waypoints ...
			if (switchWp)
			{
					// reset the switch flag ..
				switchWp = false;
	
					wpDecision = (wpScript.altProbability * aiPosShortcutMod * diffShortcut);
					
						// diffShortcut is the difficulty modifier for shortcut usage
					if ((Random.value >= wpDecision) || hyperspace)
					{																// 75% probability to take next waypoint, not shortcut
						waypoint = wpScript.nextWp;
						bestOffset = wpScript.nextOptimalOffset;					// get the next (or alt) waypoints best offset and segment width
						nextWidth = wpScript.nextWidth;
					}
					else
					{																// take the shortcut..
						waypoint = wpScript.altWp;
						bestOffset = wpScript.altOptimalOffset;
						nextWidth = wpScript.altWidth;
					}			
	
	
					// get the segLen before switching to next wp!
				segLen = wpScript.segLen;
				
					// get our aimNode before switching over
				wpAimNode = wpScript.aimVector;
				
					// get the waypoints speedup setting
				wpSpeedup = wpScript.speedAdjust;									// get the initial waypoints speed boost
				
			//
			//	TRASFORMATION HANDLING
			//
			
				// normal skating track handling
			if (wpScript.autoTransform == 0)
			{
					// only do stuff IF we are transformed
				if (publicInfo.upTrans)
				{	// back from plane
					if (!hyperspace)
					{
						transFromPlane();
						longJump = false;
					}
				}
				else if (publicInfo.dnTrans)
				{	// transform back from car
					transFromCar();
				}
			}
			
				// check if we need to go into plane mode ..
			else if (wpScript.autoTransform == 1)
			{	
					// don't handle transfroms if we are in hyperspace																
				if(!hyperspace)
				{
					if (!publicInfo.upTrans)
					{
							// transform toPlane (if timer setting ...)
						transToPlane();
						longJump = true;
					}
				}				
			}
				// Handling if on Car segment
			else if (wpScript.autoTransform == 2)
			{
					// Convert this to a toggle ..not timer based ...
				if(!publicInfo.dnTrans)
				{
						// transform into car
					transToCar();
				}
			}
			
			//
			//	TRANSFORMATION HANDLING END
			//
				
					// handle color adjustment
				botRenderer.material.color = wpScript.adjustColor;
				
				
					// get the trackPassed to the just hit waypoint, before changing script
				trackPassed = wpScript.trackPassed;			
				
					// handle lap Change .. (if we just collided with the finish line ... in the next loop the script will already be the last wps
				if (wpScript.isStart)
				{									// if current waypoint is finishLine ...
					if (!lapChange)
					{									// lap NOT changed in last loop
						lapChange = true;
						lapCount++;
						
							// if this is the race start, store time
						if (lapCount == 1)
						{
							_refHolder.Lap0times[botIndex] = currTime;
							raceTime += _refHolder.Lap0times[botIndex];
						}
						else if (lapCount == 2)
						{
							_refHolder.Lap1times[botIndex] = currTime - raceTime;
							raceTime += _refHolder.Lap1times[botIndex];
						}
						else if (lapCount == 3)
						{
							_refHolder.Lap2times[botIndex] = currTime - raceTime;
							raceTime += _refHolder.Lap2times[botIndex];
						}
						else if (lapCount == 4)
						{
							_refHolder.Lap3times[botIndex] = currTime - raceTime;
							raceTime += _refHolder.Lap3times[botIndex];
						}
					}
				}
				else
				{									// if not, just set our flag back to false
					lapChange = false;
				}
				
	
					// check if race is over
				if (lapCount == (raceLaps + 1))
				{
					if (!botFinished)
					{
					
						publicInfo.raceOver = true;
					
							// at the end of the racenable the auto pilot
						//autoPilot = true;
						
							// handle the final ranking
						_refHolder.finishRanking[botIndex] = _refHolder.finishedCount;
						_refHolder.finishedCount++;											// as we passed the line, the next one needs an incremented rank
						botFinished = true;													// set finished flag
					}
				}
				
					// get our reset settings
				abyssRespawn = wpScript.dropRespawn;
				abyssStopTime = wpScript.dropTimer;										// time till slow mode
				abyssSlowTime =	abyssStopTime + 1.5;									// time we are slow after reset ...
				
					// get the airTime stored in the current waypoint
				transUpTime = wpScript.airTimer;
				aiWpMulti = wpScript.aiMulti;
				wpTurnMulti = wpScript.wpTurnMulti;										// turn enhancment
				
					//
					//	Set the initial wpPos ... to be changed later in getAiSpeed function
					//
				
					// get the currently active spread
				currSpread = _refHolder.botSpread[botIndex - 1];
				
					// handle our Offset and get the wpPos for this segment .. based on best offset
				// segOffset = Mathf.Clamp((bestOffset+ ((Random.value - 0.5) * aiAccurracy * aiWpMulti * aiRandomize) + (spreadMulti * currSpread * aiWpMulti)), -wpClamp, wpClamp);
				segOffset = Mathf.Clamp((bestOffset + (spreadMulti * currSpread * aiWpMulti * aiAccurracy * aiAccurPosMod)), -wpClamp, wpClamp);
				
					// store our offset
				publicInfo.wpOffset = segOffset;
	
				// wpPos = (waypoint.TransformDirection(Vector3(0, 0, 25.0)) + waypoint.position);
				wpPos = (waypoint.TransformDirection(Vector3((segOffset * nextWidth), 0, 0.0)) + waypoint.position);
		
				
					// weapon chacking based on waypoint values ...
				
				
					// mines first ...
				if (hasMine)
				{
						// get random value
					dropTest = Random.value;
					
						// check if start?
					if(dropTest < wpScript.mineProbability * diffWeaponUse)
					{
							// start timed, based on random value .. reference time 3 sec.
						Invoke("applyPickup", (3.0 * dropTest));
					}
				}
	
					// missles next .. BUT check targetting first ...
				if (hasOffense)
				{
						// if we are no 1 no offese weapon use ...
					if(pRank != 0)
					{
							// get random value
						dropTest = Random.value;
						
							// check if start?
						if(dropTest < wpScript.missleProbability * diffWeaponUse)
						{
								// start timed, based on random value .. reference time 3 sec.
							Invoke("applyPickup", (3.0 * dropTest));
						}
					}
				}
				
					// Juice Boost or SpeedPickup handling ...
				
				if (pickupType == 8)
				{
					if(dropTest < (wpScript.juiceProbability * diffWeaponUse))
					{
							// start timed, based on random value .. reference time 3 sec.
						Invoke("applyPickup", (3.0 * dropTest));
					}
				}
				else if (juiceLeft >= BotStats.juiceFull[charIndex])
				{
						// if we are no 1 no juice weapon use ...

							// get random value
						dropTest = Random.value;
						
							// check if start?
						if(dropTest < (wpScript.juiceProbability * diffJuiceMulti * aiJuicePosMod))
						{
								// start timed, based on random value .. reference time 3 sec.
							Invoke("burnJuice", (2.0 * dropTest));
						}
				}
		
			}	
		
				// NOW: unified dist handling - player (and AI) pos is projected on a point along the direct line between 2 wayponts (no more rounding at end)
				// get player position in aimNode space
			wpDistPos = wpAimNode.InverseTransformPoint(playerTrns.position);
		
				// Now get the new distance (only the z value of the player position ...)
			wpDist = wpDistPos.z;
			
	
	//	############################################
	//
	//		Add weapon decision handling
	
			
					
	//		End Weapon decision handling
	//
	//	#############################################		
			
			
			
		
			
				// and get our track progress
			if (!botFinished)
			{
				tProgress = (trackPassed + wpDist) + trackLen * (lapCount-1);
			}
			else
			{
				tProgress = (20000 - (_refHolder.finishRanking[botIndex] * 10));
			}
			
				// and store it in our vault
			_refHolder.trackProgress[botIndex] = tProgress;	
			
	
	// wp handling END
	// 	###############################	

	}	//End game enabled check ...
	
	//	##########
	//
	// END PODIUM HANDLING CHECK
	}
	
	// DEBUG
	//print ("Bot " + botIndex + " downforce: " + currDownforce + "  Height: " + hoverHitDist);
}






	// handle actual collisions... convert to rigidbody
function OnControllerColliderHit (collision : ControllerColliderHit)
{
/*
		// NOTE: 	Since we don't exacly know which contact point is the first, we also din't know we always have the exact tangent contact point, or maybe a point
		//			on the sphere sticking in the wall at some point. We know though that the normal is always the same for a given segment, so we'll use the normal 
		//			to calculate our hitAngle.	

	if(collision.collider.CompareTag("Player"))
	{
		// get the position of the hit player in our local space
		var hitPlayer3D : Vector3 = playerTrns.InverseTransformPoint(collision.collider.transform.position);
		hitPlayer3D.y =0.0;

			// add our sideBounce speed ..
		if (Mathf.Abs(hitPlayer3D.x) > bounceThreshold )
		{
				// check if even bigger
			sideBounce = -hitPlayer3D.x * bounceMax;
		}
		
			// add our speedBounce ...
		if (Mathf.Abs(hitPlayer3D.z) > bounceThreshold )
		{
				// check if even bigger
			speedBounce = -hitPlayer3D.z * bounceMax;
		}
	}
	next was else if
	*/
	
		// if we hit the wall ...
	if (collision.collider.CompareTag("wall"))
	{
			// get our surface normal 
		var hitNormal3D : Vector3 = playerTrns.InverseTransformDirection(collision.normal);
		
			// remove the height from our direction
		hitNormal3D.y = 0.0;

			// get our collision angle with the wall (angle between wall normal in player space and on player plane compared to player fwd direction)
		hitAngle = Vector3.Angle(hitNormal3D, Vector3(0,0,1));
		
			// from the angle extract the ammount we need to rotate to align on track get
		hitAngle = hitAngle - 85.0;								// straight hit results in 180 degrees, as the normal points away from player. We need to rotate 90, add another 5 to be safe. - subtract 85 from the 180 
		
			
		
		//print("Hit Angle: " + hitAngle + " at: " + hitNormal3D + "hitNormal: " + hit.contacts[0].normal);

				
			// simplify like the navigation ...  hitAngle = (hitPoint3D.z / collMagnitude) if wall is 90 deg to side, z and magnitude are the same -> 1 if totally in front z is 0 -> 0

			//	######################################################################################
			//
			// Step 2: Handle the rotation
			
			// if we are hit from behind .. no turning is needed ... (as we are already facing away from our collider)
		if(hitNormal3D.z > 0.0)
		{
				// set the hit from behind flag to speed up
			backColl = true;
		}
		else
		{		
				// basically as long as we're touching the wall, rotate away (no complex calculation)
			if(hitNormal3D.x <= 0)
			{									// right hand side collision | requires negative counter rotation ...
					// negate 
				hitAngle = -hitAngle;
			}
			
				// calculate our rotation angle ..
			//hitAngle = Mathf.MoveTowardsAngle(0.0, hitAngle, 210.0 * dTime);
			
				// basically as long as we're touching the wall, rotate away
			
				// Step 3: reduce speed until 0.6 times normal speed...
			if (currSpeed > (maxSpeed * 0.6))
			{ 
				currSpeed = currSpeed * GlobalStats.collisionSpeedDecrease;				// decrease Speed per hit
			}
		}

	}
}




	// handle triggering
function OnTriggerEnter (hit : Collider)
{

	// organize collisions by their probability .. waypoints first, pickups next, jumpgate, normal collision
	switch (true)
	{
		case (hit.collider.CompareTag("waypoint")):

					// Handle Waypoint hit
				var tempWpHit = (hit.collider.GetComponent(wpAttribs) as wpAttribs);
				
				if (lastWpIndex != tempWpHit.waypointIndex)
				{
					wpScript = tempWpHit;
					lastWpIndex = wpScript.waypointIndex;
					switchWp = true;
					
					// do the waypoint switching directly here ...
				}
			break;			
		
		case (hit.collider.CompareTag("pickup")):

					// run the pickup code here -> directly implement stuff only support random pickups for now.
				handlePickup();
			break;
			
		case (hit.collider.CompareTag("speed")):
			
					// run the speedhit function
				speedHit();
			break;
			
		case (hit.collider.CompareTag("box")):

					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
						// start damage handling ...
					beginDamage (0.3, 0.3, 3.0);
				
						// play sound ...
					// audio.clip = badaboomSound;
					// audio.Play ();
				}
				
					// play explosion
				_refHolder.allExplosions[botIndex].position = playerTrns.position;
				_refHolder.allExplosionScr[botIndex].Explode();
			break;
			
		case (hit.collider.CompareTag("mineIsotope")):

					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
					isotopeHit = true;
						
						// start damage handling ...
					beginDamage (0.2, 0.2, 5.0);
					
						// play explosion
					_refHolder.allExplosions[botIndex].position = playerTrns.position;
					_refHolder.allExplosionScr[botIndex].Explode();
				}
			break;
			
		case (hit.collider.CompareTag("mineBada")):

					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
						// start damage handling ...
					beginDamage (0.1, 0.1, 3.0);
					
						// play explosion
					_refHolder.allExplosions[botIndex].position = playerTrns.position;
					_refHolder.allExplosionScr[botIndex].Explode();
				}
			break;
		
		case (hit.collider.CompareTag("playerIsotope")):
			
					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
					isotopeHit = true;
						
						// start damage handling ...
					beginDamage (0.2, 0.2, 5.0);
					
						// play explosion
					_refHolder.allExplosions[botIndex].position = playerTrns.position;
					_refHolder.allExplosionScr[botIndex].Explode();
					
						// play info on screen
					playerMoveScr.startHitFeedback(charIndex, 7);
					// DEBUG
				//print ("Isotope Called for: "  + botIndex);
				}
			break;
			
		case (hit.collider.CompareTag("playerBada")):

					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
						// start damage handling ...
					beginDamage (0.1, 0.1, 3.0);
					
						// play explosion
					_refHolder.allExplosions[botIndex].position = playerTrns.position;
					_refHolder.allExplosionScr[botIndex].Explode();
					
						// play info on screen
					playerMoveScr.startHitFeedback(charIndex, 4);
					// DEBUG
				//print ("Bada Called for: " + botIndex);
				}
			break;
			
		case (hit.collider.CompareTag("barrier")):
			
					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
						// start damage handling ...
					beginDamage (0.3, 0.3, 2.5);
				
						// play sound ...
					// audio.clip = badaboomSound;
					// audio.Play ();

				}
			break;
			
		case (hit.collider.CompareTag("sky")):
			
					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
						// if hit, exit speedPlane
					speedPlaneExit = 0.0;
					
						// while hit .. stand still
					currSpeed = currSpeed * 0.0;
								
						// reduce our target speed by simply adjusting the vertInput we have ...
					speedMod = 0.0;
								
						// set anim handler to stopped ..(convert to getInfo script ...)
					publicInfo.stopped = true;
			
						// play hit animation
					animScript.playHit();
																
						// start the stopped animation
					animState = 6;	
					
						// invoke the Hit state in 1.5 sec.
					Invoke("skyshotHit", 2.0);
					
						// play the explosion
					_refHolder.allExplosions[botIndex].position = playerTrns.position;
					_refHolder.allExplosionScr[botIndex].Explode();
						
						// flag skyshot hit call
					skyshotHitCalled = true;
				}
			break;
			
		case (hit.collider.CompareTag("playerSky")):
							
					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
						// if hit, exit speedPlane
					speedPlaneExit = 0.0;
									
						// while hit .. stand still
					currSpeed = currSpeed * 0.0;
								
						// reduce our target speed by simply adjusting the vertInput we have ...
					speedMod = 0.0;
								
						// set anim handler to stopped ..(convert to getInfo script ...)
					publicInfo.stopped = true;
			
						// play hit animation
					animScript.playHit();
																
						// start the stopped animation
					animState = 6;	
					
						// invoke the Hit state in 1.5 sec.
					Invoke("skyshotHit", 2.0);
					
						// display hit on player HUD
					playerMoveScr.startHitFeedback(charIndex, 6);
					// DEBUG
				//print ("Sky Called for: " + botIndex);
										
						// play the explosion
					_refHolder.allExplosions[botIndex].position = playerTrns.position;
					_refHolder.allExplosionScr[botIndex].Explode();
					
						// flag skyshot hit call
					skyshotHitCalled = true;
				}
			break;
			
		case (hit.collider.CompareTag("playerLeader")):
			
					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
						// if hit, exit speedPlane
					speedPlaneExit = 0.0;
							
						// while hit .. stand still
					currSpeed = currSpeed * 0.0;
								
						// reduce our target speed by simply adjusting the vertInput we have ...
					speedMod = 0.0;
								
						// set anim handler to stopped ..(convert to getInfo script ...)
					publicInfo.stopped = true;
			
						// play hit animation
					animScript.playHit();
																
						// start the stopped animation
					animState = 6;	
					
						// invoke the Hit state in 1.5 sec.
					Invoke("skyshotHit", 2.0);
					
						// display hit on player HUD
					playerMoveScr.startHitFeedback(charIndex, 9);
					// DEBUG
				//print ("leader Called for: " + botIndex);
					
						// play the explosion
					_refHolder.allExplosions[botIndex].position = playerTrns.position;
					_refHolder.allExplosionScr[botIndex].Explode();
					
						// flag skyshot hit call
					skyshotHitCalled = true;
				}
			break;
			
		case (hit.collider.CompareTag("leader")):
			
					// if shield enabled .. disable .. no effect
				if (shieldSet)
				{
					shieldDisable();
				}
				else
				{
						// if hit, exit speedPlane
					speedPlaneExit = 0.0;
					
						// while hit .. stand still
					currSpeed = currSpeed * 0.0;
								
						// reduce our target speed by simply adjusting the vertInput we have ...
					speedMod = 0.0;
								
						// set anim handler to stopped ..(convert to getInfo script ...)
					publicInfo.stopped = true;
			
						// play hit animation
					animScript.playHit();
																
						// start the stopped animation
					animState = 6;	
					
						// invoke the Hit state in 1.5 sec.
					Invoke("skyshotHit", 2.0);
					
						// play the explosion
					_refHolder.allExplosions[botIndex].position = playerTrns.position;
					_refHolder.allExplosionScr[botIndex].Explode();
					
						// flag skyshot hit call
					skyshotHitCalled = true;
				}
			break;


		case (hit.collider.CompareTag("kill")):

						// invoke reset
					Invoke("abyssReset", 0.0);
			break;
	}
}


/*
Line 1311:abyssGizmo
working ai Values

		// set some difficulty based values
	if (_refHolder.aiDiff == 0)
	{					// Easy
		diffRandomDecision = 0.6;
		diffShortcut = 0.2;							// super low shortcut probability
		//diffSpeedMulti = 0.8;						// was 0.8
		//diffTurnMulti = 0.9;
		//diffAccurrMulti	= 1.0;						// this is used to increase spread if close to next bot back to 1 (with aiAccurracy)
		//diffRubberOffset = (rubberLength * 0.3);	// increase rubberOffset by 50 %
		diffRubberSlowdown = 1.8;					// slowdown twice as fast 2.0
		aiAccurracy = 1.0;
		diffJumpVal = 0.4;
		diffWeapAvoidVal = 0.2;
		diffJuiceMulti = 0.7;						// set to 60% of waypoint setting
		diffWeaponUse = 1.0;
		diffLeadAdjust = 0.8;
		diffTailAdjust = 0.5;
		diffCloseAdjust = 0.7;
		aiCloseOffset = aiCloseOffset * 1.3;
		aiTailOffset = aiTailOffset * 1.6;
		aiFirstOffset = aiFirstOffset * -0.3;						// At the end aim at a pos 10 m behind player
		aiPlayerBuffer = aiPlayerBuffer * 2.0;
		diffEndMulti = 2.5;
		aiPlayerSpeedup = aiPlayerSpeedup * 0.6;
		
			// reduce speedMod
		aiSpeedMod = aiSpeedMod * 0.95;
	}
	else if (_refHolder.aiDiff == 1)
	{					// Normal
		diffRandomDecision = 0.9;
		diffShortcut = 3.0;							// increase shortcut probability by 500 %
		//diffSpeedMulti = 1.1;						// was 1.1
		//diffTurnMulti = 1.4;
		//diffAccurrMulti = 1.667;					// this is used to increase spread if close to next bot back to 1 (with aiAccurracy)
		//diffRubberOffset = - (rubberLength * 0.3);	// decrease rubberOffset by 50 %
		diffRubberSlowdown = 0.9;					// slowdown 25% slower
		aiAccurracy = 0.8;							// increase accurr.
		diffJumpVal = 0.75;
		diffWeapAvoidVal = 0.6;
		diffJuiceMulti = 1.1;						// set to 100% of waypoint setting
		diffWeaponUse = 1.0;
		diffLeadAdjust = 1.2;
		diffTailAdjust = 1.0;
		diffCloseAdjust = 1.0;
		aiCloseOffset = aiCloseOffset * 1.0;
		aiTailOffset = aiTailOffset * 1.0;
		aiFirstOffset = aiFirstOffset * 1.0;						// At the end aim at a pos 50 m in front of player
		aiPlayerBuffer = aiPlayerBuffer * 1.0;
		diffEndMulti = 1.0;
		aiPlayerSpeedup = aiPlayerSpeedup * 1.0;
		
			// increase speedMod
		aiSpeedMod = aiSpeedMod * 1.07;
	}
	else
	{					// Hard
		diffRandomDecision = 1.0;
		diffShortcut = 6.0;							// increase shortcut probability by 500 %
		//diffSpeedMulti = 1.1;						// was 1.1
		//diffTurnMulti = 1.4;
		//diffAccurrMulti = 1.667;					// this is used to increase spread if close to next bot back to 1 (with aiAccurracy)
		//diffRubberOffset = - (rubberLength * 0.3);	// decrease rubberOffset by 50 %
		diffRubberSlowdown = 0.9;					// slowdown 25% slower
		aiAccurracy = 0.6;							// increase accurr.
		diffJumpVal = 0.85;
		diffWeapAvoidVal = 0.7;
		diffJuiceMulti = 1.2;						// set to 100% of waypoint setting
		diffWeaponUse = 1.2;
		diffLeadAdjust = 1.5;
		diffTailAdjust = 1.2;
		diffCloseAdjust = 1.1;
		aiCloseOffset = aiCloseOffset * 0.8;
		aiTailOffset = aiTailOffset * 0.8;
		aiFirstOffset = aiFirstOffset * 1.3;						// At the end aim at a pos 50 m in front of player
		aiPlayerBuffer = aiPlayerBuffer * 1.3;
		diffEndMulti = 0.8;
		aiPlayerSpeedup = aiPlayerSpeedup * 1.3;
		
			// increase speedMod
		aiSpeedMod = aiSpeedMod * 1.12;
	}
	*/
	
	
function OnGUI_deactivate()
{
	//GUI.Box(Rect(5, 5,460,25),("Player Max: " + playerMoveScr.maxSpeed + " | Player Boost: " + playerMoveScr.speedPlaneSpeed));
	
	if (botIndex == 1)
	{
	
		GUI.Box(Rect(5, 35,460,25),("Bot1 horizInput: " + ((wp3D.x / wpMagnitude) * wpTurnMulti * aiTurnMulti * aiTurnAdjust) + " doSlide: " + doSlide)); 
		GUI.Box(Rect(5, 65,460,25),("Bot1 wpMagnitude: " + wpMagnitude + " wpTurnMulti: " + wpTurnMulti + " aiTurnMulti: " + aiTurnMulti + " aiTurnAdjust: " + aiTurnAdjust));
		GUI.Box(Rect(5, 95,460,25),("Bot1 slideDist: " + slideDist + " slideInput: " + slideInput));
		GUI.Box(Rect(5, 125,460,25),("Bot1 increaseDist: " + increaseDist + " revides horizInput: " + horizInput));
	
	
	/*
		GUI.Box(Rect(5, 35,460,25),("Bot1 Max Norm: " + maxSpeed + " Boost Norm: " + speedPlaneSpeed));
		GUI.Box(Rect(5, 60,460,25),("Bot1 Comp: " + aiPlayerCompensation + " Boost x: " + aiBoostMax + " Res: " + (speedPlaneSpeed * aiBoostMax)));
		GUI.Box(Rect(5, 85,460,25),("Bot1 Max x: " + aiPlayerMax + " Min x: " + aiPlayerMin + " MaxVis x : " + aiMaxVisSpeed));
		GUI.Box(Rect(5, 110,460,25),("Bot1 Max: " + (aiPlayerMax * maxSpeed) + " Min x: " + (aiPlayerMin * maxSpeed) + " MaxVis x : " + (aiMaxVisSpeed * maxSpeed)));
		GUI.Box(Rect(5, 135,460,25),("Bot1 wpDecision: " + wpDecision  + " WPaltProb: " + wpScript.altProbability + " aiPosShortcut: " + aiPosShortcutMod + " diffShortcut: " + diffShortcut));
	*/
	}
	/*
	if (botIndex == 2)
	{
		GUI.Box(Rect(5, 175,460,25),("Bot1 Max Norm: " + maxSpeed + " Boost Norm: " + speedPlaneSpeed));
		GUI.Box(Rect(5, 200,460,25),("Bot1 Comp: " + aiPlayerCompensation + " Boost x: " + aiBoostMax + " Res: " + (speedPlaneSpeed * aiBoostMax)));
		GUI.Box(Rect(5, 225,460,25),("Bot1 Max x: " + aiPlayerMax + " Min x: " + aiPlayerMin + " MaxVis x : " + aiMaxVisSpeed));
		GUI.Box(Rect(5, 250,460,25),("Bot1 Max: " + (aiPlayerMax * maxSpeed) + " Min x: " + (aiPlayerMin * maxSpeed) + " MaxVis x : " + (aiMaxVisSpeed * maxSpeed)));
		GUI.Box(Rect(5, 275,460,25),("Bot1 wpDecision: " + wpDecision  + " WPaltProb: " + wpScript.altProbability + " aiPosShortcut: " + aiPosShortcutMod + " diffShortcut: " + diffShortcut));
	}
	
	if (botIndex == 3)
	{
		GUI.Box(Rect(5, 315,460,25),("Bot1 Max Norm: " + maxSpeed + " Boost Norm: " + speedPlaneSpeed));
		GUI.Box(Rect(5, 340,460,25),("Bot1 Comp: " + aiPlayerCompensation + " Boost x: " + aiBoostMax + " Res: " + (speedPlaneSpeed * aiBoostMax)));
		GUI.Box(Rect(5, 365,460,25),("Bot1 Max x: " + aiPlayerMax + " Min x: " + aiPlayerMin + " MaxVis x : " + aiMaxVisSpeed));
		GUI.Box(Rect(5, 390,460,25),("Bot1 Max: " + (aiPlayerMax * maxSpeed) + " Min x: " + (aiPlayerMin * maxSpeed) + " MaxVis x : " + (aiMaxVisSpeed * maxSpeed)));
		GUI.Box(Rect(5, 415,460,25),("Bot1 wpDecision: " + wpDecision + " WPaltProb: " + wpScript.altProbability + " aiPosShortcut: " + aiPosShortcutMod + " diffShortcut: " + diffShortcut));
	}
*/
}