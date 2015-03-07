//
//	Abyss collider
//
// 	specify width and length...

var abyssColl : BoxCollider;
var width : float = 10.0;
var length :float = 40.0;


function Awake()
{
	abyssColl.size = Vector3(width, 1.0, length);

}

function OnDrawGizmos()
{
	Gizmos.color = Color.blue;				// set the line color
	var collTrns : Transform = transform;							// get the transform once ...
	
		// set the size correctly
	abyssColl.size = Vector3(width, 1.0, length);
	
		// get four points for our lines...
	var collUpLeft : Vector3 = (collTrns.TransformDirection(Vector3((-width / 2), 0, (length / 2))) + collTrns.position);
	var collUpRight : Vector3 = (collTrns.TransformDirection(Vector3((width / 2), 0, (length / 2))) + collTrns.position);
	var collDnLeft : Vector3 = (collTrns.TransformDirection(Vector3((-width / 2), 0, (-length / 2))) + collTrns.position);
	var collDnRight : Vector3 = (collTrns.TransformDirection(Vector3((width / 2), 0, (-length / 2))) + collTrns.position);
	

		// draw the lines for our rectangle
	// Gizmos.DrawLine (wpTrns.position, wpDirection);
	
	Gizmos.DrawLine (collUpLeft, collUpRight);
	Gizmos.DrawLine (collUpLeft, collDnLeft);
	Gizmos.DrawLine (collUpRight, collDnRight);
	Gizmos.DrawLine (collDnLeft, collDnRight);
	
}