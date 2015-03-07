
	// get access to all bot transforms
var allConstructs : Transform[] = new Transform[7];

	// get access to all bot GOs
var allGOs : GameObject[] = new GameObject[7];

	// get access to the select position of all bots
var allPositions : Transform[] = new Transform[7];

var botName : UILocalize;

	// the card positions
//var allCards : Transform[] = new Transform[7];

	// the button objects
//var allButtons : Transform[] = new Transform[7];

	// the bots materials
var opaqueMaterials : Material[] = new Material[7];
var botMaterials : Material[] = new Material[7];
var loadMaterials : Material[] = new Material[7];
var darkMaterial : Material;

	// the skin textures ...
var skinA : Texture[] = new Texture[7];
var skinB : Texture[] = new Texture[7];
var skinC : Texture[] = new Texture[7];
var skinDef : Texture[] = new Texture[7];

var skinA_bot : Transform[] = new Transform[7];
var skinB_bot : Transform[] = new Transform[7];
var skinC_bot : Transform[] = new Transform[7];
var skinA_garage : Transform;
var skinB_garage : Transform;
var skinC_garage : Transform;

var skinA_rot : Transform;
var skinB_rot : Transform;
var skinC_rot : Transform;
var skinButtonPos : Transform;


	// get the feature position
var botFeature : Transform;

var settingsHolder : settingsHolder;					// script of our settings holder

var featuredBot : int = 8;								// the currently stored featured bot (init as 8)

var _touchHandler : touchHandler;
var rotator : Transform;
var turntable : Transform;

var shine_pos : Transform;
var shine_geo : Transform;

var currentRot : float = 0.0;
var minRot : float = 0.0;
var maxRot : float = 90.0;

	// the stats window entries
// var botName : TextMesh;
// var nameList : String[] = ["VECTOR", "iROBOT", "TRUK", "STEAMBALL", "PODBOT", "MONOBOT", "TRIBOT"];
var selectBtn : Transform;
var buyBtn : Transform;
var skinBuyBtn : Transform;

var bot_lock : Transform;
var skinA_lock : Transform;
var skinB_lock : Transform;
var skinC_lock : Transform;

var statsAnim : Transform;
var statsRoot : Transform;
var menuBots_pos : Transform;

var updateSkinBtns : boolean[] = [false, false, false];

private var speedStats : int[] = [7,5,6,4,4,6,5];
private var accStats : int[] = [6,6,7,7,6,5,5];
private var juiceStats : int[] = [2,5,2,5,6,6,7];

var statsRowA : HUD_SingleButton[] = new HUD_SingleButton[7];
var statsRowB : HUD_SingleButton[] = new HUD_SingleButton[7];
var statsRowC : HUD_SingleButton[] = new HUD_SingleButton[7];

private var lazy : float = 10.0;
private var swipeMoving : boolean = false;
var lastTurn : float = 0.0;
private var xSpeed : float = 0.0;
private var swipeRange : float;
private var singleStep : float;
private var halfStep : float;
private var isUpdating : boolean = true;				// are we updating the bots currently

	// always store the last active bot and whether the last selected skin was locked. If so, on bot change set last bots active skin to 0
private var lastActive : int = 1;
private var lastSkinLocked : boolean = false;
private var menuActive : boolean = false;

var offsetMultiplier : float = 1.0;
var offset : float = 0.0;
var offsetTrn : Transform;

private var lastBot : int;

	// the price of the last selected item
//var activePrice : float = 0.0;



function checkUnlocks()
{
	for (var i = 0; i < 7; i++)
	{
		if (!DataTransfer.botUnlocks[i])
		{
			allGOs[i].GetComponentInChildren(Renderer).material = darkMaterial;
		}
		else
		{
			allGOs[i].GetComponentInChildren(Renderer).material = botMaterials[i];
		}
		
			// override material color for featured bot
		if (i == (DataTransfer.activeBot - 1))
		{
			allGOs[i].GetComponentInChildren(Renderer).material = loadMaterials[i];
			//allGOs[i].GetComponentInChildren(Renderer).material = opaqueMaterials[i];
		}
	}
	
}


