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
 	
	// play animation
var playAnim : boolean = false;
var framerate : int = 10;
var loop : boolean = true;

var moveActual : boolean = false;
private var inPos : boolean = false;

private var numFrames : int;
private var frameInterval : int = 1;
private var counter : int = 0;
private var initActive : boolean = true;

	//store our uvs here
private var uvs : Vector2[] = new Vector2[4]; 


function Awake()
{
		// get the attached mesh Filter, 
	mesh = (GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
	
		// change to initial state
	changeState(initState);
	
		// get the frame interval
	if (framerate == 0)
		framerate = 1; 					// prevent division by zero
		
	frameInterval = 30 / framerate;

		// get the number of frames from array
	numFrames = spritePos.length;
	
		// get the uvs from our mesh
	uvs = mesh.uv;
	
		// if moveActual
	if (moveActual)
	{
		transform.localPosition.y = -2000;
	}
}


function changeState(state : int)
{
 	var spriteFrame : Vector2;
		 
		// create our uv Vector2 Array 
   // var uvs : Vector2[] = new Vector2[4]; 
    
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

	
	
// print(frameInterval);	
	if(playAnim)
	{
		if (moveActual)
		{
			if (!inPos)
			{
				transform.localPosition.y = 0;
				inPos = true;
			}
		}	
	
		initActive = false;
		if(Time.frameCount % frameInterval == 0)
		{
				// set the new frame
			changeState(counter);
				
				// increase the counter
			counter ++;
				
				// after one loop check what's next (if looping, don't play the last frame)
			if(counter == (numFrames))
			{
					// check if we need to stop ...
				if(!loop)
				{
						// we played one loop. Stop playing
					playAnim = false;
					counter = 0;
				}
				else
				{
						// we're looping. Reset the counter
					counter = 0;
				}
			}
		}
	}
	else if (!initActive)
	{
		initActive = true;
		changeState(initState);
		
		if (moveActual)
		{
			if (inPos)
			{
				transform.localPosition.y = -2000;
				inPos = false;
			}
		}	
	}

}


