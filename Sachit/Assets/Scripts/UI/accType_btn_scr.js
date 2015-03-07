// Single Race Button handling

var inputScript : pInput;						// the animation node (CamAnim)
var rootNode : Transform;						// the root Node for our control (move out of view)
var buttonScript : HUD_SingleButton;			// race type selector
var isOver : boolean = false;					// here isOver is used to check if music state is already changed

function Start()
{
		// get our settings holder
	var playerConstruct = GameObject.Find("Player_Construct");
	inputScript = (playerConstruct.GetComponent(pInput) as pInput); 
	
		// get our root node
	rootNode = transform;
	
		// get our button script
	buttonScript = (rootNode.GetComponent(HUD_SingleButton) as HUD_SingleButton); 
	
	
		// init grapihics
	if(inputScript.accWheel)
	{
		buttonScript.changeState(0);
		isOver = true;
	}
	else
	{
		buttonScript.changeState(1);
		isOver = false;
	}
	
}


	// execute Button function
function execute () 
{
		// inactivate the button
	// buttonScript.changeState(1);

		// start the game
	inputScript.toggleWheel();
}

function over()
{
		// change if needed
	if (!isOver)
	{
		buttonScript.changeState(0);
	}
	else
	{
		buttonScript.changeState(1);
	}
		
}

function Update()
{
		// check if music is on (and adjust button for it)
	if(inputScript.accWheel)
	{
			// check if we still need to switch button state
		if (!isOver)
		{
			buttonScript.changeState(0);
			isOver = true;
		}
	}
	else
	{
			// check if we still need to switch button state
		if (isOver)
		{
			buttonScript.changeState(1);
			isOver = false;
		}
	}
}

