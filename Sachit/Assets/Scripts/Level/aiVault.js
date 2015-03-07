var playerPos : Vector3;
var noTrans : boolean = true;									// those handle the current desired transformation state ...
var upTrans : boolean = false;
var dnTrans : boolean = false;
var stillUp : boolean = false;									// those are for the playAnim script to finish playing the correct animations ...
var stillDn : boolean = false;

var transTimer : float;
var animStarted : boolean;

var stopped : boolean = false;							// are we in stopped mode?


	// animation handling flags
var fastSkate : boolean = false;						// are we skating fast?
var speedPlane : boolean = false;						// are we on a speedplane?

	// store the current waypoint
var waypoint : Transform;
var switchWp : boolean = false;							// do we need to switch on next loop??
var wpPos : Vector3;									// store the current wp position
var hitWpScript : wpAttribs;							// store the next wp script from collider	

var wpSpeedup : float = 1;								// the current waypoints speed multiplier

var wpOffset : float;
var raceOver : boolean = false;							// are we done?

	// currently active pickup
// var pickupType : int = 0;
var canTransform : boolean = true;

