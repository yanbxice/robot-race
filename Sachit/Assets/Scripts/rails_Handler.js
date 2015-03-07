var train : Transform;
var speed : float = 0.1;					// in m/sec
var distance : float = 30;
var delay : float = 0.0;					// delay before we start the first time (nice to offset several trains)

private var dTime : float;					// our time interval per update
private var distTraveled : float = 0.0;		// we record the distance we travel, so we don't need to read any transforms (slow)
private var moveStep : float = 0.0;			// our current frame movement (seperate so we can add it to distTraveled)


function Update () 
{	
		// check if we can start moving ...
	if (Time.time > delay)
	{
			// all moevements need to be framerate independent!!!
		dTime = Time.deltaTime;
		
			// get the current move step
		moveStep = dTime * speed;
		
			// get the distanceTraveled if we move once more..
		distTraveled += moveStep;
		
			// if we hit the max distance, reset Train
		if(Mathf.Abs(distTraveled) > distance)
		{
				// move the train back
			train.Translate (0, 0, -(distTraveled - moveStep));
			
				// reset distTraveled
			distTraveled = 0.0;
		}
		else
		{
				// move the train if we're not at the end
			train.Translate (0, 0, moveStep);
		}
	}
}