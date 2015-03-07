using UnityEngine;
using System.Collections;

public class InGameMenu3 : InGameMenu {
	
	public GameObject Label_TouchToContinue;
	public GameObject Label_winMessage;
	
	public GameObject Label_Robot1;
	public GameObject Label_Robot1Time;
	public GameObject Label_Robot1Value1;
	public GameObject Label_Robot1Value2;
	
	public GameObject Label_Robot2;
	public GameObject Label_Robot2Time;
	public GameObject Label_Robot2Value1;
	public GameObject Label_Robot2Value2;
	
	public GameObject Label_Robot3;
	public GameObject Label_Robot3Time;
	public GameObject Label_Robot3Value1;
	public GameObject Label_Robot3Value2;
	
	public GameObject Label_Robot4;
	public GameObject Label_Robot4Time;
	public GameObject Label_Robot4Value1;
	public GameObject Label_Robot4Value2;
	
	public GameObject Label_Robot5;
	public GameObject Label_Robot5Time;
	public GameObject Label_Robot5Value1;
	public GameObject Label_Robot5Value2;
	
	public GameObject Label_Crystal;
	public GameObject Label_CrystalNumber;
	public GameObject Sprite_Crystal;
	
	public float enlargeFactor;
	
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public override void OpenMenu (GUI_Flags guiFlags)
	{
		Label_TouchToContinue.active = true;
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
		Label_winMessage.active = true;
		
		Label_Robot1.active = true;
		Label_Robot1.GetComponent<UILocalize>().key = GetRobotNameKey(guiFlags.podiumBots[0], guiFlags);
		Label_Robot1Time.active = true;
		Label_Robot1Time.GetComponent<UILabel>().text = GetTotalTime(0, guiFlags);
		if(guiFlags.isQuick)
		{
			Label_Robot1Value1.active = true;
			Label_Robot1Value1.GetComponent<UILabel>().text = guiFlags.circuitPoints[guiFlags.podiumBots[0]].ToString();
			Label_Robot1Value2.active = true;
			Label_Robot1Value2.GetComponent<UILabel>().text = guiFlags.racePoints[guiFlags.podiumBots[0]].ToString();
		}
		
		
		Label_Robot2.active = true;
		Label_Robot2.GetComponent<UILocalize>().key = GetRobotNameKey(guiFlags.podiumBots[1], guiFlags);
		Label_Robot2Time.active = true;
		Label_Robot2Time.GetComponent<UILabel>().text = GetTotalTime(1, guiFlags);
		if(guiFlags.isQuick)
		{
			Label_Robot2Value1.active = true;
			Label_Robot2Value1.GetComponent<UILabel>().text = guiFlags.circuitPoints[guiFlags.podiumBots[1]].ToString();
			Label_Robot2Value2.active = true;
			Label_Robot2Value2.GetComponent<UILabel>().text = guiFlags.racePoints[guiFlags.podiumBots[1]].ToString();
		}
		
		Label_Robot3.active = true;
		Label_Robot3.GetComponent<UILocalize>().key = GetRobotNameKey(guiFlags.podiumBots[2], guiFlags);
		Label_Robot3Time.active = true;
		Label_Robot3Time.GetComponent<UILabel>().text = GetTotalTime(2, guiFlags);
		if(guiFlags.isQuick)
		{
			Label_Robot3Value1.active = true;
			Label_Robot3Value1.GetComponent<UILabel>().text = guiFlags.circuitPoints[guiFlags.podiumBots[2]].ToString();
			Label_Robot3Value2.active = true;
			Label_Robot3Value2.GetComponent<UILabel>().text = guiFlags.racePoints[guiFlags.podiumBots[2]].ToString();
		}
		
		if (guiFlags.botCount > 2)
		{
			Label_Robot4.active = true;
			Label_Robot4.GetComponent<UILocalize>().key = GetRobotNameKey(guiFlags.podiumBots[3], guiFlags);
			Label_Robot4Time.active = true;
			Label_Robot4Time.GetComponent<UILabel>().text = GetTotalTime(3, guiFlags);
			if(guiFlags.isQuick)
			{
				Label_Robot4Value1.active = true;
				Label_Robot4Value1.GetComponent<UILabel>().text = guiFlags.circuitPoints[guiFlags.podiumBots[3]].ToString();
				Label_Robot4Value2.active = true;
				Label_Robot4Value2.GetComponent<UILabel>().text = guiFlags.racePoints[guiFlags.podiumBots[3]].ToString();
			}
		}
		
		if (guiFlags.botCount > 3)
		{
			Label_Robot5.active = true;
			Label_Robot5.GetComponent<UILocalize>().key = GetRobotNameKey(guiFlags.podiumBots[4], guiFlags);
			Label_Robot5Time.active = true;
			Label_Robot5Time.GetComponent<UILabel>().text = GetTotalTime(4, guiFlags);
			if(guiFlags.isQuick)
			{
				Label_Robot5Value1.active = true;
				Label_Robot5Value1.GetComponent<UILabel>().text = guiFlags.circuitPoints[guiFlags.podiumBots[4]].ToString();
				Label_Robot5Value2.active = true;
				Label_Robot5Value2.GetComponent<UILabel>().text = guiFlags.racePoints[guiFlags.podiumBots[4]].ToString();
			}
		}
		
		Label_Crystal.active = true;
		Label_CrystalNumber.active = true;
		Label_CrystalNumber.GetComponent<UILabel>().text = guiFlags.playerCredits.ToString();
		Sprite_Crystal.active = true;
		
		HighlightPlayer(guiFlags);
	}
	
