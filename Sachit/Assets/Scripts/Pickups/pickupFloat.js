//
//	Pickup Point code
//
//	set the with and height of the collider
//	

var pickupSound : AudioClip;

var reloadTime : float = 20.0;					// time to get active again
var activeState : boolean = true;
private var nextActive : float = 0.0;					// time at which to get active again

var updateSize : boolean = false;				// update the colliders size in viewport already
var pickCollider : BoxCollider;					// the attached collider

private var pickTrans : Transform;

function Awake()
{
	pickTrans = transform;
	
		// set the collider size
	pickCollider.center = Vector3(0, 1.5, 0);
	
}

function pickupUpdate()
{
	if(!activeState)
	{
		if(DataVault.sysTime >= nextActive)
		{
			activeState = true;
			pickTrans.Translate(Vector3(0, 2000, 0));
			
				// if pickup reset, cancel invoke again ...
			CancelInvoke("pickupUpdate");
		}
	}
}

function collectPickup()
{
	if (activeState)
	{
	 	activeState = false;
		nextActive = DataVault.sysTime + reloadTime;

		pickTrans.Translate(Vector3(0, -2000, 0));
		audio.clip = pickupSound;
		audio.Play ();
		
			// invoke repeating of pickup reset loop
		InvokeRepeating("pickupUpdate",1.0, 2.0);
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
