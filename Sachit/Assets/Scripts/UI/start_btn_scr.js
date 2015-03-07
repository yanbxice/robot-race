// Single Race Button handling

var inputScript : pInput;							// the animation node (CamAnim)
var rootNode : Transform;							// the root Node for our control (move out of view)
var buttonScript : HUD_SingleButton;				// race type selector

function Start()
{
		// get our settings holder
	var playerConstruct = GameObject.Find("Player_Construct");
	inputScript = (playerConstruct.GetComponent(pInput) as pInput); 
	
		// get our root node
	rootNode = transform;
	
		// get our button script
	buttonScript = (rootNode.GetComponent(HUD_SingleButton) as HUD_SingleButton); 
	
}
	// execute Button function
function execute () 
{
		// start the game
	inputScript.btnStartLevel();
}

function over()
{

}

function Update()
{

}

