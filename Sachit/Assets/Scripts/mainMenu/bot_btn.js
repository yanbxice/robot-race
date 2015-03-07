// Single Race Button handling

var settingsHolder : settingsHolder;				// script of our settings holder
var botIndex : int = 1;								// robot index


	// execute Button function
function execute () 
{
		// Change active bot
	if (DataTransfer.botUnlocks[botIndex - 1])
	{
		DataTransfer.activeBot = botIndex;
	}

}