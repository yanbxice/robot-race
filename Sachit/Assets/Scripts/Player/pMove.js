// ##########################################
//
//	Character control script for robot race
//
// 	Version 0.5
//
//	Changes:
//		- remove gravity and rely on downforce | added grav back in, but till in downforce dir.
//		- remove downforce dependency on speed??? Just use max all the time?!
//
//	ToDo:
//
//		- change all arrays[] to built in Array class??
//
//		- Get all the DataVault stuff once and put into vars???
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
//
//


		// one fast way of calculating distances for comparisions
	//var sqrLen = (myTarget.position - playerTrns.position).sqrMagnitude;
//
//	##########################################

var layerMask : LayerMask; //make sure we aren't in this layer 
private var lastPosCache : Vector3;

var autoPilot = false;

//var colorOffset : float = 5.0;

var _podiumHandler : podiumHandler;
var _inputScript : pInput;

	// refholder ... to access other bots and weapons ...
var _refHolder : refHolder;

private var isoDrop : int = 0;			// we can now drop 3 mines per type at one time -- this is the counter
private var badaDrop : int = 0;
private var botIndex : int = 0;

// #####	SETUP all needed transforms	#####
var wrongDirEnable : boolean = false;

var spawnPoint : Transform;				// the spawnpoint for the player
var waypoint : Transform;				// the first waypoint ...

	// HUD Button access
var HUD_Speed : HUD_SingleButton;							// the control for the speed display
var HUD_bZort : HUD_SingleButton;							// the hit effect for barriers ...
var bZortSound : AudioClip;
var strikeSound : AudioClip;
var wallSound : AudioClip;

var badgeSource : AudioSource;
var speedSource : AudioSource;
var virusSource : AudioSource;

var guiFlags : GUI_Flags;									// get access to the GUI system


	// Implement juice for Player
var juiceLeft : float = 0.0;
// var juiceBuildup : float = 0.2;					// These need to be set by botStats
var juiceFull : float = 5.0;					// These need to be set by botStats

	
private var speedState : boolean = false;					// is speedplane speed on? (HUD Boolean)
private var hitFeedback : int = 0;


	// pickup access and handling vars
// var pickupScript : pickupHandling;		// script to handle the pickups
private var pickupType : int = 0;		// initial pickup type for now set to jump
private var nextPickup : float = 0.0;	// timer for pickup activation

	// scripts and transforms
var animScript : pAnim;					// The animation script for the character ...		-> player_construct
private var slideGoal : float = 0;
private var animState : int = 0;		// we don't want to call skateSlow all the time, so whever we change anim away from skateslow, set to 0, else set to 1 (so that skate slow is only started once - it'S looping ...)
										// also use for skate l/r -> 1 - skateSlow 2- skateRight 3 - skateLeft

var charMesh : Transform;																	// iRobot_Player
var charIndex : int;					// the robots index
var charRoot : Transform;				// The root node (needed for sliding)				// player_root
var charOffset : Transform;				// The node to add additional transforms to our character....	// player_offset
var rayCastSender : Transform;																	// rayCastSender
var playerTrns : Transform;																		// none
var softAlign : Transform;

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

	// better way to handle char scaling ...
var charScaler : Transform;				// this node is used to scale the bot (via animation)
var charScalerAnim : Animation;			// the anim node for the char scaler ...
var camAnim : Animation;
var camSpeed : Animation;				// speed effects cam animation


// var charController : Rigidbody;			// let's try again to use the character controller .. but only for collisions, not for ground contact
var charController : CharacterController;			// let's try again to use the character controller .. but only for collisions, not for ground contact

// var charCollider : SphereCollider;		// our collider

// private var charHit : ControllerColliderHit;	// the object the character Controller hits ...

var mainCam : Transform;				// when resetting the player, we also need to reset the cam
var camTrgt : Transform;
var camPos : Transform;					// the animated objects for the camera
var trgtPos : Transform;


var blobShadow : Transform;				// the blob shadow plane ...								//blobShadow
var botRenderer : Renderer;				// the bots render node
var localHip : Transform;					// the hip position variable
var localHipPos : Vector3;
// var botMesh : GameObject;				// the robots center of gravity ( from bbox center)

// private var prevPos : Vector3;								// position store


// #####	SETUP movement settings	Updated by statFiles #####

var gravity = -15.0;					// in m/s¬≤

var offRoad = 0.7;
// var isOffroad : boolean = false;		// are we offRoad?
var maxSpeed = 35.0;
var speedPlaneSpeed = 45.0;				// SpeedPlane Contact
var speedPlaneTime = 4.0;				// speedplane boost in sec.
var speedPlaneExit : float;		// time at which to exit speedplane mode

	// rotation and slide handling
var rotateSpeed = 120.0;				// Angle per second?
var speedRotationDecrease = 0.2;

// var maxSlideAngle = 90.0;				// maximum angle we can slide off move direction	|	For the script to work, this needs to be between 0 and 180
// var fullSlideTime = 0.6;				// time it takes at FULL side slide to reach maxAngle ...
private var slideAngle = 0.0;			// variable to hold the combined slide angles (to apply in later cycles ...) 
private var slideSign = 1.0;			// var to store the sign of the actual slide rotation
private var slideTimer = 0.0;			// in order to not suffer fluctuating iPhone input add a timer ...

private var slideSpeedup = 0.0;						// how long have we been sliding?
private var slideCountStart : boolean = false;		// did we stop sliding, need to restart counting time ..
private var slideSpeedMin = 1.5;					// minimum time at which to speedup

private	var rollAngle : float;					// the roll angle multiplier for plane mode

// ################
// ################
// why not use DataVault ???
private var planeMode : boolean = false;		// flag to check if we are in plane mode (used to run code only ONCE whenever we transform)
private var normalMode : boolean = true;		// flag to check if we are in normal mode .. used to execute code only ONCE

// var planeRollMulti = 8.0;						// the fraction of our steering rotation we want to roll!
private var rollAmmount = 0;					// the initial roll angle - updates how much roll to add in plane mode ...
// var turnCharMulti = 2.0;						// ammount to turn the model even if not sliding
var slideRevertDampen : float = 0.7;			// the multi that defines how much of the slide direction is taken back when reverting from sliding (not 100% in slide dir but like 90%)

	// acceleration handling
var accRate = 25.0;								// in m/s¬≤
var decRate = 30.0;								// in m/s¬≤


// #####	SETUP Hovering stuff	#####

	// 	hover handling
var hoverRayHit : RaycastHit;						// we're shooting a ray down to check for the ground ... this tores the hit info ...

var hoverRayMask = 1<<8;							// the layer mask for the hover ray ..

// var downforce = -10.0;								// the force pushing down at max Speed ... (wie bodenhaftung bei Auto... speed und fl√ºgel dr√ºcken runter ..)
//var maxDownforce = -45;								// maximum downforce when falling ...
//var idleDownforce = -10.0;							// the downforce when standing ...
//var hoverForce : float = 20.0;						// Force bigger than gravPull to enable hover in plane mode

private var hoverMaxDist : float;					// the maximum hover distance (basically the length of the raycast check)

private var hoverHitDist : float = 0.0;				// store the last hit distance
private var hoverLift : float = 0.0;				// hover lift value

private var currDownforce : float;
private var trgtDownforce : float;

// +3.0 -> to be on the safe side with our speeds... for now I set the Raycast sender up 3 units above the characters feet, so 3.0 means - feet on the ground (so that gravity from one cycle to the next wont slip player through ground) AND add 0.1 for the shadow plane height
//var nHoverMaxDist = 3.25;				// the "normal" or robot mode hover height
//var nHoverHeight = 3.1;
//var uHoverMaxDist = 12.0;				// the "up" or plane mode hover height
//var uHoverHeight = 11.1;
//var dHoverMaxDist = 3.12;				// the "down" or car mode hover height
//var transformHeightSpeed = 4.0;			// speed with which we increase our height when transforming

// ################
// ################
// USED???	Also nHoverHeight used?
// var transformDnTimeshift = 0.3;			// transforming back down from plane mode starts a bit earlyer, because we don't want the animation to play ON the ground....
//var hoverMinDist : float = 0.1;			// the minimum hover distance (this basically meand we're hitting the ground)

	// Jump Vars ...
//var jumpSpeed = 15.0;
//var jumpPause = 0.1;			// time between jumps ...

private var airborne : boolean = true;						// are we airborne ??
private var airTime;


// #####	SETUP collision code	#####

var skateHeight : float = 1.1;						// the height of the raycast senders.
var carHeight : float = 0.7;
var planeHeight : float = 0.7;
private var actHeight : float = 1.0;

//var collisionSpeedDecrease : float = 0.8;			// factor to which speed decreases...

// ################
// ################
// USED???
	// movement timers	Not needed on iPhone where we have no backwards driving ...
private var lastJump = 0.0;		// time when next jump is possible
private var isJumping = 0;		// check if we are currently jumping ...
private var grounded = 0;		// are we grounded??

	// more acceleration handling ....
private var targetSpeed = 0.0;
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



	// camera location setting...
var nCamPos : Vector3 = Vector3(0, 2, -3);					// the cam locations in robot mode ....
var nCamTrgtPos : Vector3 = Vector3(0, 1.5, 0);
var uCamPos : Vector3 = Vector3(0, 1.1, -2);				// the cam locations in robot mode ...
var uCamTrgtPos : Vector3 = Vector3(0, 0.5, 0);
var dCamPos : Vector3 = Vector3(0, 0.9, -1.5);				// the cam locations in robot mode ...
var dCamTrgtPos : Vector3 = Vector3(0, 0.5, 0);
var camTransTime : float = 2.0;								// time the camera change for transforms takes ...


// WP Vars...


private var switchWp : boolean = false;						// do we switch waypoint??
private var lapChange : boolean = false;					// have we changed the lap recently?
private var nextStart : boolean = true;						// did we just pass the last waypoint before finish || Initially yes, of course
private var prevStart : boolean = false;					// did we just pass the first waypoint after start
private var lapRemoved : boolean = false;					// did we move back and had a lap removed?

private var wpAimNode : Transform;
var wpDistPos : Vector3;									// this will hold the position we use to calculate player distance to waypoint ...
private var pRank : int;


// Access Lap and pos buttons

private var tProgress : float;								// the position index of the robot ...
var lapCount : int = 0;								// number of completed laps
private var wpDist : float = 0.0;							// our Distance ...
private var botFinished : boolean = false;					// if our bot crossed the finish line, set a super high but ordered trackPassed value (to keep sorting correct)

var raceLaps : int = 3;										// how many laps the race has
var endzone : float = 700.0;								// length of zone before finishline where AI won'd accelerate extra
//private var noAiSpeedup : float;							// here we'll store at which distance to stop speeding up AI (end of last lap)

private var lastWpIndex : int = -99;						// last collision waypoint index
private var segLen : float;									// waypoint segment length
private var wpSpeedup : float = 1;							// the current waypoints speed multiplier
private var trackPassed : float = 0.0;						// the distance traveled so far

	// special occasions ..
// private var overAbyss : boolean = false;					// are we over an abyss
private var shadowHeight : float = 0.1;						// our shadow height - drop out if over abyss
// private var allowHover : boolean = true;					// set if hover allowed... (abyss only when in plane mode)
private var wpScript : wpAttribs;							// this will hold the current waypoint script (to reset player on next wp after drop)
private var trackLen : float;								// length of complete track

	// the ai speed multiplier
private var aiSpeedMulti : float = 1.1;

	// Abyss timers ... OPTIMIZE???
	// -> one will specify the time after hitting the abyss, how long we fall, the other will specify how long we must wait on the other side until we can continue
private var abyssResetTime : float = 2.0;					// time till reset and stop
private var abyssStopTime : float = 1.5;					// time till slow mode
private var abyssSlowTime : float =	2.0;					// time till normal operations
private var abyssDrop : boolean = false;					// flag, so we don't contiously reset the time while over abyss ...


	// robot collision speedup
var backColl : boolean = false;								// were we hit from behind last loop??
private var backCollSpeedboost : float = 1.2;				// multi for hit from behind..

	// add transform timer here for jumpgate handling
// replaced with transUp time	|	var transTime : float;										// time we stay transformed ...
// no timer here anymore ...	|	var transDnTime : float = 1.0;
var transUpTime : float = 4.0;
var hitJumpGate : boolean = false;							// since we're handling collisions in a seperate function, I'm setting a bool Value when a gate was hit, that will initialize setting the correct transformed time on entering the move function
var longJump : boolean = false;								// if exiting out of hyperspace we need to know if this is on!

	// wrong direction timer
private var wrongDirReset : float = 3.5;					// after 4 seconds in wrong direction reset player
private var wrongDirDisplay : float = 0.8;					// after 0.5 seconds display wrong direction
private var wrongDirTimer : float = 0.0;
private var wrongDirActive : boolean = false;				
private var wrongDirEngaged : boolean = false;				// I want to make sure that when going back and hitting another waypoint (thus changing dist does not directly cancel our backMovement ...)
var wpOldDist : float = 0.0;								// last loops track progress (to compare with current for wrong dir checking)

	// get the weapon prefabs
// var mineIsotope : mineDeploy;
// var mineBadaboom : mineDeploy;
// var cruiseMissle : missleShoot;
// var skyShot : GameObject;
var shield : Transform;
var shieldHeight : Transform;
// var virusHUD : HUD_SingleButton;
var virusAnim : Animation;

// var HUD_noTarget : HUD_SingleButton;						// the no target info ...


	// warning HUD
// var skyShotWarning : HUD_SingleButton;
// var missleWarningL : HUD_SingleButton;
// var missleWarningR : HUD_SingleButton;
private var playWarning : boolean = false;

	// get the weapon sounds...
var isotopeSound : AudioClip;
var badaboomSound : AudioClip;
var speedSound : AudioClip;
var jumpSound : AudioClip;
var transformSound : AudioClip;
// var explosionSound : AudioClip;
var virusSound : AudioClip;

	
	// weapon Flags and timers
private var shieldSet : boolean = false;
private var shieldPosed : boolean = true;
var shieldAnim : Animation;
private var managedEvade : boolean = false;			// did we evade missle or skyshot??
private var cooldownTime : float = 1.5;

	// flag for stuff to run only once ...
private var mineHit : boolean;

private var isotopeHit : boolean = false;
//var autoPilot = false;
private var hyperspace : boolean = false;
private var hyperspaceExit : boolean = true;
private var hyperspaceTime : float = 0.0;

	// weapon effect timer
private var effectTimer : float;
private var stopTimer : float;
private var slowTimer : float;

	// is aiming enabled?
var aimEnable : boolean = false;
var aimTarget : Transform;				// the current target
var aimIndex : int;						// the index of our target!! (to use with refHolder)
var hasTarget : boolean = false;		// do we have a target??

	// store the current waypoints aimtarget (in case we go automatic)
var wpPos : Vector3;

	// get our attached getInfo script (this will be used to distribute values to other scripts ..)
var publicInfo : getInfo;



//
// define all runtime generated vars here already ...
//

	// get our rotation to ground normal ..
