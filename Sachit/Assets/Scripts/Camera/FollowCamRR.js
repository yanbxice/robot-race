//	Simple smooth camera script makes the camera follow the player, but with smoothed out movement
//	ToDo:
//		Add seperate Target node that moves up/dn to compensate for movement
//		Add settings for Camera Position to allow from far up to "first person" camera position
//		Add collision detection etc....

//
//		Slow down smoothing for transformations ..
//

	//Target
var playerTrns : Transform;

var camTransform : Transform;

var camTrgt : Transform;
var camPos : Transform;

var skyboxCam : samSkybox;

	// have the cam look down on the level for the first 0.3 seconds (to make sure all assets are loaded)... 
var startTime : float = 0.3;
private var inPosition : boolean = false;

private var camNewPos : Vector3;
private var trgtNewPos : Vector3;


function Start ()
{		
	//camTransform.position = camPos.position;																									// Set the cam position to the target position
	//camTransform.LookAt(camTrgt.position, playerTrns.TransformDirection(Vector3.up));
	// camTransform.parent = camPos;
}

// function camUpdate() 
// function LateUpdate()

	// since our movement now happens at Fixed Update, move the cam only at Fixed Update ...
function Update()
{	

	if (!inPosition)
	{
		if (Time.time > startTime)
		{
				// move cam in position
			camTransform.position = camPos.position;																									// Set the cam position to the target position
			camTransform.LookAt(camTrgt.position, playerTrns.TransformDirection(Vector3.up));
			
				// flag as active
			inPosition = true;
		}
	}
	else
	{
		// ONCE WE ARE IN POSITION, USER THE CAM SCRIPT
	
			// at least for now, cam just snap pos
		camNewPos = camPos.position;
		trgtNewPos = camTrgt.position;
		
			// place camera and target
		camTransform.position = camNewPos;	
		camTransform.LookAt(trgtNewPos, camPos.TransformDirection(Vector3.up));
		
			// currently LookAt does not align with bot ORIENTATION (smoother) ... maybe blend both???
		//camTransform.LookAt(trgtNewPos);
	
		
			// and update the skybox cam
		skyboxCam.DoUpdate();
	}
}


	
	