using UnityEngine;
using System.Collections;

public class InGameMenu1 : InGameMenu {
	
	public GameObject Label_TouchToContinue;
	
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public override void OpenMenu (GUI_Flags guiFlags)
	{
		Label_TouchToContinue.active = true;
	}
	
	public override void CloseMenu()
	{
		Label_TouchToContinue.active = false;
	}
}
