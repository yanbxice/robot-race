using UnityEngine;
using System.Collections;

public class TutorialChanger : MonoBehaviour 
{
	public Texture tutorialEN;
	public Texture tutorialCN;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		switch(PlayerPrefs.GetInt("lang"))
		{
		case 0: //English
			gameObject.renderer.material.mainTexture = tutorialEN;
			break;
		case 1: //Germany
			gameObject.renderer.material.mainTexture = tutorialEN;
			break;
		case 2: //Chinese
			gameObject.renderer.material.mainTexture = tutorialCN;
			break;
		default:
			gameObject.renderer.material.mainTexture = tutorialEN;
			break;
		}
	}
}
