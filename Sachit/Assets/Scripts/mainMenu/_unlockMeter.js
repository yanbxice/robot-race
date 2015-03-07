// // name text color
	//botName.renderer.material.color = Color(1,1,0,1);
	
var txt_Levels : TextMesh;
var txt_Items : TextMesh;
var txt_Robots : TextMesh;
var txt_Skins : TextMesh;

var numLevels : int = 6;
var numItems : int = 9;
var numBots : int = 7;
var numSkins : int = 21;
var skinState : int[] = new int[7];

var levelValues : HUD_SingleButton[] = new HUD_SingleButton[10];
var itemValues : HUD_SingleButton[] = new HUD_SingleButton[10];
var robotValues : HUD_SingleButton[] = new HUD_SingleButton[10];
var skinValues : HUD_SingleButton[] = new HUD_SingleButton[10];

function checkUnlocks () 
{
	var calcValue : float = 0.0;
	var calcAll : float = 0.0;
	var calcResult : float = 0.0;
	
	var levelValue : int = 0;
	var itemValue : int = 0;
	var robotValue : int = 0;
	var skinValue : int = 0;
	
// ######
	
		// first check the Level unlocks
	var initValue = 0;
	for (var level = 0; level < numLevels; level++)
	{
		if (DataTransfer.trackUnlocks[level])
		{
			initValue++;
		}
	}
	
		// calc our ration with floats
	// calcValue = initValue;
	// calcAll = numLevels;
	// calcResult = calcValue / calcAll;
	
		// store our percentage in 0 to 10 values ..
	levelValue = initValue;

// ######
	
		// next check the Item unlocks
	initValue = 0;
	for (var item = 0; item < numItems; item++)
	{
		if (DataTransfer.pickupUnlocks[item])
		{
			initValue++;
		}
	}
	
		// calc our ration with floats
	//calcValue = initValue;
	//calcAll = numItems;
	//calcResult = calcValue / calcAll;
	
		// store our percentage in 0 to 10 values ..
	//itemValue = calcResult * 10;
	itemValue = initValue;
	
// ######	
	
		// next check the Robot unlocks
	initValue = 0;
	for (var bot = 0; bot < numBots; bot++)
	{
		if (DataTransfer.botUnlocks[bot])
		{
			initValue++;
		}
	}
		
		// calc our ration with floats
	//calcValue = initValue;
	//calcAll = numBots;
	//calcResult = calcValue / calcAll;
	
		// store our percentage in 0 to 10 values ..
	robotValue = initValue;
	
// ######	
	
		// next check the Skin unlocks
	initValue = 0;
	for (var skin = 0; skin < numBots; skin++)
	{
		skinState[skin] = 0;
		
		if (DataTransfer.skinA[skin])
		{
			skinState[skin]++;
		}
		if (DataTransfer.skinB[skin])
		{
			skinState[skin]++;
		}
		if (DataTransfer.skinC[skin])
		{
			skinState[skin]++;
		}
	}
		
		// calc our ration with floats
	//calcValue = initValue;
	//calcAll = numSkins;
	//calcResult = calcValue / calcAll;
	/*
	calcValue = initValue;
	calcAll = 3.0;
	calcResult = calcValue / calcAll;
	*/
	
		// store our percentage in 0 to 10 values ..
	//skinValue = calcResult;
		
//	######
	
	
		//
		// in the end set all our boxes values
	for (var levelBox = 0; levelBox < 6; levelBox++)
	{
			// level Boxes
		if (levelValue > levelBox)
		{
			levelValues[levelBox].changeState(1);
		}
		else
		{
			levelValues[levelBox].changeState(0);
		}
	}
	for (var itemBox = 0; itemBox < 9; itemBox++)
	{
			// item Boxes
		if (itemValue > itemBox)
		{
			itemValues[itemBox].changeState(1);
		}
		else
		{
			itemValues[itemBox].changeState(0);
		}
	}
	for (var robotBox = 0; robotBox < 7; robotBox++)
	{
			// robot Boxes
		if (robotValue > robotBox)
		{
			robotValues[robotBox].changeState(1);
		}
		else
		{
			robotValues[robotBox].changeState(0);
		}
	}
	for (var skinBox = 0; skinBox < 7; skinBox++)
	{

			// skin Boxes
		if (skinState[skinBox] == 0)
		{
			skinValues[skinBox].changeState(0);
		}
		else if (skinState[skinBox] == 1)
		{
			skinValues[skinBox].changeState(3);
		}
		else if (skinState[skinBox] == 2)
		{
			skinValues[skinBox].changeState(2);
		}
		else if (skinState[skinBox] == 3)
		{
			skinValues[skinBox].changeState(1);
		}

	}

}


function Start()
{
	//txt_Levels.text = LanguageHandler.levels;
	//txt_Items.text = LanguageHandler.items;
	//txt_Robots.text = LanguageHandler.robots;
	//txt_Skins.text = LanguageHandler.skins;


	checkUnlocks();
}