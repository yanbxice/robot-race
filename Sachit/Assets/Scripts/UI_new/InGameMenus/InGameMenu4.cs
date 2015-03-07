using UnityEngine;
using System.Collections;

public class InGameMenu4 : InGameMenu 
{
	public GameObject Label_TouchToContinue;
	public GameObject Label_Unlock;
	public GameObject Label_CircuitName;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public override void OpenMenu (GUI_Flags guiFlags)
	{
		Label_TouchToContinue.active = true;
		Label_Unlock.active = true;
		
		Label_CircuitName.active = true;
		Label_CircuitName.GetComponent<UILocalize>().key = guiFlags.trackUnlocks;
	}
	
	public override void CloseMenu()
	{
		Label_TouchToContinue.active = false;
		Label_Unlock.active = false;
		Label_CircuitName.active = false;
	}
}
