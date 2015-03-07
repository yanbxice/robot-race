// Single Race Button handling

var numCircuits : int = 6;
var imageMaterial : Material;
var circuitTextures : Texture[] = new Texture[6];

var circuitLock : Transform;

var _touchHandler : touchHandler;

//var circuitNames : String[] = ["Toasted Circuit", "Connected Circuit", "Offline Circuit", "Short Circuit", "Wired Circuit", "Shocking Circuit"];
//var circuitsLabel : TextMesh;
//var circuitState : TextMesh;

var circuitLabelLoc : UILocalize;
var circuitStateLoc : UILocalize;

var decrease : boolean = false;

function Awake()
{
		// set initial texture
	imageMaterial.mainTexture = circuitTextures[0];
	
		// hide the lock
	circuitLock.localPosition.y = -20000;

		// color circuit Name
	//circuitsLabel.renderer.material.color = Color(1,1,0,1);
	//handleCircuit();
	

}

function updateMap()
{

		// adjust the map image to the circuit starting level (numbers not 0 based as the DataTransfer active Level is 1 based)
	switch (DataTransfer.currentCircuit)
	{
		case 1:
					// set to electric
				DataTransfer.activeLevel = 3;
			break;
			
		case 2:
					// set to LA
				DataTransfer.activeLevel = 4;
			break;
			
		case 3:
					// set to china
				DataTransfer.activeLevel = 6;
			break;
			
		case 4:
					// set to white
				DataTransfer.activeLevel = 5;
			break;
			
		case 5:
					// set to LA
				DataTransfer.activeLevel = 2;
			break;
			
		case 6:
					// set to china
				DataTransfer.activeLevel = 6;
			break;
	}
}


function handleCircuit()
{
	
		// see if this circuit is locked (show lock)
	if (DataTransfer.circuitUnlocks >= DataTransfer.currentCircuit)
	{
		circuitLock.localPosition.y = -20000;
	}
	else
	{
		circuitLock.localPosition.y = 0;
		
		if (DataTransfer.currentCircuit == 6)
		{
			//circuitState.text = LanguageHandler.circuitState[0];
			circuitStateLoc.key = "circuitState0";
		}
		else
		{
			//circuitState.text = LanguageHandler.circuitState[1];
			circuitStateLoc.key = "circuitState1";
		}
	}

		// Change the text
	//circuitsLabel.text = LanguageHandler.circuitNames[DataTransfer.currentCircuit - 1];
	
	circuitLabelLoc.key = "circuitNames" + DataTransfer.currentCircuit.ToString();
		// trigger localize refresh
	NGUI_Handler.locUpdate = true;
	//Debug.Log ("circuitNext");
		

		// show correct image
	imageMaterial.mainTexture = circuitTextures[DataTransfer.currentCircuit-1];
	
		// update map image
	updateMap();
}


	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// get the current map
	var currCircuit : int = DataTransfer.currentCircuit;
	
		// set the next/prev map
	if (!decrease)
	{
		currCircuit++;
	}
	else
	{
		currCircuit--;
	}

	
		// check that we don't exceed max
	if (currCircuit > numCircuits)
	{
		currCircuit = 1;			// if we have already shown the last map, start from the beginning
	}
	else if (currCircuit < 1)
	{
		currCircuit = numCircuits;			// if we have already shown the last map, start from the beginning
	}
	
		// store the new mapindex
	DataTransfer.currentCircuit = currCircuit;
	
		// handle circuit function
	handleCircuit();
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}