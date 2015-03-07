// debug menu disabled by renaming onGui function!! in play_btn.js added a bool for debug

var mainCam : Transform;						// in order to not break our prefab (cam mover) parent cam at runtime
var camMover : Transform;
var mainCamera : Camera;
var loadScreen : GameObject;
//Camera.main.

var settingsHolderGO : GameObject;
//var settingsHolderScr : settingsHolder;
var botHandler : _botSelectHandler;				// update bot unlock display
var menuFlags : Menu_Flags;
var _menuHandler : debugMenuStates;


var iPhone : boolean = false;
var pressedTimer : float = 0.0;					// was a button pressed?
//var DataTransfer.useAcc : boolean = false;					// use accelerometer
var tiltRoot : Transform;

var sensitivity : float= 0.0;		// our steering sensitivity
var touchSens : float = 1.0;		// touch sensitivity

var smoothX : float = 0.0;
var smoothY : float = 0.0;

var sWidth : int;
var sHeight : int;

var buttonSound : AudioClip;
var overSound : AudioClip;
var denySound : AudioClip;

var tableRenderer : Renderer;
var tankRenderer : Renderer;
var rotatorRenderer : Renderer;
var atmRenderer : Renderer;
var atmScreenRenderer : Renderer;
var coverRenderer : Renderer;


var tronTxt : Material;

var anim : Animation;							// the animation node (CamAnim)

	// handling the debug menu! This will be set from the play_btn Script!!!
var debugMenu : int = 8;	//8 default					// this is used in the onGUI function to check which menu to show. 8 is none, 7 is char select and 0 to 6 is on char each
var lastMenu : int = 8;

var atmActive : boolean = false;

private var touchStart : Vector2;
private var screenPos : Vector2;
private var swipeVector : Vector2;
var swipeValues : Vector2;
private var swipeActive : boolean = false;
var hasSwipe : boolean = false;

	// store sum to purchase ...
var purchaseSum : float = 0.0;
// Handles by NGUI UILocalize - var creditInfo : TextMesh;

var overPlayed : boolean = false;

var demoBuild : boolean = false;

function placeCam()
{
		// place camera!!
	mainCam.parent = camMover;
	mainCam.localPosition = Vector3(0,0,0);
	mainCam.localEulerAngles = Vector3(0,270,0);
	
		// reduce range
	mainCamera.farClipPlane = 30.0;
	
		// destroy loadscreen
	Destroy(loadScreen);
}

function Awake()
{
		// Screen / Touch handling variables
	sWidth = Screen.width;			// get screen width and height
	sHeight = Screen.height;

		// restart time ...
	Time.timeScale = 1.0;
	
		// invoke cam placement
	Invoke("placeCam", 1.00);

#if UNITY_IPHONE
			// Disable screen dimming
		Screen.sleepTimeout = 0.0f;
		
			// Disable rotate animation in unity (screen frame)
		// iPhoneKeyboard.autorotateToPortrait = false;
		// iPhoneKeyboard.autorotateToPortraitUpsideDown = false;
		// iPhoneKeyboard.autorotateToLandscapeLeft = false;
		// iPhoneKeyboard.autorotateToLandscapeRight = false;
		
			// iPhone controls
		iPhone = true;
#endif


		// get our settings Holder script and initialize the stats...
	//settingsHolderScr = (settingsHolderGO.GetComponent(settingsHolder) as settingsHolder);
	//settingsHolderScr.ReadStats();
	
		// if last race was won (This is NOW set in the continue_btn_scr, as I have to take multiple races into account)
	if(DataTransfer.lastRacePos == 1)
	{
			// change Texture
		tableRenderer.material = tronTxt;
		tankRenderer.material = tronTxt;
		rotatorRenderer.material = tronTxt;
		atmRenderer.material = tronTxt;
		atmScreenRenderer.material = tronTxt;
		//coverRenderer.material = tronTxt;
	}
	
	// DEMO CHANGES
	if (demoBuild)
	{
		demoUnlocks();
		
		DataTransfer.activeLevel = 2;
		DataTransfer.loadLevel = 2;
	}
	
		// init Debug Menu for Root menu
	debugMenu = 9;
	/*
		// if we need to initialize .. run this
	if (!DataTransfer.initDone)
	{
		if (!DataTransfer.initSkip)
		{
			debugMenu = 99;
		}
	}
		*/
		// get the current unlocks
	getUnlocks();
	getPrefs();
	
		// Google.analytics register level load
//	Google.analytics.logPageView();
	
	
}



