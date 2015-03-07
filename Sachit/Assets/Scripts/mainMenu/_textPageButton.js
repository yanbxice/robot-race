// Single Race Button handling

var _touchHandler : touchHandler;
var _textItem : _textPageHandler;
var step : int = 1;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// increase count
	DataTransfer.currPage = Mathf.Repeat( (DataTransfer.currPage + step), _textItem.numPages);
	
		// trigger localize refresh
	NGUI_Handler.locUpdate = true;
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}
