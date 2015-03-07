var mineColl : BoxCollider;
var thisTrns : Transform;

var deploySound : AudioClip;

var wallAnim : Animation;

// var explosionPref : Transform;

private var liveTime : float = 50.0;			// last 50 sec
private var activateIn : float = 0.2;
private var isActive : boolean = false;


function Awake () 
{
	mineColl.center = Vector3(0, -2000, 0);
}


function activate()
{
	mineColl.center = Vector3(0, -2000, 0);
	isActive = true;
	
	audio.clip = deploySound;
	audio.Play ();
	
		// play the unfold animation
	wallAnim.Play();
	
		// invoke detonator (collider)
	Invoke("setDetonator", activateIn);
}


function deActivate()
{
	mineColl.center = Vector3(0, -2000, 0);
	isActive = false;
	
		// move out of the way ...
	thisTrns.localPosition = Vector3(0,0,0);
	
		// rewind animation
	wallAnim.Rewind();
	
}

function setDetonator()
{

	if(isActive)
	{
			// move the collider up
		mineColl.center = Vector3(0, 0, 0);

			// apply destruction timer
		Invoke("deActivate", liveTime);
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
