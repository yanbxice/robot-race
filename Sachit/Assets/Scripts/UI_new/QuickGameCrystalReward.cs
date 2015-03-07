using UnityEngine;
using System.Collections;

public class QuickGameCrystalReward : MonoBehaviour {
	
	public UILabel reward_1st;
	public UILabel reward_2nd;
	public UILabel reward_3rd;
	
	public int[] easyReward;
	public int[] normalReward;
	public int[] hardReward; //Must have at least 3 members
	
	private int aiDiff;

	// Use this for initialization
	void Start () 
	{
		aiDiff = -1;
	}
	
	// Update is called once per frame
	void Update () 
	{
		if(aiDiff != DataTransfer.aiDiff)
		{
			aiDiff = DataTransfer.aiDiff;
			//Update Crystal Reward
			switch(aiDiff)
			{
			case 0:
				reward_1st.text = easyReward[0].ToString();
				reward_2nd.text = easyReward[1].ToString();
				reward_3rd.text = easyReward[2].ToString();
				break;
			case 1:
				reward_1st.text = normalReward[0].ToString();
				reward_2nd.text = normalReward[1].ToString();
				reward_3rd.text = normalReward[2].ToString();
				break;
			case 2:
				reward_1st.text = hardReward[0].ToString();
				reward_2nd.text = hardReward[1].ToString();
				reward_3rd.text = hardReward[2].ToString();
				break;
			}
		}
	}
}
