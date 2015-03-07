using UnityEngine;
using System.Collections;

public class BadgeCrystalReward : MonoBehaviour 
{
	public UILabel rewardEasy;
	public UILabel rewardNormal;
	public UILabel rewardHard;
	public int[,] crystalReward;
	
	private int currentBadge;
	// Use this for initialization
	void Start () 
	{
		currentBadge = -1;
		crystalReward = new int[,]{{15,20,30},{25,35,50},{10,15,20},{15,20,30},{5,10,15},{20,30,40},{10,15,20},{25,35,50},{5,10,15},{5,10,15},{20,30,40}};
	}
	
	// Update is called once per frame
	void Update () 
	{
		if(currentBadge != DataTransfer.currentBadge)
		{
			currentBadge = DataTransfer.currentBadge;
			rewardEasy.text = crystalReward[currentBadge,0].ToString();
			rewardNormal.text = crystalReward[currentBadge,1].ToString();
			rewardHard.text = crystalReward[currentBadge,2].ToString();
		}
	}
}
