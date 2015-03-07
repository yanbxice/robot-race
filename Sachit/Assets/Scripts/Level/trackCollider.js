
var width : float = 1.0;
var length: float = 10.0;
var height: float = 1.0;

var trackColl : BoxCollider;
var collTrns : Transform;

private var updateGizmos : boolean = true;


function Awake()
{
		// when running the game we do not want to update our gizmos
	updateGizmos = false;
}

function OnDrawGizmos()
{
	if (updateGizmos)
	{
		Gizmos.color = Color.black;
	
			// get eight points for our lines...
		var TopA : Vector3 = (collTrns.TransformDirection(Vector3(-(width/2), (height/2), (length/2))) + collTrns.position);
		var TopB : Vector3 = (collTrns.TransformDirection(Vector3((width/2), (height/2), (length/2))) + collTrns.position);
		var TopC : Vector3 = (collTrns.TransformDirection(Vector3((width/2), (height/2), -(length/2))) + collTrns.position);
		var TopD : Vector3 = (collTrns.TransformDirection(Vector3(-(width/2), (height/2), -(length/2))) + collTrns.position);
		
		var LowA : Vector3 = (collTrns.TransformDirection(Vector3(-(width/2), -(height/2), (length/2))) + collTrns.position);
		var LowB : Vector3 = (collTrns.TransformDirection(Vector3((width/2), -(height/2), (length/2))) + collTrns.position);
		var LowC : Vector3 = (collTrns.TransformDirection(Vector3((width/2), -(height/2), -(length/2))) + collTrns.position);
		var LowD : Vector3 = (collTrns.TransformDirection(Vector3(-(width/2), -(height/2), -(length/2))) + collTrns.position);
	
			// draw the lines for our box
		Gizmos.DrawLine (TopA, TopB);
		Gizmos.DrawLine (TopB, TopC);
		Gizmos.DrawLine (TopC, TopD);
		Gizmos.DrawLine (TopD, TopA);
		
		Gizmos.DrawLine (LowA, LowB);
		Gizmos.DrawLine (LowB, LowC);
		Gizmos.DrawLine (LowC, LowD);
		Gizmos.DrawLine (LowD, LowA);
		
		Gizmos.DrawLine (TopA, LowA);
		Gizmos.DrawLine (TopB, LowB);
		Gizmos.DrawLine (TopC, LowC);
		Gizmos.DrawLine (TopD, LowD);
		
			// size the collider
		trackColl.size = Vector3(width, height, length);
	}	
}
