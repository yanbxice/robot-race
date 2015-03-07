//This is not a good way to rescale. 
//But the resolution 480*320 is hard-coded into many places in this game, 
//this is the best way I can figure out.

using UnityEngine;
using System.Collections;

public class ResolutionScaleAndPositionAdjust : MonoBehaviour 
{
	public Vector2[] supportedResolution;
	public Vector3[] adjustScale;
	public Vector3[] adjustPosition;
	// Use this for initialization
	void Start () 
	{
		int width, height;
		width = Screen.width;
		height = Screen.height;
		
		if(supportedResolution.Length != adjustScale.Length || supportedResolution.Length != adjustPosition.Length)
		{
			Debug.LogError("The number of supported resolution and scale&position should match!");
		}
		
		int i;
		for(i = 0; i < supportedResolution.Length; i++)
		{
			if(width == supportedResolution[i].x && height == supportedResolution[i].y)
			{
				transform.localScale = adjustScale[i];
				transform.localPosition = adjustPosition[i];
			}
		}
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
