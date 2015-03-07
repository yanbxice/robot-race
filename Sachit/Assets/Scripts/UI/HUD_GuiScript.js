// Simple script to animate button sprites ...
//
//	Workflow:	Generate Atlas map with demo of TexturePacker
//				.. use the generated .plist file to get the sprite size and topLeftCorner coords
//
//				use QuadUi to create planes (quicker). Create class "none"
//				Add this script and set values ..
//

//	NOTE: I rebuilt the UI in Maya as a single mesh to save drawcalls ... this is a specialized script ...
// !!!! IF you reapply the input script, you need to afterwards reapply the HUD script again! I don't know why!!!

var mesh : Mesh;										// set the mesh here, so we don't need to getComponent ...
var vertNum : int[] = new int[9];						// initialize an array with 9 entries (for each changing GUI object Vertex numbers of mesh..)

var spriteSize : Vector2[] = new Vector2[7];			// The size of the sprite planes (pixel size in texture)
var spriteFrameNorm : Vector2[] = new Vector2[5];		// the array of sprite corners in normal state (TopLeft corner)
var spriteFrameActive : Vector2[] = new Vector2[5];		// the array of sprite corners in active state

var numFrames : Vector2[] = new Vector2[12];			// The number fields get special treatment ...
var ordinalFrames : Vector2[] = new Vector2[4];			// .. as do the ordinal fields ..