private var fromRotation : Quaternion;			// our current rotation
private var cacheRotation : Quaternion;			// our last toRotation
private var toRotation : Quaternion;			// our current toRotation
	
	// get our normals to average our surface alignment
private var currNormal : Vector3;
private	var lastNormal : Vector3;
private var preNormal : Vector3;
private var avgNormal : Vector3;


	// get our time handlers ...
private var dTime : float;
private var currTime : float;
		
	// get our current input ..
private var vertInput : float;
private var horizInput : float;
private	var doSlide : int;

	// add our handlers for getReady (we'Re active but no movement and no steering and playing getReady)
private var startHoriz : float = 0.0;			// use speedMod for vert movement

private var dir : Vector3 = Vector3(0,0,0);							// for handling the acceleration ...
		
	// are we braking?
private var brakesActive : boolean = false;
	
		
	// turn calculation vars for autopilot
private var wp3D : Vector3;
//private var wp2D : Vector2;
//private var wpAngle : float;	

	// holder for the optimal offset to use, based on alt or next selection
// NOT NEEDED FOR PLAYER
// var bestOffset : float;
// var nextWidth : float;
var botOffsetTest : float;										// ai offset calculation Random value holder (in waypoint switch handling)
private var lastOffset : float = 0.0;

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
private var localSlideTime : float;								// I want the slide to be based on input slightly:	
	
	// vars to check if we need to roll/turn visually
private var lastTurnRollCombo : float = 0.0;
private var turnRollCombo : float = 0.0;
	
	// acceleration handling local vars
private var offRoadMulti : float = 1.0;							// set to 1 first	
				
	// skyshot offset from player
private var shotPos : float;

	// gravity handling local vars ...
private var gravComp : float;
private var upForce : float;
private var lastDownforce : float;
	
	// ranking local vars (rankSort function ...)
private var vaultProgress : float[] = new float[7];
private var robots : int[] = new int [7];						// initialize the robot list in the order they use in _refHolder.trackProgress
private var ranking : int[] = new int[7];						// initialize the ranklist

	// invoke repeat timers ...
private var wrongDirInterval : float = 0.8;
private var rankSortInterval : float = 0.2;

	// ai settings ...
var aiWpMulti : float = 1.0;									// ai offset multiplier
var wpTurnMulti : float = 1.0;									// waypoint turn multiplier

			// AI related vars ...
		var wpMagnitude : float;
		var increaseDist : float = 40.0;	// this is the value at which we increase the turnrate to make the turn, including the 25m the wpPos is behind the actual waypoint
		var slideDist : float =  15.0;		// at this distance we start a slide until we are too close to the waypoint.
		var slideExit : float = 3.0;
		var slideInput : float = 0.3;		// if calculated horiz input above this, add slide
		
			// waypoint offset handling (AI)				
		var aiAccurracy : float = 1;		// how accurate is the AI with setting their waypoint? 0 is full accuracy, 1 is up to 0.5 * segWidth off, depending on random value
		var wpClamp : float = 0.5;
		
		
					// TEMP
		var checkTransforms : boolean = true;
		var hasAction : boolean= true;				// might be an int that is increased with each event ... decreased with each event closing

private var lastPickup : int = 0;

	//add a global speed modifier...
var speedMod : float = 0.0;

// private var planeSlowdown : float = 1.0;			// slowdown multi if we miss our gate
private var wasHit : boolean = false;				// were we hit by something?
private var	skyshotHitCalled : boolean = false;


	// collision bounce test..
var sideBounce : float = 0.0;				// here we check our collision bounce
var speedBounce : float = 0.0;
private var bounceRevert : float = 80.0;
/*
var bounceMax : float = 12.0;
var bounceThreshold : float = 0.5;
*/
	// handle collision rotation in our Update function, using the angle we get on collision enter
private var hitAngle : float = 0.0;

	// Lap times
var lapTime : float[] = new float[4];
private var raceTime : float = 0.0;


//	##################################################
//
//	Start Function Code...
//
//

	// is played after the start time (during which the get ready is played)
function isReady()
{
		// prepare to run normal animation
	animState = 0;			// .. and set animState to 0 so that the skateSlow is called again
	
		// enable the movement multipliers...
	speedMod = 1.0;

	startHoriz = 1.0;
	
		// play the cam SpeedUp animation
	camSpeed.CrossFade("speedNormal");
	
		// flag to enable controls
	DataTransfer.controlsEnabled = true;
}


	// get spread for AI
function getSpread()
{
				// calculate the spread of the other bots (so they don't clamp together (will still be influenced by accurracy))
			botOffsetTest = Random.value;
				
				// limit change per loop
			if ((botOffsetTest - lastOffset) > 0.2)
			{
				botOffsetTest = lastOffset + 0.2;
			}
			else if ((botOffsetTest - lastOffset) < -0.2)
			{
				botOffsetTest = lastOffset - 0.2;
			}
			
			lastOffset = botOffsetTest;
			
			
			for (var spreadIndex = 0; spreadIndex < (_refHolder.botCount - 1); spreadIndex++)
			{
					// need to define float values .. crap
				var currIndex : float = spreadIndex;
				var count : float = _refHolder.botCount;
			
					// get a random value between 0 and 1. Then add the bot offset and make sure it wraps around if above 1 ...
					//	... then subtracht 0.5 (so we get values between -0.5 and 0.5) and multiply by 1.9 so that we can use 95% of track width.
				_refHolder.botSpread[spreadIndex] = (Mathf.Repeat(( (currIndex / count) + botOffsetTest), 1) - 0.5) * 1.9;
				
				// TEST: print ("Spread: " + ( currIndex / count));
			}
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
		if (wp3D.z < -5.0)
		{
				// we are moving back
			if((wrongDirTimer + wrongDirDisplay) < currTime)
			{
				if(!wrongDirActive)
				{
					// HUD_Message_btn.changeState(1);					// set wrong Dir message
					
						// lap handling to guiHandling
					guiFlags.warningChanged = true;
					guiFlags.warningType = 3;
					guiFlags.warningTime = 2.0;						// set 30 sec time (will be switched off anyway ..)
					
					wrongDirActive = true;
				}
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
				var resetAngle : float = Vector3.Angle(resetDirection, playerTrns.TransformDirection(Vector3(0, 0, 1)));
				

					// align player to new direction
				playerTrns.Rotate(0, resetAngle, 0);
					
					// set the stored quaternion rotation (which is still facing the other direction and will be used in rotation below)
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
				if (wrongDirActive)
				{								// reset wrongDir display if not needed
					wrongDirActive = false;
					// HUD_Message_btn.changeState(2);
					
					// lap handling to guiHandling
					guiFlags.warningChanged = true;
					guiFlags.warningType = 0;
					guiFlags.warningTime = 0.0;						// set 30 sec time (will be switched off anyway ..)
				}
			}
		}
	}
}	


	// sort bot progress function - to be used with invoke repeat ...
function rankSort()
{
// Time testing
// var startTime : float = Time.realtimeSinceStartup;

				// initialize an Array with the correct robot order, as is also used by the trackProgress array
			robots = [0, 1, 2, 3, 4, 5, 6];									

				// Fill the vaultProgress Array ..
			// vaultProgress = _refHolder.trackProgress;							// Doing this seems to create a reference as the ref Holder is sorted, too
			vaultProgress[0] = _refHolder.trackProgress[0];
			vaultProgress[1] = _refHolder.trackProgress[1];
			vaultProgress[2] = _refHolder.trackProgress[2];
			vaultProgress[3] = _refHolder.trackProgress[3];
			vaultProgress[4] = _refHolder.trackProgress[4];
			vaultProgress[5] = _refHolder.trackProgress[5];
			vaultProgress[6] = _refHolder.trackProgress[6];
			
				// now sort the robots by distance traveled ... (last first ...)
			System.Array.Sort(vaultProgress, robots);							// yeah!! 
			
				// the sorting has left us with our robot array in correct order. Since the bot with the highest trackPassed value(traveled farthest)
				// is the first bot, the order of our bots is reversed ...
				//
				//	Now go through the robot array from back to front and put the robots in the correct order into the ranking array
				
				// store the rank of the leading robot in the correct slot (defined by robots[6], which holds the index of the leading robot)
			ranking[robots[6]] = 0;			//if for example our player is first, and I need to look up his place, I just need to check ranking[0], for the second robot in our list it would be ranking[1] which would store the value 2 if he was in third place (0 based)
			
				// store second place in according robot slot etc...
			ranking[robots[5]] = 1;
			ranking[robots[4]] = 2;
			ranking[robots[3]] = 3;
			ranking[robots[2]] = 4;
			ranking[robots[1]] = 5;
			ranking[robots[0]] = 6;
			
				// now get the players rank
			pRank = ranking[0];
				
				
				// Adjust the HUD display of current position (IF it needs change) AND only change HUD while race not over AND only if we have crossed the start line
			if( (publicInfo.pRank != pRank) && (!_refHolder.raceOver) && (lapCount != 0))
			{
					// give info to gui handling
				guiFlags.placeCurr = (pRank + 1);
				guiFlags.placeChanged = true;

			}

				
				// store bot ordered array with ranks
			_refHolder.ranking = ranking;
			
				// store rank ordered bot array
			_refHolder.robots = robots;
			
				// The Player Rank should only be set while the race is not over
			if(!_refHolder.raceOver)
			{
					// store rank in infoHolder
				publicInfo.pRank = pRank;
			}


			// Write to vault for storage:
			
// var endTime :float = Time.realtimeSinceStartup;
// var timeElapsed : float = (endTime-startTime);
// Debug.Log("Avg Time: "+timeElapsed+" seconds");
}


function doEnd ()
{
	_refHolder.podiumStart = true;
}


function Start ()
{	
// Invoke("doEnd", 10.0);

		// set Juice Full value
	juiceFull = BotStats.juiceFull[charIndex];

		// get the new no Target, HUD  GO by name ... (so I don'T need to always connect it)
	// var hudTemp = GameObject.Find("HUD_NoTarget");
	// HUD_noTarget = (hudTemp.GetComponent(HUD_SingleButton) as HUD_SingleButton); 
	
	// hudTemp = GameObject.Find("HUD_HitWeapon");
	// HUD_HitWeapon = (hudTemp.GetComponent(HUD_SingleButton) as HUD_SingleButton);
	
	// hudTemp = GameObject.Find("HUD_HitBot");
	// HUD_HitBot = (hudTemp.GetComponent(HUD_SingleButton) as HUD_SingleButton);
	
	
		// get access to the GUI flags system
	var hudTemp = GameObject.Find("GUI_Handler");
	guiFlags = (hudTemp.GetComponent(GUI_Flags) as GUI_Flags);
	
		// get the virus anim
	virusAnim = GameObject.Find("virusEffekt").GetComponent(Animation) as Animation;
	
		// get the camSpeed anim ...
	//camSpeed = GameObject.Find("camSpeed_holder").GetComponent(Animation) as Animation;
	
		// get the input script
	_inputScript = transform.GetComponent(pInput) as pInput;
	
		// get the podium handler
	_podiumHandler = GameObject.Find("podium_pref").GetComponent(podiumHandler) as podiumHandler;

		// connect the _refHolder to the animscript
	animScript._refHolder = _refHolder;
	animScript.publicInfo = publicInfo;

		// invoke get Ready exit function
	Invoke("isReady", _refHolder.startTime);

		// test parenting the mesh back unter the player
	charMesh.parent = charScaler;
	charMesh.localPosition = Vector3(0,0,0);
	charMesh.localEulerAngles = Vector3(0,0,0);
	
		// get the char mesh renderer...
	// botRenderer = botMesh.GetComponentInChildren(Renderer);
	botRenderer = charMesh.GetComponentInChildren(Renderer);
	
		// store the current mesh index in the getInfo script
	publicInfo.meshIndex = charIndex;

		// invoke the sorting function repeating ..
	InvokeRepeating("rankSort", 0.1, rankSortInterval);
	
		// invoke the wrong Dir function repeating ..
	if(wrongDirEnable)
	{
		InvokeRepeating("checkWrongDir", 0.5, wrongDirInterval);
	}
	
		// invoke repeating for bot offset ...
	InvokeRepeating("getSpread", 0.3, 3.0);		// instad of 1.33
	
		// Get the player transform ....
	playerTrns = transform;
	
		// init the character on the spawnpoint ...
	playerTrns.position = spawnPoint.position;
	playerTrns.rotation = spawnPoint.rotation;
	
		// get the initial moveDirection
	moveDirection = playerTrns.TransformDirection(Vector3(0, 0, 1));	
	
		// set initial stat settings ...
	maxSpeed = BotStats.botSpeed[charIndex];
	rotateSpeed = BotStats.botRotation[charIndex];
	accRate = BotStats.botAcc[charIndex];
	decRate = BotStats.botDec[charIndex];
	speedPlaneSpeed = BotStats.botSpeedpad[charIndex];
	offRoad = BotStats.botOffroad[charIndex];
	
	publicInfo.dnTrans = false;		// Reset the transform flags 
	publicInfo.upTrans = false;
	publicInfo.noTrans = true;

	
		// also set our rigidbody to freeze rotation
	//charController.freezeRotation = true;
	//charController.useGravity = false;

		// the distance is needed .. otherwise the ray stops on the first collider, even if it is the wrong layer ...
 	Physics.Raycast (rayCastSender.position, playerTrns.TransformDirection (Vector3(0, -1, 0)), hoverRayHit, 50.0, hoverRayMask);
 	//Physics.Raycast ((playerTrns.TransformDirection(Vector3(0, 3, 0)) + playerTrns.position), playerTrns.TransformDirection (Vector3.down), hoverRayHit, 50.0, hoverRayMask);
	hoverHitDist = hoverRayHit.distance;						// store the initial distance 
	
		// init the three buffer normals...
	preNormal = hoverRayHit.normal;						// move stored vectors one frame back
	lastNormal = hoverRayHit.normal;
	currNormal = hoverRayHit.normal;

	trgtDownforce = GlobalStats.idleDownforce;								// initially NO Speed, NO Downforce
	hoverMaxDist = GlobalStats.nHoverMaxDist;								// set the initial hover settings...
	speedPlaneExit = -speedPlaneTime;							// we don't want to start in boost mode
	hoverRayMask = 1<<8;										// set the bitmask for the hover ray 

		// set the correct transform flags
	rollAngle = 0.0;											// the roll angle multiplier for plane mode
	planeMode = false;
	normalMode = true;

		// set the ray senders to correct height
	actHeight = skateHeight;		
	
		// set character controller height
//	charCollider.center.y = actHeight;
//	charCollider.center.y = 0.7;								// set height to radius (on the ground)
	
	shieldHeight.localPosition.y = actHeight;

		// set some flags for abyss handling
	// overAbyss = false;	
	shadowHeight = 0.1;				
	// allowHover = true;			

	nextPickup = 0.0;											// init the next Pickuptimer ..		
	lastJump = 0.0;												// init the jump timer
	
		// set initial camera Position ...
	DataVault.camTrgtPosActual = nCamTrgtPos;					// camera target
	
		// set the distance for the last lap no AI speedup zone....
	wpScript = (waypoint.GetComponent(wpAttribs) as wpAttribs); 
	
		// get the full track length
	_refHolder.fullTrack = wpScript.fullLen * 3.0;
	
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
			
				// test with actual wpPlane! Still Jitter Test without offset for now???
			wpPos = (waypoint.TransformDirection(Vector3(0.0, 0.0, 0.0)) + waypoint.position);
	
		
//
//
// ##################################	

	trackLen = wpScript.fullLen;								// get the track len from the first waypoint ...

		// init the dataVaults wpscript ...
	lastWpIndex = -99;											// as I'm checking that waypoints are not triggered twice in one pass, change the index away from first wp

		// these should only be set after start ..init to some value first ...
	segLen = wpScript.segLen;									// get the initial segLen
	wpSpeedup = wpScript.speedAdjust;							// get the initial waypoints speed boost

		// define the area where no ai speedup will be performed
	// noAiSpeedup = ((trackLen * raceLaps) - endzone);
	// DataVault.noAiSpeedup = noAiSpeedup;

	
		// initialize Pickup Type as none
	//pickupHUD.changeState(pickupType);
	guiFlags.pickupType = 0;									// flag initial pickup
	guiFlags.pickupChanged = true;								// force change in gui
	
		// initialize lap and numlaps	(GET THOSE VALUES FROM INIT)
	guiFlags.placeCurr = (DataTransfer.playerPosition);
	guiFlags.placeChanged = true;	
	

		// lap handling to guiHandling
	guiFlags.lapChanged = true;
	guiFlags.lapCount = 3;
	guiFlags.lapCurr = 1;
	

		// init the character on the spawnpoint ... AGAIN
	playerTrns.position = spawnPoint.position;
	playerTrns.rotation = spawnPoint.rotation;
	
		// set the camera correctly
	// mainCam.position = playerTrns.TransformPoint(camPos.localPosition);
	// camTrgt.position = playerTrns.TransformPoint(trgtPos.localPosition);
	
		// set the speed modifier for plane mode back to 1
	// planeSlowdown = 1.0;
	
		// add color
	//botRenderer.material.color = botRenderer.material.color + Color(colorOffset,colorOffset,colorOffset,1);
	botRenderer.material.color = _refHolder.startColor;
	
	
	// cam
	// move camera back
	camAnim.Play("intro");
}


	// revert to normal from car			
