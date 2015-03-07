	// initially I want to see EVERYTHING to get it loaded

function reduceRange()
{
	camera.farClipPlane = 800.0;
}

function Start () 
{
	Invoke("reduceRange", 0.2);
}