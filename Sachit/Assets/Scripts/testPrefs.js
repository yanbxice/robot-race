var sensitivity : float;
var accelerometer : boolean; 



	// set all prefs for our game ...
function setPrefs()
{
		// default value is 1 (for true)
	if(accelerometer)
	{
		PlayerPrefs.SetInt("useAcc", 1);
	}
	else
	{
		PlayerPrefs.SetInt("useAcc", 0);
	}

		// default value is 2.0
	PlayerPrefs.SetFloat("sensitivity", sensitivity);
}

	// get all prefs for our game
function getPrefs()
{
		// default value is 1 (for true)
	if(PlayerPrefs.GetInt("useAcc", 1) == 0)
	{
		accelerometer = false;
	}
	else
	{
		accelerometer = true;
	}

		// default value is 2.0
	sensitivity = PlayerPrefs.GetFloat("sensitivity", 2.0);
}



function Update () {
}