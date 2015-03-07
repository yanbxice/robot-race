using UnityEngine;
using System.Collections;

public class CircuitCrystalReward : MonoBehaviour 
{
	public UILabel reward_1st;
	public UILabel reward_2nd;
	public UILabel reward_3rd;
	
	public int[,] crystalReward;
	
	private int currentCircuit;
	// Use this for initialization
	void Start () 
	{
		currentCircuit = -1;
		crystalReward = new int[7,3]{{0,0,0},{100,80,50},{150,120,75},{200,160,100},{300,200,125},{350,240,150},{400,280,175}};
	}
	
	// Update is called once per frame
	void Update () 
	{
		if(currentCircuit != DataTransfer.currentCircuit)
		{
			currentCircuit = DataTransfer.currentCircuit;
			reward_1st.text = crystalReward[currentCircuit,0].ToString();
			reward_2nd.text = crystalReward[currentCircuit,1].ToString();
			reward_3rd.text = crystalReward[currentCircuit,2].ToString();
		}
	}
}
