using UnityEngine;
using System.Collections;

public class InGameMenu9 : InGameMenu 
{
	public GameObject Label_TouchToContinue;
	public GameObject Label_BadgeEarned;
	public GameObject Label_BadgeReward0;
	public GameObject Label_BadgeReward1;
	public GameObject Label_BadgeReward2;
	public GameObject Label_BadgeReward3;
	public GameObject Label_BadgeReward4;
	public GameObject Label_BadgeReward5;
	public GameObject Label_BadgeReward6;
	public GameObject Label_BadgeReward7;
	public GameObject Label_BadgeReward8;
	public GameObject Label_BadgeReward9;
	public GameObject Label_BadgeReward10;
	public GameObject Sprite_Crystals;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public override void OpenMenu (GUI_Flags guiFlags)
	{
		Label_TouchToContinue.active = true;
		Label_BadgeEarned.active = true;
		
		Label_BadgeReward0.active = true;
		Label_BadgeReward1.active = true;
		Label_BadgeReward2.active = true;
		Label_BadgeReward3.active = true;
		Label_BadgeReward4.active = true;
		Label_BadgeReward5.active = true;
		Label_BadgeReward6.active = true;
		Label_BadgeReward7.active = true;
		Label_BadgeReward8.active = true;
		Label_BadgeReward9.active = true;
		Label_BadgeReward10.active = true;
		
		Sprite_Crystals.active = true;
	}
	
	
	public override void CloseMenu()
	{
		Label_TouchToContinue.active = false;
		Label_BadgeEarned.active = false;
		
		Label_BadgeReward0.active = false;
		Label_BadgeReward1.active = false;
		Label_BadgeReward2.active = false;
		Label_BadgeReward3.active = false;
		Label_BadgeReward4.active = false;
		Label_BadgeReward5.active = false;
		Label_BadgeReward6.active = false;
		Label_BadgeReward7.active = false;
		Label_BadgeReward8.active = false;
		Label_BadgeReward9.active = false;
		Label_BadgeReward10.active = false;
		
		Sprite_Crystals.active = false;
	}
}
