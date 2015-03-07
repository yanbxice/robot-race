// Single Race Button handling

var inputScript : pInput;							// the animation node (CamAnim)
var buttonScript : UI_SlicedButton;					// race type selector
var isOver : boolean = false;


function Start()
{
		// get our settings holder
	var playerConstruct = GameObject.Find("Player_Construct");
	inputScript = (playerConstruct.GetComponent(pInput) as pInput); 

		// get our button script
	buttonScript = (transform.GetComponent(UI_SlicedButton) as UI_SlicedButton); 
	
}


	// execute Button function
function execute () 
{
		// inactivate the button
	buttonScript.changeState(0);

		// start the game
	inputScript.btnResume();
}

function over()
{
		// change if needed
	if (!isOver)
	{
		buttonScript.changeState(1);
	}
		// set hover mode
	isOver = true;
}

function Update()
{
	if(isOver)
	{
		buttonScript.changeState(0);
		isOver = false;
	}
}

