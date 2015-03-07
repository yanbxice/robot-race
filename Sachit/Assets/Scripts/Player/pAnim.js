// simple script to play all animations .... 
// Crossfading and handling currently playing animations is done in here ...
var play : Animation;							// iRobot_Player
var timerBuffer : float = 2.0;					// buffer to take off counter (to give time for reTransform)
var speedupTimer : float = 0.0;					// how long Skate slow has been played...
var publicInfo : getInfo;
var _refHolder : refHolder;

var audioSource : AudioSource;
var skate : AudioClip;

private var nextRandom : float = 0.0;			// skate slow will randomly just play the idle animation but once started it should run for a few seconds instead of switching in every call -> timer
private var getReadyPlayed : boolean = false;	// we only want to play the get ready anim once .. 

private var standInit : boolean = false;

function playSkateSlow ()
{
//if(!play.IsPlaying("Damage") && !play.IsPlaying("Attack"))
		// this is for normal skating mode ...
		// check a few flags..
	if(publicInfo.stopped)
	{										// robot is standing
		play.CrossFade ("Stand_Idle", 0.5);
		//print ("Called skate Slow");
			// play collision sound
		//audioSource.audio.clip = skate;
		//audioSource.audio.Stop ();
	}
	else if(_refHolder.getReady)
	{										// if we are in get Ready mode
		if (!getReadyPlayed)
		{		// play get ready, then start pingPong animation of end.
			play.CrossFade ("GetReady");
			play.CrossFadeQueued("readyIdle", 0.3, QueueMode.CompleteOthers);
			getReadyPlayed = true;
			
				// play collision sound
			//audioSource.audio.clip = skate;
			//audioSource.audio.Stop ();
		}
	}
	else if (publicInfo.speedPlane || publicInfo.juiceActive)
	{
		// if (!play.IsPlaying("Attack") && !play.IsPlaying("Damage") && !play.IsPlaying("JumpLand") && !play.IsPlaying("Idle2Car") && !play.IsPlaying("CarIdle") && !play.IsPlaying("Car2Idle") && !play.IsPlaying("Skate_Slow") && !play.IsPlaying("Idle2Plane") && !play.IsPlaying("PlaneIdle") && !play.IsPlaying("Plane2Idle"))
		// if (!play.IsPlaying("carhit") && !play.IsPlaying("planehit") && !play.IsPlaying("Attack") && !play.IsPlaying("Damage") && !play.IsPlaying("JumpLand") && !play.IsPlaying("Idle2Car") && !play.IsPlaying("CarIdle") && !play.IsPlaying("Car2Idle") && !play.IsPlaying("Idle2Plane") && !play.IsPlaying("PlaneIdle") && !play.IsPlaying("Plane2Idle"))
		if (!play.IsPlaying("carhit") && !play.IsPlaying("planehit") && !play.IsPlaying("Attack") && !play.IsPlaying("JumpLand") && !play.IsPlaying("Jump_Over") && !play.IsPlaying("Jump_Float") && !play.IsPlaying("Idle2Car") && !play.IsPlaying("CarIdle") && !play.IsPlaying("Car2Idle") && !play.IsPlaying("Idle2Plane") && !play.IsPlaying("PlaneIdle") && !play.IsPlaying("Plane2Idle"))
		{
			// play.CrossFade ("Skate_Idle", 0.5);		// switch to idle animation
			play.CrossFade ("Skate_Fast", 0.25);		// switch to fast animation
			standInit = false;
			// play.Play ("Skate_Fast");		// switch to fast animation
			
				// play skate sound
			//audioSource.audio.clip = skate;
			//audioSource.audio.Play ();
		}
	}
	else
	{
//!!!!!! -> AI
		if (!play.IsPlaying("carhit") && !play.IsPlaying("planehit") && !play.IsPlaying("Attack") && !play.IsPlaying("Damage") && !play.IsPlaying("JumpLand") && !play.IsPlaying("Jump_Over") && !play.IsPlaying("Jump_Float") && !play.IsPlaying("Idle2Car") && !play.IsPlaying("CarIdle") && !play.IsPlaying("Car2Idle") && !play.IsPlaying("Skate_Slow") && !play.IsPlaying("Idle2Plane") && !play.IsPlaying("PlaneIdle") && !play.IsPlaying("Plane2Idle"))
		{
			play.CrossFade ("Skate_Slow",0.5);		// switch to std animation
			standInit = false;
			
				// play skate sound
			//audioSource.audio.clip = skate;
			//audioSource.audio.Play ();	
		}
		else if (play.IsPlaying("Damage") && standInit)
		{
			play.CrossFade ("Skate_Slow",0.5);		// switch to std animation
			standInit = false;
		}
 	}
}

function playJump () 
{
	 if (!play.IsPlaying("Jump_Over"))
	 {
		// play.CrossFade ("Jump_Over");
		play.CrossFadeQueued("Jump_Over", 0.3, QueueMode.PlayNow);	
		play.CrossFadeQueued("JumpFloat", 0.3, QueueMode.CompleteOthers);
			// play collision sound
			//audioSource.audio.clip = skate;
			//audioSource.audio.Stop ();
	}
}

