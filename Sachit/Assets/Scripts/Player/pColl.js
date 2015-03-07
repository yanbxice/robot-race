var _pMove : pMove;
var playerTrns : Transform;

private var bounceMax : float = 1.0;
var bounceThreshold : float = 0.5;

var collSound : AudioClip;
var audioSource : AudioSource;


	// handle actual collisions... convert to rigidbody
function OnTriggerEnter (hit : Collider)
{
		// play collision sound
	audioSource.audio.clip = collSound;
	audioSource.audio.Play ();

//print("sideBounceInitial: " + _pMove.sideBounce);

		// NOTE: 	Since we don't exacly know which contact point is the first, we also din't know we always have the exact tangent contact point, or maybe a point
		//			on the sphere sticking in the wall at some point. We know though that the normal is always the same for a given segment, so we'll use the normal 
		//			to calculate our hitAngle.	

	// get the position of the hit player in our local space
	var hitPlayer3D : Vector3 = playerTrns.InverseTransformPoint(hit.transform.position);
	hitPlayer3D.y =0.0;
			// add our sideBounce speed ..
	if (Mathf.Abs(hitPlayer3D.x) > bounceThreshold )
	{
	//print("sideBounce bounceMax: " + bounceMax);
			// check if even bigger
		_pMove.sideBounce = -hitPlayer3D.x * bounceMax;
		//print("sideBounce Assigned: " + _pMove.sideBounce);
	}
		
		// add our speedBounce ...
	if (Mathf.Abs(hitPlayer3D.z) > bounceThreshold )
	{
			// check if even bigger
		_pMove.speedBounce = -hitPlayer3D.z * bounceMax;
	}
	
	//print ("Out Bounce: " + _pMove.sideBounce);
}