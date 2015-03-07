// Single Race Button handling

var inputScript : pInput;							// the animation node (CamAnim)
var rootNode : Transform;							// the root Node for our control (move out of view)

var buttonScript : UI_SlicedButton;					// race type selector
var isOver : boolean = false;

// 
// This button should enable the refHolders podiumFlag for now. 
//		Later it will go from the podium to the next race, from last race to main menu
//		and the podium will only be shown if this is the last race of the circuit or if
//		we have a single race.
//
//	Also add a node that brings the robots position in race back to main menu and sets their 
//	order for the next race!!!
//

function Start()
{
		// get our root node
	rootNode = transform;
	
		// input script
	inputScript = GameObject.Find("Player_Construct").GetComponent(pInput) as pInput;
	
		// get our button script
	buttonScript = (rootNode.GetComponent(UI_SlicedButton) as UI_SlicedButton); 

}


	// execute Button function
function execute () 
{
		// inactivate the button
	buttonScript.changeState(0);
	
	
		// moved all functionality to pInput .. just run that function
	inputScript.btnContinue();

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