function transFromCar()
{
		// set flags
	publicInfo.noTrans = true;
	publicInfo.upTrans = false;
	publicInfo.dnTrans = false;
	
		// shot off rollAngle (only from plane)
	rollAngle = 0.0;
	
		// move camera back
	camAnim.CrossFade("car2norm");
	
		// until autonomous anim function, play transform back animation
	animScript.playTransBack();													
	animState = 0;

		// play transformation sound						
	audio.clip = transformSound;
	audio.Play();
					
		// get the correct height
	actHeight = skateHeight;
	
		// init shield height change
	shieldPosed = false;
		
		// set charController height instead ...
//	charCollider.center.y = actHeight;
	//shieldHeight.localPosition.y = actHeight;
					
		// set robot stat settings ...
	maxSpeed = BotStats.botSpeed[charIndex];
	rotateSpeed = BotStats.botRotation[charIndex];
	accRate = BotStats.botAcc[charIndex];
	decRate = BotStats.botDec[charIndex];
	speedPlaneSpeed = BotStats.botSpeedpad[charIndex];
	offRoad = BotStats.botOffroad[charIndex];
	
		// set the speed modifier for plane mode back to 1
	// planeSlowdown = 1.0;
	
		//flag to reactiveate transform hidden
	guiFlags.isTransformed = false;
}


	// revert to normal from Plane			
function transFromPlane()
{
		// set flags
	publicInfo.noTrans = true;
	publicInfo.upTrans = false;
	publicInfo.dnTrans = false;
	
		// move camera back
	camAnim.CrossFade("plane2norm");
	
		// until autonomous anim function, play transform back animation
	animScript.playTransBack();													
	animState = 0;

		// play transformation sound						
	audio.clip = transformSound;
	audio.Play();
	
		// shot off rollAngle (only from plane)
	rollAngle = 0.0;
					
		// get the correct height
	actHeight = skateHeight;
	
		// init shield height change
	shieldPosed = false;
		
		// set charController height instead ...
//	charCollider.center.y = actHeight;
	// shieldHeight.localPosition.y = actHeight;
					
		// set robot stat settings ...
	maxSpeed = BotStats.botSpeed[charIndex];
	rotateSpeed = BotStats.botRotation[charIndex];
	accRate = BotStats.botAcc[charIndex];
	decRate = BotStats.botDec[charIndex];
	speedPlaneSpeed = BotStats.botSpeedpad[charIndex];
	offRoad = BotStats.botOffroad[charIndex];
	
		// from plane:
	hoverMaxDist = GlobalStats.nHoverMaxDist;

		// longJump off	Handled in triggering(wp)
	// longJump = false;
	
		// set the speed modifier for plane mode back to 1
	// planeSlowdown = 1.0;
	
		//flag to reactiveate transform hidden
	guiFlags.isTransformed = false;
}


	// transform to plane			
function transToPlane()
{
		// set flags
	publicInfo.noTrans = false;
	publicInfo.upTrans = true;
	publicInfo.dnTrans = false;
	
		// move camera back
	camAnim.CrossFade("norm2plane");
	
		// set rollAngle and reset downforce (so that we rise directly)
	rollAngle = BotStats.planeRollMulti[charIndex];
	currDownforce = 0.0;
	
		// set the correct height
	actHeight = planeHeight;
	
		// init shield height change
	shieldPosed = false;
						
		// adjust char controller height
//	charCollider.center.y = actHeight;
	//shieldHeight.localPosition.y = actHeight;
		
		// init the transform up animation
	animScript.playTransUp();		// Start animation
	animState = 7;
					
		// play sound ..
	audio.clip = transformSound;
	audio.Play ();
					
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
	publicInfo.transTimer = currTime + transUpTime;					// set the transformed time will be used for slowdown...
	
		// check for speed right after the trans Timer should end (so we don't have to check every loop)
	// Invoke("checkTransform", (transUpTime + 0.1));
	
		// set the speed modifier for plane mode back to 1
	// planeSlowdown = 1.0;
	
		//flag to deactiveate transform hidden
	guiFlags.isTransformed = true;
}


	// transform to car			
function transToCar()
{
		// set flags
	publicInfo.noTrans = false;
	publicInfo.upTrans = false;
	publicInfo.dnTrans = true;
	
		// move camera back
	camAnim.CrossFade("norm2car");
	
		// set rollAngle and reset downforce (so that we rise directly)
	rollAngle = 0.0;
	currDownforce = 0.0;
	
		// set the correct heigth
	actHeight = carHeight;
	
		// init shield height change
	shieldPosed = false;
						
		// adjust char controller height
//	charCollider.center.y = actHeight;
	//shieldHeight.localPosition.y = actHeight;
		
		// init the transform up animation
	animScript.playTransDn();		// Start animation
	animState = 8;
					
		// play sound ..
	audio.clip = transformSound;
	audio.Play ();
					
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
	
		//flag to deactiveate transform hidden
	guiFlags.isTransformed = true;
}


function speedSlide(duration : float)
{
	// run fuction as long as OVER speedpad and set speed
	// currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod * planeSlowdown;
	currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod;
	
		// play the cam Speed animation
	camSpeed.CrossFade("speedFast");
	
		// set the exit time
	speedPlaneExit = currTime + duration;

		// first hit run once
	if (!speedState)
	{
			// speedlines
		HUD_Speed.playAnim = true;
		
			// set flags
		speedState = true;
		
			// play speed sound
		speedSource.clip = speedSound;
		speedSource.Play ();
		
			// public flag
		publicInfo.speedPlane = true;
	}
}

function speedHit()
{
		// end any possible damage
	endDamage();
	
		// make sure stopped is off
	publicInfo.stopped = false;
	animState = 0;

		// if the Virus is active .. exit
	if(virusAnim.IsPlaying("virus"))
	{
			// end screeen animation
		virusAnim.Play("exit");
		
			// quit the Virus message
		guiFlags.virusState = 3;
		guiFlags.virusWarningExit = 0.0;
	}
	
	
	
	
		// run fuction as long as OVER speedpad and set speed
	// currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod * planeSlowdown;
	currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod;
	
		// play the cam Speed animation
	camSpeed.CrossFade("speedFast");
	
		// set the exit time
	speedPlaneExit = currTime + speedPlaneTime;

		// play speed sound
	speedSource.clip = speedSound;
	speedSource.Play ();

		// first hit run once
	if (!speedState)
	{
			// speedlines
		HUD_Speed.playAnim = true;
		
			// set flags
		speedState = true;

			// public flag
		publicInfo.speedPlane = true;
			
			// call play anim
		animScript.playSkateSlow();
	}
}


function burnJuice()
{
		// the button visuals are handled ON the juice button by the HUD_juiceLoader script!!!!
		// end any possible damage
	endDamage();
	
		// make sure stopped is off
	publicInfo.stopped = false;
	animState = 0;
	
		// if the Virus is active .. exit
	if(virusAnim.IsPlaying("virus"))
	{
			// end screeen animation
		virusAnim.Play("exit");
		
			// quit the Virus message
		guiFlags.virusState = 3;
		guiFlags.virusWarningExit = 0.0;
	}
	
		// play speed sound
	speedSource.clip = speedSound;
	speedSource.Play ();
	
		// if juice not yet active
	if (!publicInfo.juiceActive)
	{
			// set our two juice flags
		publicInfo.juiceActive = true;
		
			// public flag
		//publicInfo.speedPlane = true;

			//
			// change our animation and speed stuff just like on the speedpad..
		
			// run fuction as long as OVER speedpad and set speed
		// currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod * planeSlowdown;
		currSpeed = speedPlaneSpeed  * offRoadMulti * speedMod;
		
			// play the cam Speed animation
		camSpeed.CrossFade("speedFast");
		
			// speedlines
		HUD_Speed.playAnim = true;

		
			// call play anim
		animScript.playSkateSlow();
	}
}



function startHitFeedback (bot : int, weapon : int)
{
// DEBUG
			//	print ("hit Feedback Called" + bot);
// !!!!!!!
//
//	The charIndex of gthe aiMove is 0-Based. The array in our GUI_manager is setup the dsame way.
//	Make sure I pass the actual index (was -1)
//

		// increase hit feedback count
	hitFeedback++;
	
		// play sound ...
	badgeSource.clip = strikeSound;
	badgeSource.Play ();

		// set the icons
	if (hitFeedback > 0)
	{
			// guiFlags Handling
		guiFlags.hitChanged = true;
		guiFlags.hitWeapon = weapon;
			// bot array is 0-based; So vektor is bot 0! But I'm using 0 as "no bot" in the GUI, so I add 1 here and subtract it when showing the botIcon!!
		guiFlags.hitBot = bot + 1;
	
			// count hits...
		switch (guiFlags.hitWeapon)
		{
			case 1:
						// badge Hit Virus info
					DataTransfer.hitsRace[2]++;
					DataTransfer.hitsCareer[2]++;
					DataTransfer.hitsRace[9]++;
					DataTransfer.hitsCareer[9]++;
					
						// send analytics
					//Google.analytics.logEvent("stats", "damageDealt", "virus");
				break;
				
			case 2:
						// badge Hit Missle info
					DataTransfer.hitsRace[0]++;
					DataTransfer.hitsCareer[0]++;
					DataTransfer.hitsRace[9]++;
					DataTransfer.hitsCareer[9]++;
					
						// send analytics
					//Google.analytics.logEvent("stats", "damageDealt", "missile");
				break;
				
			case 4:
						// badge Hit Bada info
					DataTransfer.hitsRace[4]++;
					DataTransfer.hitsCareer[4]++;
					DataTransfer.hitsRace[9]++;
					DataTransfer.hitsCareer[9]++;
						
						// send analytics
					//Google.analytics.logEvent("stats", "damageDealt", "caltrop");
				break;
				
			case 6:
						// badge Hit Skyshot info
					DataTransfer.hitsRace[1]++;
					DataTransfer.hitsCareer[1]++;
					DataTransfer.hitsRace[9]++;
					DataTransfer.hitsCareer[9]++;
					
						// send analytics
					//Google.analytics.logEvent("stats", "damageDealt", "skyshot");
				break;
			
			case 7:
						// badge Hit Iso info
					DataTransfer.hitsRace[3]++;
					DataTransfer.hitsCareer[3]++;
					DataTransfer.hitsRace[9]++;
					DataTransfer.hitsCareer[9]++;
					
						// send analytics
					//Google.analytics.logEvent("stats", "damageDealt", "shrink");
				break;
				
			case 9:
						// badge Hit Leader info
					DataTransfer.hitsRace[10]++;
					DataTransfer.hitsCareer[10]++;
					DataTransfer.hitsRace[9]++;
					DataTransfer.hitsCareer[9]++;
					
						// send analytics
					//Google.analytics.logEvent("stats", "damageDealt", "leadershot");
				break;
		}
		
			// show badge
		if (DataTransfer.hitsRace[9] == 5)
		{
				// dangerous equipment
			guiFlags.badgeChanged = true;
			guiFlags.badgeType = 2;
			
				// increase badges counters
			DataTransfer.badgesRace[guiFlags.badgeType]++;
			DataTransfer.badgesCareer[guiFlags.badgeType]++;
			DataTransfer.badgeCount++;
			
				// send analytics
			//Google.analytics.logEvent("stats", "badges", "dangerousEquipment");
				
				// play sound ...
			badgeSource.clip = strikeSound;
			badgeSource.Play ();
		}
		else if (DataTransfer.hitsRace[9] == 10)
		{
				// Iron Fist
			guiFlags.badgeChanged = true;
			guiFlags.badgeType = 3;
			
				// increase badges counters
			DataTransfer.badgesRace[guiFlags.badgeType]++;
			DataTransfer.badgesCareer[guiFlags.badgeType]++;
			DataTransfer.badgeCount++;
			
				// send analytics
			//Google.analytics.logEvent("stats", "badges", "ironFist");
			
				// play sound ...
			badgeSource.clip = strikeSound;
			badgeSource.Play ();
		}
	
			// set hit bot display
		// HUD_HitBot.changeState(bot);
				
			// set hit weapon display
		// HUD_HitWeapon.changeState(weapon);
		
			// invoke clearing of display after 2 seconds
		Invoke("endHitFeedback", 2.0);
	}
	
}


function endHitFeedback ()
{
	
		// check if no other feedback remains
	hitFeedback--;
	
	/*
		// clear the display ...
	if (hitFeedback <= 0)
	{
			// reset hit bot display
		HUD_HitBot.changeState(7);
		
			// reset hit weapon display
		HUD_HitWeapon.changeState(0);
	}
	*/
}


function beginDamage(speed : float, currMod : float, effectTime : float)
{
		// if hit, exit speedPlane
	speedPlaneExit = 0.0;
	
		// if hit reset juice loader
	//juiceLeft = 0.0;
	//guiFlags.juiceLeft = juiceLeft;
	
		// play the cam Slow animation
	camSpeed.CrossFade("speedSlow");

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
	}
}


