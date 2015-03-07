using UnityEngine;
using System.Collections;

public class PlayGameCrystalReward : MonoBehaviour {
	
	public GameObject quickRace;
	public GameObject circuit;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		if(DataTransfer.currentCircuit == 0)
		{
			quickRace.SetActiveRecursively(true);
			circuit.SetActiveRecursively(false);
		}
		else
		{
			quickRace.SetActiveRecursively(false);
			circuit.SetActiveRecursively(true);
		}
	}
}
