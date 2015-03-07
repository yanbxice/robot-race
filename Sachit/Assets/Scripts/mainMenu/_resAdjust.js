// For this script to work, the buttons need to be placed under a parent that is 
// in the exact screen center.

function Awake ()
{
		// iPhone resolution is 1.5!! This is my initial setup!
	var sWidth : float = Screen.width;			// get screen width and height
	var sHeight : float = Screen.height;
	var adjustRatio : float;
	
	adjustRatio = sWidth / sHeight;
	
		// now get our adjustment ratio (1.5 being the ratio the UI was setup with)
	adjustRatio = adjustRatio / 1.5;
	
		// now that we know our ratio, adjust our transforms ONCE
	transform.localPosition.x = transform.localPosition.x * adjustRatio;
	transform.localScale = transform.localScale * adjustRatio;
	
}
