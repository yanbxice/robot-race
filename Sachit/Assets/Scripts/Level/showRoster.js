//var playerImage : HUD_SingleButton;
//var oponent1 : HUD_SingleButton;
//var oponent2 : HUD_SingleButton;
//var oponent3 : HUD_SingleButton;

var botNames : String[] = ["Vektroid", "Zipbot", "Wrekker", "DaBomb", "Podbot", "Speedbot" ,"Tribot"];
//var playerText : TextMesh;
var playerTextLoc : UILocalize;
//var oponent1 : TextMesh;
var op1Loc : UILocalize;
//var oponent2 : TextMesh;
var op2Loc : UILocalize;
//var oponent3 : TextMesh;
var op3Loc : UILocalize;

var anchorA : Transform;
var anchorB : Transform;
var anchorC : Transform;

var meshes : Transform[] = new Transform[7];

private var rotatorA : float = 85.0;
private var rotatorB : float = 85.0;
private var rotatorC : float = 85.0;

private var maxRange : float = 60.0;
private var currRotation : float = 0.0;


function Start () 
{
		// colorize the player Text
	//playerText.renderer.material.color = Color(1,1,0,1);

	//playerImage.changeState(DataTransfer.playerBot - 1);
	//playerText.text = botNames[DataTransfer.playerBot - 1];
	playerTextLoc.key = "botNames" + (DataTransfer.playerBot).ToString();
	
	var counter : int = 0;
	var slots : int [] = new int [3];
	
	
	if (DataTransfer.robotPositions[0] != 8)
	{
		slots[counter] = 0;
		counter++;
	}
	if (DataTransfer.robotPositions[1] != 8)
	{
		slots[counter] = 1;
		counter++;
	}
	if (DataTransfer.robotPositions[2] != 8)
	{
		slots[counter] = 2;
		counter++;
	}
	if (DataTransfer.robotPositions[3] != 8)
	{
		slots[counter] = 3;
		counter++;
	}
		
		// first slot
	//oponent1.changeState(DataTransfer.robotPositions[slots[0]] - 1);
	//oponent1.text = botNames[DataTransfer.robotPositions[slots[0]] - 1];
	op1Loc.key = "botNames" + (DataTransfer.robotPositions[slots[0]]).ToString();
	meshes[DataTransfer.robotPositions[slots[0]] - 1].parent = anchorA;
	meshes[DataTransfer.robotPositions[slots[0]] - 1].position = anchorA.position;
	meshes[DataTransfer.robotPositions[slots[0]] - 1].rotation = anchorA.rotation;
		
		// second slot
	//oponent2.changeState(DataTransfer.robotPositions[slots[1]] - 1);
	//oponent2.text = botNames[DataTransfer.robotPositions[slots[1]] - 1];
	op2Loc.key = "botNames" + (DataTransfer.robotPositions[slots[1]]).ToString();
	meshes[DataTransfer.robotPositions[slots[1]] - 1].parent = anchorB;
	meshes[DataTransfer.robotPositions[slots[1]] - 1].position = anchorB.position;
	meshes[DataTransfer.robotPositions[slots[1]] - 1].rotation = anchorB.rotation;
		
		// third slot
	//oponent3.changeState(DataTransfer.robotPositions[slots[2]] - 1);
	//oponent3.text = botNames[DataTransfer.robotPositions[slots[2]] - 1];
	op3Loc.key = "botNames" + (DataTransfer.robotPositions[slots[2]]).ToString();
	meshes[DataTransfer.robotPositions[slots[2]] - 1].parent = anchorC;
	meshes[DataTransfer.robotPositions[slots[2]] - 1].position = anchorC.position;
	meshes[DataTransfer.robotPositions[slots[2]] - 1].rotation = anchorC.rotation;
	
		// trigger localize refresh
	NGUI_Handler.locUpdate = true;

}

function Update()
{
/*
	if (anchorA.localEulerAngles.y < 90.0)
	{
		rotatorA = 275.0;
	}
	else if (anchorA.localEulerAngles.y > 270.0)
	{
		rotatorA = 85.0;
	}
	if (Mathf.Abs(anchorB.localEulerAngles.y) < 90.0)
	{
		rotatorB = 275.0;
	}
	else if (Mathf.Abs(anchorB.localEulerAngles.y) > 270.0)
	{
		rotatorB = 85.0;
	}
	
	if (Mathf.Abs(anchorC.localEulerAngles.y) < 90.0)
	{
		rotatorC = 275.0;
	}
	else if (Mathf.Abs(anchorC.localEulerAngles.y) > 270.0)
	{
		rotatorC = 85.0;
	}
*/
	anchorA.Rotate(Vector3(0, (-2.0), 0) );
	//anchorA.localEulerAngles.y = Mathf.MoveTowards(anchorA.localEulerAngles.y, rotatorA, 1.0);
	anchorA.localScale = Vector3(1, 1, 1);
	
	anchorB.Rotate(Vector3(0, (-1.8), 0) );
	//anchorB.localEulerAngles.y = Mathf.MoveTowards(anchorB.localEulerAngles.y, rotatorB, 0.7);
	anchorB.localScale = Vector3(1, 1, 1);
	
	anchorC.Rotate(Vector3(0, (-2.1), 0) );
	//anchorC.localEulerAngles.y = Mathf.MoveTowards(anchorC.localEulerAngles.y, rotatorC, 1.2);
	anchorC.localScale = Vector3(1, 1, 1);
}