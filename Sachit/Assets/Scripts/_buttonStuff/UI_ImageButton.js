// Simple script to animate one planes UV textures ..
//
//	Workflow:	Generate Atlas map with demo of TexturePacker
//				.. use the generated .plist file to get the sprite size and topLeftCorner coords
//
//	use the base gui plane in the Assets / Maya folder and attach this script to it!
//	The plane is 1x1 in size, so just resize to what pixel size you want the button/texture to be
// 
//	Supports multiple states through the spritePos array. Just enter all states topLeft positions (get from texture packer plist file)
//
//	Then simply run by calling this Objects changeState(i) where i is the index of your state!
//
//	Basically this allows you to have multiple buttons and/or animations sharing one atlas texture and one material, thus also only
//	using up one drawcall.
//


var mesh : Mesh;																		// set the mesh here, so we don't need to getComponent ...

var spriteSize : Vector2 = Vector2(132,132);											// The size of the sprite planes (pixel size in texture)

	// input the top left corner of the sprite in pixels on the atlas map here
var spritePos : Vector2[] =  new Vector2[2];											// this is a normal button .. change two states

	// Texture size
var textureSize : Vector2 = Vector2(1024,1024); 
 
 	// initial state
var initState : int = 0;																// on animations this should be the frames with the blank frame coming last

	// button size
var buttonSize : Vector2;
// var buttonAnim : Animation;
var buttonCenter : Transform;
var buttonSprite :GameObject;
var buttonMaterial : Material;
var buttonTrigger : BoxCollider;

var enableButton : boolean = true;

//var button

private var initActive : boolean = true;

	//store our uvs here
private var uvs : Vector2[] = new Vector2[4]; 

var updateButton : boolean = false;

function Awake()
{
		// size and place the button
	buttonSprite.transform.localScale = Vector3(buttonSize.x, buttonSize.y, 1);
		buttonSprite.transform.localPosition = Vector3((-buttonSize.x / 2), (-buttonSize.y / 2), 0);
		buttonSprite.renderer.material = buttonMaterial;
		mesh = (buttonSprite.GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
	
		// place the center
	buttonCenter.localPosition = Vector3((-buttonSize.x / 2), (-buttonSize.y / 2), 0);
	
		// set the button trigger size ...
	buttonTrigger.center = Vector3((-buttonSize.x / 2), (-buttonSize.y / 2), 0);
	buttonTrigger.size = Vector3(buttonSize.x, buttonSize.y, 5);
	
		// get the uvs from our mesh
	uvs = mesh.uv;
		
		// change to initial state
	changeState(initState);
}


function OnDrawGizmosSelected ()
{
	if (updateButton)
	{
			// size and place the button
		buttonSprite.transform.localScale = Vector3(buttonSize.x, buttonSize.y, 1);
			buttonSprite.transform.localPosition = Vector3((-buttonSize.x / 2), (-buttonSize.y / 2), 0);
			buttonSprite.renderer.material = buttonMaterial;
			mesh = (buttonSprite.GetComponent(MeshFilter) as MeshFilter).sharedMesh;	// get the mesh here...
		
			// place the center
		buttonCenter.localPosition = Vector3((-buttonSize.x / 2), (-buttonSize.y / 2), 0);
		
			// set the button trigger size ...
		buttonTrigger.center = Vector3((-buttonSize.x / 2), (-buttonSize.y / 2), 0);
		buttonTrigger.size = Vector3(buttonSize.x, buttonSize.y, 5);
		
			// get the uvs from our mesh
		uvs = mesh.uv;
			
			// change to initial state
		changeState(initState);
	}
}


function changeState(state : int)
{
 	var spriteFrame : Vector2;
		 
    
    	// get our values
    spriteFrame = spritePos[state];										// which state do we set?
    
		// calculate the uv values we need ONCE!!
	var xMinVal : float = (spriteFrame.x / textureSize.x);
	var xMaxVal : float = ((spriteFrame.x + spriteSize.x) / textureSize.x);
	var yMinVal : float = (1 - ((spriteFrame.y + spriteSize.y) / textureSize.y));	// for the y values .. UVs count from bottom up, pixels from top down -> reverse value ..
	var yMaxVal : float = (1 - (spriteFrame.y / textureSize.y));

		// first get the existing uvs ..
	// uvs = mesh.uv;

		// now change the uvs we want to change ...
		
		// top left vert
	uvs[2] = Vector2 (xMinVal, yMaxVal);
		// top right vert
	uvs[3] = Vector2 (xMaxVal, yMaxVal);
		// bottom left vert
	uvs[0] = Vector2 (xMinVal, yMinVal);
		// bottom roght vert
	uvs[1] = Vector2 (xMaxVal, yMinVal);

		// and reassign the UVs
    mesh.uv = uvs;
}

function Update()
{
/*
	if (!initActive)
	{
		initActive = true;
		changeState(initState);
	}
*/
}


