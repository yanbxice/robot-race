
var screenSize : Vector2 = new Vector2(480, 320);
var thisTrns : Transform;
var drawGizmo : boolean = false;

function OnDrawGizmos () 
{
	if (drawGizmo)
	{
		var upLeft : Vector3 = (thisTrns.TransformDirection(Vector3(0, 0, 0)) + thisTrns.position);
		var upRight : Vector3 = (thisTrns.TransformDirection(Vector3(-screenSize.x, 0, 0)) + thisTrns.position);
		var dnLeft : Vector3 = (thisTrns.TransformDirection(Vector3(0, -screenSize.y, 0)) + thisTrns.position);
		var dnRight : Vector3 = (thisTrns.TransformDirection(Vector3(-screenSize.x, -screenSize.y, 0)) + thisTrns.position);
		
			// draw the lines for our rectangle
		Gizmos.DrawLine (upLeft, upRight);
		Gizmos.DrawLine (upLeft, dnLeft);
		Gizmos.DrawLine (upRight, dnRight);
		Gizmos.DrawLine (dnLeft, dnRight);
	}
}