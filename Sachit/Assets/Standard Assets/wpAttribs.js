//
//	Waypoint script
//
//	Waypoints are used by the AI to navigate the track, as well as by the player to determine it's lapcount and progress
//	
//	Waypoints need to be places between fairly straight segments (so more waypoints in curves), on the middle of the track. 
//	They should sit on the floor and be oriented with their zAxis following the track!!!
//
//	Waypoints need to be initialized .. so FIRST:
//		Define the previous and next Waypoint
//		then first activate and deactivate the Init Seg Len for each waypoint
//		after that do the same for Init Track Passed
//		finally set the width of the segment according to the tracks width - the gizmo resizes correctly in view
//
//	There are extra attributes that allow speedup when moving downhill, or slowdown moving up, and for the AI
//		it should be defined if the next segment has shortcuts, obstacles etc..

private var showTangents : boolean = true;

	// color adjust for bots
var adjustColor : Color = Color(1,1,1,1);

var waypointIndex : int = 1;							// index of the current waypoint (to compare if same hit twice)

var wpColl : BoxCollider;
var nextWp : Transform;
var altWp : Transform;									// if we are branching off, add the alternate
var prevWp : Transform;
var switchDist : float = 5.0;							// Distance at which to switch to next WP

// var initSegLen : boolean = true;						// I don't want the lengths to be calculated while running the game. Init all Waypoints once .. then just store the values ..
var segLen : float;

// var initTrackPassed : boolean = false;
var trackPassed : float;
var fullLen : float;

var isStart : boolean = true;							// are we a start/finish waypoint ??
var prevStart : boolean = false;
var nextStart : boolean = false;

var lastShortcut : boolean = false;
var firstShortcut : boolean = false;

var autoTransform : int = 0;							// do we autotransform at this waypoint
// var hasShortcut : boolean = false;
// var hasObstacle : boolean = false;
// var obstacleOffset : float;
var speedAdjust : float = 1.0;							// adjust speed in this sector ... (like slower for uphill, faster for downhill etc)

	// special flags
var optimalOffset : float = 0.0;						// the optimal offset from center // for example speedpad ..
var nextOptimalOffset : float = 0.0;					// the optimal offset for the next waypoint ... (so we don't need to aquire that info during runtime ..)
var altOptimalOffset : float = 0.0;						// same for the alt wp ...set by init script

var missleProbability : float = 0.15;					// probability to shoot a missle from here (or something else)
var mineProbability : float = 0.15;						// probability to drop a mine ...
var altProbability : float = 0.25;						// probability to use altWp
var juiceProbability : float = 0.8;						// probability of using the juice feature ... there is a 60 40 chance the bots will use it

// var maxTurnRatio : float = 0.0;							// here we can later define if we need sliding or slowing for turns
// var hasSpeedplane : boolean = false;
var speedplaneOffset : float = 0.0;
var collWidth : float = 2.0;
var collOffset : float = 0.0;
var segmentWidth : float = 20.0;						// define with of segment for the AI robots (so they don't aim on the same point)
var segmentHeight : float = 10;
var nextWidth : float;									// access to the next and alt width! set by init script
var altWidth : float;

var dropRespawn : Transform;							// where to respawn if dropped
var dropTimer : float = 4.0;							// time before slowmode from drop time
var airTimer : float = 5.0;

var aiMulti : float = 1.0;								// this allows to increase wpTarget accuracy per waypoint ...
var wpTurnMulti : float = 1.0;							// have them turn a bit harder in hard turns ...

var abyss : boolean = false;							// is this WP standing before an abyss?
var aimVector : Transform;								// the vector aiming to the next waypoint ...

var doJump : boolean;									// should the AI Jump??

function Awake()
{
		// size a bit bigger
	wpColl.size = Vector3((segmentWidth*2 + collWidth), ((segmentHeight+ 5.0) + 1.0), 7.0);
	wpColl.center = Vector3(collOffset, (((segmentHeight+ 5.0)/2) - 0.5), -2.0);
}

function OnDrawGizmos()
{
	Gizmos.color = Color.black;									// set the line color
	var wpTrns : Transform = transform;							// get the transform once ...
	var nextWpScr : wpAttribs;									// get the next waypoints script
	
	nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// get the next wps script
	
		// get Transform direction ..
	// var wpDirection : Vector3 = (wpTrns.TransformDirection(Vector3.forward) + wpTrns.position);
	
		// get four points for our lines...
	var wpUpLeft : Vector3 = (wpTrns.TransformDirection(Vector3(-segmentWidth, segmentHeight, 0)) + wpTrns.position);
	var wpUpRight : Vector3 = (wpTrns.TransformDirection(Vector3(segmentWidth, segmentHeight, 0)) + wpTrns.position);
	var wpDnLeft : Vector3 = (wpTrns.TransformDirection(Vector3(-segmentWidth, -1, 0)) + wpTrns.position);
	var wpDnRight : Vector3 = (wpTrns.TransformDirection(Vector3(segmentWidth, -1, 0)) + wpTrns.position);
		
		// without placing the wpPos BEHIND the waypoint, I can now draw the optimal route...
	var offsetCurr : Vector3 = (wpTrns.TransformDirection(Vector3(segmentWidth * optimalOffset, 0.5, 0.0)) + wpTrns.position);
	var offsetNext : Vector3 = (nextWp.TransformDirection(Vector3(nextWpScr.segmentWidth * nextWpScr.optimalOffset, 0.5, 0.0)) + nextWp.position);
	
		// draw the lines for our rectangle
	// Gizmos.DrawLine (wpTrns.position, wpDirection);
	
	Gizmos.DrawLine (wpUpLeft, wpUpRight);
	Gizmos.DrawLine (wpUpLeft, wpDnLeft);
	Gizmos.DrawLine (wpUpRight, wpDnRight);
	Gizmos.DrawLine (wpDnLeft, wpDnRight);
	
	Gizmos.color = Color.white;
	// draw offset
	Gizmos.DrawLine (offsetCurr, offsetNext);
	// Gizmos.DrawLine (offsetRight, offsetNext);

	
	if(showTangents)
	{	
			// draw the tangents to the next paypoint pos...
		var wpNextRight : Vector3 = (nextWp.TransformDirection(Vector3(nextWpScr.segmentWidth, -1, 0)) + nextWp.position);
		var wpNextLeft : Vector3 = (nextWp.TransformDirection(Vector3(-nextWpScr.segmentWidth, -1, 0)) + nextWp.position);
		
		Gizmos.color = Color.red;				// set the line color
		Gizmos.DrawLine (wpNextRight, wpDnRight);
		
		Gizmos.color = Color.green;				// set the line color
		Gizmos.DrawLine (wpNextLeft, wpDnLeft);
	}

		// set the collider size ..
	wpColl.size = Vector3((segmentWidth*2 + collWidth), ((segmentHeight+ 5.0) + 1.0), 7.0);
	wpColl.center = Vector3(collOffset, (((segmentHeight+ 5.0)/2) - 0.5), -2);
}