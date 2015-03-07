//
//	Pickup Point code
//
//	set the with and height of the collider
//	


var collWidth: float = 1.0;
var collHeight: float = 1.5;

var hitSound : AudioClip;

var reloadTime : float = 20.0;					// time to get active again
var activeState : boolean = true;

var updateSize : boolean = false;

var pickCollider : BoxCollider;					// the attached collider


// var type : int = 0;

private var pickTrans : Transform;

function Awake()
{
	pickTrans = transform;
	
		// set the collider size
	pickCollider.size = Vector3(collWidth, collHeight, collWidth);
	pickCollider.center = Vector3(0, (collHeight/2 - 0.25), 0);
}

function pickupUpdate()
{
	if(!activeState)
	{
		activeState = true;
		pickTrans.Translate(Vector3(0, (collHeight + 2000), 0));
	}
}

function collectPickup()
{
	if (activeState)
	{
	 	activeState = false;

		pickTrans.Translate(Vector3(0, -(collHeight + 2000), 0));
		audio.clip = hitSound;
		audio.Play ();
		
			// invoke reenabling of pickup
		Invoke("pickupUpdate",reloadTime);
	}
}


function OnTriggerEnter(hit : Collider)
{
		// instead of using the sendMessage
	if(hit.collider.CompareTag("Player"))
	{
		collectPickup();
	}
}


function OnDrawGizmos()
{
	if(updateSize)
	{
		// set the collider size
		pickCollider.size = Vector3(collWidth, collHeight, collWidth);
		pickCollider.center = Vector3(0, (collHeight/2 - 0.25), 0);
	}
}