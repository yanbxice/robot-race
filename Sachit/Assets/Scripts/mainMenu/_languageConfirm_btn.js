// Single Race Button handling

var _touchHandler : touchHandler;
var _textItem : _textPageHandler;


	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// store new language
	//DataTransfer.lang = _textItem.currPage;
	_touchHandler.setPrefs();
	
		// reload main menu
	Application.LoadLevel(0);
	
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}
