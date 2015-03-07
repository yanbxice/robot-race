using UnityEngine;
using System.Collections;

public class ResolutionAdjust : MonoBehaviour {
	
	public float defaultWidth = 480;
	public float defaultHeight = 320;
	
	public bool keepPosition = false;
	public bool stretchHeight = false;

	// Use this for initialization
	void Start () 
	{
		//The position of UI Camera is hard-coded in SamUI.cs. So BAD!!!
		//int cameraPositionX = defaultWidth/2;
		//int cameraPositionY = -defaultHeight/2;
		
		float currentWidth = Screen.width;
		float currentHeight = Screen.height;
		
		Vector3 scale = transform.localScale;
		scale.x *= (currentWidth/currentHeight)/(defaultWidth/defaultHeight);
		if(stretchHeight && (currentWidth/currentHeight) > (defaultWidth/defaultHeight))
		{
			scale.y *= (currentWidth/currentHeight)/(defaultWidth/defaultHeight);
		}
		transform.localScale = scale;
		
		Vector3 position = transform.localPosition;
		if(!keepPosition)
		{
			position.x -= (scale.x - defaultWidth)/2;
			if(stretchHeight && currentWidth/currentHeight > defaultWidth/defaultHeight)
			{
				position.y -= (scale.y - defaultHeight)/2;
			}
		}
		transform.localPosition = position;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
