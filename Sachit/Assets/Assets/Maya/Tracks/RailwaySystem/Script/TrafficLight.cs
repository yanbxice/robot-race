using UnityEngine;
using System.Collections;

public class TrafficLight : MonoBehaviour {
	
	public GameObject Light_Greet;
	public GameObject Light_Red;
	public Material Red_Mat;
	public Material Green_Mat;
	
	private float Time_Past;
	
	// Use this for initialization
	void Start () {
		Time_Past = Time.time;
	}
	
	// Update is called once per frame
	void Update () {
		if (Time.time - Time_Past >= 0.3 && Time.time - Time_Past < 0.6){
			Light_Greet.renderer.material.SetColor("_Color", Color.red);
			Light_Red.renderer.material.SetColor("_Color", Color.green);
		}else if (Time.time - Time_Past >= 0.6){
			Light_Greet.renderer.material.SetColor("_Color", Color.green);
			Light_Red.renderer.material.SetColor("_Color", Color.red);
			Time_Past = Time.time;
		}
	}
}