function endDamage()
{


		// flag end damage (so that skyshot hit has no function)
	skyshotHitCalled = false;
	
		// set back to skate slow
	publicInfo.stopped = false;
	animState = 0;									// so that playSkateSlow gets played next loop

		// reset speed modifier
	speedMod = 1.0;

		// stop virus sound
	virusSource.Stop ();

		// play the cam SpeedUp animation
	camSpeed.CrossFade("speedNormal");
	
		// flag end of hit
	wasHit = false;
	
		// check special occassions ...
	if (isotopeHit)
	{		
			// shut isotope off
		isotopeHit = false;
		
			// play the grow animation
		charScalerAnim.Play("scaleUp");
	}
	
		// call play anim
	// animScript.playSkateSlow();
	
		// reset player occupied
	DataTransfer.playerOccupied = false;
}

		
function skyshotFire()
{
		// shot fired ... turn off warning
	// skyShotWarning.playAnim = false;

		// no Exit Warning
	guiFlags.warningChanged = true;
	guiFlags.warningType = 0;
	guiFlags.warningTime = 0.0;						// set 30 sec time (will be switched off anyway ..

		// handle evasion decision ...
		// check if we are braking
	if(brakesActive)
	{
		_refHolder.allSkyshot[botIndex].position = (playerTrns.TransformDirection(Vector3(2, -hoverHitDist, 4)) + playerTrns.position);
	}
	else if (shieldSet)
	{
		_refHolder.allSkyshot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, -hoverHitDist, 4)) + playerTrns.position);
		//shieldDisable();
	}
	else
	{
			// ray hits player
		_refHolder.allSkyshot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, -hoverHitDist, 3)) + playerTrns.position);
		
	}
					
		// instantiate the ray
	_refHolder.allSkyshotScr[botIndex].setTag = "sky";
	_refHolder.allSkyshotScr[botIndex].doFire();
	
		// flag player occupied
	DataTransfer.playerOccupied = true;
	

}


function leadershotFire()
{
		// shot fired ... turn off warning
	guiFlags.warningChanged = true;
	guiFlags.warningType = 0;
	guiFlags.warningTime = 0.0;						// set 30 sec time (will be switched off anyway ..
	
		// handle evasion decision ...
		// check if we are braking
	if(brakesActive)
	{
		_refHolder.allLeaderShot[botIndex].position = (playerTrns.TransformDirection(Vector3(2, -hoverHitDist, 4)) + playerTrns.position);
	}
	else if (shieldSet)
	{
		_refHolder.allLeaderShot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, -hoverHitDist, 3)) + playerTrns.position);
		//shieldDisable();
	}
	else
	{	
			// ray hits player
		_refHolder.allLeaderShot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, -hoverHitDist, 3)) + playerTrns.position);
	}
					
		// instantiate the ray 
	// OLD - PLACE ON GROUND   _refHolder.allLeaderShot[botIndex].position = (playerTrns.TransformDirection(Vector3(0, 0, shotPos)) + playerTrns.position);
	
	_refHolder.allLeaderShotScr[botIndex].setTag = "leader";
	_refHolder.allLeaderShotScr[botIndex].doFire();
	
		// flag player occupied
	DataTransfer.playerOccupied = true;
}



function skyshotHit()
{
		// check that we haven't cancelled our shot already
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
		speedMod = 0.5;
		
			// set the damage effect timer
		effectTimer = currTime + 1.2;
	}
}



function shieldEnable()
{
	if (!shieldSet)
	{
			// shield height
		shieldHeight.localPosition.y = actHeight;
					
			// set shield visible
		shieldSet = true;
		// effectTimer = currTime + 40.0;
					
			// play animations ...
		shieldAnim.Play("expand");	
		shieldAnim.CrossFadeQueued("active", 0.3, QueueMode.CompleteOthers);
		
			// invoke disabling the shield
		Invoke("shieldDisable", 40.0);
	}

}


	// Disable the shield
function shieldDisable()
{
	if (shieldSet)
	{
		shieldSet = false;
				
			// start FadeAway anim early
		shieldAnim.Play("collapse");
	}
}


	// reset after drop							
function abyssReset()
{
		// reset the player position ..
	playerTrns.position = abyssRespawn.position;			// position the player correctly
	playerTrns.Translate(0, 1, 0);							// move player up 1 unit
	playerTrns.rotation = abyssRespawn.rotation;
	currSpeed = 0.0;									// we dropped. Set our speed to 0
	currDownforce = 0.0;								// we were falling FAST! Reset our downforce
	
		// set the camera correctly
	mainCam.position = playerTrns.TransformPoint(camPos.localPosition);
	camTrgt.position = playerTrns.TransformPoint(trgtPos.localPosition);
	
		// set anim handler to stopped ..
	publicInfo.stopped = true;
					
		// start the stopped animation
	animScript.playSkateSlow();
	// print ("line 1268");
	animState = 6;										// set to call playSkateSlow next
	
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
	animScript.playSkateSlow();
	effectTimer = abyssSlowTime;
	wasHit = true;
}


	// function that handles pickup collection
function handlePickup ()
{
		//tut handling
	if (DataTransfer.tutEnable)
	{
		if (!DataTransfer.tutFinish[6])
		{
			DataTransfer.tutExit = false;
			DataTransfer.currTut = 6;
			_inputScript.startTutorial();
		}
	}

				
		// get a random value
	var randomValue : float = Random.value;
	
	//	####################
	//
	//		Handle pickup distribution manually ...
	
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
	
	if (publicInfo.dnTrans)
	{
		if (pickupType == 3)
		{
			pickupType = 8;
		}
	}
	
	
// STATES:	
// pickupOverride
//pickupType = 6;
//aimEnable = true;
		// Find the Index Out of range bug ...
// 	Debug.Log("Selected Pickup: " + pickupType);

		// Handle pickups and Unlocks
	switch (pickupType)
	{
		case 0:
					// no pickup selected ... do nothing
			break;
			
		case 1:
					// if Virus is locked ...
				if (!DataTransfer.pickupUnlocks[0])
				{
						// if Missle is locked
					if (!DataTransfer.pickupUnlocks[1])
					{
							// if Skyshot is locked
						if (!DataTransfer.pickupUnlocks[5])
						{
							if (!DataTransfer.pickupUnlocks[8])
							{
									// if all offenses are locked .. set shield
								pickupType = 5;
								aimEnable = false;
							}
							else
							{
									// enable LeaderShot
								pickupType = 9;
								aimEnable = false;
							}
						}
						else
						{
								// enable skyshot
							pickupType = 6;
							aimEnable = true;							
						}
					}
					else
					{
							// enable Missle
						pickupType = 2;
						aimEnable = true;
					}
				
				}
				else
				{
						// enable Virus
					pickupType = 1;
					aimEnable = true;
				}
			break;
		
		case 2:
					// if Missle is locked ...
				if (!DataTransfer.pickupUnlocks[1])
				{
						// if Virus is locked
					if (!DataTransfer.pickupUnlocks[0])
					{
							// if Skyshot is locked
						if (!DataTransfer.pickupUnlocks[5])
						{
							if (!DataTransfer.pickupUnlocks[8])
							{
									// if all offenses are locked .. set shield
								pickupType = 5;
								aimEnable = false;
							}
							else
							{
									// enable LeaderShot
								pickupType = 9;
								aimEnable = false;
							}
						}
						else
						{
								// enable skyshot
							pickupType = 6;
							aimEnable = true;							
						}
					}
					else
					{
							// enable Virus
						pickupType = 1;
						aimEnable = true;
					}
				
				}
				else
				{
						// enable Missle
					pickupType = 2;
					aimEnable = true;
				}
			break;
			
		case 3:
					// if Hyperspace is locked ...
				if (!DataTransfer.pickupUnlocks[2])
				{
						// if Speed is locked
					if (!DataTransfer.pickupUnlocks[7])
					{
							// if Shield is locked
						if (!DataTransfer.pickupUnlocks[4])
						{
								// set no Pickup
							pickupType = 0;
							aimEnable = false;
						}
						else
						{
								// enable shield
							pickupType = 5;
							aimEnable = false;
						}
					}
					else
					{
							// enable Speed
						pickupType = 8;
						aimEnable = false;
					}
				}
				else
				{		// handle hyperspace
					aimEnable = false;
					pickupType = 3;
	
						// execute applyPickup (Hyperspace)
					applyPickup();
					
						// show autopilot info
					guiFlags.warningChanged = true;
					guiFlags.warningType = 9;
					guiFlags.warningTime = 2.0;						// set 30 sec time (will be switched off anyway ..)
				}
			break;
		
		case 4:
					// if Badaboom is locked ...
				if (!DataTransfer.pickupUnlocks[3])
				{
						// if Isotope is locked
					if (!DataTransfer.pickupUnlocks[6])
					{
							// enable shield
						pickupType = 5;
						aimEnable = false;
					}
					else
					{
							// enable Isotope
						pickupType = 7;
						aimEnable = false;
					}
				}
				else
				{		// enable Badaboom
					aimEnable = false;
					pickupType = 4;
				}
			break;
			
		case 5:
					// if Shield is locked ...
				if (!DataTransfer.pickupUnlocks[4])
				{
						// if Speed is locked
					if (!DataTransfer.pickupUnlocks[7])
					{
							// if Hyperspace is locked
						if (!DataTransfer.pickupUnlocks[2])
						{
								// set no Pickup
							pickupType = 0;
							aimEnable = false;
						}
						else
						{
								// handle hyperspace
							aimEnable = false;
							pickupType = 3;
			
								// execute applyPickup (Hyperspace)
							applyPickup();
						}
					}
					else
					{
							// enable Speed
						pickupType = 8;
						aimEnable = false;
					}
				}
				else
				{		// enable shield
					aimEnable = false;
					pickupType = 5;
				}
			break;
			
		case 6:
					// if Skyshot is locked ...
				if (!DataTransfer.pickupUnlocks[5])
				{
						// if Missle is locked
					if (!DataTransfer.pickupUnlocks[1])
					{
							// if Virus is locked
						if (!DataTransfer.pickupUnlocks[0])
						{
							if (!DataTransfer.pickupUnlocks[8])
							{
									// if all offenses are locked .. set shield
								pickupType = 5;
								aimEnable = false;
							}
							else
							{
									// enable LeaderShot
								pickupType = 9;
								aimEnable = false;
							}
						}
						else
						{
								// enable Virus
							pickupType = 1;
							aimEnable = true;							
						}
					}
					else
					{
							// enable Missle
						pickupType = 2;
						aimEnable = true;
					}
				
				}
				else
				{
						// enable Skyshot
					pickupType = 6;
					aimEnable = true;
				}
			break;
			
		case 7:
					// if Isotope is locked ...
				if (!DataTransfer.pickupUnlocks[6])
				{
						// if Badaboom is locked
					if (!DataTransfer.pickupUnlocks[3])
					{
							// enable shield
						pickupType = 5;
						aimEnable = false;
					}
					else
					{
							// enable Badaboom
						pickupType = 4;
						aimEnable = false;
					}
				}
				else
				{		// enable Isotope
					aimEnable = false;
					pickupType = 7;
				}
			break;
			
		case 8:
					// if Speed is locked ...
				if (!DataTransfer.pickupUnlocks[7])
				{
						// if Shield is locked
					if (!DataTransfer.pickupUnlocks[4])
					{
							// if Hyperspace is locked
						if (!DataTransfer.pickupUnlocks[2])
						{
								// set no Pickup
							pickupType = 0;
							aimEnable = false;
						}
						else
						{
								// handle hyperspace
							aimEnable = false;
							pickupType = 3;
			
								// execute applyPickup (Hyperspace)
							applyPickup();
						}
					}
					else
					{
							// enable Shield
						pickupType = 5;
						aimEnable = false;
					}
				}
				else
				{		// enable shield
					aimEnable = false;
					pickupType = 8;
				}
			break;
		
		case 9:
					// if Leader Shot is locked ...
				if (!DataTransfer.pickupUnlocks[8])
				{
						// if Missle is locked
					if (!DataTransfer.pickupUnlocks[1])
					{
							// if Skyshot is locked
						if (!DataTransfer.pickupUnlocks[5])
						{
							if (!DataTransfer.pickupUnlocks[0])
							{
									// if all offenses are locked .. set shield
								pickupType = 5;
								aimEnable = false;
							}
							else
							{
									// enable Virus
								pickupType = 1;
								aimEnable = true;
							}
						}
						else
						{
								// enable skyshot
							pickupType = 6;
							aimEnable = true;							
						}
					}
					else
					{
							// enable Missle
						pickupType = 2;
						aimEnable = true;
					}
				
				}
				else
				{
						// enable Leader Shot
					pickupType = 9;
					aimEnable = false;
				}
			break;
	}

	
		// Find the Index Out of range bug ...
// 	Debug.Log("Unlock Checked Pickup: " + pickupType);



		// change HUD etc ...
	// pickupHUD.changeState(pickupType);
	guiFlags.pickupType = pickupType;							// flag current pickup
	guiFlags.pickupChanged = true;								// force change in gui

		// store pickup Type
	publicInfo.pickupType = pickupType;			
}


function startMissle ()
{
		// deploy missle 2 m in front of player
	_refHolder.allMissle[botIndex].position = (playerTrns.position + playerTrns.TransformDirection(Vector3(0, 1.5, 2.0)));
	_refHolder.allMissle[botIndex].rotation = playerTrns.rotation;
				
		// run targetting
	if(hasTarget)
	{
		_refHolder.allMissleScr[botIndex].LockOn(aimIndex, waypoint, publicInfo.wpOffset);
	}
	else
	{
		_refHolder.allMissleScr[botIndex].LockOn(7, waypoint, publicInfo.wpOffset);
	}

		// play screen flash
	// HUD_Flash.playAnim = true;
	guiFlags.flashChanged = true;
					
		// shut off aiming
	aimEnable = false;
}


