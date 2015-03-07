// Single Race Button handling

var _touchHandler : touchHandler;
var _menuHandler : debugMenuStates;
var _storeBotHandler : storeBotHandler;
var step : int = 1;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// increase count
	_menuHandler.currBot = Mathf.Repeat( (_menuHandler.currBot + step), _storeBotHandler.numBots);
	

		// if we have already unlocked all bots
	if (_menuHandler.currBot == 7)
	{
		var assumeTrue : boolean = true;
	
		for (var j = 0; j < 7; j++)
		{
			if (!DataTransfer.botUnlocks[j])
			{
				assumeTrue = false;
			}
		}
		
		if (assumeTrue)
		{
				//once more as this screen is hidden now
			_menuHandler.currBot = Mathf.Repeat( (_menuHandler.currBot + step), _storeBotHandler.numBots);
		}
	}

		// flag change
	_storeBotHandler.hasChange = true;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}