function Awake()
{
	mesh = (GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
		
		// initialize the vertNum array
	vertNum[0] = 0;								// action button
	vertNum[1] = 4;								// slide button
	vertNum[2] = 8;								// TransDn button
	vertNum[3] = 12;							// TransUp button
	vertNum[4] = 16;							// pause button
	vertNum[5] = 20;							// place field
	vertNum[6] = 24;							// ordinal field
	vertNum[7] = 28;							// currLap field
	vertNum[8] = 36;							// maxLaps field
	
		// initialize the vector 2 Arrays ...
	spriteSize[0] = Vector2(136,136);					// initialize the plane size Array
	spriteFrameNorm[0] = Vector2(136,0);				// initialize the normal state Array
	spriteFrameActive[0] = Vector2(0,0);				// initialize the active state Array
	
	spriteSize[1] = Vector2(615,135);					// initialize the plane size Array
	spriteFrameNorm[1] = Vector2(0,271);				// initialize the normal state Array
	spriteFrameActive[1] = Vector2(369,136);			// initialize the active state Array
	
	spriteSize[2] = Vector2(95,95);						// initialize the plane size Array
	spriteFrameNorm[2] = Vector2(95,406);				// initialize the normal state Array
	spriteFrameActive[2] = Vector2(845,271);			// initialize the active state Array
	
	spriteSize[3] = Vector2(95,95);						// initialize the plane size Array
	spriteFrameNorm[3] = Vector2(380,406);				// initialize the normal state Array
	spriteFrameActive[3] = Vector2(190,406);			// initialize the active state Array
	
	spriteSize[4] = Vector2(78,78);						// initialize the plane size Array
	spriteFrameNorm[4] = Vector2(939,0);				// initialize the normal state Array
	spriteFrameActive[4] = Vector2(861,0);				// initialize the active state Array
	
		// NOW THE FIELDS ...
	spriteSize[5] = Vector2(40,50);						// initialize the plane size Array
	numFrames[0] = Vector2(381,0);						// initialize the normal state Array
	numFrames[1] = Vector2(421,0);						// initialize the normal state Array
	numFrames[2] = Vector2(461,0);						// initialize the normal state Array
	numFrames[3] = Vector2(501,0);						// initialize the normal state Array
	numFrames[4] = Vector2(541,0);						// initialize the normal state Array
	numFrames[5] = Vector2(581,0);						// initialize the normal state Array
	numFrames[6] = Vector2(621,0);						// initialize the normal state Array
	numFrames[7] = Vector2(661,0);						// initialize the normal state Array
	numFrames[8] = Vector2(701,0);						// initialize the normal state Array
	numFrames[9] = Vector2(741,0);						// initialize the normal state Array
	numFrames[10] = Vector2(781,0);						// initialize the normal state Array
	numFrames[11] = Vector2(821,0);						// initialize the normal state Array
	
	spriteSize[6] = Vector2(60,50);						// initialize the plane size Array
	ordinalFrames[0] = Vector2(249,136);				// initialize the normal state Array
	ordinalFrames[1] = Vector2(129,136);				// initialize the normal state Array
	ordinalFrames[2] = Vector2(189,136);				// initialize the normal state Array
	ordinalFrames[3] = Vector2(309,136);				// initialize the normal state Array
	

}


function ChangeFrame (currObj : int, currFrame : int)
{
		// The size of the assigned texture		
	var textureSize : Vector2 = Vector2(1024,512);		
	
	var spriteFrame : Vector2;
	var planeSize : Vector2;		
	
 	// var mesh : Mesh = (GetComponent(MeshFilter) as MeshFilter).mesh;
    var vertices : Vector3[]  = mesh.vertices;
    var uvs : Vector2[] = new Vector2[vertices.Length];		
    
    if (currObj <= 4)
    {										// we are changing a button
    	if (currFrame == 0)
    	{									// we are setting the default state
    		spriteFrame = spriteFrameNorm[currObj];		
    		planeSize = spriteSize[currObj];
    	}
    	else if (currFrame == 1)
    	{									// we are setting the active state
    		spriteFrame = spriteFrameActive[currObj];		
    		planeSize = spriteSize[currObj];
    	}
    }
    
    else if (currObj != 6)
    {										// we are working with a number field ...
    	spriteFrame = numFrames[currFrame];
    	planeSize = spriteSize[5];
    }
    
    else if (currObj == 6)
    {										// we are working with the ordinal field
    	spriteFrame = ordinalFrames[currFrame];
    	planeSize = spriteSize[6];
    }


		// calculate the uv values we need ONCE!!
	var xMinVal : float = (spriteFrame.x / textureSize.x);
	var xMaxVal : float = ((spriteFrame.x + planeSize.x) / textureSize.x);
	var yMinVal : float = (1 - ((spriteFrame.y + planeSize.y) / textureSize.y));	// for the y values .. UVs count from bottom up, pixels from top down -> reverse value ..
	var yMaxVal : float = (1 - (spriteFrame.y / textureSize.y));

		// first get the existing uvs ..
	uvs = mesh.uv;

		// now change the uvs we want to change ...
		
		// top left vert
	uvs[vertNum[currObj]] = Vector2 (xMinVal,yMaxVal);
		// top right vert
	uvs[vertNum[currObj]+1] = Vector2 (xMaxVal, yMaxVal);
		// bottom left vert
	uvs[vertNum[currObj]+2] = Vector2 (xMinVal, yMinVal);
		// bottom roght vert
	uvs[vertNum[currObj]+3] = Vector2 (xMaxVal, yMinVal);

		// and reassign the UVs
    mesh.uv = uvs;
    
}

function ButtonChange ( hudChanges: int[])
{
	
			// The size of the assigned texture		
	var textureSize : Vector2 = Vector2(1024,512);		
	
	var spriteFrame : Vector2;
	var planeSize : Vector2;		
	
 	// var mesh : Mesh = (GetComponent(MeshFilter) as MeshFilter).mesh;
    var vertices : Vector3[]  = mesh.vertices;
    var uvs : Vector2[] = new Vector2[vertices.Length];		
 
 		// first get the existing uvs ..
	uvs = mesh.uv;
	
		// go through all buttons and if needed change the uv coords ... THEN change all at once
  	for (var i = 0; i < 5; i++)
  	{
		if (hudChanges[i] != 99)
		{
	    	if (hudChanges[i] == 0)
    		{									// we are setting the default state
    			spriteFrame = spriteFrameNorm[i];		
    			planeSize = spriteSize[i];
	    	}
    		else if (hudChanges[i] == 1)
    		{									// we are setting the active state
	    		spriteFrame = spriteFrameActive[i];		
    			planeSize = spriteSize[i];
    		}

				// calculate the uv values we need ONCE!!
			var xMinVal : float = (spriteFrame.x / textureSize.x);
			var xMaxVal : float = ((spriteFrame.x + planeSize.x) / textureSize.x);
			var yMinVal : float = (1 - ((spriteFrame.y + planeSize.y) / textureSize.y));	// for the y values .. UVs count from bottom up, pixels from top down -> reverse value ..
			var yMaxVal : float = (1 - (spriteFrame.y / textureSize.y));


				// now change the uvs we want to change ...
		
				// top left vert
			uvs[vertNum[i]] = Vector2 (xMinVal,yMaxVal);
				// top right vert
			uvs[vertNum[i]+1] = Vector2 (xMaxVal, yMaxVal);
				// bottom left vert
			uvs[vertNum[i]+2] = Vector2 (xMinVal, yMinVal);
				// bottom roght vert
			uvs[vertNum[i]+3] = Vector2 (xMaxVal, yMinVal);

		}
  	}
		// and reassign the UVs
    mesh.uv = uvs;
}
