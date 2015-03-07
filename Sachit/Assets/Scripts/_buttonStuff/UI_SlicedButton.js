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


// var mesh : Mesh;																		// set the mesh here, so we don't need to getComponent ...
	// the mesh Filter objects
private var sliceComp : Mesh[] = new Mesh[9];
	// the slice planes transforms
var slicePlanes : GameObject[] = new GameObject[9];
	// the middle transform
var buttonCenter : Transform;
	// the sliced buttons size
var buttonSize : Vector2 = new Vector2(128,64);
	// the correct atlas map
var atlasMat : Material;
var buttonTrigger : BoxCollider;

var spriteSize : Vector2 = Vector2(132,132);											// The size of the sprite planes (pixel size in texture)

	// input the top left corner of the sprite in pixels on the atlas map here
var spritePos : Vector2[] =  new Vector2[2];											// this is a normal button .. change two states
// PENDING	var spriteSize : Vector2[] =  new Vector2[2];											// if we wanted to support variable sprite sizes ...

	// Texture size
var textureSize : Vector2 = new Vector2(1024,1024); 

 	// initial state
var initState : int = 0;																// on animations this should be the frames with the blank frame coming last

	// the margins for the sliced sprite
var sliceMarginsX : int = 2;
var sliceMarginsY : int = 2;
private var sliceMarginsGeo : Vector2;

	// var for sliceScale	(to adjust usage of buttons)
var sliceScale : float = 1.0;
var centerTransform : boolean = false;

	//store our uvs here (is this needed??)
private var uvsTL : Vector2[] = new Vector2[4]; 
private var uvsTC : Vector2[] = new Vector2[4]; 
private var uvsTR : Vector2[] = new Vector2[4]; 

private var uvsML : Vector2[] = new Vector2[4]; 
private var uvsMC : Vector2[] = new Vector2[4]; 
private var uvsMR : Vector2[] = new Vector2[4]; 

private var uvsBL : Vector2[] = new Vector2[4]; 
private var uvsBC : Vector2[] = new Vector2[4]; 
private var uvsBR : Vector2[] = new Vector2[4]; 

var enableButtonFeedback : boolean = false;
var enableButton : boolean = true;
var isCheckbox : boolean = false;
private var isOver : boolean = false;
private var overTimer : float = 0.0;

var currState : int = 1;

