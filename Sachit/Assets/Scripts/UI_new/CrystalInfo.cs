using UnityEngine;
using System.Collections;

public class CrystalInfo : MonoBehaviour 
{
	public UILabel crystalNumber;
	
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		crystalNumber.text = DataTransfer.credits.ToString();
	
	}
}
