// var missleCC : Rigidbody;
var thisTrns : Transform;

var lockTarget : Transform;
var lockIndex : int;					// index of our target

var _refHolder : refHolder;
var waypoint : Transform;

var deploySound : AudioClip;

var playerMissle : boolean = false;		// is this the player missle??

private var seekTime : float = 30.0;

// var rayCastSender : Transform;
// private var hoverRayHit : RaycastHit;
// private var hoverRayMask = 1<<8;

var isDeployed : boolean = false;
var locked : boolean = false;

private var switchWp : boolean = false;
// private var hitWpScript : wpAttribs;
private var wpScript : wpAttribs;
private var lastWpIndex : int = -99;
private var wpPos : Vector3;
private var wpOffset : float;			// the offset from waypoint center ...

private var targetInfo : getInfo;
private var targetDist : float;

private var dieTime : float;

private var isWarning : boolean = false;


	// set missle stats
private var missleSpeed : float = 50.0;
private var moveDirection = Vector3(0, 0, missleSpeed);
private var switchDist : float = 25;

private var lostLock : boolean;
			

	// our hover height
// var hoverHeight : float = 4.0;

function Awake () 
{
		// not deployed yet
	isDeployed = false;
	
		// set move direction vector again
	moveDirection = Vector3(0, 0, missleSpeed);

	// hoverHeight = 4.0;
	
		// disable rotation for missle..
	// also set our rigidbody to freeze rotation
	// missleCC.freezeRotation = true;
	// missleCC.useGravity = false;
	
		// collide mask for hover ray
	// hoverRayMask = 1<<8;
	
}


	// get our target
function LockOn(target : int, wpGet : Transform, offset : float)
{
		// set as deployed
	isDeployed = true;

		// check for target
	if (target == 7)
	{
		locked = false;
	}
	else
	{
			// get the target
		lockTarget = _refHolder.allConstructs[target];
		lockIndex = target;
		
		// this function will set the correct target
		targetInfo = _refHolder.allGetInfo[target];
		locked = true;
	}
	
		// get wpScript
	waypoint = wpGet;
	// was physics... hitWpScript = (waypoint.GetComponent(wpAttribs) as wpAttribs);
		// no physics version
	wpScript = (waypoint.GetComponent(wpAttribs) as wpAttribs);
	// was physics version ...  wpPos = (waypoint.TransformDirection(Vector3((wpOffset * hitWpScript.segmentWidth), 2.0, 5.0)) + waypoint.position);
	
	wpPos = (waypoint.TransformDirection(Vector3((offset * wpScript.segmentWidth), 1.2, 5.0)) + waypoint.position);
	// wpOffset = offset;

	
		//	Set time at which to self destruct
	dieTime = Time.time + seekTime;
	
		// deploy sound ...
	audio.clip = deploySound;
	audio.Play ();
	
		// !!!! Add explosion to missle if "self destruct"
}

