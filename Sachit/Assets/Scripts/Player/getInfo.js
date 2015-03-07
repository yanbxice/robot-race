// this script is used for missles or other scripts to access a robots settings
//
//	Maybe use this instead of DataVault? 

var isPlayer : boolean = false;
var meshIndex : int;

var playerMoveScr : pMove;
var aiMoveScr : aiMove;

var wpOffset : float;				// waypoint offset
var currHeight : float;				// current height over ground
var braking : boolean = false;		// are we braking?
var stopped : boolean = false;		// are we standing
var speedPlane : boolean = false;	// are we on a speedplane??
var juiceActive : boolean = false;	// is juice active?
var jumping : boolean = false;		// are we jumping?

var missleHit : boolean = false;	// hit by a missle?
var rearHit : boolean = false;		// hit from behind?
var missleClose : boolean = false;	// is a missle closeby??
var pausedTime : float = 0.0;		// our time spent in pause mode
var canTransform : boolean = true;

var cooldown : float = 0.0;

var	vertInput : float;
var	horizInput : float;
var doSlide : int;

//var damage : float = 1.0;

var pRank : int;
var pLap : int;
var raceOver : boolean;

var dnTrans : boolean = false;		// Reset the flags 
var upTrans : boolean = false;
var noTrans : boolean = true;

var transTimer : float = 0.0;

var stillUp : boolean = false;
var stillDn : boolean = false;

	// condensed player state handling ...
var playerState : int = 0;			// player state, init als getReady
var transState : int = 0;			// transformState, init as noTrns
var hitType : int = 0;				// hit by ... init as none
var pickupType : int = 0;			// init as no Pickup
var speedPlaneActive : boolean;		// are we still under speedplane effect???

var playerSpeedMax : float;

// add functions thet can be triggered and then call weapon hits for player or ai

function infection(fromPlayer : boolean)
{
	
	if(isPlayer)
	{
		playerMoveScr.infection();
	}
	else
	{
		aiMoveScr.infection(fromPlayer);
	}
	
}


function skyshot(fromPlayer : boolean)
{
	
	if(isPlayer)
	{
		playerMoveScr.skyshot();
	}
	else
	{
		aiMoveScr.skyshot(fromPlayer);
	}
	
}

function leadershot(fromPlayer : boolean)
{
	
	if(isPlayer)
	{
		playerMoveScr.leadershot();
	}
	else
	{
		aiMoveScr.leadershot(fromPlayer);
	}
	
}

function missleImpact(playerMissle : boolean)
{
	
	if(isPlayer)
	{
		playerMoveScr.missleImpact();
	}
	else
	{
		aiMoveScr.missleImpact(playerMissle);
	}
	
}

function startWarning()
{
		// if we have an incoming missle .. play the warning
	if(missleClose)
	{
		if(isPlayer)
		{
			playerMoveScr.missleWarning();
		}
		else
		{
			aiMoveScr.missleWarning();
		}
	}
}

function missleJumpNow()
{
	if(isPlayer)
		{
			// do nothing ...
		}
		else
		{
			aiMoveScr.missleJump();
		}
}

function stopWarning()
{
		// if no more incoming missles, stop warning
	if(!missleClose)
	{
		if(isPlayer)
		{
			playerMoveScr.missleWarningExit();
		}
		else
		{
			aiMoveScr.missleWarningExit();
		}
	}

}