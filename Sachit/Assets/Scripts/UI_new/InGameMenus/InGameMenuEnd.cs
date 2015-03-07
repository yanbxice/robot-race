using UnityEngine;
using System.Collections;

//This one is different from other In-Game-Menu scripts because the way how others implement this menu
public class InGameMenuEnd : MonoBehaviour 
{
	public GameObject Label_BadgesNumber;
	public GameObject Label_CrystalsNumber;
	
	public GUI_Flags guiFlags;
	// Use this for initialization
	void Start () 
	{
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		Label_CrystalsNumber.GetComponent<UILabel>().text = guiFlags.playerCredits.ToString();
		
		int badgesNumber = 0;
		foreach (int i in DataTransfer.badgesRace)
		{
			badgesNumber += i;
		}
		Label_BadgesNumber.GetComponent<UILabel>().text = badgesNumber.ToString();
	}
}
