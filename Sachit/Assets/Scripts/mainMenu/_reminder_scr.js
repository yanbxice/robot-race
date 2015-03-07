#pragma strict

// this script is only run once! Only when we enter the menu! So it is run from debugMenu 9!!

var _touchHandler : touchHandler;
var menuStates : debugMenuStates;
var storeButtonGlow : GameObject;

// debugMenu

function Start () {


	var botAvail : boolean = false;
	var skinAvail : boolean = false;
	var mapAvail : boolean = false;
	var itemAvail : boolean = false;
	
	for (var bot = 0; bot < 7; bot++)
	{
		if ( (DataTransfer.credits >= DataTransfer.botPrice[bot]) && !DataTransfer.botUnlocks[bot] )
		{
			botAvail = true;
			
		}
	}
	
	for (var skin = 0; skin < 7; skin++)
	{
		if ( (DataTransfer.credits >= DataTransfer.skinPrice[1]) && !DataTransfer.skinA[skin] )
		{
			skinAvail = true;
		}
		if ( (DataTransfer.credits >= DataTransfer.skinPrice[2]) && !DataTransfer.skinB[skin] )
		{
			skinAvail = true;
		}
		if ( (DataTransfer.credits >= DataTransfer.skinPrice[3]) && !DataTransfer.skinC[skin] )
		{
			skinAvail = true;
		}

	}
	
	for (var map = 0; map < 8; map++)
	{
		if ( (DataTransfer.credits >= DataTransfer.trackPrice[map]) && (DataTransfer.trackUnlocks[map] == 0) )
		{
			mapAvail = true;
		}
	}
	
	for (var item = 0; item < 9; item++)
	{
		if ( (DataTransfer.credits >= DataTransfer.itemPrice[item]) && !DataTransfer.pickupUnlocks[item] )
		{
			itemAvail = true;
		}
	}
	
	if (itemAvail || mapAvail || skinAvail || botAvail)
	{
		if(storeButtonGlow != null)
			storeButtonGlow.active = true;
			// only pop up 30 percent of the time
		if ( (Random.value < 0.3) && (menuStates.initLangOn == false) )
		{
			_touchHandler.debugMenu = 27;
			menuStates.reminderOn = true;
		}
	}
	
	

}

function Update ()
{
var botAvail : boolean = false;
	var skinAvail : boolean = false;
	var mapAvail : boolean = false;
	var itemAvail : boolean = false;
	
	for (var bot = 0; bot < 7; bot++)
	{
		if ( (DataTransfer.credits >= DataTransfer.botPrice[bot]) && !DataTransfer.botUnlocks[bot] )
		{
			botAvail = true;
			
		}
	}
	
	for (var skin = 0; skin < 7; skin++)
	{
		if ( (DataTransfer.credits >= DataTransfer.skinPrice[1]) && !DataTransfer.skinA[skin] )
		{
			skinAvail = true;
		}
		if ( (DataTransfer.credits >= DataTransfer.skinPrice[2]) && !DataTransfer.skinB[skin] )
		{
			skinAvail = true;
		}
		if ( (DataTransfer.credits >= DataTransfer.skinPrice[3]) && !DataTransfer.skinC[skin] )
		{
			skinAvail = true;
		}

	}
	
	for (var map = 0; map < 8; map++)
	{
		if ( (DataTransfer.credits >= DataTransfer.trackPrice[map]) && (DataTransfer.trackUnlocks[map] == 0) )
		{
			mapAvail = true;
		}
	}
	
	for (var item = 0; item < 9; item++)
	{
		if ( (DataTransfer.credits >= DataTransfer.itemPrice[item]) && !DataTransfer.pickupUnlocks[item] )
		{
			itemAvail = true;
		}
	}
	
	if (itemAvail || mapAvail || skinAvail || botAvail)
	{
		if(storeButtonGlow != null)
			storeButtonGlow.active = true;
	}
	else
	{
		if(storeButtonGlow != null)
			storeButtonGlow.active = false;
	}
}