// Simple script to animate button sprites ...
//
//	Workflow:	Generate Atlas map with demo of TexturePacker
//				.. use the generated .plist file to get the sprite size and topLeftCorner coords
//
//				use QuadUi to create planes (quicker). Create class "none"
//				Add this script and set values ..


var spriteSize : Vector2;				// The size of the curent sprite plane
var textureSize : Vector2;				// The size of the assigned texture

var spriteFrame : Vector2[];			// the array of sprite corners (upperLeft pixel coords)


function ChangeFrame (currFrame : int)
{
 	var mesh : Mesh = (GetComponent(MeshFilter) as MeshFilter).mesh;
    var vertices : Vector3[]  = mesh.vertices;
    var uvs : Vector2[] = new Vector2[vertices.Length];			// could also init the Array with 4 ...

		// calculate the uv values we need ONCE!!
	var xMinVal : float = (spriteFrame[currFrame].x / textureSize.x);
	var xMaxVal : float = ((spriteFrame[currFrame].x + spriteSize.x) / textureSize.x);
	var yMinVal : float = (1 - ((spriteFrame[currFrame].y + spriteSize.y) / textureSize.y));	// for the y values .. UVs count from bottom up, pixels from top down -> reverse value ..
	var yMaxVal : float = (1 - (spriteFrame[currFrame].y / textureSize.y));

		// top left vert
	uvs[0] = Vector2 (xMinVal,yMaxVal);
	
		// top right vert
	uvs[1] = Vector2 (xMaxVal, yMaxVal);
	
		// bottom left vert
	uvs[2] = Vector2 (xMinVal, yMinVal);
	
		// bottom roght vert
	uvs[3] = Vector2 (xMaxVal, yMinVal);

    mesh.uv = uvs;
}

	// reset to first frame
function ResetSprite()
{
	ChangeFrame(0);
}