	private void HighlightPlayer(GUI_Flags guiFlags)
	{
		switch(guiFlags.playerRank)
		{
		case 0:
			HightlightLabels(Label_Robot1, Label_Robot1Time, Label_Robot1Value1, Label_Robot1Value2);
			break;
		case 1:
			HightlightLabels(Label_Robot2, Label_Robot2Time, Label_Robot2Value1, Label_Robot2Value2);
			break;
		case 2:
			HightlightLabels(Label_Robot3, Label_Robot3Time, Label_Robot3Value1, Label_Robot3Value2);
			break;
		case 3:
			HightlightLabels(Label_Robot4, Label_Robot4Time, Label_Robot4Value1, Label_Robot4Value2);
			break;
		case 4:
			HightlightLabels(Label_Robot5, Label_Robot5Time, Label_Robot5Value1, Label_Robot5Value2);
			break;
		}
	}
	
	private void HightlightLabels(GameObject robotLabel, GameObject robotTimeLabel, GameObject robotValue1Label, GameObject robotValue2Label)
	{
		robotLabel.GetComponent<UILabel>().color = Color.yellow;
		robotLabel.transform.localScale = new Vector3(robotLabel.transform.localScale.x * enlargeFactor, robotLabel.transform.localScale.y * enlargeFactor, 1);
		robotTimeLabel.GetComponent<UILabel>().color = Color.yellow;
		robotTimeLabel.transform.localScale = new Vector3(robotTimeLabel.transform.localScale.x * enlargeFactor, robotTimeLabel.transform.localScale.y * enlargeFactor, 1);
		robotValue1Label.GetComponent<UILabel>().color = Color.yellow;
		robotValue1Label.transform.localScale = new Vector3(robotValue1Label.transform.localScale.x * enlargeFactor, robotValue1Label.transform.localScale.y * enlargeFactor, 1);
		robotValue2Label.GetComponent<UILabel>().color = Color.yellow;
		robotValue2Label.transform.localScale = new Vector3(robotValue2Label.transform.localScale.x * enlargeFactor, robotValue2Label.transform.localScale.y * enlargeFactor, 1);
	}
	
	public override void CloseMenu()
	{
		Label_TouchToContinue.active = false;
		Label_winMessage.active = false;
		
		Label_Robot1.active = false;
		Label_Robot1Time.active = false;
		Label_Robot1Value1.active = false;
		Label_Robot1Value2.active = false;
		
		Label_Robot2.active = false;
		Label_Robot2Time.active = false;
		Label_Robot2Value1.active = false;
		Label_Robot2Value2.active = false;
		
		Label_Robot3.active = false;
		Label_Robot3Time.active = false;
		Label_Robot3Value1.active = false;
		Label_Robot3Value2.active = false;
		
		Label_Robot4.active = false;
		Label_Robot4Time.active = false;
		Label_Robot4Value1.active = false;
		Label_Robot4Value2.active = false;
		
		Label_Robot5.active = false;
		Label_Robot5Time.active = false;
		Label_Robot5Value1.active = false;
		Label_Robot5Value2.active = false;
		
		Label_Crystal.active = false;
		Label_CrystalNumber.active = false;
		Sprite_Crystal.active = false;
	}
	
	private string GetRobotNameKey(int robotNameIndex, GUI_Flags guiFlags)
	{
		string robotNameKey;
		robotNameKey = "botNames" + (robotNameIndex+1).ToString();
		return robotNameKey;
	}
	
	private string GetTotalTime(int robotIndex, GUI_Flags guiFlags)
	{
		return formatTime(guiFlags.Lap1Time[guiFlags.podiumBots[robotIndex]]+ guiFlags.Lap2Time[guiFlags.podiumBots[robotIndex]] + guiFlags.Lap3Time[guiFlags.podiumBots[robotIndex]]);
	}
}
