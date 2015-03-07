using UnityEngine;
using System.Collections;

public class MiniMapAdjust : MonoBehaviour 
{
	private Vector2 iPhone4;
	private Vector2 iPhone5;
	private Vector2 iPad;
	
	public Vector4 iPhone_4_Adjust;
	public Vector4 iPhone_5_Adjust;
	public Vector4 iPad_Adjust;
	
	// Use this for initialization
	void Start () 
	{
		iPhone4 = new Vector2(960, 640);
		iPhone5 = new Vector2(1136, 640);
		iPad = new Vector2(1024, 768);
		
		AdjustMiniMap();
	}
	
	// Update is called once per frame
	void Update () 
	{
	}
	
	void AdjustMiniMap()
	{
		Vector2 res = new Vector2(Screen.width, Screen.height);
		float ratio = res.x/res.y;
		
		if(ratio >= 15.9f/9.0f) // 16:9
		{
			res = iPhone5;
		}
		else if(ratio >= 2.9f/2.0f) // 3:2
		{
			res = iPhone4;
		}
		else if(ratio >= 3.9f/3.0f) // 4:3
		{
			res = iPad;
		}
		
		Debug.Log(ratio);
		
		
		if(res == iPhone4)
		{
			transform.localPosition = new Vector3(iPhone_4_Adjust.x, iPhone_4_Adjust.y, transform.localPosition.z);
			transform.localScale = new Vector3(iPhone_4_Adjust.z, iPhone_4_Adjust.w, transform.localScale.z);
		}
		if(res == iPhone5)
		{
			transform.localPosition = new Vector3(iPhone_5_Adjust.x, iPhone_5_Adjust.y, transform.localPosition.z);
			transform.localScale = new Vector3(iPhone_5_Adjust.z, iPhone_5_Adjust.w, transform.localScale.z);
		}
		if(res == iPad)
		{
			transform.localPosition = new Vector3(iPad_Adjust.x, iPad_Adjust.y, transform.localPosition.z);
			transform.localScale = new Vector3(iPad_Adjust.z, iPad_Adjust.w, transform.localScale.z);
		}
	}
}
