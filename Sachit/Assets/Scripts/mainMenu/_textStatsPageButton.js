// Single Race Button handling

var _touchHandler : touchHandler;
var _textItem : _textStatsHandler;
var step : int = 1;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// increase count
	//_textItem.currPage = Mathf.Repeat( (_textItem.currPage + step), _textItem.numPages);
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
