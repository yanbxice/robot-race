//	Simple smooth camera script makes the camera follow the player, but with smoothed out movement
//	ToDo:
//		Add seperate Target node that moves up/dn to compensate for movement
//		Add settings for Camera Position to allow from far up to "first person" camera position
//		Add collision detection etc....

	//Target
var target : Transform;
// var camPos : Transform;

	// Camera placement settings ...
var camDist : float = 15.0;
var camHeight : float = 3.0;

	// Camera damping values ...
var camHeightDamp = 6;		// bigger value means les dampen tme ...
var camSideDamp = 9;
var camDistDamp = 8;

	// define local camera position and store last Update and current position ...
private var oldPos : Vector3;														// This will store the old Camera Position in the Targets LocalSpace (as we want to calculate the distance and height in relation to the target ...)
private var targetPos : Vector3; 													// the local Space where the camera SHOULD go (-camDist as the cam is BEHIND)
private var camPos : Vector3;														// where the cam should go!

function Awake ()
{		// initialize our Camera without drag ....

	targetPos = Vector3(0, camHeight, -camDist);
	camPos = target.TransformPoint(targetPos);									// convert the stored local Camera position into worls Space ...
	transform.position = camPos;

	transform.LookAt(target);
}


	// The LateUpdate function is called after all the other update functions! This way we can make sure
	// that the camera responds to the actual position of the target ...
function LateUpdate() 
{

		// Drop out if no target set ..
	if (!target)
		return;
		// store our current camera position ... (after moving the target away)
	oldPos = target.InverseTransformPoint(transform.position);					// get the current position of the camera in the target's local space ...
	camPos = targetPos;															// on every update we move the camera into the local target Position ... but we smooth into this position ...
	
		// introduce damping ... -> calculate the correct coordinates for the Camera in the targets local space ...
	// var newSide : float = Mathf.Lerp(oldPos.x, targetPos.x, camSideDamp * Time.deltaTime);
	// camPos.x = newSide;	
	// var newHeight : float = Mathf.Lerp(oldPos.y, targetPos.y, camHeightDamp * Time.deltaTime);
	// camPos.y = newHeight;	 
	//var newDist : float = Mathf.Lerp(oldPos.z, targetPos.z, camDistDamp * Time.deltaTime);
	// camPos.z = newDist;	
	 camPos = targetPos;
		// now get the camera working directly (without drag) first ....
	 camPos = target.TransformPoint(camPos);								// now convert the local coordinates back into world space ...


	transform.position = camPos;

	transform.LookAt(target);

}

