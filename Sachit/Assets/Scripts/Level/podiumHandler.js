// if a bot has passed the finish line, the pMove or aiMove script sets the 
// finishRank for him AND locks the _refHolder.trackProgress to ordered VERY high
// values. So sorting still has correct order even if race is finished

// This is the podium handling code

var podiumPlane : Transform;
var podiumMat : Material;
var fadeTime : float = 1.5;

var podiumMover : Transform;
var podiumPosition : Transform;
var podiumCamera : Transform;

var posOne : Transform;
var posTwo : Transform;
var posThree : Transform;

private var robotMeshes : GameObject[] = new GameObject[7];					// the robot meshes

private var HUD_Update : GUI_Flags;
private var HUD_Mover : Transform;				// the parent transform for the HUD
private var visible : boolean = false;			// are we visibly handling the podium ??
var fadeIn : boolean = false;
var fadeOut : boolean = false;
private var fadeTimer : float = 0.0;			// timer when to fade back in again
var stagePrepared : boolean = false;

private var mainCam : Transform;				// the main camer transform (will be parented to our cam handler after race ...)

private var _refHolder : refHolder;

function Awake ()
{
		// reset black to 0
	podiumMat.color.a = 0.0;
	podiumPlane.localPosition.y = 2000.0;
	
		// get our refHolder
	var refConstruct = GameObject.Find("_refHolder");
	_refHolder = refConstruct.GetComponent(refHolder) as refHolder;

		// fadeIn to off
	fadeIn = false;
}


function OnApplicationQuit()
{
		// reset black to 0
	podiumMat.color.a = 0.0;
	podiumPlane.localPosition.y = 2000.0;
}



