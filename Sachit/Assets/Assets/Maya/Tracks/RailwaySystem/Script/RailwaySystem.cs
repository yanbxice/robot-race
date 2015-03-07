using UnityEngine;
using System.Collections;

public class RailwaySystem : MonoBehaviour {
	public GameObject Start_Obj;
	public GameObject End_Obj;
	public GameObject Train;
	
	private Vector3 Start_Point;
	private Vector3 End_Point;
	private float Move_Direction;
	private int move_steps;
	
	// Use this for initialization
	void Start () {
		Start_Point = Train.transform.position;
		End_Point = End_Obj.transform.position;
		move_steps = 0;
		//Train.transform.position = new Vector3(Start_Point.x, Train.transform.position.y, Start_Point.z);
		if (End_Point.z > Train.transform.position.z){
			Move_Direction = 0.1f;
		}else{
			Move_Direction = -0.1f;
		}
	}
	
	// Update is called once per frame
	void Update () {
		Train.transform.Translate(0,0,Move_Direction);
		move_steps++;
		if (move_steps > 530){
			Train.transform.position = Start_Point;
			move_steps = 0;
		}
	}
}
