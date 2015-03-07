// The main level loading menu
//
//

	// the button textures ..
var singleBtn : Texture;
var multiplayerBtn : Texture;
var optionsBtn : Texture;
var helpBtn : Texture;

var Skin : GUISkin;

	// Screen / Touch handling variables
private var sWidth: float;			// get screen width and height
private var sHeight: float;

private var loadLevel : int = 1;

function Awake () {
	
		// Screen / Touch handling variables
	sWidth = Screen.width;			// get screen width and height
	sHeight = Screen.height;

}

function OnGUI()
{												// temp code for the in game menu
		var btnWidth = (sWidth / 10) * 3;
		var btnHeight = 30;
		
		var xPos = (sWidth / 10) * 6;
		var yPos = (sHeight /6) * 2;
		
			// set our skin..
		GUI.skin = Skin;

			// menu will only appear if in pause mode
		if (GUI.Button(Rect(xPos,(yPos-60),btnWidth,(btnHeight*2 - 5)),singleBtn))
		{
			//Application.LoadLevel(1);
		}
		
		if (GUI.Button(Rect(xPos, (yPos), btnWidth, (btnHeight*2 - 5)),multiplayerBtn))
		{
			//Application.LoadLevel(3);
		}
		
		if (GUI.Button(Rect(xPos, (yPos + 60), btnWidth, (btnHeight*2 - 5)),optionsBtn))
		{
			//Application.LoadLevel(5);
		}
		
		if (GUI.Button(Rect(xPos, (yPos + 120), btnWidth, (btnHeight*2 - 5)),helpBtn))
		{
			//Application.LoadLevel(7);
		}


/*
			// menu will only appear if in pause mode
		if (GUI.Button(Rect(xPos,yPos,btnWidth,btnHeight),"Load Electric (AI)"))
		{
			Application.LoadLevel(1);
		}
		
		if (GUI.Button(Rect(xPos, (yPos + 50), btnWidth, btnHeight),"Load Military"))
		{
			Application.LoadLevel(3);
		}
		
		if (GUI.Button(Rect(xPos, (yPos + 100), btnWidth, btnHeight),"Load Wasteland"))
		{
			Application.LoadLevel(5);
		}
		
		if (GUI.Button(Rect(xPos, (yPos + 150), btnWidth, btnHeight),"Load Mushroom"))
		{
			Application.LoadLevel(7);
		}
*/
}

