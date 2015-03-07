var cullDist : float = 300;

function Start () 
{
		// an array of our 32 possible layers
	var distances = new float[32];
	
		// set layer 19 to less distance
	distances[19] = cullDist;
	
	camera.layerCullDistances = distances;
	
}