function resetPrefs()
{
		// store music state
	PlayerPrefsX.SetBool("playMusic", true);

		// default value is 1 (for true)
	PlayerPrefs.SetInt("useAcc", 1);

		// default value is 2.0
	PlayerPrefs.SetInt("sensitivity", 4);
	
		// touch sens
	PlayerPrefs.SetInt("touchSens", 4);
	
		// store tutorial state
	PlayerPrefsX.SetBool("tutEnable", true);
	PlayerPrefsX.SetBoolArray("tutFinish", [false,false,false,false,false,false,false]);
	
		// handle language selection
	PlayerPrefs.SetInt("lang", 0);			// default language is english

		// save everything
	PlayerPrefs.Save();
	
		// now reload that stuff
	getPrefs();
}

function demoUnlocks()
{

		// handle unlocks...
	PlayerPrefsX.SetBoolArray("pickupUnlocks", [true, true, true, true, true, true, true, true, false]);
	PlayerPrefsX.SetBoolArray("botUnlocks", [true, false, true, false, false, false, false]);
	PlayerPrefsX.SetIntArray("trackUnlocks", [0, 3, 0, 0, 0, 0, 0, 0]);
	// PlayerPrefsX.SetBoolArray("circuitUnlocks", [true, true, true, true, true, true, true]);
	PlayerPrefs.SetInt("circuitUnlocks", 0);
	
		// badges
	// PlayerPrefsX.SetIntArray("badgesCareer", [1,1,1,1,1,1,1,1,1,1,1]);
	
		// skin handling
	PlayerPrefsX.SetIntArray("currentSkin", [0,0,0,0,0,0,0]);
	PlayerPrefsX.SetBoolArray("skinA", [false, false, false, false, false, false, false]);
	PlayerPrefsX.SetBoolArray("skinB", [false, false, false, false, false, false, false]);
	PlayerPrefsX.SetBoolArray("skinC", [false, false, false, false, false, false, false]);

		// save everything
	PlayerPrefs.Save();
	
		// now reload that stuff
	getUnlocks();
	
		// update bot unlock display
	botHandler.checkUnlocks();
}


function unlockAll()
{

		// handle unlocks...
	PlayerPrefsX.SetBoolArray("pickupUnlocks", [true, true, true, true, true, true, true, true, true]);
	PlayerPrefsX.SetBoolArray("botUnlocks", [true, true, true, true, true, true, true]);
	PlayerPrefsX.SetIntArray("trackUnlocks", [3, 3, 3, 3, 3, 3, 3, 3]);
	// PlayerPrefsX.SetBoolArray("circuitUnlocks", [true, true, true, true, true, true, true]);
	PlayerPrefs.SetInt("circuitUnlocks", 6);
	
		// badges
	PlayerPrefsX.SetIntArray("badgesCareer", [1,1,1,1,1,1,1,1,1,1,1]);
	
		// skin handling
	PlayerPrefsX.SetIntArray("currentSkin", [0,0,0,0,0,0,0]);
	PlayerPrefsX.SetBoolArray("skinA", [true, true, true, true, true, true, true]);
	PlayerPrefsX.SetBoolArray("skinB", [true, true, true, true, true, true, true]);
	PlayerPrefsX.SetBoolArray("skinC", [true, true, true, true, true, true, true]);
	
		// save everything
	PlayerPrefs.Save();
		
		// now reload that stuff
	getUnlocks();
	
		// update bot unlock display
	botHandler.checkUnlocks();
}


