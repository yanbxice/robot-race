// Single Race Button handling

var _touchHandler : touchHandler;
var _btnScript : UI_SlicedButton;
var btnLabel : TextMesh;
var btnLabelLoc :UILocalize;

private var isSelect : boolean = true;
private var isOver : boolean = false;
private var overTimer : float = 0.0;

	// execute Button function
function execute () 
{
		// check if the circuit is enabled
	if (DataTransfer.circuitUnlocks >= DataTransfer.currentCircuit)
	{
			// close debug menu
		_touchHandler.debugMenu = 70;
		
			// play execute sound
		_touchHandler.isExecuteSound();
	}
	else
	{
			// play deny sound
		_touchHandler.isDenySound();
	}
}

function over()
{
		// change if needed
	if (!isOver)
	{
			// check if the circuit is enabled
		if (DataTransfer.circuitUnlocks >= DataTransfer.currentCircuit)
		{
				// play over sound
			_touchHandler.isOverSound();
				
				// change button
			_btnScript.changeState(1);
		}
		else
		{
				// play deny sound
			_touchHandler.isDenySound();
			
				// change button
			_btnScript.changeState(2);
		}
		
	}
		// set over mode
	isOver = true;
	
		// set over timer
	overTimer = Time.time + 0.2;
}

function Update()
{
	if(isOver && (Time.time > overTimer))
	{
		_btnScript.changeState(0);
		isOver = false;
	}
	
		// handle the button text
	if (DataTransfer.circuitUnlocks >= DataTransfer.currentCircuit)
	{
			// text is Select
		if (!isSelect)
		{
			isSelect = true;
			
			//btnLabel.text = LanguageHandler.buttonText[4];
			btnLabelLoc.key = "select";
		}
	}
	else
	{
			// text is Locked
		if (isSelect)
		{
			isSelect = false;
			
			//btnLabel.text = LanguageHandler.buttonText[47];
			btnLabelLoc.key = "locked";
		}
	}
}