function updateStats()
{
		// Display the correct bot name
	//botName.text = LanguageHandler.botNames[DataTransfer.activeBot - 1];	
		// trigger localize refresh
	//NGUI_Handler.locUpdate = true;
	//Debug.Log ("botSelect");
	
		// update bot stats
	for (var stat = 0; stat < 7; stat++)
	{
			// speed stats
		if (speedStats[DataTransfer.activeBot - 1] <= stat)
		{
			statsRowA[stat].changeState(0);
		}
		else 
		{
			statsRowA[stat].changeState(1);
		}
		
			// acc stats
		if (accStats[DataTransfer.activeBot - 1] <= stat)
		{
			statsRowB[stat].changeState(0);
		}
		else 
		{
			statsRowB[stat].changeState(1);
		}
			
			// handling stats
		if (juiceStats[DataTransfer.activeBot - 1] <= stat)
		{
			statsRowC[stat].changeState(0);
		}
		else 
		{
			statsRowC[stat].changeState(1);
		}
		
			// DEFAULT TEXTURE
			// for now return all textures to stdTexture, then, below set active skin
		opaqueMaterials[stat].mainTexture = skinDef[stat];
			
			// adjust loading screen material
		loadMaterials[stat].mainTexture = skinDef[stat];
		
	}
	
		// Update the play button if necessary
		// handle currently selected bot being locked...
	if (!DataTransfer.botUnlocks[DataTransfer.activeBot - 1])
	{
		buyBtn.localPosition = Vector3(0,0,0);
		selectBtn.localPosition = Vector3(0,200,0);
		skinBuyBtn.localPosition = Vector3(0,200,0);
		
			// set a price for now
		//activePrice = 1000.0;
		
			// show lock
		bot_lock.localPosition = Vector3(0,0,0);
		
			// hide skin buttons
		skinButtonPos.localPosition = Vector3(0,2000,0);
		
	}
	else
	{
		buyBtn.localPosition = Vector3(0,200,0);
		selectBtn.localPosition = Vector3(0,0,0);
		skinBuyBtn.localPosition = Vector3(0,200,0);
		
			// set a price for now
		//activePrice = 0.0;
		
			// hide lock
		bot_lock.localPosition = Vector3(0,-50000,0);
		
			// show Skin buttons
		skinButtonPos.localPosition = Vector3(0,0,0);
	}
	
		// move skin bots in place
	for (var skinBtn = 0; skinBtn < 7; skinBtn++)
	{
		if (skinBtn == (DataTransfer.activeBot - 1) )
		{
			skinA_bot[skinBtn].parent = skinA_rot;
			skinA_bot[skinBtn].localPosition = Vector3(0,0,0);
			skinA_bot[skinBtn].localEulerAngles = Vector3(0,0,0);
			skinA_bot[skinBtn].localScale = Vector3(1,1,1);
			
			skinB_bot[skinBtn].parent = skinB_rot;
			skinB_bot[skinBtn].localPosition = Vector3(0,0,0);
			skinB_bot[skinBtn].localEulerAngles = Vector3(0,0,0);
			skinB_bot[skinBtn].localScale = Vector3(1,1,1);
			
			skinC_bot[skinBtn].parent = skinC_rot;
			skinC_bot[skinBtn].localPosition = Vector3(0,0,0);
			skinC_bot[skinBtn].localEulerAngles = Vector3(0,0,0);
			skinC_bot[skinBtn].localScale = Vector3(1,1,1);
		}
		else
		{
			skinA_bot[skinBtn].parent = skinA_garage;
			skinA_bot[skinBtn].localPosition = Vector3(0,0,0);
			skinA_bot[skinBtn].localEulerAngles = Vector3(0,0,0);
			
			skinB_bot[skinBtn].parent = skinB_garage;
			skinB_bot[skinBtn].localPosition = Vector3(0,0,0);
			skinB_bot[skinBtn].localEulerAngles = Vector3(0,0,0);
			
			skinC_bot[skinBtn].parent = skinC_garage;
			skinC_bot[skinBtn].localPosition = Vector3(0,0,0);
			skinC_bot[skinBtn].localEulerAngles = Vector3(0,0,0);
		}
	}
	
		// SKIN LOCK ICON
		// show skin locks
	if (!DataTransfer.skinA[DataTransfer.activeBot - 1])
	{
		skinA_lock.localPosition = Vector3(0,0,0);
	}
	else
	{
		skinA_lock.localPosition = Vector3(0,-2000,0);
	}
	
	if (!DataTransfer.skinB[DataTransfer.activeBot - 1])
	{
		skinB_lock.localPosition = Vector3(0,0,0);
	}
	else
	{
		skinB_lock.localPosition = Vector3(0,-2000,0);
	}
	
	if (!DataTransfer.skinC[DataTransfer.activeBot - 1])
	{
		skinC_lock.localPosition = Vector3(0,0,0);
	}
	else
	{
		skinC_lock.localPosition = Vector3(0,-2000,0);
	}
	
		// set the selected skin for the current bot
		// check if the button is skin A, B or C
	if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] == 1)
	{
			// change skin for current bot
		opaqueMaterials[(DataTransfer.activeBot - 1)].mainTexture = skinA[(DataTransfer.activeBot - 1)];
		
			// adjust loading screen material
		loadMaterials[(DataTransfer.activeBot - 1)].mainTexture = skinA[(DataTransfer.activeBot - 1)];
		
			// check if the skin needs to be bought
		if (!DataTransfer.skinA[DataTransfer.activeBot - 1])
		{
			buyBtn.localPosition = Vector3(0,200,0);
			selectBtn.localPosition = Vector3(0,200,0);
			skinBuyBtn.localPosition = Vector3(0,0,0);
			lastSkinLocked = true;
		}
		else 
		{
			lastSkinLocked = false;
		}
	}
	else if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] == 2)
	{
			// change skin for current bot
		opaqueMaterials[(DataTransfer.activeBot - 1)].mainTexture = skinB[(DataTransfer.activeBot - 1)];
			
			// adjust loading screen material
		loadMaterials[(DataTransfer.activeBot - 1)].mainTexture = skinB[(DataTransfer.activeBot - 1)];
			
			// check if the skin needs to be bought
		if (!DataTransfer.skinB[DataTransfer.activeBot - 1])
		{
			buyBtn.localPosition = Vector3(0,200,0);
			selectBtn.localPosition = Vector3(0,200,0);
			skinBuyBtn.localPosition = Vector3(0,0,0);
			lastSkinLocked = true;
		}
		else 
		{
			lastSkinLocked = false;
		}
	}
	else if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] == 3)
	{
			// change skin for current bot
		opaqueMaterials[(DataTransfer.activeBot - 1)].mainTexture = skinC[(DataTransfer.activeBot - 1)];
		
			// adjust loading screen material
		loadMaterials[(DataTransfer.activeBot - 1)].mainTexture = skinC[(DataTransfer.activeBot - 1)];
		
			// check if the skin needs to be bought
		if (!DataTransfer.skinC[DataTransfer.activeBot - 1])
		{
			buyBtn.localPosition = Vector3(0,200,0);
			selectBtn.localPosition = Vector3(0,200,0);
			skinBuyBtn.localPosition = Vector3(0,0,0);
			lastSkinLocked = true;
		}
		else 
		{
			lastSkinLocked = false;
		}
	}

		// make sure our skin buttons update
	updateSkinBtns = [true, true, true];
	
}