function Update()
{

		
		// only move if actually deployed ...
	if(isDeployed)
	{
		
		var currTime = Time.time;
		var dTime = Time.deltaTime;

			// deactivate missle after time ...
		if(currTime > dieTime)
		{
				// limit the stuff that can only be doine when locked
			if (locked)
			{
					// stop warning missle ...			
				if(isWarning)
				{
					targetInfo.missleClose = false;
					targetInfo.stopWarning();
					isWarning = false;
				}
			}
					
				// play explosion
			_refHolder.allExplosions[lockIndex].position = thisTrns.position;
			_refHolder.allExplosionScr[lockIndex].Explode();
			
				// move away
			thisTrns.localPosition = Vector3(0,0,0);
			isDeployed = false;
			lostLock = false;
			
				
		}
		else
		{
		
			// get the targetHeight
		
			// #######################################
			//
			// WP switch handling START
				
				// First check if we need to switch waypoints ...
			if (switchWp)
			{
					// reset the switch flag ..
				switchWp = false;
				
					// get next waypoint	(This will not select the wp hit, but the next one ..)
				// was physics... waypoint = hitWpScript.nextWp;
				waypoint = wpScript.nextWp;
				
					// get the next waypoints script (for the offset)
				wpScript = waypoint.GetComponent(wpAttribs) as wpAttribs;
			}
			
			// wp switch handling END
			// ################################	
		

				// Get the current wpAim Position, based on the targets offset
			if (locked)
			{
				wpPos = (waypoint.TransformDirection(Vector3((targetInfo.wpOffset * wpScript.segmentWidth), 1.2, 5.0)) + waypoint.position);
			}
			else
			{
				wpPos = (waypoint.TransformDirection(Vector3((wpScript.segmentWidth), 1.2, 5.0)) + waypoint.position);
			}
				// check distance to next waypoint and whether we need to switch
			var wpDistPos : Vector3 = thisTrns.InverseTransformPoint(wpPos);
			var wpDist = wpDistPos.sqrMagnitude;
			
			if (wpDist < switchDist)
			{
				switchWp = true;
			}
				
			var wp3D : Vector3 = wpPos;
		
			if (locked)
			{
					// Get our targets aim point (a bit up, not on the feet)
				var target3D : Vector3 = lockTarget.TransformDirection(0.0, 1.2, 0.0) + lockTarget.position;
					
					// compare distances (is the target closer than the waypoint)
				var targetDist : float = thisTrns.InverseTransformPoint(target3D).sqrMagnitude;
						
					// check if we should be following our target
				if(targetDist < 900)
				{
						// if target is close ... navigate to it
					//wp3D = target3D;
					
						// keep height above ground!!!!!
					wp3D = Vector3(target3D.x, wp3D.y, target3D.z);
				}
				
					// look at target
				thisTrns.LookAt(wp3D);
												
					// move towards target (use move towards, so we don't overshoot!!!)
				// thisTrns.Translate(moveDirection * Time.deltaTime);
				thisTrns.position = Vector3.MoveTowards(thisTrns.position, wp3D, missleSpeed * 1.4 * Time.deltaTime);
						
					// NOW after moving to our target, we need to check if we hit it ...
				targetDist = thisTrns.InverseTransformPoint(lockTarget.TransformDirection(0.0, 1.2, 0.0) + lockTarget.position).sqrMagnitude;
				
					// If distance is closer than some value (test 10) and no collision was made uncheck targetting and go along trajectory
				if(targetDist < 15.0)
				{
						// 3m distance is live dist ...
					locked = false;
												
						// disable warning
					targetInfo.missleClose = false;
					targetInfo.stopWarning();
					isWarning = false;
							
						//if target not jumping .. hit in detonation range .. check if player is jumping
					if(!targetInfo.jumping)
					{
							// set target to hit by missle
						targetInfo.missleImpact(playerMissle);
									
							// stop speed
						// missleCC.velocity = Vector3.zero;
								
							// play explosion
						_refHolder.allExplosions[lockIndex].position = thisTrns.position;
						_refHolder.allExplosionScr[lockIndex].Explode();
								
							// move out of the way			
						thisTrns.localPosition = Vector3(0,0,0);
						isDeployed = false;
						lostLock = false;

					}
					else
					{
							// detonate after 2 sec...
						dieTime = Time.time + 0.5;
						
							// set to lost lock
						lostLock = true;
					}
				}
				else if (targetDist < 30.0)
				{
						// if the missle is 5 m away, initiate jump for ai
					targetInfo.missleJumpNow();
				}
						

						// hoverHeight = Mathf.MoveTowards(hoverHeight, (targetInfo.currHeight + 1.0),10.0 * dTime);
							
					// get the sqrMagnitude and warn player if needed ... (check every 10 frames ...)
				if(Time.frameCount % 10 == 0)
				{
					if(targetDist < 2500)
					{
							// check if we are already warning the player 
						if (!isWarning)
						{
								// warn player of incoming missle ...			
							targetInfo.missleClose = true;
							targetInfo.startWarning();
							isWarning = true;
						}
					}
					else
					{
							// check if we are still warning the player
						if(isWarning)
						{
							targetInfo.missleClose = false;
							targetInfo.stopWarning();
							isWarning = false;
						}
					}
				}
			}	// end Target handling
			else
			{										// if we are not locked on, just move along...
					// if we lost lock last loop, just continue straight
				if (!lostLock)
				{
						// look at selected point
					thisTrns.LookAt(wp3D);
				}
					
					// move towards waypoint
				thisTrns.Translate(moveDirection * Time.deltaTime);
			}
	
		// END timer loop
		}	
	// END if deployed loop
	}
}


/*
	// collision handling ..
function OnTriggerEnter (hit : Collider)
{

	if (hit.collider.CompareTag("waypoint"))
	{
			// Handle Waypoint hit
		var tempWpHit = (hit.collider.GetComponent(wpAttribs) as wpAttribs);
			
		
			
		if (lastWpIndex != tempWpHit.waypointIndex)
		{
			// print("NewIndex: " +  );
			hitWpScript = tempWpHit;
			lastWpIndex = hitWpScript.waypointIndex;
			switchWp = true;
		}
	}
}
*/

