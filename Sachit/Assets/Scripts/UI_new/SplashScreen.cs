using UnityEngine;
using System.Collections;

public class SplashScreen : MonoBehaviour 
{
	public float defaultWidth = 480;
	public float defaultHeight = 320;
	public Texture2D splashReplace;
	// Use this for initialization
	void Start () 
	{
		float currentWidth = Screen.width;
		float currentHeight = Screen.height;
		float aspect = currentWidth/currentHeight;
		if(aspect <= 17.0f/9 && aspect >= 15.0f/9)
		{
			//If the aspect ratio is close to 16:9, use another image to better fit the ratio
			renderer.material.mainTexture = splashReplace;
			
			
			Vector3 scale = transform.localScale;
			scale.x *= (currentWidth/currentHeight)/(defaultWidth/defaultHeight);
			transform.localScale = scale;
			
		}
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
