var doActivate : boolean = false;
var doDeactivate : boolean = false;
var fireScript : wallDeploy;

function Update () 
{
	if (doActivate)
	{
		fireScript.activate();
		doActivate = false;
	}
	
	if (doDeactivate)
	{
		fireScript.deActivate();
		doDeactivate = false;
	}
}