//
//	Spawn Point code
//
//


function Awake()
{

}

function OnDrawGizmos()
{
	Gizmos.color = Color.red;				// set the line color
	var spwnTrns : Transform = transform;							// get the transform once ...
	
		// get Transform direction ..
	// var wpDirection : Vector3 = (wpTrns.TransformDirection(Vector3.forward) + wpTrns.position);
	
		// get four points for our lines...
	var spwnFront : Vector3 = (spwnTrns.TransformDirection(Vector3(0, 0, 2)) + spwnTrns.position);
	var spwnBackLeft : Vector3 = (spwnTrns.TransformDirection(Vector3(-1, 0, -1)) + spwnTrns.position);
	var spwnBackRight : Vector3 = (spwnTrns.TransformDirection(Vector3(1, 0, -1)) + spwnTrns.position);
	var spwnBackHigh : Vector3 = (spwnTrns.TransformDirection(Vector3(0, 3, 0)) + spwnTrns.position);
	

		// draw the lines for our rectangle
	// Gizmos.DrawLine (wpTrns.position, wpDirection);
	
	Gizmos.DrawLine (spwnFront, spwnBackLeft);
	Gizmos.DrawLine (spwnFront, spwnBackRight);
	Gizmos.DrawLine (spwnBackLeft, spwnBackRight);
	Gizmos.DrawLine (spwnTrns.position, spwnBackHigh);
	
}