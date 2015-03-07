var mineColl : SphereCollider;
var activationTime : float = 0.01;		// time till activation
var thisObject : GameObject;			// to destroy after activation ...
var thisTrns : Transform;

var deploySound : AudioClip;

// var explosionPref : Transform;

private var liveTime : float;			// last 50 sec
private var activateAt : float = 0.0;
private var isActive : boolean = false;

function Awake () 
{
	mineColl.center = Vector3(0, -2000, 0);
}


function activate()
{
		//	Set the activation time...
	// activateAt = Time.time + activationTime;
	activateAt = Time.time + 0.3;
	
		// set the destruction time ..
	liveTime = Time.time + 90.0;
	
	mineColl.center = Vector3(0, -2000, 0);
	isActive = true;
	
	audio.clip = deploySound;
	audio.Play ();
}


function deActivate()
{
	mineColl.center = Vector3(0, -2000, 0);
	isActive = false;
	
		// move out of the way ...
	//thisTrns.position.y = -2000.0;
	thisTrns.localPosition = Vector3(0,0,0);
		
	
}


function FixedUpdate()
{
	if(isActive)
	{
			// if time has passed...
		if(Time.time > activateAt)
		{
				// move the collider up
			mineColl.center = Vector3(0, 0, 0);
	
		}
			// apply destruction timer
		if(Time.time > liveTime)
		{
				// destroy this script
			deActivate();		
		}
	}
	

}


function OnTriggerEnter (hit : Collider)
{

	if(isActive)
	{
		if (hit.collider.CompareTag("Player"))
		{
			deActivate();
		}
	}
}
