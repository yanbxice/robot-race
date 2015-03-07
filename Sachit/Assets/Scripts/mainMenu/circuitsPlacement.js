var _touchHandler : touchHandler;
var placed : boolean = false;

function Update () 
{
	if (_touchHandler.debugMenu == 10)
	{
		if (!placed)
		{
			transform.localPosition.y = 0.0;
			placed = true;
		}
	}
	else
	{
		if (placed)
		{
			transform.localPosition.y = -2000.0;
			placed = false;
		}
	}

}