var _menuHandler : debugMenuStates;
var _botStore : storeBotHandler;
var _mapStore : storeMapHandler;
var _itemStore : storeItemHandler;

function execute () 
{
		// on going back reset selection
	_menuHandler.currBot = 0;
	_menuHandler.currSkin = 0;
	_menuHandler.currMap = 0;
	_menuHandler.currItem = 0;
	_botStore.hasChange = true;
	_mapStore.hasChange = true;
	_itemStore.hasChange = true;
}