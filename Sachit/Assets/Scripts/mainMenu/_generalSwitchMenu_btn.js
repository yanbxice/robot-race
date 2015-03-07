// Single Race Button handling

var _touchHandler : touchHandler;
var goToMenu : int = 0;
var isAtm : boolean = false;
var storePrefs : boolean = false;
var storeLastMenu : boolean = false;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// if we have an atm screen, set it
	if (isAtm)
	{
		_touchHandler.atmActive = true;
	}
		
	if (storePrefs)
	{
		_touchHandler.setPrefs();
	}
	
	if (storeLastMenu)
	{
			// store last menu!!
		_touchHandler.lastMenu = _touchHandler.debugMenu;
	}
	
		// go to badge menu
	_touchHandler.debugMenu = goToMenu;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}