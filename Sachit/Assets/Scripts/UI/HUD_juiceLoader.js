	// move script for juiceLeft settings
private var moveScript : pMove;

	// stuff to handle the button appearance
var _juiceScaler : Transform;
var HUD_JuiceLoader : HUD_SingleButton;
var HUD_Juice : HUD_SingleButton;

private var loaderActive : boolean = false;
private var juiceActive : boolean = false;

function Start ()
{
		// get the players move script to access some vars ... (at least for now)
	var moveTemp = GameObject.Find("Player_Construct");
	moveScript = (moveTemp.GetComponent(pMove) as pMove); 
}

function Update () 
{
		// as long as juice is not full
	if (moveScript.juiceLeft < moveScript.juiceFull)
	{
			// calc our scale value
		var loadScale : float = moveScript.juiceLeft / moveScript.juiceFull;
	
			// scale loader correctly
		_juiceScaler.localScale = Vector3(loadScale, loadScale, loadScale);
		
			// if our button is still active, clear it...
		if (juiceActive)
		{
			HUD_Juice.changeState (1);
			juiceActive = false;
		}
		
			// if our juiceLoader is not visible
		if (!loaderActive)
		{
			HUD_JuiceLoader.changeState (0);
			loaderActive = true;
		}
	}
		// if juice is full ...
	else
	{
			// if the loader is still active ...set stuff ONCE
		if (loaderActive)
		{
				// reset the scale ...
			_juiceScaler.localScale = Vector3.zero;
			
				// hide the scaler
			HUD_JuiceLoader.changeState (1);
			loaderActive = false;
		}
			
			// if the juice Button is not visible
		if (!juiceActive)
		{
				// set juice active
			juiceActive = true;
			
				// show button
			HUD_Juice.changeState (0);
		}
	}

}