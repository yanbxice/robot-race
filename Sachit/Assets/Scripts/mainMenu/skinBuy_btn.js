// Single Race Button handling

var _touchHandler : touchHandler;
var _botHandler : _botSelectHandler;
var _menuHandler : debugMenuStates;

var purchaseType : int = 3;

public var priceLabel : UILabel;

	// execute Button function
function execute () 
{
		// play execute sound
	_touchHandler.isExecuteSound();

		// if we have enough money to buy our item show confirmation button
	if (DataTransfer.credits >= DataTransfer.skinPrice[DataTransfer.currentSkin[(DataTransfer.activeBot - 1)]])
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
	priceLabel.text = "for " + DataTransfer.skinPrice[DataTransfer.currentSkin[(DataTransfer.activeBot - 1)]];
}