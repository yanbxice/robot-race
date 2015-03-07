var updateInterval = 0.5;

private var fps = 0;
private var frames = 0;
private var accum = 0.0;
private var timeleft : float;


// private var pLap : int;
// private var pRank : int;
// private var pickup : String = "Jump";		// init with zero

// private var aiMulti : float;

// private var dTime : float;
// private var sysTime : float;
// private var pauseState : boolean;

function Start()
{
    timeleft = updateInterval; 
}

function Update()
{
	if (DataVault.showStats)
	{
	    timeleft -= Time.deltaTime;
	    accum += Time.timeScale/Time.deltaTime;
	    ++frames;
	   
	   	// pLap = DataVault.pLap;
	   	// pRank = DataVault.pRank;
	   	
	   	// aiMulti = DataVault.aiSpeedMulti;
	/*
	   	if (DataVault.pickupType == 0)
	   	{
	   		pickup = "JUMP";
	   	}
	   	else
	   	{
	   		pickup = "BOOST";
	   	}
	 */  
	   	// dTime = DataVault.dTime;
	   	// sysTime = DataVault.sysTime;
	   	// pauseState = DataVault.gameEnabled;
	   
	    // Interval ended - update GUI text and start new interval
	    if( timeleft <= 0.0 )
	    {
	        // display two fractional digits (f2 format)
	        // guiText.text = "" + (accum/frames).ToString("f2");
			
			fps = accum / frames;
	        timeleft = updateInterval;
	        accum = 0.0;
	        frames = 0;
	    }
	}
}
/*
function OnGUI()
{ 
	if (DataVault.showStats)
	{	
		// GUI.Label(Rect(0,80,100,100), fps.ToString());
		GUI.Box (Rect(5,90,120,20), GUIContent("Framerate: " + fps.ToString()));
		// GUI.Box (Rect(5,115,120,20), GUIContent("Updates: " + DataVault.fps.ToString()));
		// GUI.Box (Rect(5,140,120,20), GUIContent("Player Pos: " + pRank.ToString()));
		// GUI.Box (Rect(5,165,120,20), GUIContent("Pickup: " + pickup));
		// GUI.Box (Rect(5,190,120,20), GUIContent("AiMulti: " + aiMulti.ToString()));
		// GUI.Box (Rect(5,215,120,20), GUIContent("pauseState: " + pauseState.ToString()));
  	}
}
*/