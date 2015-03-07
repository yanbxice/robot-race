using UnityEngine;
using System.Collections;

public class InGameMenu : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	virtual public void OpenMenu(GUI_Flags guiFlags)
	{
		;
	}
	
	virtual public void CloseMenu()
	{
		;
	}
	
	protected string formatTime (float inTime)
	{
		
		string outVal;
		int tmpInt;
		float restSeconds;
		
			// get our minutes
		tmpInt = (int)(inTime / 60);
		restSeconds = (inTime % 60);
		
			// add leading zeros
		if (tmpInt < 10)
		{
			outVal = ("0" + tmpInt.ToString() + ":");
		}
		else
		{
			outVal = (tmpInt.ToString() + ":");
		}
		
			// add leading zero for seconds
		if(restSeconds < 10)
		{
			//outVal = (outVal + "0" + restSeconds.ToString());
			outVal = (outVal + "0" + string.Format("{0:F3}",restSeconds) );
		}
		else
		{
			//outVal = (outVal + restSeconds.ToString());
			outVal = (outVal + string.Format("{0:F3}",restSeconds));
		}
		
		return outVal;
	}
}
