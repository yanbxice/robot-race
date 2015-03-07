// Single Race Button handling

var _touchHandler : touchHandler;
var _botHandler : _botSelectHandler;
var _menuHandler : debugMenuStates;
var priceLabel : UILabel;

var purchaseType : int = 2;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// if we have enough money to buy our item show confirmation button (Maps or Bot arrays are 0 based. The menu entries are 1 based)
	if (DataTransfer.credits >= DataTransfer.trackPrice[DataTransfer.activeLevel - 1])
	{
			// show the confirmation dialog
		_menuHandler.botConfirm = true;
		_menuHandler.stateChange = true;
		_menuHandler.purchaseType = purchaseType;
	}
	else
	{
			// show the purchase menu
		_menuHandler.botPurchase = true;
		_menuHandler.stateChange = true;
		_menuHandler.purchaseType = 0;
	}
		
}

function over()
{
		// play over sound
	_touchHandler.isOverSound();
}

function Update()
{
	priceLabel.text = "for " + DataTransfer.trackPrice[DataTransfer.activeLevel - 1];
}