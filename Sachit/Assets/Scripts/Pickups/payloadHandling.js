//
//	Pickup Point code
//
//	set the with and height of the collider
//	


var rootTrns : Transform;							// the payloadHome trns

var payloadTrns : Transform;						// the payload

var explosionScr : explosionTrigger;
var explosionTrns : Transform;						// the payloadExplosion trns

var railMover : Transform;							// the animated object (to check if we are back in our housing)

var activeState : boolean = true;

var explodeSound : AudioClip;
var explodeAudiosource : AudioSource;

function Awake()
{
	explosionTrns.localPosition.y = -2000.0;

}


function Update()
{
	if(!activeState)
	{
			// if claw back in building, reraise payload
		if(railMover.localPosition.z < -40.0)
		{
				// set active
	 		activeState = true;
	 		
	 			// move up
			payloadTrns.localPosition.y = 0.0;
		}
	}
}


function detonate()
{
	if (activeState)
	{
	 		// set inactive
	 	activeState = false;

		 	// play explosion
		explosionTrns.position = rootTrns.position;
		explosionScr.Explode();
	
			// move down
		payloadTrns.localPosition.y = -2000.0;
		
			// play sound
		explodeAudiosource.clip = explodeSound;
		explodeAudiosource.Play ();
	}
}


function OnTriggerEnter(hit : Collider)
{
		// instead of using the sendMessage
	if(hit.collider.CompareTag("Player"))
	{
		detonate();
	}
}
