using UnityEngine;
using System.Collections;

public class InGameMenu2 : InGameMenu 
{
	public GameObject Label_TouchToContinue;
	public GameObject Label_winMessage;
	public GameObject Label_Lap1;
	public GameObject Label_Lap2;
	public GameObject Label_Lap3;
	public GameObject Label_Lap1Time;
	public GameObject Label_Lap2Time;
	public GameObject Label_Lap3Time;
	public GameObject Label_Crystal;
	public GameObject Label_CrystalNumber;
	
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public override void OpenMenu (GUI_Flags guiFlags)
	{
		Label_TouchToContinue.active = true;
		Label_winMessage.active = true;
		switch(guiFlags.playerRank)
		{
			case 0:
				Label_winMessage.GetComponent<UILocalize>().key = "winMessage1";
				break;
	
			case 1:
				Label_winMessage.GetComponent<UILocalize>().key = "winMessage2";
				break;
	
			case 2:
				Label_winMessage.GetComponent<UILocalize>().key = "winMessage3";
				break;
		}
		Label_Lap1.active = true;
		Label_Lap1Time.active = true;
		Label_Lap1Time.GetComponent<UILabel>().text = formatTime(guiFlags.Lap1Time[guiFlags.playerMesh]);
		Label_Lap2.active = true;
		Label_Lap2Time.active = true;
		Label_Lap2Time.GetComponent<UILabel>().text = formatTime(guiFlags.Lap2Time[guiFlags.playerMesh]);
		Label_Lap3.active = true;
		Label_Lap3Time.active = true;
		Label_Lap3Time.GetComponent<UILabel>().text = formatTime(guiFlags.Lap3Time[guiFlags.playerMesh]);
		Label_Crystal.active = true;
		Label_CrystalNumber.active = true;
		Label_CrystalNumber.GetComponent<UILabel>().text = guiFlags.playerCredits.ToString();
		
	}
	
	public override void CloseMenu()
	{
		Label_TouchToContinue.active = false;
		Label_winMessage.active = false;
		Label_Lap1.active = false;
		Label_Lap1Time.active = false;
		Label_Lap2.active = false;
		Label_Lap2Time.active = false;
		Label_Lap3.active = false;
		Label_Lap3Time.active = false;
		Label_Crystal.active = false;
		Label_CrystalNumber.active = false;
	}
	
}
