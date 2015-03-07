// Single Race Button handling

var inApp_Handler : InApp_RR;
var purchaseHandler : _appPurchaseHandler;

	// execute Button function
function execute () 
{
	purchaseHandler.sentRequest = false;
	inApp_Handler.purchaseFailCancel = false;
	inApp_Handler.purchaseSuccess = false;
}