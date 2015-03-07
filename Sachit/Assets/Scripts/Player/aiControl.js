// ##########################################
//
//	Character control script for robot race
//
//	ToDo:
//
//	IMPORTANT :

	//	!!! Instead of using the refObj handle this all in code?? Convert a worldPosition into local Position? Introduce here first ...
	// 	!!! AS I'm using rotateSpeed here, maybe hand over actual rotation vlaues to move script (instead of input?) and don'T use 1 .. -1 mut Mathf.moveTowards with set speed..

//
//	##########################################

// #####	SETUP VARs	#####
var wrongDirEnable : boolean = false;

var moveAi : aiMove;					//player_construct
var aiVault : aiVault;					// where do we store our stuff ..
var waypoint : Transform;				// the first waypoint ...
var refTrns : Transform;				// our ref trans ..
//var refUp : Transform;					// used as upvector in aiming ...
//var refRoot : Transform;					// used as upvector in aiming ...

var construct : Transform;				// our characters construct
var rotateSpeed : float = 120.0	;		// our rotate speed as used in move script
var switchDist : float = 15.0;			// when to switch to next WP
var deadzone : float = 0.5;				// if the angle is inside this range .. do not correct rotation ..
private var gradInput : float = 0.6;			// speed at which horiz Input increases / decreases (smoother ai rotations)

var robotIndex : int = 1;					// index of robot for the array in data vault ..
var robotOffset : float = 1.0;				// multiplyer for waypoint offset ..

// private var trackProgress : float;			// the position index of the robot ...
private var lapCount : int = 0;				// number of completed laps
private var wpPos : Vector3;				// the wpPosition including offset
private var lapChange : boolean = false;	// change lap flag
private var trackLen : float;								// length of complete track
private var wpScript : wpAttribs;							// this will hold the current waypoint script (to reset player on next wp after drop)

private var wpDist : float = 0.0;							// our Distance ...
private var maxRot : float = 0.0;							// max rotation for this cycle ...
private var newVect : Vector3 = Vector3.zero;		// placeholder for new direction in angle calculations ...
private var newAngle : float = 0.0;		// placeholder for the new direction (turn to waypoint)

// private var lastWpIndex : int = -99;						// last collision waypoint index
private var segLen : float;									// waypoint segment length
private var wpSpeedup : float = 1;							// the current waypoints speed multiplier
private var trackPassed : float = 0.0;						// the distance traveled so far

private var transUpTimer : float = 0.0;
private var transDnTimer : float = 0.0;


var transTime : float = 9.0;			// time we are transformed

var transDnTime : float = 1.0;			// time we are in car mode
var transUpTime : float = 4.0;			// time we are in plane mode

var transInterval : float = 2.0;		// time from completed transformcycle to next one

private	var doSlide : int = 0;

	// system time at which to start the race
private var startTime : float;

	// timer for speed variable
private var vertInput : float;							// holder for movement speed...
	
private var nextSpeedTest : float;						// wann nächster test
private var speedTestInterval : float = 7.0;			// alle 7 sek checken für speed adjust

	// new distance calc variables ...
private var wpAimNode : Transform;
var wpDistPos : Vector3;									// this will hold the position we use to calculate player distance to waypoint ...

	// wrong direction timer
private var wrongDirReset : float = 3.0;					// after 4 seconds in wrong direction reset player
private var wrongDirTimer : float = 0.0;
private var wrongDirEngaged : boolean = false;				// I want to make sure that when going back and hitting another waypoint (thus changing dist does not directly cancel our backMovement ...)
var wpOldDist : float = 0.0;								// last loops track progress

var publicInfo : getInfo;