function initMenuItems()
{
		// this function will move all important items to their places after being seen by the cam
	
		// the stats frame
	statsRoot.parent = statsAnim;
	statsRoot.localPosition = Vector3(0,0,0);
	statsRoot.localScale = Vector3(1,1,1);
	statsRoot.localEulerAngles = Vector3(0,0,0);
	
		// the stat skin bots
	menuBots_pos.localPosition = Vector3(0,0,0);
}


function placeBot()
{	
	for(var bot = 0; bot < 7; bot++)
	{
			// handle selected bot
		// if(bot == (settingsHolder.activeBot - 1))
		if(bot == (DataTransfer.activeBot - 1))
		{
				// place bot correctly
			allConstructs[bot].parent = botFeature;
			allConstructs[bot].position = botFeature.position;
			allConstructs[bot].rotation = botFeature.rotation;
			allConstructs[bot].localScale = Vector3(0.12, 0.12, 0.12);
			
				// First do the CheckUnlocks so that locked bots are red ...
			checkUnlocks();
			
				// override material color for featured bot
			//allGOs[bot].GetComponentInChildren(Renderer).material = opaqueMaterials[bot];
	
				//	UPDATE STATS DISPLAY
			updateStats();
		}
			// handle the rest
		else
		{
				// place bot correctly
			allConstructs[bot].parent = allPositions[bot];
			allConstructs[bot].position = allPositions[bot].position;
			allConstructs[bot].rotation = allPositions[bot].rotation;
			allConstructs[bot].localScale = Vector3(0.04, 0.04, 0.04);
		}
	}
}
		
		
function Start()
{
	
		// name text color
	// botName.renderer.material.color = Color(1,1,0,1);
	
		// parent turntable to rotator
	turntable.parent = rotator;
	turntable.localEulerAngles = Vector3(0, 0, 0);
	
	shine_geo.parent = shine_pos;
	shine_geo.localEulerAngles = Vector3(0, 0, 0);
	shine_geo.localPosition = Vector3(0, 0, 0);
	shine_geo.localScale = Vector3(1, 1, 1);
	
		// get some needed stuff
		// snap to angle increments for bots (include overshoot and unlocks)
	swipeRange = maxRot - minRot;
	singleStep = (swipeRange / 8.0);						// 1 to 7 are botPositions, 0 and 8 are softZones
	halfStep = singleStep / 2.0;
	
		// set correct bot and rotation initially!!!
	currentRot = (DataTransfer.activeBot * singleStep);
	rotator.localEulerAngles.y = currentRot;
	offsetTrn.localEulerAngles.y = offset;
	lastTurn = rotator.localEulerAngles.y;
	swipeMoving = true;									// run initially
	isUpdating = true;
	
		// check stuff on start
	updateStats();
	checkUnlocks();
	Invoke("placeBot", 0.18);
	Invoke("initMenuItems", 0.17);
	
		// set currently active bot
	lastActive = DataTransfer.activeBot;
}

