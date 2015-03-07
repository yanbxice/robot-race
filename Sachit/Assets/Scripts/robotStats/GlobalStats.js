// ##########################################
//
//	Stats File
//
//		Robot: Vektor
//
//		Stats in this file are loaded automatically!
//
//	##########################################

// #####    pInput vars #####

static var transTime : float = 9.0;			// time we are transformed
static var transInterval : float = 2.0;		// time from completed transformcycle to next one

static var deadzone = 0.02;


// #####	pMove VARs	#####
/*
static var maxSpeed = 35.0;							// in m/s²
static var revSpeed = 20.0;							// in m/s²
static var slipstreamBuildup = 25.0;				// what speed qualifies for slipstream buildup	remove slipstream?!	
static var slipstreamSpeed = 35.0;					// implement speedbost after collisionFree ride
static var boostSpeed = 35.0;						// Nitrous / After Burner?
static var slipstreamAfterSeconds = 3.0;
static var speedPlaneSpeed = 45.0;					// SpeedPlane speed
static var brakeTime = 0.3;							// time to stand after braking, before moving in other direction ....


	// rotation and slide handling
static var rotateSpeed = 120.0;						// Angle per second?
static var maxSlideAngle = 70.0;						// maximum angle we can slide off move direction	|	For the script to work, this needs to be between 0 and 180
static var fullSlideTime = 0.3;						// time it takes at FULL side slide to reach maxAngle ...
static var planeRollMulti = 8.0;						// the fraction of our steering rotation we want to roll!

static var turnCharMulti = 2.0;						// ammount to turn the model even if not sliding
static var slideAnimOffset = 0.0;					// offset for slide animation compensation... 30.0

	// acceleration handling
static var accRate = 15.0;							// in m/s²
static var decRate = 30.0;							// in m/s²
*/
	// 	hover handling
// static var downforce = -10.0;				// the force pushing down at max Speed ... (wie bodenhaftung bei Auto... speed und flügel drücken runter ..)
static var maxDownforce = -45;				// maximum downforce when falling ...
static var idleDownforce = -10.0;			// the downforce when standing ...


	// +3.0 -> to be on the safe side with our speeds... for now I set the Raycast sender up 3 units above the characters feet, so 3.0 means - feet on the ground (so that gravity from one cycle to the next wont slip player through ground) AND add 0.1 for the shadow plane height
static var nHoverMaxDist = 3.7;				// the "normal" or robot mode hover height 3.25
//static var nHoverHeight = 3.4;				//3.1
static var uHoverMaxDist = 18.0;			// the "up" or plane mode hover height
static var uHoverHeight = 11.1;
static var dHoverMaxDist = 3.25;			// the "down" or car mode hover height
static var dHoverHeight = 3.1;
// static var transformHeightSpeed = 4.0;		// speed with which we increase our height when transforming

// static var transformDnTimeshift = 0.3;		// transforming back down from plane mode starts a bit earlyer, because we don't want the animation to play ON the ground....
static var hoverMinDist = 0.1;				// the minimum hover distance (this basically means we're hitting the ground)

	// Jump Vars ...
static var jumpSpeed = 20.0;
static var jumpPause = 0.6;											// time between jumps ...

static var gravity = -40.0;

	// collision handling
static var collisionSpeedDecrease: float = 0.8;						// factor to which speed decreases...
//static var collisionTurnSpeed: float = 15.0;						// maximum turn angle per loop per collision

	// added vaules...
static var hoverForce : float = 20.0;										// Force bigger than gravPull to enable hover in plane mode
static var obstacleSpeedDecrease : float = 0.1;							// speed decrease when hitting obstacles