function Awake()
{
		// get the attached mesh Filter, 
	// mesh = (GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
	
		// adjust aour mesh margins (so our corners size is independant of the texture...)
	sliceMarginsGeo = new Vector2( (sliceMarginsX * sliceScale), (sliceMarginsY * sliceScale) );
	
		// get the number of frames from array
	// var numFrames = spritePos.length;

		// center offset
	var centerOffset : Vector2 = new Vector2(buttonSize.x / 2, buttonSize.y / 2);
	if (enableButton)
	{
		buttonTrigger.center = Vector3(-centerOffset[0], -centerOffset[1], 0);
		buttonTrigger.size = Vector3(buttonSize.x, buttonSize.y, 1);
	}
	

		// position the center correctly...
	buttonCenter.localPosition = Vector3(-centerOffset.x, -centerOffset.y, 0);
	
		// set the correct size and pos for our planes ...
	slicePlanes[0].transform.localScale = Vector3(sliceMarginsGeo[0], sliceMarginsGeo[1], 1);
		slicePlanes[0].transform.localPosition = Vector3(-centerOffset.x, -centerOffset.y, 0);
		slicePlanes[0].renderer.material = atlasMat;
		sliceComp[0] = (slicePlanes[0].GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
	slicePlanes[1].transform.localScale = Vector3( (buttonSize.x - (2 * sliceMarginsGeo[0])), sliceMarginsGeo[1], 1);
		slicePlanes[1].transform.localPosition = Vector3(-centerOffset.x + sliceMarginsGeo[0], -centerOffset.y, 0);
		slicePlanes[1].renderer.material = atlasMat;
		sliceComp[1] = (slicePlanes[1].GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
	slicePlanes[2].transform.localScale = Vector3(sliceMarginsGeo[0], sliceMarginsGeo[1], 1);
		slicePlanes[2].transform.localPosition = Vector3( (centerOffset.x - sliceMarginsGeo[0]), -centerOffset.y, 0);
		slicePlanes[2].renderer.material = atlasMat;
		sliceComp[2] = (slicePlanes[2].GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
		
	slicePlanes[3].transform.localScale = Vector3(sliceMarginsGeo[0], (buttonSize.y - (2 * sliceMarginsGeo[1])), 1);
		slicePlanes[3].transform.localPosition = Vector3(-centerOffset.x, (-centerOffset.y + sliceMarginsGeo[1]), 0);
		slicePlanes[3].renderer.material = atlasMat;
		sliceComp[3] = (slicePlanes[3].GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
	slicePlanes[4].transform.localScale = Vector3( (buttonSize.x - (2 * sliceMarginsGeo[0])), (buttonSize.y - (2 * sliceMarginsGeo[1])), 1);
		slicePlanes[4].transform.localPosition = Vector3(-centerOffset.x + sliceMarginsGeo[0], (-centerOffset.y + sliceMarginsGeo[1]), 0);
		slicePlanes[4].renderer.material = atlasMat;
		sliceComp[4] = (slicePlanes[4].GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
	slicePlanes[5].transform.localScale = Vector3(sliceMarginsGeo[0], (buttonSize.y - (2 * sliceMarginsGeo[1])), 1);
		slicePlanes[5].transform.localPosition = Vector3( (centerOffset.x - sliceMarginsGeo[0]), (-centerOffset.y + sliceMarginsGeo[1]), 0);
		slicePlanes[5].renderer.material = atlasMat;
		sliceComp[5] = (slicePlanes[5].GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
		
	slicePlanes[6].transform.localScale = Vector3(sliceMarginsGeo[0], sliceMarginsGeo[1], 1);
		slicePlanes[6].transform.localPosition = Vector3(-centerOffset.x, (centerOffset.y - sliceMarginsGeo[1]), 0);
		slicePlanes[6].renderer.material = atlasMat;
		sliceComp[6] = (slicePlanes[6].GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
	slicePlanes[7].transform.localScale = Vector3( (buttonSize.x - (2 * sliceMarginsGeo[0])), sliceMarginsGeo[1], 1);
		slicePlanes[7].transform.localPosition = Vector3(-centerOffset.x + sliceMarginsGeo[0], (centerOffset.y - sliceMarginsGeo[1]), 0);
		slicePlanes[7].renderer.material = atlasMat;
		sliceComp[7] = (slicePlanes[7].GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
	slicePlanes[8].transform.localScale = Vector3(sliceMarginsGeo[0], sliceMarginsGeo[1], 1);
		slicePlanes[8].transform.localPosition = Vector3( (centerOffset.x - sliceMarginsGeo[0]), (centerOffset.y - sliceMarginsGeo[1]), 0);
		slicePlanes[8].renderer.material = atlasMat;
		sliceComp[8] = (slicePlanes[8].GetComponent(MeshFilter) as MeshFilter).mesh;	// get the mesh here...
		
		// get the uvs from our mesh
	uvsTL = sliceComp[0].uv;
	uvsTC = sliceComp[1].uv;
	uvsTR = sliceComp[2].uv;
	
	uvsML = sliceComp[3].uv;
	uvsMC = sliceComp[4].uv;
	uvsMR = sliceComp[5].uv;
	
	uvsBL = sliceComp[6].uv;
	uvsBC = sliceComp[7].uv;
	uvsBR = sliceComp[8].uv;

	//print ("TopL: " + uvsTL);
	
		// Test
	// changeElement (spritePos[0], Vector2(sliceMargins, sliceMargins), uvsTL, sliceComp[0]);	
		
		// change to initial state
	changeState(initState);
	
		// check center positioning
	if(centerTransform)
	{
			// position the center correctly...
		buttonCenter.localPosition = Vector3(0, 0, 0);
		if (enableButton)
		{
			buttonTrigger.center = Vector3(0, 0, 0);
		}
	}
}

function changeState(state : int)
{
		// change the state of all elements ...
	changeElement (spritePos[state], Vector2(sliceMarginsX, sliceMarginsY), uvsTL, sliceComp[0]);	
	changeElement (Vector2( (spritePos[state].x + sliceMarginsX), (spritePos[state].y) ), Vector2( (spriteSize.x - (2 * sliceMarginsX)), sliceMarginsY), uvsTC, sliceComp[1]);
	changeElement (Vector2( (spritePos[state].x + spriteSize.x - sliceMarginsX), (spritePos[state].y) ), Vector2(sliceMarginsX, sliceMarginsY), uvsTR, sliceComp[2]);	
	
	changeElement (Vector2(spritePos[state].x, (spritePos[state].y + sliceMarginsY) ), Vector2(sliceMarginsX, (spriteSize.y - (2 * sliceMarginsY))), uvsTR, sliceComp[3]);	
	changeElement (Vector2( (spritePos[state].x + sliceMarginsX), (spritePos[state].y + sliceMarginsY) ), Vector2( (spriteSize.x - (2 * sliceMarginsX)), (spriteSize.y - (2 * sliceMarginsY))), uvsTR, sliceComp[4]);
	changeElement (Vector2( (spritePos[state].x + spriteSize.x - sliceMarginsX), (spritePos[state].y + sliceMarginsY) ), Vector2(sliceMarginsX, (spriteSize.y - (2 * sliceMarginsY))), uvsTR, sliceComp[5]);
		
	changeElement (Vector2(spritePos[state].x, (spritePos[state].y + spriteSize.y - sliceMarginsY) ), Vector2(sliceMarginsX, sliceMarginsY), uvsTR, sliceComp[6] );	
	changeElement (Vector2( (spritePos[state].x + sliceMarginsX), (spritePos[state].y + spriteSize.y - sliceMarginsY) ), Vector2( (spriteSize.x - (2 * sliceMarginsX)), sliceMarginsY), uvsTR, sliceComp[7]);
	changeElement (Vector2( (spritePos[state].x + spriteSize.x - sliceMarginsX), (spritePos[state].y + spriteSize.y - sliceMarginsY) ), Vector2(sliceMarginsX, sliceMarginsY), uvsTR, sliceComp[8]);

		// store current state
	currState = state;
}

function changeElement(spriteFrame : Vector2, sliceSize : Vector2, uvs : Vector2[], sliceComponent : Mesh)
{
 	// var spriteFrame : Vector2;
    
    	// get our values
    // spriteFrame = spritePos[state];										// which state do we set?
    
		// calculate the uv values we need ONCE!!
	var xMinVal : float = (spriteFrame.x / textureSize.x);
	var xMaxVal : float = ((spriteFrame.x + sliceSize.x) / textureSize.x);
	var yMinVal : float = (1 - ((spriteFrame.y + sliceSize.y) / textureSize.y));	// for the y values .. UVs count from bottom up, pixels from top down -> reverse value ..
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
    sliceComponent.uv = uvs;
}

function execute()
{

}

function over()
{
	if (enableButtonFeedback)
	{
			// change if needed
		if (!isOver)
		{
			changeState(1);
		}
			// set over mode
		isOver = true;
		
			// set over timer
		overTimer = Time.time + 0.2;
	}
}

function Update()
{
	if (enableButtonFeedback)
	{
		if(isOver && (Time.time > overTimer))
		{
			changeState(0);
			isOver = false;
		}
	}
}

/*
function Update()
{

	else if (!initActive)
	{
		initActive = true;
		changeState(initState);
	}

}
*/