function Update () 
{
	var dTime : float = Time.deltaTime;
	
		// Handle Camera fadeIn
	if (fadeOut)
	{
			// if we are already on black screen do nothing ...
		if (!visible)
		{
			podiumPlane.localPosition.y = 0.0;
			
				// fade in but slow
			podiumMat.color.a += (dTime / fadeTime) * 0.4;
			
			if (podiumMat.color.a >= 1.0)
			{
				visible = true;
				fadeOut = false;
				_refHolder.podiumBlack = true;
				// fadeOut = true;
				
					// set a timer to fade back in again (after 3 sec)
				fadeTimer = Time.time + 0.5;
			}
		}
	}
		
		// we only need to handle the podium in the end
	if(_refHolder.podiumStart)
	{

			// Handle Camera fadeOut
		if (fadeIn)
		{
				// if we are already on black screen do nothing ...
			if (visible)
			{
				podiumMat.color.a -= dTime / fadeTime;
				
				if (podiumMat.color.a <= 0)
				{
					// NO, since we need that to check if podium was initialized ...   visible = false;
					// fadeIn = true;
					fadeIn = false;
					_refHolder.podiumActive = true;
					podiumPlane.localPosition.y = 2000.0;
				}
			}
		}
	
			// First trigger the initial fadeout. Only then will we do additional stuff ...
		if (!visible)
		{
			fadeOut = true;
			/*visible = true;
			_refHolder.podiumBlack = true;
			podiumMat.color.a = 1.0;
			fadeIn = true;*/
		}
		
			// do we have a black screen? Can we continue handling stuff?
		if (_refHolder.podiumBlack)
		{
			if (!stagePrepared)
			{
				//
				// FIRST GET ALL THE STUFF WE NEED ...
				//

					// find the HUD transform
				var refConstruct = GameObject.Find("UIToolkit");
				HUD_Mover = refConstruct.transform;
				
					// find the HUD Map transform
				refConstruct = GameObject.Find("GUI_Handler");
				HUD_Update = refConstruct.GetComponent(GUI_Flags) as GUI_Flags;
				
					// find the camera transform
				var bestCam = Camera.main;
				mainCam = bestCam.transform;
				
					// get the robot meshes
				refConstruct = GameObject.Find("_levelSettings_grp_doNotMove");
				var _initLevel = refConstruct.GetComponent(initLevel) as initLevel;
				robotMeshes = _initLevel.robotMeshes;
				
				//
				//	END GET STUFF 
				//
			
			
					// Move HUD out of the way
				HUD_Mover.localPosition.y -= 2000.0;
				HUD_Update.menuChanged = true;
				// HUD_Map.localPosition.y -= 2000.0;
				
					// Move podium into place
				podiumMover.position = podiumPosition.position;
				podiumMover.rotation = podiumPosition.rotation;
				
					// Stop Robot movement code
				// basically done by _refHolder.podiumBlack stuff ...
				// Add this to our pMove and aiMove Functions ..
				//*			// Podium handling condition
				//*	if (!_refHolder.podiumBlack)
				//*	{
				//*		*CODE HERE
				//*	}
				
				
				// Currently triggered by Invoke("doEnd", 10.0); in pMove
				
				
					// set some vars ...
				var botTrns : Transform;
				var botAnim : Animation;
				
					
					// Move meshes to their podiums, or out of the way and start animations
				if (_refHolder.botCount > 0)
				{
						
					botTrns = robotMeshes[_refHolder.orderedBots[6]].transform;
						// adjust material first
					botTrns.GetComponentInChildren(Renderer).material.color = new Color(1,1,1,1);
					botTrns.parent = posOne;
					botTrns.localPosition = Vector3(0,0,0);
					botTrns.localEulerAngles = Vector3(0,0,0); 
					botAnim = robotMeshes[_refHolder.orderedBots[6]].animation;
					botAnim.Play("Win");
					botAnim.PlayQueued("WinLoop", QueueMode.CompleteOthers);
				}
					// Handle place 2
				if (_refHolder.botCount > 1)
				{
					botTrns = robotMeshes[_refHolder.orderedBots[5]].transform;
						// adjust material first
					botTrns.GetComponentInChildren(Renderer).material.color = new Color(1,1,1,1);
					botTrns.parent = posTwo;
					botTrns.localPosition = Vector3(0,0,0);
					botTrns.localEulerAngles = Vector3(0,0,0);
					botAnim = robotMeshes[_refHolder.orderedBots[5]].animation;
					botAnim.Play("Win");
					botAnim.PlayQueued("WinLoop", QueueMode.CompleteOthers);
				}	
					//Handle place 3
				if (_refHolder.botCount > 2)
				{
					botTrns = robotMeshes[_refHolder.orderedBots[4]].transform;
						// adjust material first
					botTrns.GetComponentInChildren(Renderer).material.color = new Color(1,1,1,1);
					botTrns.parent = posThree;
					botTrns.localPosition = Vector3(0,0,0);
					botTrns.localEulerAngles = Vector3(0,0,0);
					botAnim = robotMeshes[_refHolder.orderedBots[4]].animation;
					botAnim.Play("Win");
					botAnim.PlayQueued("WinLoop", QueueMode.CompleteOthers);
				}
					// Handle the remaining unranked bots ...
				if (_refHolder.botCount > 3)
				{
					for (var unranked = 3; unranked >= (7 - _refHolder.botCount); unranked--)
					{
						botTrns = robotMeshes[_refHolder.orderedBots[unranked]].transform;
						botTrns.localPosition = Vector3(0,-2000,0);
					}
				}
			
					
					// move camera into place
				mainCam.parent = podiumCamera;
				mainCam.localPosition = Vector3(0,0,0);
				mainCam.localEulerAngles = Vector3(0,0,0);
									
					// set stage as prepared
				stagePrepared = true;
			}
			
				// If time has come, start fade in
			if ((visible) && (fadeTimer < Time.time))
			{
				fadeIn = true;
			}
		}
	
	}
	
	/*
	What needs to be done?
	
		1. OK	-	Fade to black
		2. While black, hide the HUD (not the pause menu)
		3. Hide the Robot meshes
		4. Move the Podium into position
		5. parent the camera to the Podium Camera holder
		6. Parent the top 3 nots to their Podium space
		7. Start the podium animation loop
		8. Start the robots Win animation loop
		9. Fade in!
		0. Set the _refHolder.podiumActive, so that nect time we enter Menu
		
		Also:
			a. Store all bots placement
			b. store player position
			c. store player collected points
	
						// Move meshes to their podiums, or out of the way and start animations
				if (_refHolder.botCount > 0)
				{
					botTrns = robotMeshes[_refHolder.botMeshes[_refHolder.robots[6]]].transform;
					botTrns.parent = posOne;
					botTrns.localPosition = Vector3(0,0,0);
					botTrns.localEulerAngles = Vector3(0,0,0); 
					botAnim = robotMeshes[_refHolder.botMeshes[_refHolder.robots[6]]].animation;
					botAnim.Play("Stand_Idle");
				}
					// Handle place 2
				if (_refHolder.botCount > 1)
				{
					botTrns = robotMeshes[_refHolder.botMeshes[_refHolder.robots[5]]].transform;
					botTrns.parent = posTwo;
					botTrns.localPosition = Vector3(0,0,0);
					botTrns.localEulerAngles = Vector3(0,0,0);
					botAnim = robotMeshes[_refHolder.botMeshes[_refHolder.robots[5]]].animation;
					botAnim.Play("Stand_Idle");
				}	
					//Handle place 3
				if (_refHolder.botCount > 2)
				{
					botTrns = robotMeshes[_refHolder.botMeshes[_refHolder.robots[4]]].transform;
					botTrns.parent = posThree;
					botTrns.localPosition = Vector3(0,0,0);
					botTrns.localEulerAngles = Vector3(0,0,0);
					botAnim = robotMeshes[_refHolder.botMeshes[_refHolder.robots[4]]].animation;
					botAnim.Play("Stand_Idle");
				}
					// Handle the remaining unranked bots ...
				if (_refHolder.botCount > 3)
				{
					for (var unranked = 3; unranked >= (7 - _refHolder.botCount); unranked--)
					{
						botTrns = robotMeshes[_refHolder.botMeshes[_refHolder.robots[unranked]]].transform;
						botTrns.localPosition = Vector3(0,-2000,0);
					}
				}
	
	*/

}