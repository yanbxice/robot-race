//
//	Pickup Point code
//
//	set the with and height of the collider
//	


var width: float = 2.0;
var height: float = 3.0;

var pickupSound : AudioClip;

var reloadTime : float = 20.0;					// time to get active again
var activeState : boolean = true;

var updateSize : boolean = false;				// update the colliders size in viewport already
var pickCollider : BoxCollider;					// the attached collider
var geoHolder : Transform;

// var type : int = 0;

private var pickTrans : Transform;

function Awake()
{
	pickTrans = transform;
	
		// set the collider size
	pickCollider.size = Vector3(width*1.1, height, width*1.1);
	pickCollider.center = Vector3(0, height/2, 0);
	// geoHolder.localScale = Vector3(height/3, height/3, height/3);
	
	
}

function pickupUpdate()
{
	if(!activeState)
	{
			activeState = true;
			pickTrans.Translate(Vector3(0, (height + 2000), 0));
	}
}

function collectPickup()
{
	if (activeState)
	{
	 	activeState = false;

		pickTrans.Translate(Vector3(0, -(height + 2000), 0));
		audio.clip = pickupSound;
		audio.Play ();
		
			// invoke repeating of pickup reset loop
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
		pickCollider.size = Vector3(width*1.1, height, width*1.1);
		pickCollider.center = Vector3(0, height/2, 0);
		// geoHolder.localScale = Vector3(width, width, width);
	}


	Gizmos.color = Color.green;				// set the line color
	var pickTrns : Transform = transform;							// get the transform once ...
	
		// get Transform direction ..
	// var wpDirection : Vector3 = (wpTrns.TransformDirection(Vector3.forward) + wpTrns.position);
	
		// get four points for our lines...
	var pickFrontLeft : Vector3 = (pickTrns.TransformDirection(Vector3(-(width/2), 0, (width/2))) + pickTrns.position);
	var pickFrontRight : Vector3 = (pickTrns.TransformDirection(Vector3((width/2), 0, (width/2))) + pickTrns.position);
	var pickBackLeft : Vector3 = (pickTrns.TransformDirection(Vector3(-(width/2), 0, -(width/2))) + pickTrns.position);
	var pickBackRight : Vector3 = (pickTrns.TransformDirection(Vector3((width/2), 0, -(width/2))) + pickTrns.position);
	var pickHigh : Vector3 = (pickTrns.TransformDirection(Vector3(0, height, 0)) + pickTrns.position);
	

		// draw the lines for our rectangle
	// Gizmos.DrawLine (wpTrns.position, wpDirection);
	
	Gizmos.DrawLine (pickFrontLeft, pickFrontRight);
	Gizmos.DrawLine (pickBackLeft, pickBackRight);
	Gizmos.DrawLine (pickFrontLeft, pickBackLeft);
	Gizmos.DrawLine (pickFrontRight, pickBackRight);
	Gizmos.DrawLine (pickTrns.position, pickHigh);

}