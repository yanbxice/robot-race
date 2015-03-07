// Single Race Button handling

var inputScript : pInput;							// the animation node (CamAnim)
var rootNode : Transform;							// the root Node for our control (move out of view)
var buttonScript : UI_SlicedButton;				// race type selector
var isOver : boolean = false;
var _refHolder : refHolder;

// 
// This button restarts the race

function Start()
{
		// get our settings holder
	var playerConstruct = GameObject.Find("Player_Construct");
	inputScript = (playerConstruct.GetComponent(pInput) as pInput); 
	
		// get our root node
	rootNode = transform;
	
		// get our button script
	buttonScript = (rootNode.GetComponent(UI_SlicedButton) as UI_SlicedButton); 
	
		// get our refHolder
	var refConstruct = GameObject.Find("_refHolder");
	_refHolder = (refConstruct.GetComponent(refHolder) as refHolder); 
}


	// execute Button function
function execute () 
{
			// inactivate the button
		buttonScript.changeState(0);
		
		if (_refHolder.raceOver)
		{
				// DataTransferBotPoints should be reset now as we are exiting to main menu afterwards.
			DataTransfer.botPoints[0] = 0;
			DataTransfer.botPoints[1] = 0;
			DataTransfer.botPoints[2] = 0;
			DataTransfer.botPoints[3] = 0;
			DataTransfer.botPoints[4] = 0;
			DataTransfer.botPoints[5] = 0;
			DataTransfer.botPoints[6] = 0;
			
				// if not the last level of circuit, load next one...
			var	localHolder = GameObject.Find("_rr_settings_holder_local");
			Destroy(localHolder);
					
				// now load next level
			Application.LoadLevel(DataTransfer.trackList[DataTransfer.currentTrack]);
		}
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