var playerInfo : getInfo;
/*
function Start ()
{	
	// Maybe set to waypoint_0 automatically?????
	// set RefTrns automatically ???
	wpScript = (waypoint.GetComponent(wpAttribs) as wpAttribs);
	trackLen = wpScript.fullLen;								// get the track len from the first waypoint ...
	aiVault.hitWpScript = wpScript;								// init the dataVaults wpscript ...

		// these should only be set after start ..init to some value first ...
	segLen = wpScript.segLen;									// get the initial segLen
	wpSpeedup = wpScript.speedAdjust;							// get the initial waypoints speed boost
	
		// get our aimNode at the beginning
	wpAimNode = wpScript.aimVector;
	
		// get the waypoints speedup setting
	aiVault.wpSpeedup = wpScript.speedAdjust;									// get the initial waypoints speed boost
			
	wpPos = (waypoint.TransformDirection(Vector3((robotOffset * wpScript.segmentWidth), 0, 25.0)) + waypoint.position);
	
	transUpTimer = Time.time;
	transDnTimer = Time.time;

	doSlide = 0;
	
	aiVault.noTrans = true;						// set the transform state
	aiVault.upTrans = false;
	aiVault.dnTrans = false;
	aiVault.transTimer = -transInterval;
	aiVault.animStarted = false;				// set the initial value ..
	aiVault.waypoint = waypoint;			// store the initial waypoint
	
		// read the start time from Vault
	startTime = DataVault.startTime;
}

function wpAim (rootObj : Transform, aimObj : Transform, target : Vector3, upVec : Transform) 
{

	// This function can be used to get the correct rotation to our Waypoints.
	// NOTE:
	//		target and upVec are reversed here. As I ONLY want the y rotation to the
	//		waypoint, I first aim UP (for example to the Raycast sender) and then use
	//		the waypoint as upvector. This way, I always stay aligned to the Players 
	//		y-axis AND get the correct rotation.
	//
	// of course as I can't specify the Aim Axis to be y, we need to take the z rotation and apply
	// it to our robots y channel

	aimObj.LookAt(upVec, rootObj.InverseTransformPoint(target));										// aim the object
	// aimObj.Rotate (Vector3(-90, 0, 0));												// orient it correctly

}

// function runAiControl(pDeltaTime : float, pTime : float) 
function Update()
{
		// Check if we are in pause mode ...
	if(playerInfo.gameEnabled)
	{
		
		// var vertInput : float;								// define the input vars first ....
		var horizInput : float;
		//var trgtAngle : float;								// for the AI I'm just passing the target angle to the move function
	
		var dir : Vector3 = Vector3.zero;				// for handling the acceleration ...
		
		// later dealt with when run from player input proc ..
		// get the current deltaTime !!
		var pDeltaTime : float = Time.deltaTime;					// Get the time ONCE
		var pTime : float = Time.time - playerInfo.pausedTime;
	
		if(pTime > startTime)
		{
		// start code to delay race start (for countdown etc..)								
				
				//
				//	Variable AI SPEED
				// 	test for variable forward speed -> add a bit of irregularity to robots speed
			var speedDecision : float = Random.value;
			
				// check only at the given intervals ...
			if (pTime > nextSpeedTest)
			{
					// reset the counter
				nextSpeedTest = pTime + speedTestInterval;
			
					// Do the speed check ..
				// if (speedDecision <= DataVault.fullSpeedProbability)
				if (speedDecision <= 0.97)
				{	
						// 87 % chance for full speed
					vertInput = 1.0 * DataVault.aiSpeedMulti;
				}
				else
				{
						// else use a value between 0.8 and 1
					vertInput = speedDecision * DataVault.aiSpeedMulti;
				}
	
	// DEBUG		print ("Robot " + robotIndex + " Speed is: " + vertInput);
			}
			
			
				// Has to be determined by Waypoint ... 
			// horizInput = Input.GetAxis("Horizontal");
		
			//	######################
			//
			// Handle Waypoint turning ...
			//
			//	!!! Instead of using the refObj handle this all in code?? Convert a worldPosition into local Position? Introduce here first ...
			// 	!!! AS I'm using rotateSpeed here, maybe hand over actual rotation vlaues to meve script (instead of input?)
			// For now we use offset for all of them ..! IMPORTANT -> LATER set the max widh of the track segment inthe waypoint settings and use a multiplyer here ...
			
	
			var horizGoal : float;
				
				// Check if I need to go to next waypoint (+50 as this is what I move the waypoints back..)
			if (aiVault.switchWp)
			{
					// reset the switch flag ..
				aiVault.switchWp = false;
	
					// DONE ABOVE ALREADY   wpScript = (waypoint.GetComponent(wpAttribs) as wpAttribs);
				var wpDecision : float = Random.value;		
				
					// waypoint decision ... add difficulty handler, too
				if (wpDecision >= DataVault.shortcutProbability)
				{																// 75% probability to take next waypoint, not shortcut
					waypoint = aiVault.hitWpScript.nextWp;
				}
				else
				{																// take the shortcut..
					waypoint = aiVault.hitWpScript.altWp;
				}
				aiVault.waypoint = waypoint;									// store new waypoint for use in other scripts (aiMove)
				
					// get the script of the just hit waypoint
				wpScript = aiVault.hitWpScript;
				
					// get the hit waypoints segLen
				segLen = wpScript.segLen;
				
					// get our aimNode before switching over
				wpAimNode = wpScript.aimVector;
			
					// get the waypoints speedup setting
				aiVault.wpSpeedup = wpScript.speedAdjust;									// get the initial waypoints speed boost
				
					// check if we need to go into plane mode ..
				if (wpScript.autoTransform == 1)
				{
						// check if we are in normal mode first ...
					aiVault.dnTrans = false;		// Reset the flags 
					aiVault.upTrans = true;
					aiVault.noTrans = false;
								
					aiVault.transTimer = pTime + transUpTime;			// set the transformed time ...
				}
				else if (wpScript.autoTransform == 2)
				{
						// check if we are in normal mode first ...
					aiVault.dnTrans = true;		// Reset the flags 
					aiVault.upTrans = false;
					aiVault.noTrans = false;
								
					aiVault.transTimer = pTime + transDnTime;			// set the transformed time ...
				}
						
					
					// get the trackPassed to the just hit waypoint, before changing script
				trackPassed = wpScript.trackPassed;		
					
					// handle lap Change ..
				if (wpScript.isStart)
				{									// iff current waypoint is finishLine ...
					if (!lapChange)
					{									// lap NOT changed in last loop
						lapChange = true;
						lapCount++;
					}
				}
				else
				{									// if not, just set our flag back to false
					lapChange = false;
				}
				
					// get the waypoint script ...
				// handled above .. wpScript = (waypoint.GetComponent(wpAttribs) as wpAttribs);  				// cast as Type for iPhone compatibility
	
				
				// Offset wrong!!! This offset is based on the just hit wp, and should be based on the next one (as we are setting our new wpPos)
				
					// get the correct offset based on the segments width -> and move it back along the wp axis (as the closer they get, the more jitter)
				robotOffset = Random.value - 0.5;									// alternatively use a random value to determine the offset	RV from 0 to 1, we want -0.5 to 0.5
				
	// !!!
	// !!!			
					// set offset to correct value and save on info script
				publicInfo.wpOffset = robotOffset;
				wpPos = (waypoint.TransformDirection(Vector3((robotOffset * wpScript.segmentWidth), 0, 25.0)) + waypoint.position);				
				aiVault.wpPos = wpPos;												// store current wp position
				
	// DEBUG
				aiVault.wpOffset = robotOffset;	
	
			}	
			
			
				// NOW!! Get the distance to wp!!
									
				// get player position in aimNode space
			wpDistPos = wpAimNode.InverseTransformPoint(construct.position);
			
				// Now get the new distance (only the z value of the player position ...)
			wpDist = wpDistPos.z;
			
		
			
			var tProgress = (trackPassed + wpDist) + trackLen * (lapCount-1);
			
					
					//	Store Progress in DataVault...
			DataVault.trackProgress[robotIndex] = tProgress;
	
			// #############################
			//
			//	Wrong Dir handling
			//
			// #############################
	
		if (!wrongDirEnable)
		{
				// do nothing
		}
		else if (tProgress >= wpOldDist)
		{						// if we are moving forward or standing ...
			if(wrongDirEngaged)
			{
					// if we were going back and hit a new waypoint .. and now our trackpassed has changed in first loop to be bigger .. don't directly cancel wrongDir out out
					// give one try (as in next loop the dist should still decrease)
				wrongDirEngaged = false;
			}
			else
			{
				wrongDirTimer = pTime;
			}
		}
		else 
		{						// we are moving back
			// print("Moving back Robot: " + robotIndex);
			
			if(!wrongDirEngaged)
			{
				wrongDirEngaged = true;
			}
			if ((wrongDirTimer + wrongDirReset) < pTime)
			{													// time to reset us ..
					// store our current position
				var resetPos : Vector3 = construct.position;
				
					// get the angle to our wpDistPos
				// var resetDirection : Vector3 = wpDistPos - playerTrns.position;
				var resetDirection : Vector3 = waypoint.position - construct.position;
				var resetAngle : float = Vector3.Angle(resetDirection, construct.TransformDirection(Vector3.forward));
				
					// align player to new direction
				construct.Rotate(0, resetAngle, 0);
				
					// reset Timer
				wrongDirTimer = pTime;
				
					// reset Speed etc...
				moveAi.currSpeed = 0.0;
				print("Reset Robot: " + robotIndex);
						
			}
		}
	
			// store the last dist ...
		wpOldDist = tProgress;
			
			
				// Check if someone is between me and the WP
		
				// handle other AI flags .. (shortcut, obstacle, offset, speedplane etc...)
			
			//
			// Orient to waypoint
			//
			
			
	
			refTrns.position = wpPos;																									// place our refObject at the Waypoint position
			refTrns.localPosition.y = 0.6;																								// now rise the point to the sender Plane (0.6) (player) plane ...(y = 0)
			newVect = refTrns.position - construct.position;																	// get the vector direction from player to waypoint (in player plane ...)
	
			newAngle = Vector3.Angle(newVect, construct.TransformDirection(Vector3.forward));				// get the angle to the waypoint
																												
				// new angle resolution ...
			//wpAim (refRoot, refTrns, wpPos, refUp);										// use the inverseLookAt method
			
			// newAngle = 
			// print("NewAngle: " + newAngle);	
	
			
				// get current maxangle (for this dTime)...
			maxRot = rotateSpeed * pDeltaTime;
			
				// init rotation as 0
			horizGoal = 0.0;
			
			if (newAngle > deadzone)
			{
	
				if(refTrns.localPosition.x < 0)
				{														// we need to move more left as the refObj is on the left hand player side ...
					if (newAngle <= -maxRot)
					{													// we need more than one cycle to rotate this way ..
						horizGoal = -1;
					}
					else
					{													// get the fraction we need to move now ...
						horizGoal = (newAngle / -maxRot);
					}
				}
				else
				{														// the other direction ...
					if (newAngle >= maxRot)
					{													// we need more than one cycle to rotate this way ..
						horizGoal = 1;
					}
					else
					{													// get the fraction we need to move now ...
						horizGoal = (newAngle / maxRot);
					}
				}
			}
		
				// Now add gradual increase to our input ... !! Strength via gradInput ...
			horizInput = Mathf.MoveTowards(horizInput, horizGoal, gradInput);
	
		
	
		
		
				// Sliding code revert if nothing pressed ...
		//	if (HUD_Slide && (slideTimer < pTime)){ /* HUD_Script.ChangeFrame(1,0); //*-/ hudChanges[1] = 0; doSlide = 0; HUD_Slide = false; hudChanged = true;} //still sliding, button released, no touches..	
		
		// end start delay code ...
		}
		
		
			// NOW! Run the move function of the move script passing the current dTime, horizInput and vertInput;
		moveAi.moveCharacter(pDeltaTime, pTime, vertInput, horizInput, doSlide);

	} // end is enabled loop
}
*/
