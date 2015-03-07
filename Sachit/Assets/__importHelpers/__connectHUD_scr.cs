#if !UNITY_IPHONE 
//#if !UNITY_WEBPLAYER

using UnityEngine;
using System.Collections;

public class __connectHUD_scr : MonoBehaviour {
	
	public bool doInit = false;
	
	void OnDrawGizmosSelected()
	{
		if(doInit)
		{		// find our HUD Object
			GUI_Manager GUI_Scr = GameObject.Find("GUI_Handler").GetComponent<GUI_Manager>();
		
				// Connect stuff into it ...
			GUI_Scr.playerTrns = GameObject.Find("Player_Construct").GetComponent<Transform>();
			GUI_Scr.botTrns[0] = GameObject.Find("AI_Construct_01").GetComponent<Transform>();
			GUI_Scr.botTrns[1] = GameObject.Find("AI_Construct_02").GetComponent<Transform>();
			GUI_Scr.botTrns[2] = GameObject.Find("AI_Construct_03").GetComponent<Transform>();
			GUI_Scr.botTrns[3] = GameObject.Find("AI_Construct_04").GetComponent<Transform>();
			GUI_Scr.botTrns[4] = GameObject.Find("AI_Construct_05").GetComponent<Transform>();
			GUI_Scr.botTrns[5] = GameObject.Find("AI_Construct_06").GetComponent<Transform>();
			
				// exit loop
			doInit = false;
		}
	}
	
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}

//#endif
#endif