function playLand () 
{
		// play.CrossFadeQueued("JumpLand", 0.3, QueueMode.PlayNow);	
	play.Play("JumpLand");
	
	playSkateSlow();

	if (publicInfo.speedPlane)
	{
		play.CrossFadeQueued("Skate_Fast", 0.2, QueueMode.CompleteOthers);		// switch to fast animation
	}
	else
	{
		if (!play.IsPlaying("Idle2Car") && !play.IsPlaying("CarIdle") && !play.IsPlaying("Car2Idle") && !play.IsPlaying("Skate_Slow") && !play.IsPlaying("Idle2Plane") && !play.IsPlaying("PlaneIdle") && !play.IsPlaying("Plane2Idle"))
		{
			play.CrossFadeQueued("Skate_Slow",0.2, QueueMode.CompleteOthers);		// switch to std animation
		}
	}
	playSkateSlow();
	
		// play skate sound
	//audioSource.audio.clip = skate;
	//audioSource.audio.Play ();
}


function playSkateLeft () 
{
	if(publicInfo.noTrans)
		// play.CrossFade ("skateLeft");
		play.CrossFade ("skateLeft");
}

function playSkateRight () 
{
	if(publicInfo.noTrans)
		// play.CrossFade ("skateRight");
		play.CrossFade ("skateRight");
}

function playTransUp ()
{
	if (!publicInfo.stillUp)
	{
		play.CrossFadeQueued("Idle2Plane", 0.3, QueueMode.PlayNow);	
		play.CrossFadeQueued("PlaneIdle", 0.3, QueueMode.CompleteOthers);
		publicInfo.stillUp = true;												// set the current animatin state ...
		publicInfo.stillDn = false;
	
		// play collision sound
			//audioSource.audio.clip = skate;
			//audioSource.audio.Stop ();
	}
	

}

function playHit()
{
		// we're in plane mode ...
	if (publicInfo.stillUp)
	{
		play.CrossFade("planehit", 0.2);
		play.CrossFadeQueued("PlaneIdle", 0.05, QueueMode.CompleteOthers);
	}
	else if(publicInfo.stillDn)
	{
		play.CrossFade("carhit", 0.2);
		play.CrossFadeQueued("CarIdle", 0.05, QueueMode.CompleteOthers);
	}
	else if (publicInfo.stopped)
	{									// not transformed and over speedplane
		play.CrossFade("Damage", 0.2);	
		play.CrossFadeQueued("Stand_Idle", 0.1, QueueMode.CompleteOthers);
		standInit = true;
		// play collision sound
			//audioSource.audio.clip = skate;
			//audioSource.audio.Stop ();
	}
	/*
	else if (publicInfo.speedPlane)
	{									// not transformed and over speedplane
		play.CrossFade("Damage", 0.2);
		play.CrossFadeQueued("Skate_Fast", 0.05, QueueMode.CompleteOthers);
	}
	*/
	else
	{									// normal skate
		play.CrossFade("Damage", 0.2);
		play.CrossFadeQueued("Skate_Slow", 0.05, QueueMode.CompleteOthers);
	}
}

function playAttack()
{
		// we're in plane mode ...
	if (publicInfo.stillUp)
	{
		// Do nothing
	}
	else if(publicInfo.stillDn)
	{
		// Do nothing
	}
	else if (publicInfo.stopped)
	{									// not transformed and over speedplane
		play.CrossFadeQueued("Attack", 0.05, QueueMode.PlayNow);	
		play.CrossFadeQueued("Stand_Idle", 0.1, QueueMode.CompleteOthers);
	}
	else if (publicInfo.speedPlane)
	{									// not transformed and over speedplane
		play.CrossFadeQueued("Attack", 0.05, QueueMode.PlayNow);	
		play.CrossFadeQueued("Skate_Fast", 0.05, QueueMode.CompleteOthers);
	}
	else
	{									// normal skate
		play.CrossFadeQueued("Attack", 0.05, QueueMode.PlayNow);	
		play.CrossFadeQueued("Skate_Slow", 0.05, QueueMode.CompleteOthers);
	}
}

function playTransDn ()
{
	if (!publicInfo.stillDn)
	{
		play.CrossFadeQueued("Idle2Car", 0.3, QueueMode.PlayNow);	
		play.CrossFadeQueued("CarIdle", 0.3, QueueMode.CompleteOthers);
		publicInfo.stillUp = false;												// set the current animatin state ...
		publicInfo.stillDn = true;
		
			// play collision sound
			//audioSource.audio.clip = skate;
			//audioSource.audio.Stop ();
	}

}

function playTransBack ()
{
//!!!!!! -> AI
	if (publicInfo.stillUp)
	{																			// if we're still playing the up transformed stuff ...
		play.CrossFadeQueued("Plane2Idle", 0.15, QueueMode.PlayNow);	
		play.CrossFadeQueued("Skate_Slow", 0.15, QueueMode.CompleteOthers);
		publicInfo.stillUp = false;
	}
	else if (publicInfo.stillDn)
	{																			// if we're still playing the up transformed stuff ...
		play.CrossFadeQueued("Car2Idle", 0.3, QueueMode.PlayNow);	
		play.CrossFadeQueued("Skate_Slow", 0.3, QueueMode.CompleteOthers);
		publicInfo.stillDn = false;
																			
	}
	
	// play collision sound
			//audioSource.audio.clip = skate;
			//audioSource.audio.Play ();
}