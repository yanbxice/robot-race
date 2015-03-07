//
//	!!!	After pressing the play button, for now introduce a debug menu using unitys OnGui ...
//	!!! have a play button inside that script ...
//
//

var showdebug : boolean = false;
// Single Race Button handling

// var settingsHolder : settingsHolder;					// script of our settings holder
								// total number of maps

	// we need access to our touch handler in order to be able to load the Debug Menu ...
var touchHandlerScr : touchHandler;

	// randomize function. This function will actually Change the array we feed into it! Didn't know that.
function rndArray (arr : int[])
{
	for (var j = arr.Length - 1; j > 0; j--)
	{
		var r = Random.Range(0, j);
		var tmp = arr[j];
		arr[j] = arr[r];
		arr[r] = tmp;
	}
}

function over()
{
		// play over sound
	touchHandlerScr.isOverSound();
}

	// execute Button function
function execute () 
{
		// Reset the Table colorizer value
	DataTransfer.lastRacePos = 8;
	
		// play execute sound
	touchHandlerScr.isExecuteSound();
		
		// reset the circuit adjust! (this will be increased after each race to make the next circuit a bit harder)
	DataTransfer.circuitAdjust = 1.0;
		
		// bot system	DataTransfer.currentSkin	// send analytics
					Google.analytics.logEvent("stats", "quickRace", "startEasy");
	switch (DataTransfer.playerBot)
	{
		case 1:
					if (DataTransfer.currentSkin == 0)
					{
							// send analytics
						Google.analytics.logEvent("stats", "vektroid", "normal");
					}
					else if (DataTransfer.currentSkin == 1)
					{
							// send analytics
						Google.analytics.logEvent("stats", "vektroid", "skinA");
					}
					else if (DataTransfer.currentSkin == 2)
					{
							// send analytics
						Google.analytics.logEvent("stats", "vektroid", "skinB");
					}
					else if (DataTransfer.currentSkin == 3)
					{
							// send analytics
						Google.analytics.logEvent("stats", "vektroid", "skinC");
					}					 
			break;
		
		case 2:
					if (DataTransfer.currentSkin == 0)
					{
							// send analytics
						Google.analytics.logEvent("stats", "zipbot", "normal");
					}
					else if (DataTransfer.currentSkin == 1)
					{
							// send analytics
						Google.analytics.logEvent("stats", "zipbot", "skinA");
					}
					else if (DataTransfer.currentSkin == 2)
					{
							// send analytics
						Google.analytics.logEvent("stats", "zipbot", "skinB");
					}
					else if (DataTransfer.currentSkin == 3)
					{
							// send analytics
						Google.analytics.logEvent("stats", "zipbot", "skinC");
					}					 
			break;
			
		case 3:
					if (DataTransfer.currentSkin == 0)
					{
							// send analytics
						Google.analytics.logEvent("stats", "wrekker", "normal");
					}
					else if (DataTransfer.currentSkin == 1)
					{
							// send analytics
						Google.analytics.logEvent("stats", "wrekker", "skinA");
					}
					else if (DataTransfer.currentSkin == 2)
					{
							// send analytics
						Google.analytics.logEvent("stats", "wrekker", "skinB");
					}
					else if (DataTransfer.currentSkin == 3)
					{
							// send analytics
						Google.analytics.logEvent("stats", "wrekker", "skinC");
					}					 
			break;
			
		case 4:
					if (DataTransfer.currentSkin == 0)
					{
							// send analytics
						Google.analytics.logEvent("stats", "dabomb", "normal");
					}
					else if (DataTransfer.currentSkin == 1)
					{
							// send analytics
						Google.analytics.logEvent("stats", "dabomb", "skinA");
					}
					else if (DataTransfer.currentSkin == 2)
					{
							// send analytics
						Google.analytics.logEvent("stats", "dabomb", "skinB");
					}
					else if (DataTransfer.currentSkin == 3)
					{
							// send analytics
						Google.analytics.logEvent("stats", "dabomb", "skinC");
					}					 
			break;
			
		case 5:
					if (DataTransfer.currentSkin == 0)
					{
							// send analytics
						Google.analytics.logEvent("stats", "podbot", "normal");
					}
					else if (DataTransfer.currentSkin == 1)
					{
							// send analytics
						Google.analytics.logEvent("stats", "podbot", "skinA");
					}
					else if (DataTransfer.currentSkin == 2)
					{
							// send analytics
						Google.analytics.logEvent("stats", "podbot", "skinB");
					}
					else if (DataTransfer.currentSkin == 3)
					{
							// send analytics
						Google.analytics.logEvent("stats", "podbot", "skinC");
					}					 
			break;
			
		case 6:
					if (DataTransfer.currentSkin == 0)
					{
							// send analytics
						Google.analytics.logEvent("stats", "speedbot", "normal");
					}
					else if (DataTransfer.currentSkin == 1)
					{
							// send analytics
						Google.analytics.logEvent("stats", "speedbot", "skinA");
					}
					else if (DataTransfer.currentSkin == 2)
					{
							// send analytics
						Google.analytics.logEvent("stats", "speedbot", "skinB");
					}
					else if (DataTransfer.currentSkin == 3)
					{
							// send analytics
						Google.analytics.logEvent("stats", "speedbot", "skinC");
					}					 
			break;
			
		case 7:
					if (DataTransfer.currentSkin == 0)
					{
							// send analytics
						Google.analytics.logEvent("stats", "tribot", "normal");
					}
					else if (DataTransfer.currentSkin == 1)
					{
							// send analytics
						Google.analytics.logEvent("stats", "tribot", "skinA");
					}
					else if (DataTransfer.currentSkin == 2)
					{
							// send analytics
						Google.analytics.logEvent("stats", "tribot", "skinB");
					}
					else if (DataTransfer.currentSkin == 3)
					{
							// send analytics
						Google.analytics.logEvent("stats", "tribot", "skinC");
					}					 
			break;
	}
		
		
		
					// set player on first place
				DataTransfer.playerPosition = 1;
				
					// set the botCount									// test 5 bots!!!
				DataTransfer.botCount = 3;								// 4 bots total, as requested
				
					// set the map rotation
				DataTransfer.trackList[0] = 2;
				DataTransfer.trackList[1] = 0;							// back to menu
				
					// initialize on the first track
				DataTransfer.currentTrack = 0;

					// diff analytics
				if (DataTransfer.aiDiff == 0)
				{
						// send analytics
					Google.analytics.logEvent("stats", "quickRace", "startEasy");
				}
				else if (DataTransfer.aiDiff == 1)
				{
						// send analytics
					Google.analytics.logEvent("stats", "quickRace", "startMed");
				}
				if (DataTransfer.aiDiff == 2)
				{
						// send analytics
					Google.analytics.logEvent("stats", "quickRace", "startHard");
				}
				
					// map analytics
				if (DataTransfer.loadLevel == 1)
				{
						// send analytics
					Google.analytics.logEvent("stats", "quickRace", "weaponsFactory");
				}
				else if (DataTransfer.loadLevel == 2)
				{
						// send analytics
					Google.analytics.logEvent("stats", "quickRace", "lostAngeles");
				}
				else if (DataTransfer.loadLevel == 3)
				{
						// send analytics
					Google.analytics.logEvent("stats", "quickRace", "electricDowntown");
				}
				else if (DataTransfer.loadLevel == 4)
				{
						// send analytics
					Google.analytics.logEvent("stats", "quickRace", "bioDome");
				}
				else if (DataTransfer.loadLevel == 5)
				{
						// send analytics
					Google.analytics.logEvent("stats", "quickRace", "whiteCity");
				}
				else if (DataTransfer.loadLevel == 6)
				{
						// send analytics
					Google.analytics.logEvent("stats", "quickRace", "chinaTown");
				}
		


		// clear out all robotPositions slots... (Randomize bot selection !!!)
	for (var slot = 0; slot < 7; slot++)
	{	
			// fill with zeroes
		DataTransfer.robotPositions[slot] = 0;
	}


		//Sort our robots correctly before starting the level ...
		// Basically I count the botMesh index up
	var counter : int = 1;
	var trgtRank : int = 0;						// our rank counter to fill up the random filled slots with target ranks
	var initialArray : int[] = new int[7];
	initialArray = [1,2,3,4,5,6,7];
	
		// print ("Before: " + initialArray[0] + " " + initialArray[1] + " " + initialArray[2] + " " + initialArray[3] + " " + initialArray[4] + " " + initialArray[5] + " " + initialArray[6] + "!!!");		
		//randomize the array. If I wanted to also randomize the player position I'd have
		// to randomoze AFTER setting DataTransfer.robotPositions;
	rndArray(initialArray);
	
		// print ("After: " + initialArray[0] + " " + initialArray[1] + " " + initialArray[2] + " " + initialArray[3] + " " + initialArray[4] + " " + initialArray[5] + " " + initialArray[6] + "!!!");		

	for (var bot = 0; bot < (DataTransfer.botCount + 1); bot++)
	{
	
			// check if our counter is at our player bot
		//if(counter == DataTransfer.playerBot)
		if(initialArray[counter] == DataTransfer.playerBot)
		{
				// count bot types up. If we're at the player bot, skip it
			counter++;
		}
			// if we have our player .. set slot to 8
		if(bot == (DataTransfer.playerPosition - 1))
		{
			DataTransfer.robotPositions[bot] = 8;
		}
		else 
		{									// for now just fill up one after the other ...
			//DataTransfer.robotPositions[bot] = counter;
			
				// fill our botIndex to use
			DataTransfer.robotPositions[bot] = initialArray[counter];
			
				// fill our rankTarget array with the targetRank for the indexed bot
			DataTransfer.robotRankTarget[initialArray[counter] - 1] = trgtRank;
			trgtRank++;
			counter++;
		}
	}

/*
		// Store our settings in the DataTransfer for next level load
	DataTransfer.playerBot = settingsHolder.playerBot;
	DataTransfer.activeBot = settingsHolder.activeBot;
	DataTransfer.loadLevel = settingsHolder.loadLevel;
	DataTransfer.activeLevel = settingsHolder.activeLevel;
*/	

		// ON EXIT MENU SAVE STATS
	touchHandlerScr.setPrefs();
	touchHandlerScr.setUnlocks();

		// Set stuff like circuit, map rotation etc here ...
	if (showdebug)
	{
			// enable our debug menu ... (in touchHandler Script)
		touchHandlerScr.debugMenu = 7;
	}
	else
	{
			// load level
		Application.LoadLevel(DataTransfer.trackList[0]);
	}
	// Not needed with debug menu, for now

}