function startBadaboom ()
{
		// play screen flash
	//HUD_Flash.playAnim = true;
	guiFlags.flashChanged = true;

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
		// play screen flash
	//HUD_Flash.playAnim = true;
	guiFlags.flashChanged = true;
		
		
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


	// function that handles pickup Usage ...
// function applyPickup (currTime : float)
function applyPickup ()
{
		

		// we need a timer here as one spacebar tap fires the script 6 times ...
	if(nextPickup <= currTime)
	{
		nextPickup = currTime + 1.0;
	
		// DEBUG
	//pickupType = 3;
	
		switch (pickupType)
		{
			case 0:
				break;
			case 1:
				// Virus

						// infect targeted playerno rc
					if(hasTarget)
					{
							// infect targeted player
						_refHolder.allGetInfo[aimIndex].infection(true);

// STATES:
							// set state to attack
						publicInfo.playerState = 7;
						
							// play Attack animation
						animScript.playAttack();
						
							// shut off aiming
						aimEnable = false;
						
							// reset our item
						pickupType = 0;
						// pickupHUD.changeState(pickupType);
						guiFlags.pickupType = pickupType;							// flag current pickup
						guiFlags.pickupChanged = true;								// force change in gui
					}
					else
					{
							// if no target, flash info...
						// HUD_noTarget.playAnim = true;
						
							// no target message from gui flags
						guiFlags.warningChanged = true;
						guiFlags.warningType = 7;
						guiFlags.warningTime = 2.0;						// set 30 sec time (will be switched off anyway ..
					}
				break;
				
			case 2:
				// Missle
					//if(hasTarget)
					//{
// STATES:
							// set state to attack
						publicInfo.playerState = 7;
					
							// play Attack animation
						animScript.playAttack();
						
							// I want to deploy while the animation has started .. so .
						Invoke("startMissle", 0.4);	
						
							// reset our item
						pickupType = 0;
						// pickupHUD.changeState(pickupType);
						guiFlags.pickupType = pickupType;							// flag current pickup
						guiFlags.pickupChanged = true;								// force change in gui
					//}

				break;
				
			case 3:
				// Hyperspace
					autoPilot = true;
					hyperspace = true;
					
						// set our max hyperspace time to 30 sec for now
					hyperspaceTime = currTime + 20.0;
						
						// transform to plane
					transToPlane();
					
						// in case we are in a jump, set jump info to off
					publicInfo.jumping = false;
					isJumping = 0;
					airborne = false;
					
						// play cam Speed anim
					camSpeed.CrossFade("speedFast");
					
						// set flag
					hyperspaceExit = false;
// STATES:					
						// set transState to 1 (upTrans) and hitType to 3 (hyperspace)	
					publicInfo.transState = 1;
					publicInfo.hitType = 3;

						// set the effect timer
					// effectTimer = currTime + 20.0;		// Hyperspace rund 20 sec or until we are top rank!
					
						// play screen flash
					//HUD_Flash.playAnim = true;
					guiFlags.flashChanged = true;
					
						// speedlines
					HUD_Speed.playAnim = true;
					
						// reset our item
					pickupType = 0;
					// pickupHUD.changeState(pickupType);
					guiFlags.pickupType = pickupType;							// flag current pickup
					guiFlags.pickupChanged = true;								// force change in gui
				break;
				
			case 4:
				// Badaboom

// STATES:
						// set state to attack
					publicInfo.playerState = 7;
						
						// play Attack animation
					animScript.playAttack();
				
						// I want to fire mid anim ...
					Invoke("startBadaboom", 0.4);
					
						// reset our item
					pickupType = 0;
					// pickupHUD.changeState(pickupType);
					guiFlags.pickupType = pickupType;							// flag current pickup
					guiFlags.pickupChanged = true;								// force change in gui
				break;
				
			case 5:
				// Shield

// STATES:
						// set hitType to shield
					publicInfo.hitType = 5;
						
						// play screen flash
					//HUD_Flash.playAnim = true;
					guiFlags.flashChanged = true;
					
						// run shield enabling function
					shieldEnable();
					
						// reset our item
					pickupType = 0;
					// pickupHUD.changeState(pickupType);
					guiFlags.pickupType = pickupType;							// flag current pickup
					guiFlags.pickupChanged = true;								// force change in gui
				break;
				
			case 6:
				// Skyblast
					if(hasTarget)
					{	
// STATES:
							// set state to attack
						publicInfo.playerState = 7;
											
							// play Attack animation
						animScript.playAttack();
						
							// play screen flash
						//HUD_Flash.playAnim = true;
						guiFlags.flashChanged = true;
						
							// shut off aiming
						aimEnable = false;
						
							// send skyblast
						_refHolder.allGetInfo[aimIndex].skyshot(true);
	
							// reset our item
						pickupType = 0;
						// pickupHUD.changeState(pickupType);
						guiFlags.pickupType = pickupType;							// flag current pickup
						guiFlags.pickupChanged = true;								// force change in gui
					}
					else
					{
							// if no target, flash info...
						// HUD_noTarget.playAnim = true;
						
							// no target message from gui flags
						guiFlags.warningChanged = true;
						guiFlags.warningType = 7;
						guiFlags.warningTime = 2.0;						// set 30 sec time (will be switched off anyway ..
					}
				break;
				
			case 7:
				// Isotope
// STATES:
						// set state to attack
					publicInfo.playerState = 7;
				
						// play Attack animation
					animScript.playAttack();
					
						// I want to drop mid anim ...
					Invoke("startIsotope", 0.4);
					
						// reset our item
					pickupType = 0;
					// pickupHUD.changeState(pickupType);
					guiFlags.pickupType = pickupType;							// flag current pickup
					guiFlags.pickupChanged = true;								// force change in gui
				break;
				
			case 8:
				// Speed
					
						// enable speed
					speedHit();
						
						// reset our item
					pickupType = 0;
					// pickupHUD.changeState(pickupType);
					guiFlags.pickupType = pickupType;							// flag current pickup
					guiFlags.pickupChanged = true;								// force change in gui
				break;
				
			case 9:
						// Leader Shot
					if(_refHolder.robots[6] != botIndex)
					{										// If we are not the race leader.... (.rpbots[] reverse order)
															// The Race leader: aimIndex = _refHolder.robots[6]

							// set state to attack
						publicInfo.playerState = 7;
											
							// play Attack animation
						animScript.playAttack();
						
							// play screen flash
						//HUD_Flash.playAnim = true;
						guiFlags.flashChanged = true;
						
							// send skyblast to the race leader
						_refHolder.allGetInfo[_refHolder.robots[6]].leadershot(true);
	
							// reset our item
						pickupType = 0;
		
						guiFlags.pickupType = pickupType;							// flag current pickup
						guiFlags.pickupChanged = true;								// force change in gui
					}
					else
					{
							// if no target, flash info...
						// HUD_noTarget.playAnim = true;
						
							// no target message from gui flags
						guiFlags.warningChanged = true;
						guiFlags.warningType = 7;
						guiFlags.warningTime = 2.0;						// set 30 sec time (will be switched off anyway ..
					}
				break;
				
		}
	}
}



function infection ()
{
		// set cooldown
	//publicInfo.cooldown = Time.time + cooldownTime;

	if (hyperspace)
	{
		// do nothing! You're immune
	}
	else if (shieldSet)
	{
			// shield protects
		shieldDisable();
		
			// no warning message from gui flags
		guiFlags.warningChanged = true;
		guiFlags.warningType = 10;
		guiFlags.warningTime = 1.0;						// set 30 sec time (will be switched off anyway ..
	}
	else
	{
			// handle virus hit badge
		DataTransfer.damageRace[4]++;
		DataTransfer.damageCareer[4]++;
		
			// send analytics
		//Google.analytics.logEvent("stats", "damageTaken", "virus");
			
			// handle offense hit badge
		DataTransfer.damageRace[8]++;
		DataTransfer.damageCareer[8]++;
					
			// handle weapon hit badge
		DataTransfer.damageRace[9]++;
		DataTransfer.damageCareer[9]++;
		
			// start HUD animation
		// virusHUD.playAnim = true;
		guiFlags.virusChanged = true;
		
			// start Virus anim
		//virusAnim.Play("Virus");
		
			// play hit sound
		virusSource.clip = virusSound;
		virusSource.Play ();
		
			// if hit reset juice loader
		//juiceLeft = 0.0;
		//guiFlags.juiceLeft = juiceLeft;
		
			// flag player occupied
		DataTransfer.playerOccupied = true;
	}
}



function skyshot ()
{
		// set cooldown
	//publicInfo.cooldown = Time.time + cooldownTime;
		
	if (hyperspace)
	{
		// do nothing! You're immune
	}
		// if this was used, you'd never know that a skyshot hit you
		/*
	else if (shieldSet)
	{
			// shield protects
		shieldDisable();
	}
		*/
	else
	{
			// warmUp:
			// add skyshot warning HUD here ...
		// skyShotWarning.playAnim = true;
		
			// no warning message from gui flags
		guiFlags.warningChanged = true;
		guiFlags.warningType = 2;
		guiFlags.warningTime = 2.0;						// set 30 sec time (will be switched off anyway ..

			// start firing in 2.0 sec.
		Invoke("skyshotFire", 2.0);	
		
			// flag player occupied
		DataTransfer.playerOccupied = true;
	}
}


function leadershot ()
{
		// set cooldown
	//publicInfo.cooldown = Time.time + cooldownTime;

	if (hyperspace)
	{
		// do nothing! You're immune
	}
		/*
	else if (shieldSet)
	{
			// shield protects
		shieldDisable();
	}
		*/
	else
	{
			// no warning message from gui flags
		guiFlags.warningChanged = true;
		guiFlags.warningType = 8;
		guiFlags.warningTime = 2.0;						// set 30 sec time (will be switched off anyway ..

			// start firing in 2.0 sec.
		Invoke("leadershotFire", 2.0);	
		
			// flag player occupied
		DataTransfer.playerOccupied = true;
	}
}

	// show missle warning!
function missleWarning()
{			
	if(!playWarning)
	{
		// missleWarningL.playAnim = true;
		// missleWarningR.playAnim = true;
		
			// no target message from gui flags
		guiFlags.warningChanged = true;
		guiFlags.warningType = 1;
		guiFlags.warningTime = 2.0;						// set 30 sec time (will be switched off anyway ..
		
		playWarning = true;
		
			// flag player occupied
		DataTransfer.playerOccupied = true;
	}
}


	// exit missle warning
function missleWarningExit()
{
	if(playWarning)
	{
		// missleWarningL.playAnim = false;
		// missleWarningR.playAnim = false;
		
			// no target message from gui flags
		guiFlags.warningChanged = true;
		guiFlags.warningType = 0;
		guiFlags.warningTime = 0.0;						// set 30 sec time (will be switched off anyway ..
		playWarning = false;
		
		Invoke("endOccupy", 2.0);
	}
}


function endOccupy()
{
		// flag player occupied
	DataTransfer.playerOccupied = false;
}


function missleImpact()
{
	if (hyperspace)
	{
		// do nothing! You're immune
		// flag player not occupied
		
	DataTransfer.playerOccupied = false;
	}
	else if (shieldSet)
	{
		shieldDisable();
		
		// flag player not occupied
	DataTransfer.playerOccupied = false;
	}
	else
	{
			// handle missle hit badge
		DataTransfer.damageRace[5]++;
		DataTransfer.damageCareer[5]++;
		
			// send analytics
		//Google.analytics.logEvent("stats", "damageTaken", "missile");
			
			// handle offense hit badge
		DataTransfer.damageRace[8]++;
		DataTransfer.damageCareer[8]++;
					
			// handle weapon hit badge
		DataTransfer.damageRace[9]++;
		DataTransfer.damageCareer[9]++;
	
			// start damage handling ...
		beginDamage (0.4, 0.4, 4.0);
		
			// play hit sound
		//audio.clip = explosionSound;
		//audio.Play ();
	}
	
		// exit warning just in case
	missleWarningExit();	
}


	// leave this in as the default action for now. If pickup collected use that ...
// function applyJump (currTime : float)
function applyJump ()
{


	if (isControllable)
	{
	

		//if (controller.isGrounded - in active range ... AND we're not transformed Up or Dn)
		if ((hoverHitDist >= GlobalStats.hoverMinDist) && (hoverHitDist <= hoverMaxDist) && (publicInfo.noTrans))
		{
			if ((lastJump + GlobalStats.jumpPause) < currTime)
			{														// check if enough time has passed to jump again
			
// STATES:
					// set state to Jump
				publicInfo.playerState = 8;
			
				currDownforce = GlobalStats.jumpSpeed;
					// store initial JumpOffTime
				lastJump = currTime;					// specify time for next jump
				isJumping = 1;							// set jumping flag
				airborne = true;
				animScript.playJump();
				animState = 4;		
				
					// broadcast Jump
				publicInfo.jumping = true;
				
					// play sound
				audio.clip = jumpSound;
				audio.Play ();
							
			}
		}
		// add to JumpSpeed for a given number of seconds if button held ....
	}
}

// ####################################
// ####################################
//
//	Move Character Code	
	
	
// function moveCharacter(dTime : float, currTime : float, vertInput : float, horizInput : float, doSlide : int) 

function Update()
{
//print (DataTransfer.playerOccupied);

	if (!_refHolder.podiumBlack)
	{
		
			// Check if we are in pause mode ...
		if(_refHolder.gameEnabled)
		{
				// get our time handlers ...
			dTime = Time.deltaTime;									// Get the time ONCE
			currTime = Time.time - _refHolder.pausedTime;			//subtract the time we spent in pause mode	
			
			// DEBUG
			//print ("Time: " + currTime);
			
				// get our current input and multiply with the start value (for get ready handling) ..
			vertInput = publicInfo.vertInput;
			horizInput = publicInfo.horizInput;
			doSlide = publicInfo.doSlide;
	
			dir = Vector3(0,0,0);							// for handling the acceleration ...
			
				// are we braking?
			brakesActive = false;		
	
				// adjust shield height if not set
			if (!shieldPosed)
			{
				shieldHeight.localPosition.y = Mathf.MoveTowards(shieldHeight.localPosition.y, actHeight, dTime);
				if (Mathf.Abs(shieldHeight.localPosition.y - actHeight) < 0.02)
				{
					shieldPosed = true;
				}
			}
	
	
	//	######################################################
	//
	//	AUTO PILOT CODE !!		works on rotation only 
	//
			
					// get our hit waypoint in local space (as also needed for wrong dir, outside autopilot loop)..
				wp3D = playerTrns.InverseTransformPoint(wpPos);	
				wp3D.y = 0.0;										// remove height from equasion				
				
				if(autoPilot)
				{
						// Set forward input
					vertInput = 1.0;	
	
						// Orient to the next Waypoint (instantly)
			
						//	######################################################################################
						//
						// Step 1: Get the wayPoint in local Player space (and as Vector2 -> only x,z position)
	
						// get magnitude
					wpMagnitude = wp3D.magnitude;
					
						// test getting an input value from the waypoint (to use in our function below) NICE AND SMOOTH!! ;)
					horizInput = (wp3D.x / wpMagnitude) * wpTurnMulti;
					
						// no sliding normally
					doSlide = 0;
					
						// if close enough enable slide AND angle big enough to make sense ... horizInput of 0.5 is reached if waypoint at 45 deg angle ..
					if(wpMagnitude < (slideDist) && Mathf.Abs(horizInput) > slideInput )
					{
							// just before the waypoint we want to exit the slide otherwise set it...
						if(wpMagnitude > slideExit)
						{
							doSlide = 1;
						}
					}
					
						// now based on the distance to the waypoint, we might need to force higher turnrates ... create a multiplier based on that..
					if(wpMagnitude < (increaseDist))
					{
							// adjust the turn rate in relation to distance .. if the waypoint is close we need to increase steering, but never above 1/-1
						horizInput = Mathf.Clamp((horizInput * (increaseDist / wpMagnitude)), -1.0, 1.0);
					}
	
						// ####################################################
						//
						//	Hyperspace handling ...
						//
					if(hyperspace)
					{
						if (pRank == 0)
						{
								// if we are already first, make sure we ride hyperspace for a few seconds... set a min time ONCE
							if (!hyperspaceExit)
							{
								hyperspaceTime = currTime + 3.0;
								hyperspaceExit = true;
							}
						}
							// check if we need to shut autopilot off ... (enable a timer afterwards)
						if (hyperspaceTime < currTime)
						{	
						
								// disable the exit falg
							hyperspaceExit = false;
							
								// shut autopilot off if not race over
							if(publicInfo.raceOver != true)
							{	
								autoPilot = false;
							}
							hyperspace = false;
							
								// if we are in a long jump, continue transformed ... otherwise revert
							if(!longJump)
							{
									//transform back
								transFromPlane();
							}
							/*	not needed as all gates are now speed ...
							else 
							{
									// if in a long Jump, extend our timer
								publicInfo.transTimer = currTime + transUpTime;
							}
							*/
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
				
	// end autopilot code NEW!!! (hopefully faster)
	//
	//	END AUTO PILOT CODE
	//
	//	######################################################
	
	
	
	
	//	##################################################
	//
	// 	Exit out of our hit states ...

				// use the hasAction here ...
			if (currTime > effectTimer )
			{

					// if hit active ... deactivate
				if (wasHit)
				{
					endDamage();
				}
			
			}
			
			
				// FAILSAFE for stopped anim
			if (publicInfo.stopped && (speedMod > 0))
			{print ("called failsafe");
					// set back to skate slow
				publicInfo.stopped = false;
				animState = 0;									// so that playSkateSlow gets played next loop
					
				animScript.playSkateSlow();
			}

	
	
	// START HERE FOR GROUND CHECK
	//
	// ######################################
	// ######################################
		
		
		
		
				// do a RaycastCheck DOWN (Track alignment ...)   -   Ray is sent from 3 units up (to compensate possibility of being inside the ground after 1 loop...)
				// the distance is needed (50.0).. otherwise the ray stops on the first collider, even if it is the wrong layer ...
			if (Physics.Raycast (rayCastSender.position, playerTrns.TransformDirection (Vector3(0, -1, 0)), hoverRayHit, 150.0, hoverRayMask))
			//if ( Physics.Raycast ( (playerTrns.TransformDirection(Vector3(0, 3, 0)) + playerTrns.position), playerTrns.TransformDirection (Vector3.down), hoverRayHit, 150.0, hoverRayMask) )
			{																															// add a ray length here ..
			
				//Debug.Log("RC Hit");
			
				// allowHover = true;											// set if hover allowed... (abyss only when in plane mode)
				hoverHitDist = hoverRayHit.distance;						// store the hit distance ...
		
					// if we are too low in ground .. Jump
				if (hoverHitDist < 0.5)
				{
					applyJump();
				}
		
					// #####################################
					//
					// add abyss handling
					// could be handled on enter/exit flight mode
				if (hoverRayHit.collider.CompareTag("abyss"))
				{
						// if over abyss, shadow far down
					shadowHeight = -5000.0;
				}
				else
				{
						// else shadow up
					shadowHeight = 0.1;
				}

	
	
	// /* REMOVE EMERGENCY HOVER HANDLING	
					// move us up if we're sticking in the ground WAS 3.0!!!
				if ((hoverHitDist) < 2.7)
				{		// Change THIS to "slide" up/down on the normal
					
						// adjust hover height
					// hoverLift = nHoverHeight - hoverHitDist;			// nHoverHeight was hoverHeight in other conditional
					
					// use the 3.0 we're checking for (WAS 3.0)
					hoverLift = 2.7 - hoverHitDist;						// nHoverHeight was hoverHeight in other conditional
					
						// move physics instead
					//playerTrns.Translate(Vector3(0, hoverLift, 0));		// Move the player up the required ammount
					playerTrns.position = (playerTrns.position + playerTrns.TransformDirection(Vector3(0, hoverLift, 0)));
				}
	// */ // REMOVE 
	
				
					// add offRoad handling in ...
				
					// Set offroad Multi ...
				offRoadMulti = 1.0;
				if (hoverRayHit.collider.CompareTag("offRoad"))
				{
					offRoadMulti = offRoad;
				}
	
	
					// get our current height out (for our missle etc.)
				publicInfo.currHeight = hoverHitDist;
				
	//
	//		Insert in control and complete movement/gravity handling here ...
	//
			// END RAYCAST CHECK
			}
				// if no Raycast hit!!
			else
			{
				//Debug.Log("RC No HIT");
					// set hover hit dist to out of range
				hoverHitDist = hoverMaxDist + 1.0;
			}
	
			
		//	#############################################################
		//	#####	Check if we are in control (not too high above ground)
		//
		// 	In control loop
				
					// if we are in control (not falling/Jumping...)
				if ((hoverHitDist >= GlobalStats.hoverMinDist) && (hoverHitDist <= hoverMaxDist))
				{													// This is problematic ... is grounded seems to NOT be stable enough - we need a broader zone defined as "grounded"... Try using a raycast instead ....
																	// we actually use the raycast from the last loop ... 
		
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
						rotateAmmount = horizInput * startHoriz * currRotSpeed * dTime;					// The rotation ammount from current inputs | startHoriz is set to 0 at beginning for getReady handling
						turnValue = BotStats.turnCharMulti[charIndex] * rotateAmmount;										// this is for visual feedback when turning the character.. (but only the model)
						currRotation = 0.0;																// will hold the current roatation below ..
						prevSlideAngle = 0.0;															// will hold the rotation rest below
						
		
							// #####   HANDLE PLANE MODE ROLL   #####
						rollAmmount = Mathf.MoveTowardsAngle(rollAmmount, ((-rollAngle) * horizInput * 4), 70.0 * dTime);										// set the rollAmmount here based on the rollAngle set earlyer
						
								
							// now calculate the ammount we need to revert our rotation from collisions this updateLoop
						collRotate = Mathf.MoveTowards(0.0, hitAngle, 270 * dTime);					// basically this lets us rotate towards move direction with 180 deg per sec
						
							// remove the ammount we have already rotated from what we need ...
						hitAngle = hitAngle - collRotate;
						
						
							
				
				
							// is the slide button pressed?
						if (doSlide)
						{
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
							
							
							slideTimer = currTime + 0.1;													// short breaker for fluctuating input
	
								// store our slide goal..
							slideGoal = 0;
							localSlideTime = BotStats.fullSlideTime[charIndex];												// I want the slide to be based on input slightly:
							
							
							//	###############################################
							//
							//	NOW! First check if we want to slide, and in which direction ...
							
							if(Mathf.Abs(horizInput) <= 0.25)
							{								// input inside deadzone ...
									
								if(animState == 2)
								{		// we're sliding Right
									slideGoal = BotStats.maxSlideAngle[charIndex] * 0.8;
								}
								else if(animState == 3)
								{		// we're sliding Left	
									slideGoal = -BotStats.maxSlideAngle[charIndex] * 0.8;
								}
								else
								{		// we're not sliding in any direction
									vertInput = 0.3;		// no steering, no active slide .. slow down to 30 %
									slideGoal = 0.0;		// so our slide goal is 0
								}
								
									// set the brake to active
								brakesActive = true;
								
									// else change nothing ... at least for now
							}
							else if (horizInput > 0)
							{								// positive input (right)
									// set the brake flag inactive..
								brakesActive = false;
							
									// we're NOT in slideLeft mode, so we can jump right into slide Right
								if(animState != 3)
								{
										// are we fast enough to slide??
									if(currSpeed >= (maxSpeed * 0.3))
									{
											// set our mode flag
										if (animState != 2)
										{
											animState = 2;
											animScript.playSkateRight();
										}
					
											// new SlideAngle setting
										slideGoal = BotStats.maxSlideAngle[charIndex] * 0.8;
									}
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
							}
							else
							{								// negative input (left)
									// set the brake flag inactive..
								brakesActive = false;
									
									// we're NOT in slideRight mode
								if(animState != 2)
								{
								
										// are we fast enough to slide??
									if(currSpeed >= (maxSpeed * 0.3))
									{
											// set our mode flag
										if (animState != 3)
										{
											animState = 3;
											animScript.playSkateLeft();
										}
				
											// new Slide Angle setting
										slideGoal = -BotStats.maxSlideAngle[charIndex] * 0.8;
									}
								}
								else if (horizInput < -0.3)
								{							// when we cross the threshold, move over into slideLeft
									animState = 3;
								}
								else 
								{											// we're still sliding in the other direction, but haven't hit threshold ...
									animState = 2;							// still slide right
									slideGoal = BotStats.maxSlideAngle[charIndex] * 0.8;		// still other side slideAngle
									animScript.playSkateRight();
								}
							}
							
								// add our current input into the mix! Unfortunately I have to do it before the LERP. Won't work otherwise :(
							slideGoal += BotStats.maxSlideAngle[charIndex] * 0.2 * horizInput;
							
								// Now run our actual turning code ...
							// slideAngle = Mathf.MoveTowards(slideAngle, slideGoal, ((BotStats.maxSlideAngle / BotStats.fullSlideTime) * dTime) );
							slideAngle = Mathf.LerpAngle(slideAngle, slideGoal, (1/BotStats.fullSlideTime[charIndex] * dTime) );
				
				
								// add our final slide bit based on actual input to the Lerped slideAngle and rotate...
							charRoot.localEulerAngles = Vector3(0, slideAngle, 0);																	// Rotate the Character ...
				
				
								// Apply our visual Offset (just to see the character turning)
							charOffset.localEulerAngles = Vector3(0, turnValue, rollAmmount);
										
							
						  		// Now add the normal controls rotation ...
						  	 //rotateValue = (Vector3.up * rotateAmmount);
							 //playerTrns.Rotate(rotateValue);		
							
								// set our rotation using the ground normal, too...   AND ADD COLLISION TURNING IN
							// !!!	-	Handle below while aligning to floor ...   playerTrns.rotation = toRotation * Quaternion.Euler(0, rotateAmmount + collRotate, 0);
						}
						else
						{			// no slide button pressed...
						
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
									// print ("line 2341");
										// for safety reset the speed HUD here again
									// HUD_Speed.changeState(7);
									
									animState = 99;								// means we have run playSkateSlow twice
								}
								
								if((animState == 0) || (animState == 2) || (animState == 3))
								{
									animScript.playSkateSlow();
									//print ("line 2353");
									animState = 1;
								}
							}		
		
								
						  if (slideTimer < currTime)
						  {													// just a buffer timer so we don't drop right out of our slide
							if (slideAngle == 0)
							{
									// check if we really need to rotate... (both should always have the same sign anyway)
								turnRollCombo = turnValue + rollAmmount;
		// !!!						
									// if we need to change more than threshold ...
								if (Mathf.Abs(turnRollCombo - lastTurnRollCombo) > 0.01)
								{
									charOffset.localEulerAngles = Vector3(0, turnValue, rollAmmount);
									lastTurnRollCombo = turnRollCombo;
								}
								
									// get our normal rotation value and apply it
							 	//rotateValue = (Vector3.up * rotateAmmount);
								//playerTrns.Rotate(rotateValue);																						// based on angles per second ...
							
									// set our rotation using the ground normal, too...   AND ADD COLLISION TURNING IN
								// !!!	-	Handle below while aligning to floor ...   playerTrns.rotation = toRotation * Quaternion.Euler(0, rotateAmmount + collRotate, 0);
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
								charRoot.localEulerAngles = Vector3(0, slideAngle, 0);													// Rotate our charRoot back to 0
								
									// apply the offset rotation
								charOffset.localEulerAngles = Vector3(0, turnValue, rollAmmount);													// rotate the offset Node (Visual only)
								
									// get the correct rotate ammound, including compensation for our slide
								// rotateAmmount += currRotation * slideRevertDampen;																					// Add the correct rotate Value to rotate Ammount (so that we reach 0) for our character Controller	
								rotateAmmount = currRotation * slideRevertDampen;	// revert 																						// Add the correct rotate Value to rotate Ammount (so that we reach 0) for our character Controller	
								
									// apply our rotation
							 	//rotateValue = (Vector3.up * rotateAmmount);
								//playerTrns.Rotate(rotateValue);												// based on angles per second ...
								
									// set our rotation using the ground normal, too... AND ADD COLLISION TURNING IN
								// !!!	-	Handle below while aligning to floor ...   playerTrns.rotation = toRotation * Quaternion.Euler(0, rotateAmmount + collRotate, 0);
								
									// while slide not over, and not transformed .. continue calling skateSlow
								if(publicInfo.noTrans)
								{
									animScript.playSkateSlow();
									// print ("line 2413");
									animState = 0;
								}
							}
						  }
							
						}
		
		
					// ###########################################
					//
					// #####   HANDLE ACCELERATION / SPEED   #####
			
						// If we are moving forward ...			
					if (vertInput >= 0)
					{
	
								// Set the correct target Sped ...
							//targetSpeed = vertInput * maxSpeed * wpSpeedup * offRoadMulti * speedMod * planeSlowdown;						// get current Target Speed ... (meaning the maximum Speed for the goven controller input)
							targetSpeed = vertInput * maxSpeed * wpSpeedup * offRoadMulti * speedMod;
		
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
									//targetSpeed = speedPlaneSpeed  * offRoadMulti * speedMod * planeSlowdown;
									targetSpeed = speedPlaneSpeed  * offRoadMulti * speedMod;
									
										// until autonomous anim playback: check if we have called playSkateSlow for fast skate already
									if (!airborne && (animState != 9) && (animState != 3) && (animState != 2) && (publicInfo.noTrans))
									{																				// if we are NOT in skateFast mode .. play skateSlow function and set value.. ONCE
										animState = 9;
										publicInfo.speedPlane = true;
										animScript.playSkateSlow();
										// print ("line 2464");
									}
								}
								
								else
								{		// if our time is over, disable our flag and speed handling
									publicInfo.speedPlane = false;
									speedState = false;
									
										// play the cam SpeedDown animation
									camSpeed.CrossFade("speedDown");
									
										// stop the speed sound
									speedSource.Stop ();
									
										// revert HUD Speed if not in juice mode
									if (!publicInfo.juiceActive)
									{
										HUD_Speed.playAnim = false;
									
											// revert to normal skate again (ONCE)
										if (!airborne && (animState == 9))
										{																				// if we are NOT in skateFast mode .. play skateSlow function and set value.. ONCE
											animState = 0;
										}
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
										// decreace juiceLeft
									juiceLeft = Mathf.Clamp((juiceLeft - dTime), 0.0, juiceFull);
									
										// set our target speed ...
									// targetSpeed = speedPlaneSpeed  * offRoadMulti * speedMod * planeSlowdown;
									targetSpeed = speedPlaneSpeed  * offRoadMulti * speedMod;
									
										// until autonomous anim playback: check if we have called playSkateSlow for fast skate already
									if (!airborne && (animState != 9) && (animState != 3) && (animState != 2) && (publicInfo.noTrans))
									{																				// if we are NOT in skateFast mode .. play skateSlow function and set value.. ONCE
										animState = 9;
										animScript.playSkateSlow();
									}
								}
								else
								{		// if our time is over, disable our flag and speed handling
									publicInfo.juiceActive = false;
									
										// stop the speed sound
									speedSource.Stop ();
																	
										// play the cam SpeedDown animation
									camSpeed.CrossFade("speedDown");
									
										// revert HUD if not in speed mode
									if(!speedState)
									{
										HUD_Speed.playAnim = false;
									
											// revert to normal skate again (ONCE)
										if (!airborne && (animState == 9))
										{																				// if we are NOT in skateFast mode .. play skateSlow function and set value.. ONCE
											animState = 0;
										}
									}
								}
								
									// send current juice state to GUI system
								guiFlags.juiceLeft = juiceLeft;
								guiFlags.juiceFull = juiceFull;
								guiFlags.juiceChanged = true;
								
							}
							else if (juiceLeft < juiceFull)
							{										// adjust the juice timer if juice is not active
							
									// if we burned juice, fill it up again
								juiceLeft = Mathf.Clamp((juiceLeft + (BotStats.juiceBuildup[charIndex] * dTime)), 0.0, juiceFull);
								
									// send current juice state to GUI system
								guiFlags.juiceLeft = juiceLeft;
								guiFlags.juiceFull = juiceFull;
								guiFlags.juiceChanged = true;
							}
							else if (juiceLeft >= juiceFull)
							{
								if (DataTransfer.tutEnable)
								{
									if (!DataTransfer.tutFinish[3])
									{
										DataTransfer.tutExit = false;
										DataTransfer.currTut = 3;
										_inputScript.startTutorial();
									}
								}
							}
	
	
								//
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
								currSpeedAdd = accRate * vertInput;														// only calculate the current acceleration if needed ....
								currSpeed += currSpeedAdd * dTime;														// Increase the current Speed ...
								currSpeed = Mathf.Clamp(currSpeed, 0, targetSpeed);
							} 
							else if (currSpeed > targetSpeed)
							{																											// we'Re too fast! Slow down ...  
								// actSpeed = currSpeed;
								currSpeedAdd = decRate;																		// deceleration is not dependant on the controller input as it is the slowDown Rate with NO force applied (the other would be braking, handled by negative input...)
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
								currSpeedAdd = decRate;																		// deceleration is not dependant on the controller input as it is the slowDown Rate with NO force applied (the other would be braking, handled by negative input...)
								currSpeed -= currSpeedAdd * dTime;
								currSpeed = Mathf.Clamp(currSpeed, 0, (speedPlaneSpeed * wpSpeedup));
							}
					}
			
					
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
									// animScript.playSkateSlow();			// this is run only once, so no need to check state...
									animState = 1;
									
										// if we were transforming...
									
									if (publicInfo.upTrans)
									{
										transToPlane();
									}
									else if (publicInfo.dnTrans)
									{
										transToCar();
									}
									else
									{
											// play land animation
										animScript.playLand();
									}
										
										// broadcast Jump end
									publicInfo.jumping = false;
									
										
							}
						}
					}
	
	
	// !!!!!
	// !!!!!
	// !!!!!
	// smooth gravity handling come here ...
	// !!!!!
	// !!!!!
	// !!!!!
	
	
					else if(!publicInfo.upTrans)
					{													// we are on the ground ... normal
							// test with no downforce
						//currDownforce = 0.0;	
					currDownforce = 0.8 * GlobalStats.idleDownforce;					// trgtDownforce when we are on ground reset downforce to full! first cycle after Jump, we're still on ground but in airborne mode...
					// store the gravityComponent
						
							// in normal mode we always want to stick on ground (instead of normal gravity)
						//hoverLift = 3.0 - hoverHitDist;
						
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
						currDownforce = Mathf.SmoothStep(lastDownforce, currDownforce, 20.0 * dTime);	// works nicely!! / was 10.0
						
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
				// DEBUG info
				// print ("AIRBORNE at dist: " + hoverHitDist);
							// Check downforce
						// if (currDownforce > trgtDownforce)								// this was without adding in on downforce when falling ...
						if (currDownforce > GlobalStats.maxDownforce)
						{																					// if we are jumping ... we need to reduce the downforce back to negative values ..
							// currDownforce += trgtDownforce * dTime;								// this was still using the downfrce to move down when falling. I want to ignore the downforce while in Jump mode and use my gravity instead ....
							currDownforce += (trgtDownforce + gravity) * dTime;		// downforce AND gravity influence character when airborne...
						}
						else currDownforce = GlobalStats.maxDownforce;						// if we are already at downforce .. be happy!
		
						if (!airborne)
						{																		// if this is the first after jump cycle ...
							airborne = true;												// flag airborne mode
						}
						
							// get our collision rotate 
						// now calculate the ammount we need to revert our rotation from collisions this updateLoop
						collRotate = Mathf.MoveTowards(0.0, hitAngle, 270 * dTime);					// basically this lets us rotate towards move direction with 180 deg per sec
						
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
				
					// store current orientation of character
				cacheRotation = softAlign.rotation;
				
					// normal align rotation code
				toRotation = Quaternion.LookRotation (hoverRayHit.normal, playerTrns.TransformDirection (Vector3(0, 0, 1)));		// First get the correct Quaternion Orientation to the normal
				// toRotation = Quaternion.LookRotation (avgNormal, playerTrns.TransformDirection (Vector3.forward));		// First get the correct Quaternion Orientation to the normal
				toRotation = toRotation * Quaternion.Euler(-90, 0, 180);																									// Now change the orientation that the actual front AIMS front


	//NORMAL MODE END


				// playerTrns.rotation = Quaternion.Lerp (fromRotation, toRotation, 0.1);		// align to ground normal ...
				toRotation = Quaternion.Slerp (fromRotation, toRotation, 0.25);					// Smooth player ground align
				// shadowRotation = Quaternion.Slerp (fromRotation, toRotation, 1);					// Smooth player ground align

					// rotate player
				playerTrns.rotation = toRotation * Quaternion.Euler(0, rotateAmmount + collRotate, 0);
				
					// now set the correct rotation of the character group (first add the current rotation, then align)
				cacheRotation = cacheRotation * Quaternion.Euler(0, rotateAmmount + collRotate, 0);
				// softAlign.rotation = Quaternion.Slerp(cacheRotation, playerTrns.rotation, 6.0 * dTime);
					
					// this smooths the camera movement even more!!
				softAlign.rotation = Quaternion.Slerp(cacheRotation, playerTrns.rotation, 0.1);
				
		
				//	#####################################
				//
				//	Shadow planeCode...	Unfortunately needed as otherwise on Jump it would be following player

				blobShadow.position = hoverRayHit.point + blobShadow.TransformDirection(Vector3(0, shadowHeight, 0));	// orientation does not change, so just point and distance in blobshadows local space needed -> one less transformation that moving and then moving up
			
					// move the char, toosuppe
				charRoot.localPosition.y = Mathf.Clamp(playerTrns.InverseTransformPoint(hoverRayHit.point + blobShadow.TransformDirection(Vector3(0, shadowHeight, 0)) ).y, 0, 10);
		//		
		// Character Controller handling
		//
			//print ("PlyerSide Pre: " +sideBounce);
					// before actually moving the character , place the CharController to the characters feet
					// now move our bounce forces to 0
				sideBounce = Mathf.MoveTowards(sideBounce, 0.0, bounceRevert * dTime);								// side bounce will be set on collision and 
				speedBounce = Mathf.MoveTowards(speedBounce, 0.0, bounceRevert * dTime);	
			//print ("PlyerSide Post: " +sideBounce);
					// Calculate actual motion including bounce
				moveDirection = Vector3 (sideBounce, 0.0, moveSpeed + speedBounce);				// get the move Direction with the forward movement ... 
				
					// get move direction for our character controller
				moveDirection = playerTrns.TransformDirection(moveDirection) + Vector3(0, currDownforce, 0);			// set the forward Vector correctly in world space

					// Store our position
				// for dontGoThroughThings lastPosCache = playerTrns.position;
				
					// Move
				charController.Move(moveDirection * dTime);
	
	/* Was old RC handling
			}
			else
			{	
				// #####################################
				//
				// if NO HIT (out of range, no control)
				hoverHitDist = 0.0;				// set to zero
				
				//Debug.Log ("No Contact");
				
					// Store our position
				// for dontGoThroughThings lastPosCache = playerTrns.position;
				
					// Move
				charController.Move(moveDirection * dTime);
			}
		*/ // END Was old RC Handling
			/*
	EDIT
	SCAN FROM COLLIDER CENTER		
				// Check if we moved through stuff
			var movementThisStep : Vector3 = playerTrns.position - lastPosCache; 
   			var movementSqrMagnitude : float = movementThisStep.sqrMagnitude;
   			var movementMagnitude : float = Mathf.Sqrt(movementSqrMagnitude);
      		var hitInfo : RaycastHit; 
      		
		     	//check for obstructions we might have missed 
		    if (Physics.Raycast(previousPosition, movementThisStep, hitInfo, movementMagnitude, layerMask.value)) 
		         playerTrns.position = hitInfo.point - (movementThisStep/movementMagnitude)*partialExtent;
		         
		         // INSTEAD GO BACK THE HIT DIST MINUS COLLIDER THICKNESS!!!
			*/
			
		// END GROUND CHECK
		//
		// ######################################
		// ######################################
		
	
		
			
			// DataVault.playerPos = playerTrns.position;																				// store the current position
		
				// position the character mesh to our transform ...
			// charMesh.position = charOffset.position;
			// charMesh.rotation = charOffset.rotation;
		
				// now, that the player is in the correct position, we can place the shadow under the characters bounding box center
//			localHip = playerTrns.InverseTransformPoint(botMesh.renderer.bounds.center);
			localHipPos = playerTrns.InverseTransformPoint(localHip.position);
			blobShadow.localPosition.x = localHipPos.x;
			blobShadow.localPosition.z = localHipPos.z;
			
			//charRoot.localPosition = blobShadow.localPosition;
			
	
		
			
		// #######################################
		//
		// WP handling START
		
				// First check if we need to switch waypoints ...
			if (switchWp)
			{
					// reset the switch flag ..
				switchWp = false;
				
					// get next waypoint	(This will not select the wp hit, but the next one ..)
				waypoint = wpScript.nextWp;
	
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
				//	TRASFORMATION HANDLING END
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
	
						if (nextStart)
						{
								// if we come from the last gate before start/finish
							lapCount++;
							nextStart = false;
							prevStart = true;
							lapRemoved = false;
						}
						else if (prevStart)
						{
								// if we're running back from the first gate to the finish line (wrong dir)
							lapCount--;
							prevStart = false;
							nextStart = true;
							lapRemoved = true;
						}
						
							// lap handling to guiHandling
						guiFlags.lapChanged = true;
						guiFlags.lapCount = 3;
						guiFlags.lapCurr = lapCount;
						
						// print ("LapCount Inside: " + lapCount);
						
						//HUD_currLap.changeState(lapCount);
	
	// Normal version! Change for race summary
	/*					
							// if this is the race start, store time
						if (lapCount == 1)
						{
							lapTime[0] = currTime;
							raceTime += lapTime[0];
						}
						else
						{
								// calc the Lap times time
							lapTime[lapCount - 1] = currTime - raceTime;
							raceTime += lapTime[lapCount - 1];
						}
	*/
						if (lapCount == 1)
						{
							_refHolder.Lap0times[0] = currTime;
							raceTime += _refHolder.Lap0times[0];
						}
						else if (lapCount == 2)
						{
							_refHolder.Lap1times[0] = currTime - raceTime;
							raceTime += _refHolder.Lap1times[0];
						}
						else if (lapCount == 3)
						{
							_refHolder.Lap2times[0] = currTime - raceTime;
							raceTime += _refHolder.Lap2times[0];
						}
						else if (lapCount == 4)
						{
							_refHolder.Lap3times[0] = currTime - raceTime;
							raceTime += _refHolder.Lap3times[0];
						}
						
		
					}
				}
				else
				{									// if not, just set our flag back to false
					lapChange = false;
					
						// if we're passing the last WP before finish line flag it
					if (wpScript.nextStart)
					{
						nextStart = true;
							
							// if we passed the finish line, but turned back before touching the next gate, we want our next gate contact to
							// subtract a lap. (because gates trigger only once until another gate was touched)
						if (prevStart)
						{
							lapCount--;			// increase it again
							lapRemoved = true;
							prevStart = false;
						}
					}
						// if we're passing the first WP after start/Finish flag it
					else if (wpScript.prevStart)
					{
						nextStart = false;
						prevStart = true;
						
							// if our lap was reduced on the last gate because we were moving backwards ...
						if (lapRemoved)
						{
							lapCount++;			// increase it again
							lapRemoved = false;
						}
					}
					else
					{
						nextStart = false;
						prevStart = false;
					}
				}
				
	
					// check if race is over
				if (lapCount == (raceLaps + 1))
				{
					if (!botFinished)
					{
						_refHolder.raceOver = true;
						publicInfo.raceOver = true;
						_refHolder.gameEnabled = true;
						
							// fade to black
						_podiumHandler.fadeOut = true;
						
							// turn off speed state
						HUD_Speed.playAnim = false;
						
							// hide badge info
						guiFlags.badgeType = 99;
						guiFlags.badgeChanged = true;
						guiFlags.hitBot = 0;
						guiFlags.hitChanged = true;
						
						
							// at the end of the race enable the auto pilot
						autoPilot = true;
						
							// handle the final ranking
						_refHolder.finishRanking[0] = _refHolder.finishedCount;
						_refHolder.finishedCount++;											// as we passed the line, the next one needs an incremented rank
						
						DataTransfer.lastRacePos = _refHolder.finishedCount;				// set the rank we pass back to the menu directly
						botFinished = true;													// set finished flag
						
							// if race is over, kill the effects of isotope and/or virus (just in case)
						if (isotopeHit)
						{		
								// shut isotope off
							isotopeHit = false;
							
								// play the grow animation
							charScalerAnim.Play("scaleUp");
						}
						
							// if the Virus is active .. exit
						if(virusAnim.IsPlaying("virus"))
						{
								// end screeen animation
							virusAnim.Play("exit");
							
								// quit the Virus message
							guiFlags.virusState = 3;
							guiFlags.virusWarningExit = 0.0;
						}
							// remove the Warnings
						guiFlags.warningChanged = true;
						guiFlags.warningType = 0;
						guiFlags.warningTime = 0.0;						// set 30 sec time (will be switched off anyway ..
						
							// remove aim effect
						aimEnable = false;
						
							// move all obstacles out of the way
							
							
						
					}
				}
				
					// get our reset settings
				abyssRespawn = wpScript.dropRespawn;
				abyssStopTime = wpScript.dropTimer;										// time till slow mode
				abyssSlowTime =	abyssStopTime + 1.5;									// time we are slow after reset ...
				
					// get the airTime stored in the current waypoint
				transUpTime = wpScript.airTimer;
				aiWpMulti = wpScript.aiMulti;
				wpTurnMulti = wpScript.wpTurnMulti;
						
					// handle our Offset and get the wpPos for this segment .. based on best offset
	
					// player just follows the middle ...
				wpPos = (waypoint.TransformDirection(Vector3(0, 0, 25.0)) + waypoint.position);
				
					// get the airTime stored in the current waypoint
				transUpTime = wpScript.airTimer;
				aiWpMulti = wpScript.aiMulti;
			
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
			
			
			
		
	// !!!	This is for player only ...
	// !!!
				// get the theoretical wpOffset of our player!!! (for missle deployment)
			publicInfo.wpOffset = wpDistPos.x / wpScript.segmentWidth;
	
				// and get our track progress
			if (!botFinished)
			{
					// while not finished, set normal progress
				tProgress = (trackPassed + wpDist) + trackLen * (lapCount-1);
			}
			else
			{
				tProgress = (20000 - (_refHolder.finishRanking[0] * 10));
	
			}
			_refHolder.trackProgress[0] = tProgress;									// visualize
	
					
				// store player lapCount in Vault
			publicInfo.pLap = lapCount;
	
	
	// wp handling END
	// 	###############################	
	//	###############################
	//	###############################
	
		}	//End game enabled check ...
		
	
	// Debug.DrawRay (visHitPos, visNormalPlayer, Color.green);
	// Debug.DrawRay (playerTrns.position, hitNormal3D, Color.white);		// geht nat√ºrlich nicht da draw ray in World Space

	//	##########
	//
	// END PODIUM HANDLING CHECK
	}
	
	// DEBUG
	//DataTransfer.playerOccupied = true;

}



	// handle actual collisions... convert to rigidbody
