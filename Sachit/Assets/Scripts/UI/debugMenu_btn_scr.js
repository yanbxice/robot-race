// Single Race Button handling

var inputScript : pInput;							// the animation node (CamAnim)
var rootNode : Transform;						// the root Node for our control (move out of view)
var buttonScript : HUD_SingleButton;					// race type selector
var isOver : boolean = false;


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
		// inactivate the button
	buttonScript.changeState(1);

		// start the game
	DataVault.baseMenu = false;
	DataVault.developerMenu = true;
}

function over()
{
		// change if needed
	if (!isOver)
	{
		buttonScript.changeState(0);
	}
		// set hover mode
	isOver = true;
}

function Update()
{
	if(isOver)
	{
		buttonScript.changeState(1);
		isOver = false;
	}
}