function Update () 
{

		// check if this menu is active
	if (_touchHandler.debugMenu == 70)
	{
			// set menu active
		menuActive = true;
	
		// if(settingsHolder.activeBot != featuredBot)
		//if(DataTransfer.activeBot != featuredBot)
		//{
		// update stuff ONLY if something is in motion
		if (isUpdating)
		{
				// disable ineach loop
			isUpdating = false;
				//print ("updating");
			
				// Handle switching via position!! (single step is the segment the bot is active for, half step bases that on the center of that segment)
			if (currentRot < (singleStep + halfStep))
			{
				DataTransfer.activeBot = 1;
				NGUI_Handler.activeBot = 1;
			}
			else if (currentRot < ( (singleStep * 2) + halfStep))
			{
				DataTransfer.activeBot = 2;
				NGUI_Handler.activeBot = 2;
			}
			else if (currentRot < ( (singleStep * 3) + halfStep))
			{
				DataTransfer.activeBot = 3;
				NGUI_Handler.activeBot = 3;
			} 
			else if (currentRot < ( (singleStep * 4) + halfStep))
			{
				DataTransfer.activeBot = 4;
				NGUI_Handler.activeBot = 4;
			}
			else if (currentRot < ( (singleStep * 5) + halfStep))
			{
				DataTransfer.activeBot = 5;
				NGUI_Handler.activeBot = 5;
			}
			else if (currentRot < ( (singleStep * 6) + halfStep))
			{
				DataTransfer.activeBot = 6;
				NGUI_Handler.activeBot = 6;
			}
			else if (currentRot < ( (singleStep * 7) + halfStep))
			{
				DataTransfer.activeBot = 7;
				NGUI_Handler.activeBot = 7;
			} 
			
				// if we have just changed our bot
			if (lastActive != DataTransfer.activeBot)
			{
					// trigger localize refresh
				// NGUI_Handler.locUpdate = true;
				botName.Localize();
			
					//Check if our last selected skin was locked ..
				if (lastSkinLocked)
				{
					DataTransfer.currentSkin[(lastActive - 1)] = 0;
				}
			}
			
				// update last selected bot holder with current bot
			lastActive = DataTransfer.activeBot;
		
			//DataTransfer.playerBot = DataTransfer.activeBot;
		
				// Place our featured bot correctly
			placeBot();
			
			// DEBUG
			//print ("Is Updating");
			
		}	// END isUpdating check
	
				// handle rotations
		if (_touchHandler.hasSwipe)
		{
				// get our drag dependant rotate target
			currentRot = Mathf.Clamp( (lastTurn + (_touchHandler.swipeValues.x * swipeRange) ), minRot, maxRot );
			//currentRot = Mathf.Clamp( (lastTurn + (_touchHandler.swipeValues.x * maxRot) ), minRot, maxRot );
	
				// do the rotation
			rotator.localEulerAngles.y = Mathf.SmoothDamp(rotator.localEulerAngles.y, currentRot, xSpeed, lazy * Time.deltaTime );
			swipeMoving = true;
			isUpdating = true;
			
			// DEBUG
			//print ("Has Swipe");
		}
			// if we had a dragging action AND it has stopped (else statement) rotate stuff into position (as long as set to swipeMoving)
		else if (swipeMoving)
		{					
				// set is updating to true
			isUpdating = true;
					
				// end handling first and snapping into position
			if (currentRot > ((singleStep * 7)))
			{
				currentRot = ((singleStep * 7));
			}
			else if (currentRot < (singleStep))
			{
				currentRot = singleStep;
			}
			else
			{
					// snap to clean increments
				currentRot = (singleStep * DataTransfer.activeBot);
			}
				// check if we are finished
			if (Mathf.Abs(currentRot - rotator.localEulerAngles.y) < 0.25)
			{
				swipeMoving = false;
				isUpdating = false;
			}
				// rotate stuff
			rotator.localEulerAngles.y = Mathf.SmoothDamp(rotator.localEulerAngles.y, currentRot, xSpeed, lazy * Time.deltaTime );
			
				// store current position in last Turn (as it is only used while dragging, not in overshoot)
			lastTurn = rotator.localEulerAngles.y;
				
				// DEBUG
			//print ("Swipe Moving");
		}
		
			// rotate the bot skin images
		skinA_rot.Rotate(Vector3(0, (-1.4), 0) );
		skinA_rot.localScale = Vector3(1,1,1);
		skinB_rot.Rotate(Vector3(0, (-1.5), 0) );
		skinB_rot.localScale = Vector3(1,1,1);
		skinC_rot.Rotate(Vector3(0, (-1.3), 0) );
		skinC_rot.localScale = Vector3(1,1,1);
	
	}	// end menu active check
		// basically one cycle after changing menu, deactivate locked skins
	else if (menuActive)
	{
			//Check if our last selected skin was locked ..
		if (lastSkinLocked)
		{
			DataTransfer.currentSkin[(lastActive - 1)] = 0;
		}
		menuActive = false;
	}
}