// function OnCollisionEnter (collision : Collision)
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
			//print ("Side Bounce: " + sideBounce);
		}
		
			// add our speedBounce ...
		if (Mathf.Abs(hitPlayer3D.z) > bounceThreshold )
		{
				// check if even bigger
			speedBounce = -hitPlayer3D.z * bounceMax;

			//print ("Speed Bounce: " + speedBounce);
		}
	}
*/
		// if we hit the wall ...
	if (collision.collider.CompareTag("wall"))
	{
			// play sound ...
		audio.clip = wallSound;
		audio.Play ();
	
			// get our surface normal 
		//var hitNormal3D : Vector3 = playerTrns.InverseTransformDirection(collision.contacts[0].normal);
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

	// only handle colliders if the bot has not finished the race ....
	if (!botFinished)
		{
		// organize collisions by their probability .. waypoints first, pickups next, jumpgate, normal collision
		switch (true)
		{
			case (hit.collider.CompareTag("waypoint")):
	
						// Handle Waypoint hit
					var tempWpHit = (hit.collider.GetComponent(wpAttribs) as wpAttribs);
					
					if (lastWpIndex != tempWpHit.waypointIndex)
					{
						// WHY DATA VAULT AND NOT LOCAL??? 
						wpScript = tempWpHit;
						lastWpIndex = wpScript.waypointIndex;
						switchWp = true;
						
						// do the waypoint switching directly here ...
					}
				break;			
			
			case (hit.collider.CompareTag("pickup")):
						
						// handle Pickup badge
					DataTransfer.hitsRace[8]++;
					DataTransfer.hitsCareer[8]++;
					
						// send analytics
					//Google.analytics.logEvent("stats", "counting", "pickup");
					
					if (DataTransfer.hitsRace[8] == 5)
					{	
							//heavy metal
						guiFlags.badgeChanged = true;
						guiFlags.badgeType = 9;
						
							// increase badges counters
						DataTransfer.badgesRace[guiFlags.badgeType]++;
						DataTransfer.badgesCareer[guiFlags.badgeType]++;
						DataTransfer.badgeCount++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "badges", "heavyMetal");
						
							// play sound ...
						badgeSource.clip = strikeSound;
						badgeSource.Play ();
					}
					else if(DataTransfer.hitsRace[8] == 10)
					{
							// Full Metal
						guiFlags.badgeChanged = true;
						guiFlags.badgeType = 10;
						
							// increase badges counters
						DataTransfer.badgesRace[guiFlags.badgeType]++;
						DataTransfer.badgesCareer[guiFlags.badgeType]++;
						DataTransfer.badgeCount++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "badges", "fullMetal");
						
							// play sound ...
						badgeSource.clip = strikeSound;
						badgeSource.Play ();
					}
					
						// run the pickup code here -> directly implement stuff only support random pickups for now.
					handlePickup();
				break;
				
			case (hit.collider.CompareTag("speed")):
				
						// Badge Handling
					DataTransfer.hitsRace[6]++;
					DataTransfer.hitsCareer[6]++;
					
						// send analytics
					//Google.analytics.logEvent("stats", "counting", "speedPad");
					
					if (DataTransfer.hitsRace[6] == 5)
					{
							// High Speed
						guiFlags.badgeChanged = true;
						guiFlags.badgeType = 4;
						
							// increase badges counters
						DataTransfer.badgesRace[guiFlags.badgeType]++;
						DataTransfer.badgesCareer[guiFlags.badgeType]++;
						DataTransfer.badgeCount++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "badges", "highSpeed");
					}
					else if (DataTransfer.hitsRace[6] == 10)
					{
							// Full Speed
						guiFlags.badgeChanged = true;
						guiFlags.badgeType = 5;
						
							// increase badges counters
						DataTransfer.badgesRace[guiFlags.badgeType]++;
						DataTransfer.badgesCareer[guiFlags.badgeType]++;
						DataTransfer.badgeCount++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "badges", "fullSpeed");
						
							// play sound ...
						badgeSource.clip = strikeSound;
						badgeSource.Play ();
					}
					
						// run the speedhit function
					speedHit();
					
					// in case we hit a speed gate ...
					// reset our speed multi
					// planeSlowdown = 1.0;
					
						// check for speed right after the trans Timer should end
					// Invoke("checkTransform", (transUpTime + 0.1));
				break;
				
				case (hit.collider.CompareTag("hoop")):
				
						// Badge Handling
					DataTransfer.hitsRace[7]++;
					DataTransfer.hitsCareer[7]++;
						
						// send analytics
					//Google.analytics.logEvent("stats", "counting", "speedHoop");
					
					if (DataTransfer.hitsRace[7] == 3)
					{
							// high five Speed
						guiFlags.badgeChanged = true;
						guiFlags.badgeType = 6;
						
							// increase badges counters
						DataTransfer.badgesRace[guiFlags.badgeType]++;
						DataTransfer.badgesCareer[guiFlags.badgeType]++;
						DataTransfer.badgeCount++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "badges", "highFiveSpeed");
						
							// play sound ...
						badgeSource.clip = strikeSound;
						badgeSource.Play ();
					}
					else if (DataTransfer.hitsRace[7] == 6)
					{
							// full Sky
						guiFlags.badgeChanged = true;
						guiFlags.badgeType = 7;
						
							// increase badges counters
						DataTransfer.badgesRace[guiFlags.badgeType]++;
						DataTransfer.badgesCareer[guiFlags.badgeType]++;
						DataTransfer.badgeCount++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "badges", "fullSky");
						
							// play sound ...
						badgeSource.clip = strikeSound;
						badgeSource.Play ();
					}
					
						// run the speedhit function
					speedHit();
					
					// in case we hit a speed gate ...
					// reset our speed multi
					// planeSlowdown = 1.0;
					
						// check for speed right after the trans Timer should end
					// Invoke("checkTransform", (transUpTime + 0.1));
				break;
			
			case (hit.collider.CompareTag("box")):
	
						// if shield enabled .. disable .. no effect
					if (shieldSet)
					{
						shieldDisable();
					}
					else
					{
							// handle obstacle hit badge
						DataTransfer.damageRace[10]++;
						DataTransfer.damageCareer[10]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "damageTaken", "boxAirMine");
						
							// handle box hit badge
						DataTransfer.damageRace[1]++;
						DataTransfer.damageCareer[1]++;
					
							// play bzort effect
						// HUD_bZort.playAnim = true;
					
							// start damage handling ...
						beginDamage (0.6, 0.6, 2.0);
					
							// play sound ...
						//audio.clip = explosionSound;
						//audio.Play ();
					}
					
						// play explosion
					_refHolder.allExplosions[botIndex].position = playerTrns.position;
					_refHolder.allExplosionScr[botIndex].Explode();
			
				break;
			
			case (hit.collider.CompareTag("mineIsotope") || hit.collider.CompareTag("playerIsotope")):
	
						// if shield enabled .. disable .. no effect
					if (shieldSet)
					{
						shieldDisable();
					}
					else
					{
							// count badge iso
						DataTransfer.damageRace[2]++;
						DataTransfer.damageCareer[2]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "damageTaken", "shrink");
						
							// count badge mines
						DataTransfer.damageRace[7]++;
						DataTransfer.damageCareer[7]++;
						
							// count badge hitByWeapon
						DataTransfer.damageRace[9]++;
						DataTransfer.damageCareer[9]++;
					
						isotopeHit = true;
							
							// start damage handling ...
						beginDamage (0.3, 0.3, 4.0);
						
							// play sound ...
						audio.clip = isotopeSound;
						audio.Play ();
						
							// play explosion
						_refHolder.allExplosions[botIndex].position = playerTrns.position;
						_refHolder.allExplosionScr[botIndex].Explode();

					}
				break;
				
			case (hit.collider.CompareTag("mineBada") || hit.collider.CompareTag("playerBada")):
	
						// if shield enabled .. disable .. no effect
					if (shieldSet)
					{
						shieldDisable();
					}
					else
					{
							// count badge bada
						DataTransfer.damageRace[3]++;
						DataTransfer.damageCareer[3]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "damageTaken", "caltrop");
						
							// count badge mines
						DataTransfer.damageRace[7]++;
						DataTransfer.damageCareer[7]++;
							
							// count badge hitByWeapon
						DataTransfer.damageRace[9]++;
						DataTransfer.damageCareer[9]++;
					
							// start damage handling ...
						beginDamage (0.25, 0.25, 3.0);
					
							// play sound ...
						audio.clip = badaboomSound;
						audio.Play ();
						
							// play explosion
						_refHolder.allExplosions[botIndex].position = playerTrns.position;
						_refHolder.allExplosionScr[botIndex].Explode();
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
							// handle barrier hit badge
						DataTransfer.damageRace[0]++;
						DataTransfer.damageCareer[0]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "damageTaken", "obstacle");
						
							// handle obstacle hit badge
						DataTransfer.damageRace[10]++;
						DataTransfer.damageCareer[10]++;
					
							// play bzort effect
						HUD_bZort.playAnim = true;
					
							// start damage handling ...
						beginDamage (0.6, 0.6, 2.0);
					
							// play sound ...
						audio.clip = bZortSound;
						audio.Play ();

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
							// handle skyshot hit badge
						DataTransfer.damageRace[6]++;
						DataTransfer.damageCareer[6]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "damageTaken", "leadershot");
						
							// handle offense hit badge
						DataTransfer.damageRace[8]++;
						DataTransfer.damageCareer[8]++;
						
							// handle weapon hit badge
						DataTransfer.damageRace[9]++;
						DataTransfer.damageCareer[9]++;					
					
							// if hit, exit speedPlane
						speedPlaneExit = 0.0;
							
							// play the cam Slow animation
						camSpeed.CrossFade("speedSlow");
								
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
						Invoke("skyshotHit", 1.0);
						
							// if hit reset juice loader
						//juiceLeft = 0.0;
						//guiFlags.juiceLeft = juiceLeft;
						
							// play explosion
						_refHolder.allExplosions[botIndex].position = playerTrns.position;
						_refHolder.allExplosionScr[botIndex].Explode();
						
							// flag skyshot hit call
						skyshotHitCalled = true;
						
							// flag player occupied
						DataTransfer.playerOccupied = true;
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
							// handle skyshot hit badge
						DataTransfer.damageRace[6]++;
						DataTransfer.damageCareer[6]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "damageTaken", "skyshot");
						
							// handle offense hit badge
						DataTransfer.damageRace[8]++;
						DataTransfer.damageCareer[8]++;
						
							// handle weapon hit badge
						DataTransfer.damageRace[9]++;
						DataTransfer.damageCareer[9]++;	
							
							// if hit, exit speedPlane
						speedPlaneExit = 0.0;
							
							// play the cam Slow animation
						camSpeed.CrossFade("speedSlow");
								
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
						Invoke("skyshotHit", 1.0);
						
							// if hit reset juice loader
						//juiceLeft = 0.0;
						//guiFlags.juiceLeft = juiceLeft;
						
							// play explosion
						_refHolder.allExplosions[botIndex].position = playerTrns.position;
						_refHolder.allExplosionScr[botIndex].Explode();
						
							// flag skyshot hit call
						skyshotHitCalled = true;
						
							// flag player occupied
						DataTransfer.playerOccupied = true;
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
							// handle skyshot hit badge
						DataTransfer.damageRace[6]++;
						DataTransfer.damageCareer[6]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "damageTaken", "skyshot");
						
							// handle offense hit badge
						DataTransfer.damageRace[8]++;
						DataTransfer.damageCareer[8]++;
						
							// handle weapon hit badge
						DataTransfer.damageRace[9]++;
						DataTransfer.damageCareer[9]++;
						
							// if hit, exit speedPlane
						speedPlaneExit = 0.0;
							
							// play the cam Slow animation
						camSpeed.CrossFade("speedSlow");
								
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
						Invoke("skyshotHit", 1.0);
						
							// if hit reset juice loader
						//juiceLeft = 0.0;
						//guiFlags.juiceLeft = juiceLeft;
						
							// play explosion
						_refHolder.allExplosions[botIndex].position = playerTrns.position;
						_refHolder.allExplosionScr[botIndex].Explode();
						
							// flag skyshot hit call
						skyshotHitCalled = true;
						
							// flag player occupied
						DataTransfer.playerOccupied = true;
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
							// handle skyshot hit badge
						DataTransfer.damageRace[6]++;
						DataTransfer.damageCareer[6]++;
						
							// send analytics
						//Google.analytics.logEvent("stats", "damageTaken", "leadershot");
						
							// handle offense hit badge
						DataTransfer.damageRace[8]++;
						DataTransfer.damageCareer[8]++;
						
							// handle weapon hit badge
						DataTransfer.damageRace[9]++;
						DataTransfer.damageCareer[9]++;
						
							// if hit, exit speedPlane
						speedPlaneExit = 0.0;
							
							// play the cam Slow animation
						camSpeed.CrossFade("speedSlow");
								
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
						Invoke("skyshotHit", 1.0);
						
							// if hit reset juice loader
						//juiceLeft = 0.0;
						//guiFlags.juiceLeft = juiceLeft;
						
							// play explosion
						_refHolder.allExplosions[botIndex].position = playerTrns.position;
						_refHolder.allExplosionScr[botIndex].Explode();
						
							// flag skyshot hit call
						skyshotHitCalled = true;
						
							// flag player occupied
						DataTransfer.playerOccupied = true;
					}
				break;
				
				case (hit.collider.CompareTag("kill")):
	
							// invoke reset
						Invoke("abyssReset", 0.0);
				break;
	
		}
	}
}



/*
				if (DataTransfer.damageRace[10] == 0)
				{
						// earn badge Nimble MAchine (0)
				}
				
				if (DataTransfer.damageRace[9] == 0)
				{
						// earn badge Untouchable (1)
				}
				
				if (DataTransfer.damageRace[7] == 0)
				{
						// earn badge Never Mine (8)
				}


*/