function resetUnlocks()
{
		// handle unlocks...
	PlayerPrefsX.SetBoolArray("pickupUnlocks", [true, false, false, false, true, false, true, false, false]);
	PlayerPrefsX.SetBoolArray("botUnlocks", [true, true, false, false, false, false, false]);
	PlayerPrefsX.SetIntArray("trackUnlocks", [1, 1, 1, 0, 0, 0, 0, 0]);
	PlayerPrefsX.SetIntArray("storeStats", [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
	// PlayerPrefsX.SetBoolArray("circuitUnlocks", [true, true, false, false, false, false, false]);
	PlayerPrefs.SetInt("circuitUnlocks", 1);
	PlayerPrefs.SetInt("credits", 100);
	
		// badges
	PlayerPrefsX.SetIntArray("badgesCareer", [0,0,0,0,0,0,0,0,0,0,0]);
	
		// skin handling
	PlayerPrefsX.SetIntArray("currentSkin", [0,0,0,0,0,0,0]);
	PlayerPrefsX.SetBoolArray("skinA", [false, false, false, false, false, false, false]);
	PlayerPrefsX.SetBoolArray("skinB", [false, false, false, false, false, false, false]);
	PlayerPrefsX.SetBoolArray("skinC", [false, false, false, false, false, false, false]);

		// save everything
	PlayerPrefs.Save();
	
		// now reload that stuff
	getUnlocks();
	
		// update bot unlock display
	botHandler.checkUnlocks();
}


	// set all prefs for our game ...
function setPrefs()
{
		// store music state
	PlayerPrefsX.SetBool("playMusic", DataTransfer.playMusic);

		// default value is 1 (for true)
	PlayerPrefs.SetInt("useAcc", DataTransfer.useAcc);

		// default value is 2.0
	PlayerPrefs.SetInt("sensitivity", DataTransfer.accSensIndex);
	
		// touch sens
	PlayerPrefs.SetInt("touchSens", DataTransfer.touchSensIndex);
	
		// store tutorial state
	PlayerPrefsX.SetBool("tutEnable", DataTransfer.tutEnable);
	PlayerPrefsX.SetBoolArray("tutFinish", DataTransfer.tutFinish);
	
		// handle language selection
	PlayerPrefs.SetInt("lang", DataTransfer.lang);			// default language is english
	
	// DEBUG
	//Debug.Log ("Set Lang ID: " + DataTransfer.lang);

		// save everything
	PlayerPrefs.Save();
	
		// reload everything
	getPrefs();

}


function setUnlocks()
{
		// handle unlocks...
	PlayerPrefsX.SetBoolArray("pickupUnlocks", DataTransfer.pickupUnlocks);
	PlayerPrefsX.SetBoolArray("botUnlocks", DataTransfer.botUnlocks);
	PlayerPrefsX.SetIntArray("trackUnlocks", DataTransfer.trackUnlocks);
	PlayerPrefsX.SetIntArray("storeStats", DataTransfer.storeStats);
	// PlayerPrefsX.SetBoolArray("circuitUnlocks", DataTransfer.circuitUnlocks);
	PlayerPrefs.SetInt("circuitUnlocks", DataTransfer.circuitUnlocks);
	PlayerPrefs.SetInt("credits", DataTransfer.credits);
	
		// badges
	PlayerPrefsX.SetIntArray("badgesCareer", DataTransfer.badgesCareer);
	
		// skin handling
	PlayerPrefsX.SetIntArray("currentSkin", DataTransfer.currentSkin);
	PlayerPrefsX.SetBoolArray("skinA", DataTransfer.skinA);
	PlayerPrefsX.SetBoolArray("skinB", DataTransfer.skinB);
	PlayerPrefsX.SetBoolArray("skinC", DataTransfer.skinC);
	
		// save everything
	PlayerPrefs.Save();
	
		// update bot unlock display
	botHandler.checkUnlocks();
}


function addCredits()
{
	PlayerPrefs.SetInt("credits", (DataTransfer.credits + 1000));

		// save everything
	PlayerPrefs.Save();
	
		// now reload that stuff
	getUnlocks();
}


function getUnlocks()
{
		// load the unlock settings
	DataTransfer.pickupUnlocks = PlayerPrefsX.GetBoolArray("pickupUnlocks", [true, false, false, false, true, false, true, false, false], 9);
	DataTransfer.botUnlocks = PlayerPrefsX.GetBoolArray("botUnlocks", [true, true, false, false, false, false, false], 7);
	DataTransfer.trackUnlocks = PlayerPrefsX.GetIntArray("trackUnlocks", [1, 1, 1, 0, 0, 0, 0, 0], 8);
	DataTransfer.storeStats = PlayerPrefsX.GetIntArray("storeStats",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], 70);
	// DataTransfer.circuitUnlocks = PlayerPrefsX.GetBoolArray("circuitUnlocks", [true, true, false, false, false, false, false], 7);
	DataTransfer.circuitUnlocks = PlayerPrefs.GetInt("circuitUnlocks", 1);
	DataTransfer.credits = PlayerPrefs.GetInt("credits", 100);
	
		// badges
	DataTransfer.badgesCareer = PlayerPrefsX.GetIntArray("badgesCareer", [0,0,0,0,0,0,0,0,0,0,0], 11);
	
		// skin handling
	DataTransfer.currentSkin = PlayerPrefsX.GetIntArray("currentSkin", [0,0,0,0,0,0,0], 7);
	DataTransfer.skinA = PlayerPrefsX.GetBoolArray("skinA", [false, false, false, false, false, false, false], 7);
	DataTransfer.skinB = PlayerPrefsX.GetBoolArray("skinB", [false, false, false, false, false, false, false], 7);
	DataTransfer.skinC = PlayerPrefsX.GetBoolArray("skinC", [false, false, false, false, false, false, false], 7);
}


	// get all prefs for our game
function getPrefs()
{
		// store music state
	DataTransfer.playMusic = PlayerPrefsX.GetBool("playMusic", true);

		// default value is the current DataTransfer.useAcc setting
	DataTransfer.useAcc = PlayerPrefs.GetInt("useAcc", 1);

		// default value is the current sensitivity setting
	DataTransfer.accSensIndex = PlayerPrefs.GetInt("sensitivity", 4);
	
		// get touch sensitivity
	DataTransfer.touchSensIndex = PlayerPrefs.GetInt("touchSens", 4);
	
		// store tutorial state
	DataTransfer.tutEnable = PlayerPrefsX.GetBool("tutEnable", true);
	DataTransfer.tutFinish = PlayerPrefsX.GetBoolArray("tutFinish", [false,false,false,false,false,false,false], 7);
	
		// handle language selection
	DataTransfer.lang = PlayerPrefs.GetInt("lang", 0);			// default language is english
	
	// DEBUG
	//Debug.Log ("Got Lang ID: " + DataTransfer.lang);
	
		// actually update sensitivity settings
	setAccSens();
	setTouchSens();

}

function toggleAcc()
{
	if (DataTransfer.useAcc == 1)
	{
		DataTransfer.useAcc = 0;
	}
	else
	{
		DataTransfer.useAcc = 1;
	}
}


function setAccSens()
{
		// set our sensitivity
	sensitivity = 0.5 * DataTransfer.accSensIndex;
}


function setTouchSens()
{
		// set our sensitivity
	touchSens = (0.5 * DataTransfer.touchSensIndex);
}


function isExecuteSound()
{
		// play button sound
	audio.clip = buttonSound;
	audio.Play ();
}


function isOverSound()
{
/*
	if (!overPlayed)
	{
			// play button sound
		audio.clip = overSound;
		audio.Play ();
		
			// we want this played once only ..
		overPlayed = true;
	}
*/
}


function isDenySound()
{
		// play button sound
	audio.clip = denySound;
	audio.Play ();
}


function Update () 
{

	var screenRay : Ray;
	var buttonHit : RaycastHit;
	var cTime : float = Time.time;
	
	var dir : Vector3 = Vector3.zero;					// for handling the acceleration ...

		// update credit info
	//creditInfo.text = LanguageHandler.buttonText[30] + ": " + DataTransfer.credits.ToString();
		// color credits info
	//creditInfo.renderer.material.color = Color(1,1,0,1);

//	###############################
//
//		Setup buttonhandling ...
//
	
		// store our current menu in menuFlags (which are accessible by our uiToolkit stuff)
	menuFlags.debugMenu = debugMenu;
	
		// check if a menu is enabled (which should disable touch handling, as UNITYs GUI takes over)
	if (debugMenu > 7)
	{
//DEBUG
//#if UNITY_IPHONE	
			// check if we are using iPhone controls
		if (iPhone)
		{
				// check if display pressed
			for(var touch: Touch in Input.touches)
			{
				var pos: Vector2 = touch.position;		// get the touch input and it's position
				screenPos = pos;
				var currPhase = touch.phase;

					// set the start point
				if(TouchPhase.Began == currPhase)
				{
					screenRay = Camera.main.ScreenPointToRay(pos);
					
						// handle buttons lighting up if holding over them
					if (Physics.Raycast(screenRay, buttonHit, 200)) 
			        {
							// execute button
			        	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
			        	
			        }
			        else
			        {
			        		// if we did not touch a button ... activate swipe function
			        	touchStart = screenPos;
						swipeActive = true;
			        }
				}
				if( (TouchPhase.Moved == currPhase) || (TouchPhase.Stationary == currPhase) )
				{
						// only light up buttons under finger if fo swipe active
					if (!hasSwipe)
					{
						screenRay = Camera.main.ScreenPointToRay(pos);
					
							// handle buttons lighting up if holding over them
						if (Physics.Raycast(screenRay, buttonHit, 200)) 
				        {
								// execute button
				        	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
				        }
				        else
				        {
				        		// we moved off off our button .. enable over again!!
				        	overPlayed = false;
				        }
					}
				}
				if(TouchPhase.Ended == currPhase)
				{
						// we touch ended. Enable over sound again ...
					overPlayed = false;
				
						// only call execute button function if no swipe going on
					if (!hasSwipe)
					{
							// check if pressed timer allows next press
						if(cTime >= pressedTimer)
						{
							pressedTimer = cTime + 0.2;														// button press allowed every .2 seconds ..
						
							screenRay = Camera.main.ScreenPointToRay(pos);
				
				        	if (Physics.Raycast(screenRay, buttonHit, 200)) 
				        	{
				        			// play button sound
				        		//audio.clip = buttonSound;
								//audio.Play ();
				        			
				        			// execute button
				            	buttonHit.collider.gameObject.SendMessage("execute");						// run the code attached to button
				        	}
				    	} 
			    	}
			    	
			    		// disable swipe
					swipeActive = false;
					hasSwipe = false;
			    }  
			}	
//DEBUG
		}
//#endif
//DEBUG
//#if !UNITY_IPHONE
		else
		{
//DEBUG
				// get mouse position
			screenPos = Input.mousePosition;
			
				// check if mouse pressed
			if (Input.GetMouseButtonDown(0)) 
			{
				screenRay = Camera.main.ScreenPointToRay(screenPos);
				
					// handle buttons lighting up if holding over them
				if (Physics.Raycast(screenRay, buttonHit, 200)) 
			    {
						// execute button
			       	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
			    }
			    else
			    {
			    		// if we did not touch a button ... activate swipe function
			    	touchStart = screenPos;
					swipeActive = true;
			    }
			}
			if (Input.GetMouseButton(0)) 
			{
				screenRay = Camera.main.ScreenPointToRay(screenPos);
			
					// only light up or select buttons if we are not in a swipe state!!
				if (!hasSwipe)
				{
						// handle buttons lighting up if holding over them
					if (Physics.Raycast(screenRay, buttonHit, 200)) 
				    {
							// execute button
				       	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
				    }
				    else
				    {
				    		// we moved off off our button .. enable over again!!
				       	overPlayed = false;
				    }
				}
			}
				// check if mouse released
			if (Input.GetMouseButtonUp(0)) 
			{
					// we touch ended. Enable over sound again ...
				overPlayed = false;
					
					// if we were in a swipe, don't execute button
				if (!hasSwipe)
				{
						// check if pressed timer allows next press
					if(cTime >= pressedTimer)
					{
						pressedTimer = cTime + 0.2;														// button press allowed every .2 seconds ..
					
						screenRay = Camera.main.ScreenPointToRay(Input.mousePosition);
			
			        	if (Physics.Raycast(screenRay, buttonHit, 200)) 
			        	{
			        			// play button sound
				        	//audio.clip = buttonSound;
							//audio.Play ();
				        			
				        		// execute button
			        		buttonHit.collider.gameObject.SendMessage("execute");						// run the code attached to button
			        	}
			    	} 
		    	} 
		    	
		    		// disable swipe
				swipeActive = false;
		    	hasSwipe = false;
			}
//DEBUG
		}
//#endif

			// check for swipe action
		if (swipeActive && (debugMenu == 70) )
		{
				// get the current swipe vector
			swipeVector = touchStart - screenPos;

			swipeValues.x = swipeVector.x / sWidth;
			swipeValues.y = swipeVector.y / sHeight;
		
				// 	check if we have a swipe
			if (Mathf.Abs(swipeValues.x) > 0.05)
			{
					// mark Swipe Active
				hasSwipe = true;
				
				//print ("we have a swipe with X - Magnitude: " + swipeVector.x);
				//print ("Normalized...   X: " + swipeValues.x + "   Y: " + swipeValues.y);
				//print (" ");
			}
		}
		
	} // End onGUI Check ...

//	###############################
//
//		Setup Tilt handling
//
	if (DataTransfer.useAcc)
	{													// IF Acceleration is set ON .. get readout the accelerometer!!!
		dir.x = -Input.acceleration.y;					
		dir.z = Input.acceleration.z;
			
		var speed : float = 0.3;
			// clamp acceleration vector to unit sphere
		if (dir.sqrMagnitude > 1)
			dir.Normalize();
			
		dir.x = dir.x / 2.0;
		dir.z = dir.z / 2.0;
		
		smoothX = Mathf.SmoothDamp(smoothX, dir.x, speed, 10.0 * Time.deltaTime);
		smoothY = Mathf.SmoothDamp(smoothX, dir.z, speed, 10.0 * Time.deltaTime);
		
		// print("dir.z: " + dir.z);
		
			// smooth values and limit range to 0.5
		
			// rotate the tilt node ...
		tiltRoot.localEulerAngles.y = -smoothX;
		tiltRoot.localEulerAngles.x = smoothY;
	}	

}

function OnGUI_deactivated()
{	
	var buttonName : String;

		// enable the debug Menu resetting menu
	if ( (debugMenu == 9) && (!_menuHandler.badgeScreen) )
	{
		if (GUI.Button(Rect(10,((sHeight / 7) * 0.5) ,(sWidth / 5),(sHeight/8)),("Reset Prefs")))
		{
			resetPrefs();
		}
		
		if (GUI.Button(Rect(10,((sHeight / 7) * 1.5) ,(sWidth / 5),(sHeight/8)),("Reset Unlocks")))
		{
			resetUnlocks();
		}
		
		if (GUI.Button(Rect(10,((sHeight / 7) * 2.5) ,(sWidth / 5),(sHeight/8)),("Unlock All")))
		{
			unlockAll();
		}
		
		if (GUI.Button(Rect(10,((sHeight / 7) * 3.5) ,(sWidth / 5),(sHeight/8)),("Add 1000 $")))
		{
			addCredits();
		}
		
		
			// Show credits
		//GUI.Box(Rect((10),((sHeight / 8) * 7) ,(sWidth / 5),25),("Credits: " + DataTransfer.credits.ToString()));
	}
}
