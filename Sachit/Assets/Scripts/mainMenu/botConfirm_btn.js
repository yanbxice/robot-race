// Single Race Button handling

var _touchHandler : touchHandler;
var _botHandler : _botSelectHandler;
var _menuHandler : debugMenuStates;
var _storeBotHandler : storeBotHandler;
var _storeMapHandler : storeMapHandler;
var _storeItemHandler : storeItemHandler;

var appPurchaseHandler : _appPurchaseHandler;

var map_btn_select : Transform;
var map_btn_buy : Transform;
var map_icon_lock : Transform;

var isAtm : boolean = false;

	// execute Button function
function execute () 
{

	if (isAtm)
	{
	Debug.Log("IsAtm Called");
			// BUY CRYSTALS
		if (_touchHandler.purchaseSum > 0)
		{
			Debug.Log("App Purchase Called");
				// start the purchase then go to confirm screen
			appPurchaseHandler.startPurchase();
		}
		
			// all bot purchase
		else if (_menuHandler.buyAllBots)
		{
				// pay all bots bot ...
			DataTransfer.credits -= DataTransfer.allBots;
						
				// unlock Bot
			for (var allBots = 0; allBots < 7; allBots++)
			{
				DataTransfer.botUnlocks[allBots] = true;
			}			
			
			//Post unlock to Game Center
			#if UNITY_IPHONE
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach7",100.0);
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach11",100.0);
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach15",100.0);
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach19",100.0);
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach23",100.0);
			#endif	
				// store prefs
			_touchHandler.setUnlocks();
			
				// reset flag
			_menuHandler.buyAllBots = false;
			
				// reset bots
			_menuHandler.currBot = 0;
			_menuHandler.currSkin = 0;
			
				// flag change
			_storeBotHandler.hasChange = true;
		}
			// bot purchase
		else if (_menuHandler.buyBot)
		{
				// pay all bots bot ...
			DataTransfer.credits -= DataTransfer.botPrice[_menuHandler.currBot];
						
				// unlock Bot
			DataTransfer.botUnlocks[_menuHandler.currBot] = true;
			
				// send analytics
			if (_menuHandler.currBot == 0)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "vektroid");
			}
			else if (_menuHandler.currBot == 1)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "zipbot");
			}
			else if (_menuHandler.currBot == 2)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "wrekker");
				#if UNITY_IPHONE
				//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach7",100.0);
				#endif
			}
			else if (_menuHandler.currBot == 3)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "dabomb");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach15",100.0);
				#endif
			}
			else if (_menuHandler.currBot == 4)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "podbot");
				
				//Post unlock to Game Center
				#if UNITY_IPHONE
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach11",100.0);
				#endif
			}
			else if (_menuHandler.currBot == 5)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "speedbot");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach19",100.0);
				#endif
			}
			else if (_menuHandler.currBot == 6)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "tribot");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach23",100.0);
				#endif
			}

				// store prefs
			_touchHandler.setUnlocks();
			
				// reset flag
			_menuHandler.buyBot = false;
			
				// flag change
			_storeBotHandler.hasChange = true;
		}
			// skinA purchase
		else if (_menuHandler.buySkin)
		{
				// pay all bots bot ...
			DataTransfer.credits -= DataTransfer.skinPrice[_menuHandler.currSkin];
				
			if (_menuHandler.currSkin == 1)
			{
					// unlock Skin
				DataTransfer.skinA[_menuHandler.currBot] = true;
				
					// send analytics
				if (_menuHandler.currBot == 0)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "vektroidA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach1",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 1)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "zipbotA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach4",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 2)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "wrekkerA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach8",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 3)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "dabombA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach16",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 4)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "podbotA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach12",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 5)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "speedbotA");
					
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach20",100.0);
				}
				else if (_menuHandler.currBot == 6)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "tribotA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach24",100.0);
					#endif
				}
			
			}
			else if (_menuHandler.currSkin == 2)
			{
					// unlock Skin
				DataTransfer.skinB[_menuHandler.currBot] = true;
					
					// send analytics
				if (_menuHandler.currBot == 0)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "vektroidB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach2",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 1)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "zipbotB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach5",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 2)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "wrekkerB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach9",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 3)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "dabombB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach17",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 4)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "podbotB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach13",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 5)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "speedbotB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach21",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 6)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "tribotB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach25",100.0);
					#endif
				}
			}
			else if (_menuHandler.currSkin == 3)
			{
					// unlock Skin
				DataTransfer.skinC[_menuHandler.currBot] = true;
				
					// send analytics
				if (_menuHandler.currBot == 0)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "vektroidC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach3",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 1)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "zipbotC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach6",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 2)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "wrekkerC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach10",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 3)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "dabombC");
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach18",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 4)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "podbotC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach14",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 5)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "speedbotC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach22",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 6)
				{
						// send analytics
					Google.analytics.logEvent("store", "unlock", "tribotC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach26",100.0);
					#endif
				}
			}
						
				// store prefs
			_touchHandler.setUnlocks();
			
				// reset flag
			_menuHandler.buySkin = false;
			
				// flag change
			_storeBotHandler.hasChange = true;
		}
			// all MAP purchase
		else if (_menuHandler.buyAllMaps)
		{
				// pay all bots bot ...
			DataTransfer.credits -= DataTransfer.allMaps;
						
				// unlock Maps
			for (var allMaps = 0; allMaps < 5; allMaps++)
			{
				DataTransfer.trackUnlocks[allMaps] = 3;
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach"+(allMaps+1),100.0);
				#endif
			}			
				// store prefs
			_touchHandler.setUnlocks();
			
				// reset flag
			_menuHandler.buyAllMaps = false;
			
			_menuHandler.currMap = 0;
			
				// flag change
			_storeMapHandler.hasChange = true;
		}
			// MAP purchase
		else if (_menuHandler.buyMap)
		{
				// pay all bots bot ...
			DataTransfer.credits -= DataTransfer.trackPrice[_menuHandler.currMap];
			
				// submit analytics map purchase
			if (_menuHandler.currMap == 0)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "weaponsFactory");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach4",100.0);
				#endif
			}
			else if (_menuHandler.currMap == 1)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "lostAngeles");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach5",100.0);
				#endif
			}
			else if (_menuHandler.currMap == 2)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "electricDowntown");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach3",100.0);
				#endif
			}
			else if (_menuHandler.currMap == 3)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "bioDome");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach1",100.0);
				#endif
			}
			else if (_menuHandler.currMap == 4)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "whiteCity");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach6",100.0);
				#endif
				
			}
			else if (_menuHandler.currMap == 5)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "chinaTown");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach2",100.0);
				#endif
			}
			
				// unlock Bot
			DataTransfer.trackUnlocks[_menuHandler.currMap] = 3;

				// store prefs
			_touchHandler.setUnlocks();
			
				// reset flag
			_menuHandler.buyMap = false;
			
				// flag change
			_storeMapHandler.hasChange = true;
		}
			// all ITEM purchase
		else if (_menuHandler.buyAllItems)
		{
				// pay all bots bot ...
			DataTransfer.credits -= DataTransfer.allItems;
						
				// unlock Maps
			for (var allItems = 0; allItems < 9; allItems++)
			{
				DataTransfer.pickupUnlocks[allItems] = true;
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.item.ach"+(allItems+1),100.0);
				#endif
			}			

				// store prefs
			_touchHandler.setUnlocks();
			
				// reset flag
			_menuHandler.buyAllItems = false;
			
			_menuHandler.currItem = 0;
			
				// flag change
			_storeItemHandler.hasChange = true;
		}
			// ITEM purchase
		else if (_menuHandler.buyItem)
		{
				// pay all bots bot ...
			DataTransfer.credits -= DataTransfer.itemPrice[_menuHandler.currItem];
			
				// handle analytics
			if (_menuHandler.currItem == 0)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "virus");
			}
			else if (_menuHandler.currItem == 1)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "missile");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.item.ach2",100.0);
				#endif
			}
			else if (_menuHandler.currItem == 2)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "autopilot");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.item.ach3",100.0);
				#endif
			}
			else if (_menuHandler.currItem == 3)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "caltrop");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.item.ach1",100.0);
				#endif
			}
			else if (_menuHandler.currItem == 4)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "shield");
			}
			else if (_menuHandler.currItem == 5)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "skyshot");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.item.ach5",100.0);
				#endif
			}
			else if (_menuHandler.currItem == 6)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "shrink");
			}
			else if (_menuHandler.currItem == 7)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "speed");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.item.ach7",100.0);
				#endif
			}
			else if (_menuHandler.currItem == 8)
			{
					// send analytics
				Google.analytics.logEvent("store", "unlock", "leadershot");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.item.ach8",100.0);
				#endif
			}

						
				// unlock Bot
			DataTransfer.pickupUnlocks[_menuHandler.currItem] = true;

				// store prefs
			_touchHandler.setUnlocks();
			
				// reset flag
			_menuHandler.buyItem = false;
			
				// flag change
			_storeItemHandler.hasChange = true;
		}
	
			// go back to last menu
		//_touchHandler.debugMenu = _touchHandler.lastMenu;
		_touchHandler.debugMenu = 57;
	}
	
		// floating window handling
	else
	{
		
			// CONFIRM CRYSTALS
			// if we were in the purchase menu before ...
		if (_touchHandler.purchaseSum > 0)
		{
			// start the purchase then go to confirm screen
			appPurchaseHandler.startPurchase();
		}
		
			// CONFIRM BOT ON SELECTION
			// if we were buying a bot
		else if (_menuHandler.purchaseType == 1)
		{
				// pay the bot ...
			DataTransfer.credits -= DataTransfer.botPrice[DataTransfer.activeBot - 1];
			
				// send analytics
			if (_menuHandler.currBot == 0)
			{
					// send analytics
				Google.analytics.logEvent("botSelect", "unlock", "vektroid");
			}
			else if (_menuHandler.currBot == 1)
			{
					// send analytics
				Google.analytics.logEvent("botSelect", "unlock", "zipbot");
			}
			else if (_menuHandler.currBot == 2)
			{
					// send analytics
				Google.analytics.logEvent("botSelect", "unlock", "wrekker");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach7",100.0);
				#endif
			}
			else if (_menuHandler.currBot == 3)
			{
					// send analytics
				Google.analytics.logEvent("botSelect", "unlock", "dabomb");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach15",100.0);
				#endif
			}
			
			else if (_menuHandler.currBot == 4)
			{
					// send analytics
				Google.analytics.logEvent("botSelect", "unlock", "podbot");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach11",100.0);
				#endif
			}
			else if (_menuHandler.currBot == 5)
			{
					// send analytics
				Google.analytics.logEvent("botSelect", "unlock", "speedbot");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach19",100.0);
				#endif
			}
			else if (_menuHandler.currBot == 6)
			{
					// send analytics
				Google.analytics.logEvent("botSelect", "unlock", "tribot");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach23",100.0);
				#endif
			}
			
						
				// unlock Bot
			DataTransfer.botUnlocks[DataTransfer.activeBot - 1] = true;
						
				// store prefs
			_touchHandler.setUnlocks();
			
				// update the buttons
			_botHandler.updateStats();
		}
		
			// CONFIRM MAP ON SELECTION
			// if we were buying a map
		else if (_menuHandler.purchaseType == 2)
		{
				// pay the map ...
			DataTransfer.credits -= DataTransfer.trackPrice[DataTransfer.activeLevel - 1];

				// submit analytics map purchase
			if ((DataTransfer.activeLevel - 1) == 0)
			{
					// send analytics
				Google.analytics.logEvent("mapSelect", "unlock", "weaponsFactory");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach4",100.0);
				#endif
			}
			else if ((DataTransfer.activeLevel - 1) == 1)
			{
					// send analytics
				Google.analytics.logEvent("mapSelect", "unlock", "lostAngeles");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach5",100.0);
				#endif
			}
			else if ((DataTransfer.activeLevel - 1) == 2)
			{
					// send analytics
				Google.analytics.logEvent("mapSelect", "unlock", "electricDowntown");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach3",100.0);
				#endif
			}
			else if ((DataTransfer.activeLevel - 1) == 3)
			{
					// send analytics
				Google.analytics.logEvent("mapSelect", "unlock", "bioDome");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach1",100.0);
				#endif
			}
			else if ((DataTransfer.activeLevel - 1) == 4)
			{
					// send analytics
				Google.analytics.logEvent("mapSelect", "unlock", "whiteCity");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach6",100.0);
				#endif
			}
			else if ((DataTransfer.activeLevel - 1) == 5)
			{
					// send analytics
				Google.analytics.logEvent("mapSelect", "unlock", "chinaTown");
				
				#if UNITY_IPHONE
				//Post unlock to Game Center
				iOSPlugin.pstAchievement("com.easleydunn.robotrace.levels.ach2",100.0);
				#endif
			}
					
				// unlock Bot
			DataTransfer.trackUnlocks[(DataTransfer.activeLevel-1)] = 1;
						
				// store prefs
			_touchHandler.setUnlocks();
			
				// hide the lock / switch buttons
			map_btn_select.localPosition = Vector3(0,0,0);
			map_btn_buy.localPosition = Vector3(0,200,0);
			map_icon_lock.localPosition = Vector3(0,200,0);
		}
		
		
			// CONFIRM SKIN ON SELECTION
			// if we were buying a skin
		else if (_menuHandler.purchaseType == 3)
		{
				// pay the map ...
			DataTransfer.credits -= DataTransfer.skinPrice[DataTransfer.currentSkin[(DataTransfer.activeBot - 1)]];
						
				// unlock skin
			if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] == 1)
			{
					// unlock the skin
				DataTransfer.skinA[DataTransfer.activeBot - 1] = true;
				
					// send analytics
				if (_menuHandler.currBot == 0)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "vektroidA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach1",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 1)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "zipbotA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach4",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 2)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "wrekkerA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach8",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 3)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "dabombA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach16",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 4)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "podbotA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach12",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 5)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "speedbotA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach20",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 6)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "tribotA");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach24",100.0);
					#endif
				}
			}
			else if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] == 2)
			{
					// unlock the skin
				DataTransfer.skinB[DataTransfer.activeBot - 1] = true;
				
					// send analytics
				if (_menuHandler.currBot == 0)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "vektroidB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach2",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 1)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "zipbotB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach5",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 2)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "wrekkerB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach9",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 3)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "dabombB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach17",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 4)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "podbotB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach13",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 5)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "speedbotB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach21",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 6)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "tribotB");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach25",100.0);
					#endif
				}
			}
			else if (DataTransfer.currentSkin[(DataTransfer.activeBot - 1)] == 3)
			{
					// unlock the skin
				DataTransfer.skinC[DataTransfer.activeBot - 1] = true;
				
					// send analytics
				if (_menuHandler.currBot == 0)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "vektroidC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach3",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 1)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "zipbotC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach6",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 2)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "wrekkerC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach10",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 3)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "dabombC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach18",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 4)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "podbotC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach14",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 5)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "speedbotC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach22",100.0);
					#endif
				}
				else if (_menuHandler.currBot == 6)
				{
						// send analytics
					Google.analytics.logEvent("botSelect", "unlock", "tribotC");
					
					#if UNITY_IPHONE
					//Post unlock to Game Center
					iOSPlugin.pstAchievement("com.easleydunn.robotrace.botskins.ach26",100.0);
					#endif
				}
			}
	
				// store prefs
			_touchHandler.setUnlocks();
			
				// update the buttons
			_botHandler.updateStats();
		}
	
			// hide the purchase menu
		_menuHandler.botConfirm = false;
		_menuHandler.botResult = true;
		_menuHandler.botPurchase = false;
		_menuHandler.stateChange = true;
	}
}