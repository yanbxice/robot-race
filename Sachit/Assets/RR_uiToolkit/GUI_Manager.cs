// Test this with the new Atlas I made and recreate the HUD.
// Then have the buttons do something!!

//#define USING_UITOOLKIT //In order to use the old UIToolkit system, define this.

using UnityEngine;
using System.Collections;
using System.Collections.Generic;

		
public class GUI_Manager : MonoBehaviour
{
	
	// We need to adjust the placement of our controls for the different aspect of the iPad.
	// while the 3GS has a ratio of 1.5, the iPad has 1.33333
	// So, for the width this means I need to make the Placement dependant on the width of the screen.
	// 
	
		// !!!
		// Variable Definitions
	#region Variable Definitions
	
		// Define the HUD Atlas holder
	public SamUIToolkit hudToolkit;
	
		// Define the HUD Text Atlas (messages etc)
	public SamUIToolkit hudText;
	
		// Here	we define our actual text Atlas Holder
	public SamUIToolkit textToolkit;
	
		// center of our buttons for labels in end menu.
	public Transform centerContinue;
	public Transform centerMenu;
	public Transform centerRetry;
	
		// touch to continue menu
#if USING_UITOOLKIT
	private SamUIText screenText;

	private SamUITextInstance txTouchContinue;
	private SamUITextInstance txEndHeader;
	
		// init the text lines... (for max 5 lines of text with Values)
	private SamUITextInstance txLine1Label;
		private SamUITextInstance txLine1Value;
		private SamUITextInstance txLine1ValueA;
		private SamUITextInstance txLine1ValueB;
	private SamUITextInstance txLine2Label;
		private SamUITextInstance txLine2Value;
		private SamUITextInstance txLine2ValueA;
		private SamUITextInstance txLine2ValueB;
	private SamUITextInstance txLine3Label;
		private SamUITextInstance txLine3Value;
		private SamUITextInstance txLine3ValueA;
		private SamUITextInstance txLine3ValueB;
	private SamUITextInstance txLine4Label;
		private SamUITextInstance txLine4Value;
		private SamUITextInstance txLine4ValueA;
		private SamUITextInstance txLine4ValueB;
	private SamUITextInstance txLine5Label;
		private SamUITextInstance txLine5Value;
		private SamUITextInstance txLine5ValueA;
		private SamUITextInstance txLine5ValueB;
#endif

	
	public int lastMenu = 0;
	
	
		// define our virus message
	// private SamUITextInstance virusText;
	private SamUISprite spriteVirusWarning;
	private SamUIUVRect[] uvRect_warnings = new SamUIUVRect[10];
	private string[] warnings = new string[] { "incoming_missle.png", "incoming_skyblast.png", "wrong_direction.png", "final_lap.png", "no_target.png", "reboot.png", "virus_detected.png", "incoming_leader.png", "autopilot.png", "virus_evaded.png"};
	
	public Transform flashAnim;			// this we will read the scale from
	// private float virusWarningExit = 0.0f;
	private bool virusWarningActive = false;
	
	private float messageOne = 5.0f;
	private float messageTwo = 2.0f;
	private float messageThree = 3.2f;
	// private int warningState = 0;
	
		// the virus anim holder
	public Transform virusDistort;
	public Transform virusEffekt;
	public Animation virusAnim;
	
		// the badge frame holder
	private SamUISprite sprite_frame;
	private SamUISprite sprite_strike;
		
		// define our Virus plane
	private SamUISprite sprite_virus;

		// get SamUI Objects for my stuff
	private SamUIObject HUD_root;
	private SamUIObject HUD_MidAnchor;
	private SamUIObject HUD_Anchor;
	private SamUIObject HUD_JuiceFill;
	private SamUIObject HUD_MinimapRoot;
	
		// cornerAnchors
	private SamUIObject HUD_TL;
	private SamUIObject HUD_TR;
	
	private SamUIObject Frame_TL;
	private SamUIObject Frame_TR;
	
	private SamUIObject HUD_BL;
	private SamUIObject HUD_BR;
	private SamUIObject HUD_BC;
	
	private SamUIObject HUD_TL_Anchor;
	private SamUIObject HUD_TR_Anchor;
	private SamUIObject HUD_BL_Anchor;
	private SamUIObject HUD_BC_Anchor;
	private SamUIObject HUD_BR_Anchor;
	
		// Our reticle
	private SamUISprite sprite_reticleOuter;
	private SamUISprite sprite_reticleMid;
	private SamUISprite sprite_reticleInner;
	public Transform reticleMover;
	public Transform reticleInner;
	public Transform reticleOuter;
	
		// define our pickup sprite
	private SamUISprite sprite_pickup;
	private SamUIUVRect[] uvRect_pickup = new SamUIUVRect[10];
	private string[] pickupItems = new string[] { "HUD_Juice.png", "HUD_virus.png", "HUD_missle.png", "HUD_JuiceOut.png", "HUD_badaboom.png", "HUD_shield.png", "HUD_skyblast.png", "HUD_isotope.png", "HUD_speed.png", "HUD_Leader.png" };
	private int pickupDepth = 10;									// GUI depth layer
	
		// define our juice button
	private SamUISprite sprite_juice;
	private SamUISprite sprite_juiceFill;
	private SamUIUVRect[] uvRect_juice = new SamUIUVRect[2];
	private string[] juiceStates = new string[] { "HUD_Juice.png", "HUD_JuiceOut.png"};
	private int juiceDepth = 10;										// GUI depth layer
	private int juiceFillDepth = 11;									// GUI depth layer
	
		// define our Jump button
	private SamUISprite sprite_jump;
	private bool setTransformed = false;	// are we set to transformed?
	
		// define our slide bar
	private SamUIObject sprite_slide;
	
		// define our warning message
	// private SamUITextInstance HUD_Warnings;
	private SamUISprite sprite_warning;
	public Transform flashWarning;
	private float warningExit = 0.0f;
	private bool warningActive = false;

		// define our screenflash
	private SamUISprite sprite_flash;
	private SamUIUVRect[] uvRect_flash = new SamUIUVRect[8];
	private string[] flashStates = new string[] { "HUD_flash025.png", "HUD_flash050.png", "HUD_flash075.png", "HUD_flash100.png", "HUD_flash100.png", "HUD_flash075.png", "HUD_flash050.png", "HUD_flash025.png"};
	public float fps = 1.0f;
	private float nextStep = 0.0f;
	private int currState = 0;
	private int numStates = 8;
	private bool flashActive = false;
	
		// define our lap/pos stuff
	private SamUISprite sprite_posField;
	private SamUISprite sprite_pos;
	private SamUISprite sprite_ord;
	private SamUISprite sprite_currLap;
	private SamUISprite sprite_allLaps;
	private SamUISprite sprite_slash;
	private SamUISprite sprite_Lap;
	private SamUIUVRect[] uvRect_numbers = new SamUIUVRect[11];
	private string[] spriteNumbers = new string[] { "0.png", "1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "slash.png"};
	private SamUIUVRect[] uvRect_ord = new SamUIUVRect[4];
	private string[] spriteOrd = new string[] { "st.png", "nd.png", "rd.png", "th.png"};

	private string placeText;
	private string ordText;
	private string lapText;
		
		// define our minimap
	//private SamUISprite sprite_Minimap;
	private SamUISprite sprite_Player;
	private SamUISprite[] sprite_Enemy = new SamUISprite[6];
	
		// access to bot transforms (or use refHolder???)
	public Transform playerTrns;
	public Transform[] botTrns = new Transform[6];
	
		// define our pause button
	private SamUISprite sprite_pause;
	
		// define our hitInfo
	private SamUISprite sprite_hitInfo;	// use pickup stuff
	private SamUISprite sprite_botInfo;
	private SamUIUVRect[] uvRect_botInfo = new SamUIUVRect[7];
	private string[] botStates = new string[] { "HUD_boticonVektor.png", "HUD_boticonIrobot.png", "HUD_boticonTruck.png", "HUD_boticonSteam.png", "HUD_boticonPod.png", "HUD_boticonMono.png", "HUD_boticonTri.png"};

	private float hitTimer = 0.0f;
	private float hitInterval = 2.0f;
	private bool hitVis = false;
	

		// define our badges
	private SamUISprite sprite_badges;
	private string[] badgeStates = new string[] {"badge_Nim.png", "badge_Un.png", "badge_DE.png", "badge_IF.png", "badge_HS.png", "badge_FS.png", "badge_HF.png", "badge_FSky.png", "badge_NM.png", "badge_HM.png", "badge_FM.png"};
	private SamUIUVRect[] uvRect_badges = new SamUIUVRect[11];
	
	private float badgeTimer = 0.0f;
	private float badgeInterval = 2.0f;
	private bool badgeVis = false;
	
		// connect to our javascript holding values for script access ...
	public GUI_Flags guiFlags;
	private bool doUpdate = true;									// upddate SamUI?

		// delete the HUD and open up a menu -> Have functions for each menu, load startScreen first
	
		// use simple sprites instead of buttons for the HUD -> no SendMessage crap
	#endregion Variable Definitions
		// end Variable Definitions
		// !!!
		
		// we need to place our stuff based on the screen ratio
		// the height is always the same (as we base our cams ortho size on it)
	private float invScreenRatio = 1.0f;			// to be used for controls on the left screen half (as we'd need to increase the x value)
	private float sWidth;
	private float sHeight;
	private float itemScale = 1.0f;
	private float rEdgeOffset = 0.0f;
	private float lEdgeOffset = 0.0f;
	
	public GUI_Manager_NGUI gui_Manager_NGUI;
	
	/*
	private Vector2 btnJump_pos;
	private Vector2 btnJuice_pos;
	private Vector2 btnPickup_pos;
	private Vector2 btnSlide_pos;
	private Vector2 btnPause_pos;
	*/
	/*
	void updateSlidebar()
	{
		slideTL.updateTransform();
		slideML.updateTransform();
		slideBL.updateTransform();
		
		slideTR.updateTransform();
		slideMR.updateTransform();
		slideBR.updateTransform();
		
		slideT.updateTransform();
		slideM.updateTransform();
		slideB.updateTransform();
	}
	*/
		// update all buttons for screen update
	void updateHUD()
	{
		sprite_juiceFill.updateTransform();
		sprite_juice.updateTransform();
		sprite_pickup.updateTransform();
		sprite_jump.updateTransform();
		sprite_posField.updateTransform();			
		//sprite_Minimap.updateTransform();
		sprite_pause.updateTransform();
		sprite_virus.updateTransform();
		sprite_reticleOuter.updateTransform();
		sprite_reticleMid.updateTransform();
		sprite_reticleInner.updateTransform();
		sprite_badges.updateTransform();
		sprite_frame.updateTransform();
		sprite_strike.updateTransform();
		sprite_hitInfo.updateTransform();
		sprite_botInfo.updateTransform();
					
			// Text sprites (new)
		sprite_Lap.updateTransform();
		sprite_currLap.updateTransform();
		sprite_slash.updateTransform();
		sprite_allLaps.updateTransform();
					
		sprite_pos.updateTransform();
		sprite_ord.updateTransform();
				
		sprite_warning.updateTransform();
		spriteVirusWarning.updateTransform();
				
		// animText.updateTransform();
					
	}
	
		// format seconds to correct mm:ss.msmsms
	private string formatTime (float inTime)
	{
		
		string outVal;
		int tmpInt;
		float restSeconds;
		
			// get our minutes
		tmpInt = (int)(inTime / 60);
		restSeconds = (inTime % 60);
		
			// add leading zeros
		if (tmpInt < 10)
		{
			outVal = ("0" + tmpInt.ToString() + ":");
		}
		else
		{
			outVal = (tmpInt.ToString() + ":");
		}
		
			// add leading zero for seconds
		if(restSeconds < 10)
		{
			//outVal = (outVal + "0" + restSeconds.ToString());
			outVal = (outVal + "0" + string.Format("{0:F3}",restSeconds) );
		}
		else
		{
			//outVal = (outVal + restSeconds.ToString());
			outVal = (outVal + string.Format("{0:F3}",restSeconds));
		}
		
		return outVal;
	}
	
	
	void Start()
	{

		sWidth = Screen.width;
		sHeight = Screen.height;
		
			
			// Check if we are on iPad (so we can scale down our controls)
		invScreenRatio = (sWidth / sHeight) / 1.5f;
		if (invScreenRatio < 1f)
		{
			itemScale = 0.75f;
		}
		
		lEdgeOffset = (480 - (480 * invScreenRatio)) / 2;
		rEdgeOffset = 480 - lEdgeOffset;
		

#if USING_UITOOLKIT
			// test text from different atlas
		screenText = new SamUIText( textToolkit, "menuFontP", "menuFont_prototype.png");
#endif

		// txTouchContinue = screenText.addTextInstance( "touch screen to continue", SamUIRelative.xPixelsFrom( SamUIxAnchor.Left, (int) (sWidth/2)), SamUIRelative.yPixelsFrom( SamUIyAnchor.Bottom, 10 ), 0.4f, -18, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Bottom);
		

		#region initial Stuff
			// first create our HUD Panels that we can parent everything under ...
		HUD_root = new SamUIObject();
		HUD_MidAnchor = new SamUIObject();
		HUD_Anchor = new SamUIObject();
		HUD_JuiceFill = new SamUIObject();
		HUD_MinimapRoot = new SamUIObject();
		
		
			// create cornerAnchors
		HUD_TL = new SamUIObject();
		HUD_TR = new SamUIObject();
		
		Frame_TL = new SamUIObject();
		Frame_TR = new SamUIObject();
		
		HUD_BL = new SamUIObject();
		HUD_BR = new SamUIObject();
		HUD_BC = new SamUIObject();
		
		HUD_TL_Anchor = new SamUIObject();
		HUD_TR_Anchor = new SamUIObject();
		HUD_BL_Anchor = new SamUIObject();
		HUD_BC_Anchor = new SamUIObject();
		HUD_BR_Anchor = new SamUIObject();
		
			// parent and position panels
		HUD_MidAnchor.localPosition = new Vector3(240f, -160f, 0f);
		HUD_JuiceFill.localPosition = new Vector3(63f, -302f, 0f);
		
		HUD_TR.localPosition = new Vector3(480f, 0f, 0f);
		HUD_BL.localPosition = new Vector3(0f, -320f, 0f);
		
		Frame_TR.localPosition = new Vector3(480f, 0f, 0f);
		
		HUD_BR.localPosition = new Vector3(480f, -320f, 0f);
		HUD_BC.localPosition = new Vector3(240f, -320f, 0f);
		
		HUD_MidAnchor.parentSamUIObject = HUD_root;
		HUD_Anchor.parentSamUIObject = HUD_MidAnchor;
		HUD_TL.parentSamUIObject = HUD_Anchor;
		HUD_TR.parentSamUIObject = HUD_Anchor;
		HUD_BL.parentSamUIObject = HUD_Anchor;
		HUD_BC.parentSamUIObject = HUD_Anchor;
		HUD_BR.parentSamUIObject = HUD_Anchor;
		
		HUD_TL_Anchor.parentSamUIObject = HUD_TL;
		HUD_TR_Anchor.parentSamUIObject = HUD_TR;
		HUD_BL_Anchor.parentSamUIObject = HUD_BL;
		HUD_BC_Anchor.parentSamUIObject = HUD_BC;
		HUD_BR_Anchor.parentSamUIObject = HUD_BR;
		
		HUD_JuiceFill.parentSamUIObject = HUD_BL_Anchor;
		HUD_MinimapRoot.parentSamUIObject = HUD_TR_Anchor;
		
		HUD_root.parent = virusDistort;
		
		#endregion initial Stuff
		
			// setup our text instance which will parse our .fnt file and allow us to
		// text = new SamUIText( "prototype", "prototype.png" );
		// text.alignMode = SamUITextAlignMode.Center;
		
		


			// !!!
			// add our Pickup Button
		#region pickupButton create		
		sprite_pickup = hudToolkit.addSprite(pickupItems[1], 15, 200, pickupDepth );		// create sprite
		sprite_pickup.localScale = new Vector3(0.5f, 0.5f, 0.5f);							// set correct scale
		sprite_pickup.parentSamUIObject = HUD_BL_Anchor;										// set the parent
			
			// init our sprites
		for (var i = 0; i < pickupItems.Length; i++)
		{
			uvRect_pickup[i] = sprite_pickup.manager.uvRectForFilename( pickupItems[i] ); 		// set initial rect
		}

			// move out of the way initially
		sprite_pickup.localPosition = new Vector3(15, -20000, pickupDepth);
		#endregion pickupButton create
		
			// !!!
			// add screenflash
		#region flash create	
			
		sprite_flash = hudToolkit.addSprite( "HUD_flash025.png", -50, -50, 1 );				// create sprite
		sprite_flash.localScale = new Vector3(26f, 26f, 1f);									// set correct scale
					
			// init our sprites
		for (var i = 0; i < flashStates.Length; i++)
		{
			uvRect_flash[i] = sprite_flash.manager.uvRectForFilename( flashStates[i] ); 		// set initial rect
		}

			// move out of the way initially
		sprite_flash.position = new Vector3(-50, -20000, 1);
		#endregion flash create
		
			// !!!
			// add our juice button
		#region juiceButton create		
			// calc out button Pos
			// since we have a left side ctl, we don't need to calc from centerline, but take scaling into account as first pixels are not visible:
			//                   	firstInvisPixels         + spaceFromLeftScaled
		//btnJuice_pos = new Vector2(( (400f - (400f * invScreenRatio)) + (45f * invScreenRatio)),(260f + ((128f * 0.4f) - (128f * 0.4f * itemScale))));
		
		sprite_juice = hudToolkit.addSprite(juiceStates[1], 45, 260, juiceDepth );		// create sprite
		sprite_juice.localScale = new Vector3(0.5f, 0.5f, 1f);								// set correct scale
		sprite_juice.parentSamUIObject = HUD_BL_Anchor;
		//sprite_juice.localPosition = new Vector3(btnJuice_pos.x, -btnJuice_pos.y, juiceDepth);
		
			// init our sprites
		for (var i = 0; i < juiceStates.Length; i++)
		{
			uvRect_juice[i] = sprite_juice.manager.uvRectForFilename( juiceStates[i] ); 		// set initial rect
		}

			// create the filler
		sprite_juiceFill = hudToolkit.addSprite("HUD_JuiceFill.png", 53, 263, juiceFillDepth );		// create sprite
		sprite_juiceFill.localScale = new Vector3(0.5f, 0.5f, 1f);										// set correct scale
		//sprite_juiceFill.centerize();																		// centerize

		sprite_juiceFill.parentSamUIObject = HUD_JuiceFill;
		sprite_juiceFill.localPosition = new Vector3(0,26,juiceFillDepth);
			
			// move out of the way initially
		// sprite_pickup.position = new Vector3(15, -20000, pickupDepth);
		#endregion juiceButton create
		
			// !!!
			// add Jump button
		#region JumpButton
		
		sprite_jump = hudToolkit.addSprite("HUD_jumpNormal.png", 393, 222, 10);					// create sprite
		sprite_jump.localScale = new Vector3(0.5f, 0.5f, 1.0f);		// set correct scale
		sprite_jump.parentSamUIObject = HUD_BR_Anchor;												// set the parent
		//sprite_jump.localPosition = new Vector3( 393, -222, 10);				// get into screen space
		#endregion JumpButton

			// !!!
			// add slide bar
		#region slidebar
			// create Object
		sprite_slide = new SamUIObject();
		
			// parent and place object
		sprite_slide.parentSamUIObject = HUD_BC_Anchor;
		sprite_slide.localPosition = new Vector3(110f, -232f, 10);
		
			// left side
		var slideTL = hudToolkit.addSprite( "HUD_slidebarTL.png", 110, 232, 10);
			slideTL.parentSamUIObject = sprite_slide;
		var slideML = hudToolkit.addSprite("HUD_slidebarML.png", 110, 238, 10);
			slideML.parentSamUIObject = sprite_slide;
		var slideBL = hudToolkit.addSprite( "HUD_slidebarBL.png", 110, 290, 10);
			slideBL.parentSamUIObject = sprite_slide;
		
			// stuff to scale
		var slideT = hudToolkit.addSprite("HUD_slidebarT.png", 116, 232, 10);
			slideT.localScale = new Vector3(248f/52f, 1f, 1f);
			slideT.parentSamUIObject = sprite_slide;
		var slideM = hudToolkit.addSprite("HUD_slidebarM.png", 116, 238, 10);
			slideM.localScale = new Vector3(248f/52f, 1f, 1f);
			slideM.parentSamUIObject = sprite_slide;
		var slideB = hudToolkit.addSprite("HUD_slidebarB.png", 116, 290, 10);
			slideB.localScale = new Vector3(248f/52f, 1f, 1f);
			slideB.parentSamUIObject = sprite_slide;
		
			// right side
		var slideMR = hudToolkit.addSprite("HUD_slidebarMR.png", 364, 238, 10);
			slideMR.parentSamUIObject = sprite_slide;
		var slideTR = hudToolkit.addSprite("HUD_slidebarTR.png", 364, 232, 10);
			slideTR.parentSamUIObject = sprite_slide;
		var slideBR = hudToolkit.addSprite( "HUD_slidebarBR.png", 364, 290, 10);
			slideBR.parentSamUIObject = sprite_slide;
			
			// reposition
		sprite_slide.localPosition = new Vector3(110f, -252f, 10);
		
		#endregion slidebar
		
			// !!!
			// add Warning Handler
		#region warning message
		
			// create initial Message
		sprite_warning = hudText.addSprite(warnings[0], 0, 0, 1 );		// create sprite
		sprite_warning.centerize();												// move pivot in center
		sprite_warning.parent = flashWarning;
		sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
		sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
			// init our warning sprites
		for (var i = 0; i < warnings.Length; i++)
		{
			uvRect_warnings[i] = sprite_warning.manager.uvRectForFilename( warnings[i] ); 		// set initial rect
		}
			// hide initially
		sprite_warning.localPosition = new Vector3 (0f, -2000f, 0f);
		
		#endregion warning message
	
			// !!!
			// add Pos/Lap Stuff
		#region pos lap stuff init
		
			// pos field
		sprite_posField = hudToolkit.addSprite( "HUD_posField.png", 2, 2, 20);				// create sprite
		sprite_posField.localScale = new Vector3(0.5f, 0.5f, 0.5f);							// set correct scale
		sprite_posField.parentSamUIObject = HUD_TL_Anchor;											// set the parent
		
			// pos text
		sprite_pos = hudText.addSprite( spriteNumbers[1], 0, 0, 1 );							// create sprite
		sprite_pos.parentSamUIObject = HUD_TL_Anchor;
		sprite_pos.localPosition = new Vector3 (10f, -10f, 10f);
		sprite_pos.localScale = new Vector3 (0.5f, 0.7f, 1f);
			// init our number sprites
		for (var i = 0; i < spriteNumbers.Length; i++)
		{
			uvRect_numbers[i] = sprite_pos.manager.uvRectForFilename( spriteNumbers[i] ); 		// set initial rect
		}
		
			// ord text
		sprite_ord = hudText.addSprite( spriteOrd[1], 0, 0, 1 );							// create sprite
		sprite_ord.parentSamUIObject = HUD_TL_Anchor;
		sprite_ord.localPosition = new Vector3 (40f, -12f, 10f);
		sprite_ord.localScale = new Vector3 (0.5f, 0.5f, 1f);
			// init our Ordinal sprites
		for (var i = 0; i < spriteOrd.Length; i++)
		{
			uvRect_ord[i] = sprite_ord.manager.uvRectForFilename( spriteOrd[i] ); 		// set initial rect
		}
			// lap text
		sprite_Lap = hudText.addSprite( "Lap.png", 0, 0, 1 );										// create sprite
		sprite_Lap.parentSamUIObject = HUD_TL_Anchor;
		sprite_Lap.localPosition = new Vector3 (75f, -5f, 10f);
		sprite_Lap.localScale = new Vector3 (.5f, .5f, 1f);
		
		sprite_currLap = hudText.addSprite(spriteNumbers[1], 0, 0, 1 );							// create sprite
		sprite_currLap.parentSamUIObject = HUD_TL_Anchor;
		sprite_currLap.localPosition = new Vector3 (150f, -5f, 10f);
		sprite_currLap.localScale = new Vector3 (.5f, .5f, 1f);
		
		sprite_slash = hudText.addSprite(spriteNumbers[10], 0, 0, 1 );								// create sprite
		sprite_slash.parentSamUIObject = HUD_TL_Anchor;
		sprite_slash.localPosition = new Vector3 (180f, -5f, 10f);
		sprite_slash.localScale = new Vector3 (.5f, .5f, 1f);
		
		sprite_allLaps = hudText.addSprite(spriteNumbers[3], 0, 0, 1 );							// create sprite
		sprite_allLaps.parentSamUIObject = HUD_TL_Anchor;
		sprite_allLaps.localPosition = new Vector3 (210f, -5f, 10f);
		sprite_allLaps.localScale = new Vector3 (.5f, .5f, 1f);
		
		#endregion pos lap stuff init

			// !!!
			// add minimap graphics
		#region minimap init
			
			// Map field
		//sprite_Minimap = hudToolkit.addSprite("HUD_minimapMilitary.png", 346, 11, 20);				// create sprite
		//sprite_Minimap.localScale = new Vector3(0.5f, 0.5f, 0.5f);											// set correct scale
		//sprite_Minimap.parentSamUIObject = HUD_TR_Anchor;															// set the parent
			
			// Minimap Anchor
		HUD_MinimapRoot.localPosition = new Vector3(412f, -70f, 15f);
		HUD_MinimapRoot.localScale = new Vector3(0.5f, 0.5f, 1f);
		
			// enemies
		
		for (var i = 0; i < guiFlags.numBots; i++)
		{
			sprite_Enemy[i] = hudToolkit.addSprite("HUD_minimapEnemy.png", 350, -2, 7);					// create sprite
			sprite_Enemy[i].parentSamUIObject = HUD_MinimapRoot;													// set the parent
			sprite_Enemy[i].localScale = new Vector3(0.5f, 0.5f, 0.5f);											// set correct scale
			sprite_Enemy[i].localPosition = new Vector3(0f, -2000f, 7f);										// set correct pos
		}
		
		
		sprite_Player = hudToolkit.addSprite("HUD_minimapPlayer.png", 350, -2, 5);					// create sprite
		sprite_Player.parentSamUIObject = HUD_MinimapRoot;														// set the parent
		sprite_Player.localScale = new Vector3(0.5f, 0.5f, 0.5f);											// set correct scale
		sprite_Player.localPosition = new Vector3(0f, -2000f, 5f);											// set correct scale
		
	
		

		#endregion minimap init
		
			// !!!
			// add pause button
		#region pause init
		
			// pause button
		sprite_pause = hudToolkit.addSprite("HUD_pauseNormal.png", 42, 46, 10);						// create sprite
		sprite_pause.localScale = new Vector3(0.5f, 0.5f, 0.5f);											// set correct scale
		sprite_pause.parentSamUIObject = HUD_TL_Anchor;															// set the parent
			
		
		#endregion pause init
		
			// !!!
			// add hitIcons
		#region hitIcons init
		sprite_strike = hudText.addSprite("strike_Frame.png", 240, 3, 0);						// create sprite
		sprite_strike.localScale = new Vector3(0.66666f, 0.66666f, 1.0f);								// set correct scale was .5
		sprite_strike.parentSamUIObject = Frame_TR;

			// create hitIcon
		sprite_hitInfo = hudToolkit.addSprite(pickupItems[1], 247, 8, 10 );				// create sprite
		sprite_hitInfo.localScale = new Vector3(0.4f, 0.4f, 1f);								// set correct scale
		sprite_hitInfo.parentSamUIObject = sprite_strike;												// set the parent

			// move out of the way initially
		//sprite_hitInfo.position = new Vector3(265, -20002, 10);
		
			// create botIcon
		sprite_botInfo = hudToolkit.addSprite(botStates[1], 300, 12, 10 );		// create sprite
		sprite_botInfo.localScale = new Vector3(0.5f, 0.5f, 1f);								// set correct scale
		sprite_botInfo.parentSamUIObject = sprite_strike;												// set the parent
			
			// move frame out of the way initially
		sprite_strike.localPosition = new Vector3(-240, -20003, 0);
		
			// init our sprites
		for (var i = 0; i < botStates.Length; i++)
		{
			uvRect_botInfo[i] = sprite_botInfo.manager.uvRectForFilename( botStates[i] ); 		// set initial rect
		}

			// move out of the way initially
		// sprite_botInfo.position = new Vector3(306, -20002, 10);

		#endregion hitIcons init
		
		#region badge show
		
			// add badge frame
		sprite_frame = hudText.addSprite("badge_Frame.png", 138, 50, 0);					// create sprite
		sprite_frame.localScale = new Vector3(0.66666f, 0.66666f, 1.0f);								// set correct scale was .5
		sprite_frame.parentSamUIObject = Frame_TL;
		
		// create badgeIcon
		// sprite_badges = hudToolkit.addSprite(badgeStates[0], 306, 70, 10 );				// create sprite
		sprite_badges = hudToolkit.addSprite(badgeStates[0], 155, 60, 10 );				// create sprite
		sprite_badges.localScale = new Vector3(0.5f, 0.5f, 1f);							// set correct scale
		sprite_badges.parentSamUIObject = sprite_frame;									// set the parent

			// move out of the way initially
		//sprite_badges.position = new Vector3(210, -20002, 10);
		sprite_frame.localPosition = new Vector3(5, -200090, 0);
			// init our sprites
		for (var i = 0; i < badgeStates.Length; i++)
		{
			uvRect_badges[i] = sprite_badges.manager.uvRectForFilename( badgeStates[i] ); 		// set initial rect
		}

		
		#endregion badge show
		
		#region reticle planes
		
		
			// create reticle planes
		sprite_reticleOuter = hudToolkit.addSprite("HUD_reticleOuter.png", 0, 0, 1);
		sprite_reticleMid = hudToolkit.addSprite("HUD_reticleMid.png", 0, 0, 1);
		sprite_reticleInner = hudToolkit.addSprite("HUD_reticleInner.png", 0, 0, 1);
		
		sprite_reticleOuter.centerize();
		sprite_reticleMid.centerize();
		sprite_reticleInner.centerize();
		
		sprite_reticleOuter.parent = reticleOuter;
		sprite_reticleMid.parent = reticleMover;
		sprite_reticleInner.parent = reticleInner;
		
		sprite_reticleOuter.localScale = new Vector3(0.5f, 0.5f, 1f);
		sprite_reticleMid.localScale = new Vector3(0.5f, 0.5f, 1f);
		sprite_reticleInner.localScale = new Vector3(0.5f, 0.5f, 1f);
		
		sprite_reticleOuter.localPosition = new Vector3(0, 0, 0);
		sprite_reticleMid.localPosition = new Vector3(0, 0, 0);
		sprite_reticleInner.localPosition = new Vector3(0, 0, 0);
		
		#endregion reticle planes
		
					
			// !!
			// add virus plane
		#region virus plane
		
		sprite_virus = hudToolkit.addSprite("HUD_VirusEffekt.png", -60, -800, 5);			// create sprite
		sprite_virus.parent = virusEffekt;														// set the parent
		sprite_virus.localScale = new Vector3(0.5f, 0.5f, 1f);									// set correct scale
		sprite_virus.localPosition = new Vector3 (0f, 0f, 0f);
		
		
		#endregion virus plane
		
			// !!!
			// add our Virus Message
		#region virus message
			
			// init stuff
		spriteVirusWarning = hudText.addSprite(warnings[6], 0, 0, 1 );		// create sprite;
		spriteVirusWarning.centerize();													// move pivot in center
		spriteVirusWarning.parent = flashAnim;
		spriteVirusWarning.localPosition = new Vector3 (0f, 0f, 1f);
		spriteVirusWarning.localScale = new Vector3 (2.5f, 2.5f, 1f);
		
			// hide initially
		spriteVirusWarning.localPosition = new Vector3 (0f, -2000f, 0f);
		
		#endregion virus message
		
		#region HUD placement
		
			// Now Finally place and scale our corners ...
		HUD_TL.localPosition = new Vector3(lEdgeOffset, 0f, 0f);
		HUD_TR.localPosition = new Vector3(rEdgeOffset, 0f, 0f);
		
		Frame_TL.localPosition = new Vector3(lEdgeOffset, 0f, 0f);
		Frame_TR.localPosition = new Vector3(rEdgeOffset, 0f, 0f);
		
		HUD_BL.localPosition = new Vector3(lEdgeOffset, -320f, 0f);
		HUD_BR.localPosition = new Vector3(rEdgeOffset, -320f, 0f);
		//HUD_BC.localPosition = new Vector3(240f, -320f, 0f);
		
		HUD_TL.localScale = new Vector3(itemScale, itemScale, 1f);
		HUD_TR.localScale = new Vector3(itemScale, itemScale, 1f);
		
		Frame_TL.localScale = new Vector3(itemScale, itemScale, 1f);
		Frame_TR.localScale = new Vector3(itemScale, itemScale, 1f);
		
		HUD_BL.localScale = new Vector3(itemScale, itemScale, 1f);
		HUD_BR.localScale = new Vector3(itemScale, itemScale, 1f);
		HUD_BC.localScale = new Vector3(itemScale, itemScale, 1f);
		
			//reinit slidebar
		slideTL.updateTransform();
		slideML.updateTransform();
		slideBL.updateTransform();
		slideT.updateTransform();
		slideM.updateTransform();
		slideB.updateTransform();
		slideTR.updateTransform();
		slideMR.updateTransform();
		slideBR.updateTransform();
		
		#endregion HUD placement
		
	}
	

	// Add a function for creating a sliced sprite -> Will need to add all slices as seperate textures to Atlas file
	
	void Update()
	{
#if USING_UITOOLKIT
		float tabA = 80f;
		float tabB = 220f;
		float tabC = 260f;
		float tabD = 300f;
#endif
			
		
		switch (guiFlags.activeMenu)
		{
				// Case 0 -> HUD
			#region CASE 0
			case 0:
					// remove text if still there
				if (lastMenu == 1 || lastMenu == 2)
				{
					lastMenu = 0;
#if USING_UITOOLKIT
					txTouchContinue.destroy();
#endif
					gui_Manager_NGUI.CloseAllMenu();
				}
			
					// !!!
					// pickup Button handling (Region)
				#region pickupButton Handling Code
				if (guiFlags.pickupChanged)
				{
			
					switch (guiFlags.pickupType)
					{
						case 0:
									// Change the sprite and reset the flag
								guiFlags.pickupChanged = false;
						
									// hide Button
								sprite_pickup.localPosition = new Vector3(15, -20000, pickupDepth);
						
							break;
						
						case 1:
									// Change the sprite and reset the flag
								sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
								guiFlags.pickupChanged = false;
		
										// show button
								sprite_pickup.localPosition = new Vector3(15, -200, pickupDepth);
							break;
						
						case 2:
									// Change the sprite and reset the flag
								sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
								guiFlags.pickupChanged = false;
		
									// show button
								sprite_pickup.localPosition = new Vector3(15, -200, pickupDepth);
							break;
						
						case 4:
									// Change the sprite and reset the flag
								sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
								guiFlags.pickupChanged = false;
						
									// show button
								sprite_pickup.localPosition = new Vector3(15, -200, pickupDepth);
							break;
						
						case 5:
									// Change the sprite and reset the flag
								sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
								guiFlags.pickupChanged = false;
						
									// show button
								sprite_pickup.localPosition = new Vector3(15, -200, pickupDepth);
							break;
						
						case 6:
									// Change the sprite and reset the flag
								sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
								guiFlags.pickupChanged = false;
		
									// show button
								sprite_pickup.localPosition = new Vector3(15, -200, pickupDepth);
							break;
						
						case 7:
									// Change the sprite and reset the flag
								sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
								guiFlags.pickupChanged = false;
		
									// show button
								sprite_pickup.localPosition = new Vector3(15, -200, pickupDepth);
							break;
						
						case 8:
									// Change the sprite and reset the flag
								sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
								guiFlags.pickupChanged = false;
		
									// show button
								sprite_pickup.localPosition = new Vector3(15, -200, pickupDepth);
							break;
						
						case 9:
									// Change the sprite and reset the flag
								sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
								guiFlags.pickupChanged = false;
		
									// show button
								sprite_pickup.localPosition = new Vector3(15, -200, pickupDepth);
							break;
					}
				}	
				#endregion PickupButton Handling Code
				
					// !!!
					// screen flash handling
				#region flash handling
				
				if (guiFlags.flashChanged)
				{
					flashActive = true;
					guiFlags.flashChanged = false;
					
					nextStep = Time.time;
					currState = 0;
				}
		
				if (flashActive)
				{
		
					if (Time.time >= nextStep)
					{
							// set the next progress step
						nextStep = Time.time + (1/fps);
		
							// Handle the animation
						if(currState == 0)
						{
							sprite_flash.localPosition = new Vector3(-50, 50, 1);
								
								// set the animation
							sprite_flash.uvFrame = uvRect_flash[0];
							currState++;
						}
						else if(currState == numStates)
						{
							sprite_flash.localPosition = new Vector3(-50, -2000, 1);
							
								// stop the animation
							currState = 0;
							flashActive = false;
						}
						else
						{
								// set the animation
							sprite_flash.uvFrame = uvRect_flash[currState];
							currState++;
						}
					}
		
				}
				
				#endregion flash handling
				
					// !!!
					// Juice Button code
				#region juiceButton Handling Code
				
					// Juice Filler code
					// Do processing ONLY if not full
				if (guiFlags.juiceLeft < guiFlags.juiceFull)
				{
						// if not in view, move the scaler here
					if(guiFlags.juiceCharged)
					{
						guiFlags.juiceCharged = false;
						HUD_JuiceFill.localPosition = new Vector3 (63f, -302f, juiceFillDepth);
						
							// init a texture change
						guiFlags.juiceChanged = true;
					}
				
						// calc the scale
					float fillScale = guiFlags.juiceLeft / guiFlags.juiceFull;
					
						// Loadinfo up this up
					HUD_JuiceFill.localScale = new Vector3(1f, fillScale, 1f);
				}
				else
				{
						// we're full. Move the scaler out ...
					if(!guiFlags.juiceCharged)
					{
						guiFlags.juiceCharged = true;
						HUD_JuiceFill.localPosition = new Vector3(63f, -2000f, juiceFillDepth);
						
							// init a texture change
						guiFlags.juiceChanged = true;
					}
				}
				
					// Only change sprite if something has changed
				if (guiFlags.juiceChanged)
				{
					if (guiFlags.juiceCharged)
					{
							// Change the sprite and reset the flag
						sprite_juice.uvFrame = uvRect_juice[0];
						guiFlags.juiceChanged = false;
					}
					else
					{
							// Change the sprite and reset the flag
						sprite_juice.uvFrame = uvRect_juice[1];
						guiFlags.juiceChanged = false;
					}
				}
				#endregion juiceButton Handling Code
					
					// !!!
					// Warning Message handling
				#region warning handling
		
					// Handle timer (so that warning is removed)
				if (warningActive)
				{
						// if warning is active handle exit timer
					if (Time.time > warningExit)
					{
						guiFlags.warningChanged = true;
						guiFlags.warningType = 0;
					}
				}
		
					// Only change sprite if something has changed
				if (guiFlags.warningChanged)
				{
						// set warning to active (unless we deactivate)
					warningActive = true;
					warningExit = Time.time + guiFlags.warningTime;
					
						// now check the stuff needed
					switch (guiFlags.warningType)
					{
						case 0:
									// deactivate warning
								sprite_warning.uvFrame = uvRect_warnings[guiFlags.warningType];
								sprite_warning.localPosition = new Vector3 (0f, -2000f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
								
								guiFlags.warningChanged = false;	
								warningActive = false;
									
									// Stop animation
								// warningAnim.Stop();
							break;
						
						case 1:
									// warning Message
								sprite_warning.uvFrame = uvRect_warnings[0];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
									
									// Start animation
								// warningAnim.Play();
							break;
						
						case 2:
									// warning Message
								sprite_warning.uvFrame = uvRect_warnings[1];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
						
									// Start animation
								// warningAnim.Play();
							break;
						
						case 3:
									// warning Message
								sprite_warning.uvFrame = uvRect_warnings[2];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
						
									// Start animation
								//warningAnim.Play();
							break;
						
						case 4:
									// warning Message
								sprite_warning.uvFrame = uvRect_warnings[3];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
						
									// Start animation
								// warningAnim.Play();
							break;
						
						case 5:
									// warning Message
								sprite_warning.uvFrame = uvRect_warnings[6];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
						
									// Start animation
								// warningAnim.Play();
							break;
						
						case 6:
									// warning Message
								sprite_warning.uvFrame = uvRect_warnings[5];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
						
									// Start animation
								// warningAnim.Play();
							break;
						
						case 7:
									// warning Message
								sprite_warning.uvFrame = uvRect_warnings[4];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
						
									// Start animation
								// warningAnim.Play();
							break;
						case 8:
									// warning Message (Leader Shot)
								sprite_warning.uvFrame = uvRect_warnings[7];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
									
									// Start animation
								// warningAnim.Play();
							break;
						case 9:
									// autopilot
								sprite_warning.uvFrame = uvRect_warnings[8];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
									
									// Start animation
								// warningAnim.Play();
							break;
						case 10:
									// virus evaded
								sprite_warning.uvFrame = uvRect_warnings[9];
								sprite_warning.localPosition = new Vector3 (0f, 0f, 0f);
								sprite_warning.localScale = new Vector3 (2f, 2f, 1f);
		
								guiFlags.warningChanged = false;
									
									// Start animation
								// warningAnim.Play();
							break;
					}
						
				}
		
				#endregion warning handling
				
					// !!!
					// Virus message handling
				#region virus msg handling
		
					// Handle timer (so that warning is removed)
				if (virusWarningActive)
				{
						// if warning is active handle exit timer
					if (Time.time > guiFlags.virusWarningExit)
					{
							// add break
						if (guiFlags.virusState < 2)
						{
								// advance
							guiFlags.virusState = 2;
							guiFlags.virusWarningExit = Time.time + messageTwo;
							
								// adjust message
							spriteVirusWarning.uvFrame = uvRect_warnings[5];
							spriteVirusWarning.localPosition = new Vector3 (0f, -2000f, 0f);
							spriteVirusWarning.localScale = new Vector3 (2f, 2f, 1f);
		
						}
						else if (guiFlags.virusState < 3)
						{
								// final message
							guiFlags.virusState = 3;
							guiFlags.virusWarningExit = Time.time + messageThree;
							
								// adjust message
							spriteVirusWarning.uvFrame = uvRect_warnings[5];
							spriteVirusWarning.localPosition = new Vector3 (0f, 0f, 0f);
							spriteVirusWarning.localScale = new Vector3 (2f, 2f, 1f);
						}
						else
						{
								// disable
							guiFlags.virusState = 0;
							virusWarningActive = false;
							
								// adjust message
							spriteVirusWarning.uvFrame = uvRect_warnings[5];
							spriteVirusWarning.localPosition = new Vector3 (0f, -2000f, 0f);
							spriteVirusWarning.localScale = new Vector3 (2f, 2f, 1f);
							
							// sprite Plane
							sprite_virus.localScale = new Vector3(0.5f, 0.5f, 1f);									// set correct scale
							sprite_virus.localPosition = new Vector3 (0f, 0f, 50f);
							
								// Stop animation
							// warningAnim.Stop();
							
								// reset changing HUD stuff
							guiFlags.pickupChanged = true;
							guiFlags.juiceChanged = true;
						}
					}
				}
				
					// Only change sprite if something has changed
				if (guiFlags.virusChanged)
				{
						// set warning to active (unless we deactivate)
					virusWarningActive = true;
					guiFlags.virusWarningExit = Time.time + messageOne;
					guiFlags.virusState = 1;
					
						// set first message
					spriteVirusWarning.uvFrame = uvRect_warnings[6];
					spriteVirusWarning.localPosition = new Vector3 (0f, 0f, 0f);
					spriteVirusWarning.localScale = new Vector3 (2f, 2f, 1f);
					
						// set plane size
					sprite_virus.localScale = new Vector3(3f, 3f, 1f);									// set correct scale
					sprite_virus.localPosition = new Vector3 (100f, -200f, 50f);
					
					guiFlags.virusChanged = false;
									
						// Start animation
					// warningAnim.Play();
					
						// start HUD distort anim
					virusAnim.Play("virus");
		
						
				}
				#endregion virus msg handling
					
					// !!!
					// Pos and Lap handling
				#region pos Lap handling
				
					// position handling
				if (guiFlags.placeChanged)
				{
						// adjust pos number
					sprite_pos.uvFrame = uvRect_numbers[guiFlags.placeCurr];							// change sprite
					//sprite_pos.localPosition = new Vector3 (38f, 5f, 10f);
					//sprite_pos.localScale = new Vector3 (0.8f, 1f, 1f);
					
						// adjust the ordinal
					if (guiFlags.placeCurr < 4)
					{
						sprite_ord.uvFrame = uvRect_ord[guiFlags.placeCurr - 1];
					}
					else
					{
						sprite_ord.uvFrame = uvRect_ord[3];
					}
		
						// reset flag
					guiFlags.placeChanged = false;	
					
					doUpdate = true;
				}
				
					// Lap handling
				if (guiFlags.lapChanged)
				{
						// Adjust the current lap display
					sprite_currLap.uvFrame = uvRect_numbers[guiFlags.lapCurr];
					
						// Adjust the all laps display
					sprite_allLaps.uvFrame = uvRect_numbers[guiFlags.lapCount];
					
						// reset flag
					guiFlags.lapChanged = false;	
					
					doUpdate = true;
				}
				
				#endregion pos lap handling
		
										// !!!
					// badge Info handling
				#region badge info handling
				
				if (guiFlags.badgeChanged)
				{
						// Handle Bot Icons
					if (guiFlags.badgeType == 99)
					{
							// hide icon306, 70
						sprite_frame.localPosition = new Vector3(5, -20090, 0);
						guiFlags.badgeChanged = false;
						badgeVis = false;
					}
					else
					{
							// show stuff icon
						sprite_frame.localPosition = new Vector3(5, -90, 0);
						sprite_badges.uvFrame = uvRect_badges[(guiFlags.badgeType)];
					
							// handle Timer
						badgeVis = true;
						guiFlags.badgeChanged = false;
						badgeTimer = Time.time + badgeInterval;
					}
				}
				
					// timer to fade out stuff
				if (badgeVis)
				{
					if (Time.time > badgeTimer)
					{
							// set to remove info
						guiFlags.badgeType = 99;
						guiFlags.badgeChanged = true;
						badgeVis = false;
					}
				}
			
				#endregion badge info handling
			
			
					// !!!
					// hit Info handling
				#region hit info handling
				
				if (guiFlags.hitChanged)
				{
						// now check the stuff needed
					switch (guiFlags.hitWeapon)
					{
						case 0:
									// hide icon
								guiFlags.hitChanged = false;
								hitVis = false;
							break;
						
						case 1:
									// show Icon
								sprite_hitInfo.uvFrame = uvRect_pickup[guiFlags.hitWeapon];
												
								guiFlags.hitChanged = false;
								
									// handle Timer
								hitVis = true;
								hitTimer = Time.time + hitInterval;
							break;
						
						case 2:
									// show Icon
								sprite_hitInfo.uvFrame = uvRect_pickup[guiFlags.hitWeapon];
						
								guiFlags.hitChanged = false;
						
									// handle Timer
								hitVis = true;
								hitTimer = Time.time + hitInterval;					
							break;
						
						case 4:
									// show Icon
								sprite_hitInfo.uvFrame = uvRect_pickup[guiFlags.hitWeapon];
						
								guiFlags.hitChanged = false;
						
									// handle Timer
								hitVis = true;
								hitTimer = Time.time + hitInterval;
							break;
						
						case 6:
									// show Icon
								sprite_hitInfo.uvFrame = uvRect_pickup[guiFlags.hitWeapon];
						
								guiFlags.hitChanged = false;
						
									// handle Timer
								hitVis = true;
								hitTimer = Time.time + hitInterval;
							break;
						
						case 7:
									// show Icon
								sprite_hitInfo.uvFrame = uvRect_pickup[guiFlags.hitWeapon];
						
								guiFlags.hitChanged = false;
						
									// handle Timer
								hitVis = true;
								hitTimer = Time.time + hitInterval;
							break;
					
						case 9:
									// show Icon
								sprite_hitInfo.uvFrame = uvRect_pickup[guiFlags.hitWeapon];
						
								guiFlags.hitChanged = false;
						
									// handle Timer
								hitVis = true;
								hitTimer = Time.time + hitInterval;
							break;
					}
					
						// Handle Bot Icons
					if (guiFlags.hitBot == 0)
					{
							// hide icon
						//sprite_botInfo.position = new Vector3(306, -20002, 10);	
						sprite_strike.localPosition = new Vector3(-240, -20003, 0);
					}
					else
					{
							// show stuff icon
						//sprite_botInfo.position = new Vector3(306, -2, 10);
						sprite_strike.localPosition = new Vector3(-240, -3, 0);
						sprite_botInfo.uvFrame = uvRect_botInfo[(guiFlags.hitBot - 1)];
					}
				}
				
					// timer to fade out stuff
				if (hitVis)
				{
					if (Time.time > hitTimer)
					{
							// set to remove info
						guiFlags.hitBot = 0;
						guiFlags.hitWeapon = 0;
						guiFlags.hitChanged = true;
						hitVis = false;
					}
				}
				
				#endregion hit info handling
				
					// !!!
					// minimap handling
				#region minimap handling
				
					// adjust stuff
				sprite_Player.localPosition = new Vector3( (((playerTrns.position.z) * guiFlags.minimapMulti) + guiFlags.horizOffset ), ( -((playerTrns.position.x) * guiFlags.minimapMulti) + guiFlags.vertOffset ), 5);
				
				for (var i = 0; i < guiFlags.numBots; i++)
				{
					sprite_Enemy[i].localPosition = new Vector3( (((botTrns[i].position.z) * guiFlags.minimapMulti) + guiFlags.horizOffset ), ( -((botTrns[i].position.x) * guiFlags.minimapMulti) + guiFlags.vertOffset ), 7);
				}
		
				#endregion minimap handling
				
						// !!!
						// hide transformed controls
				#region transformed hide
				
				if (guiFlags.isTransformed)
				{
					if(!setTransformed)
					{
							// hide the jump button
						sprite_jump.localPosition = new Vector3(393, -2000f, 10);
						
						    // set flag
						setTransformed = true;
						doUpdate = true;
					}
				}
				else
				{
					if(setTransformed)
					{
							// hide the jump button
						sprite_jump.localPosition = new Vector3(393, -222, 10);
						
						    // set flag
						setTransformed = false;
						doUpdate = true;
					}
				}
				#endregion transformed hide
				
				//sprite_slide.localPosition = new Vector3 (10, -30, 10);
				
					// at the end of all stuff update our sprites if needed (update manually or virus active)
				if (guiFlags.menuChanged || doUpdate || virusWarningActive || warningActive || hitVis || badgeVis)
				{
					updateHUD();
						
						// after update set to false
					//doUpdate = false;
					guiFlags.menuChanged = false;
				}
			break;
			#endregion CASE 0
			
				// Case 1 -> Start Pause
			#region CASE 1
			case 1:
						// show touch message
					if (lastMenu == 0)
					{
#if USING_UITOOLKIT
						//Old UI code using UIToolkit
						txTouchContinue = screenText.addTextInstance( guiFlags.touchContinue, 0, 0, 0.4f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
						txTouchContinue.localPosition = new Vector3(240f, -280f, -18f);
#endif
						gui_Manager_NGUI.OpenMenu(1, guiFlags);
						lastMenu = 1;
					}	
				break;
			#endregion CASE 1
			
				// Case 2 -> RaceOver Show Player stats
			#region CASE 2
			case 2:
						// show touch message
					if (lastMenu == 0)
					{
#if USING_UITOOLKIT
						txTouchContinue = screenText.addTextInstance( guiFlags.touchContinue, 0, 0, 0.4f, 5, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
						txTouchContinue.localPosition = new Vector3(240f, -280f, -18f);
								
						string winMessage = " ";
						// string valConvert = "";

							// Show Win message
						switch(guiFlags.playerRank)
						{
							case 0:
								winMessage = guiFlags.winMessage[0];
								break;
					
							case 1:
								winMessage = guiFlags.winMessage[1];
								break;
					
							case 2:
								winMessage = guiFlags.winMessage[2];
								break;
						}
					
							// show the win message
						txEndHeader = screenText.addTextInstance( winMessage, 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
						txEndHeader.localPosition = new Vector3(240f, -10f, -18f);

							// show players race times....
						txLine1Label = screenText.addTextInstance( guiFlags.infoText[0], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine1Label.localPosition = new Vector3(tabA, -100f, -18f);

						txLine1Value = screenText.addTextInstance( formatTime(guiFlags.Lap1Time[guiFlags.playerMesh]), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine1Value.localPosition = new Vector3(tabD, -100f, -18f);
				
						txLine2Label = screenText.addTextInstance( guiFlags.infoText[1], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine2Label.localPosition = new Vector3(tabA, -140f, -18f);
				
						txLine2Value = screenText.addTextInstance( formatTime(guiFlags.Lap2Time[guiFlags.playerMesh]), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine2Value.localPosition = new Vector3(tabD, -140f, -18f);
				
						txLine3Label = screenText.addTextInstance( guiFlags.infoText[2], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine3Label.localPosition = new Vector3(tabA, -180f, -18f);
				
						txLine3Value = screenText.addTextInstance( formatTime(guiFlags.Lap3Time[guiFlags.playerMesh]), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine3Value.localPosition = new Vector3(tabD, -180f, -18f);

							// show credits earned
						txLine4Label = screenText.addTextInstance( guiFlags.infoText[6], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine4Label.localPosition = new Vector3(tabA, -220f, -18f);
				
						txLine4Value = screenText.addTextInstance( guiFlags.playerCredits.ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine4Value.localPosition = new Vector3(tabD, -220f, -18f);
#endif
						gui_Manager_NGUI.OpenMenu(2, guiFlags);
				
						lastMenu = 2;

							// hide the HUD
						HUD_root.localPosition = new Vector3(0f, 0f, -2000f);
				
						sprite_slide.localPosition = new Vector3(110f, -5032f, 10);
				
						HUD_MinimapRoot.localPosition = new Vector3(416f, -5057f, 15f);;
							
							// Update all buttons
						updateHUD();
						// updateSlidebar();
					}	
				break;
			#endregion CASE 2
			
				// Case 3 -> Race summary
			#region CASE 3
			case 3:
						// show race summary
					if (lastMenu == 2)
					{
				
						gui_Manager_NGUI.CloseAllMenu();
						gui_Manager_NGUI.OpenMenu(3, guiFlags);
						lastMenu = 3;
				
#if USING_UITOOLKIT
							// delete last heading
						// Keep win message txEndHeader.destroy();
						txLine1Value.destroy();
						txLine1Label.destroy();
						txLine2Value.destroy();
						txLine2Label.destroy();
						txLine3Value.destroy();
						txLine3Label.destroy();
						txLine4Value.destroy();
						txLine4Label.destroy();
				
							// write new header
						// txEndHeader = screenText.addTextInstance( "Race Summary ..", 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
						// txEndHeader.localPosition = new Vector3(240f, -10f, -18f);
				
							// show points: Name	pointsInCup		pointsInRace	raceTime
						txLine1Label = screenText.addTextInstance( guiFlags.robotNames[ guiFlags.podiumBots[0] ], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine1Label.localPosition = new Vector3(tabA, -100f, -18f);
							if (guiFlags.isQuick)
							{
								txLine1Value = screenText.addTextInstance( guiFlags.circuitPoints[guiFlags.podiumBots[0]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine1Value.localPosition = new Vector3(tabB, -100f, -18f);
								txLine1ValueA = screenText.addTextInstance( guiFlags.racePoints[guiFlags.podiumBots[0]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine1ValueA.localPosition = new Vector3(tabC, -100f, -18f);
							}
							txLine1ValueB = screenText.addTextInstance(formatTime(guiFlags.Lap1Time[guiFlags.podiumBots[0]]+ guiFlags.Lap2Time[guiFlags.podiumBots[0]] + guiFlags.Lap3Time[guiFlags.podiumBots[0]]), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
							txLine1ValueB.localPosition = new Vector3(tabD, -100f, -18f);
				
						txLine2Label = screenText.addTextInstance( guiFlags.robotNames[ guiFlags.podiumBots[1] ], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine2Label.localPosition = new Vector3(tabA, -130f, -18f);
							if (guiFlags.isQuick)
							{
								txLine2Value = screenText.addTextInstance( guiFlags.circuitPoints[guiFlags.podiumBots[1]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine2Value.localPosition = new Vector3(tabB, -130f, -18f);
								txLine2ValueA = screenText.addTextInstance( guiFlags.racePoints[guiFlags.podiumBots[1]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine2ValueA.localPosition = new Vector3(tabC, -130f, -18f);
							}
							if (guiFlags.Lap3Time[guiFlags.podiumBots[1]] > 0)
							{
								txLine2ValueB = screenText.addTextInstance(formatTime(guiFlags.Lap1Time[guiFlags.podiumBots[1]]+ guiFlags.Lap2Time[guiFlags.podiumBots[1]] + guiFlags.Lap3Time[guiFlags.podiumBots[1]]), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine2ValueB.localPosition = new Vector3(tabD, -130f, -18f);
							}
							else
							{
								txLine2ValueB = screenText.addTextInstance(guiFlags.infoText[3], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine2ValueB.localPosition = new Vector3(tabD, -130f, -18f);
							}
					 
	
						txLine3Label = screenText.addTextInstance( guiFlags.robotNames[ guiFlags.podiumBots[2] ], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
						txLine3Label.localPosition = new Vector3(tabA, -160f, -18f);
							if (guiFlags.isQuick)
							{
								txLine3Value = screenText.addTextInstance( guiFlags.circuitPoints[guiFlags.podiumBots[2]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine3Value.localPosition = new Vector3(tabB, -160f, -18f);
								txLine3ValueA = screenText.addTextInstance( guiFlags.racePoints[guiFlags.podiumBots[2]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine3ValueA.localPosition = new Vector3(tabC, -160f, -18f);
							}
							if (guiFlags.Lap3Time[guiFlags.podiumBots[2]] > 0)
							{
								txLine3ValueB = screenText.addTextInstance(formatTime(guiFlags.Lap1Time[guiFlags.podiumBots[2]]+ guiFlags.Lap2Time[guiFlags.podiumBots[2]] + guiFlags.Lap3Time[guiFlags.podiumBots[2]]), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine3ValueB.localPosition = new Vector3(tabD, -160f, -18f);
							}
							else
							{
								txLine3ValueB = screenText.addTextInstance(guiFlags.infoText[3], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine3ValueB.localPosition = new Vector3(tabD, -160f, -18f);
							}
						
							// do we have at least 4 bots in race??
						if (guiFlags.botCount > 2)
						{
							txLine4Label = screenText.addTextInstance( guiFlags.robotNames[ guiFlags.podiumBots[3] ], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
							txLine4Label.localPosition = new Vector3(tabA, -190f, -18f);
								if (guiFlags.isQuick)
								{
									txLine4Value = screenText.addTextInstance( guiFlags.circuitPoints[guiFlags.podiumBots[3]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
									txLine4Value.localPosition = new Vector3(tabB, -190f, -18f);
									txLine4ValueA = screenText.addTextInstance( guiFlags.racePoints[guiFlags.podiumBots[3]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
									txLine4ValueA.localPosition = new Vector3(tabC, -190f, -18f);
								}
								if (guiFlags.Lap3Time[guiFlags.podiumBots[3]] > 0)
								{
									txLine4ValueB = screenText.addTextInstance(formatTime(guiFlags.Lap1Time[guiFlags.podiumBots[3]]+ guiFlags.Lap2Time[guiFlags.podiumBots[3]] + guiFlags.Lap3Time[guiFlags.podiumBots[3]]), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
									txLine4ValueB.localPosition = new Vector3(tabD, -190f, -18f);
								}
								else
								{
									txLine4ValueB = screenText.addTextInstance(guiFlags.infoText[3], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
									txLine4ValueB.localPosition = new Vector3(tabD, -190f, -18f);
								}
						}
							// do we have at least 5 bots in race
						if (guiFlags.botCount > 3)
						{
							txLine5Label = screenText.addTextInstance( guiFlags.robotNames[ guiFlags.podiumBots[4] ], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
							txLine5Label.localPosition = new Vector3(tabA, -220f, -18f);
								txLine5Value = screenText.addTextInstance( guiFlags.circuitPoints[guiFlags.podiumBots[4]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine5Value.localPosition = new Vector3(tabB, -220f, -18f);
								txLine5ValueA = screenText.addTextInstance( guiFlags.racePoints[guiFlags.podiumBots[4]].ToString(), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
								txLine5ValueA.localPosition = new Vector3(tabC, -220f, -18f);
								if (guiFlags.Lap3Time[guiFlags.podiumBots[4]] > 0)
								{
									txLine5ValueB = screenText.addTextInstance(formatTime(guiFlags.Lap1Time[guiFlags.podiumBots[4]]+ guiFlags.Lap2Time[guiFlags.podiumBots[4]] + guiFlags.Lap3Time[guiFlags.podiumBots[4]]), 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
									txLine5ValueB.localPosition = new Vector3(tabD, -220f, -18f);
								}
								else
								{
									txLine5ValueB = screenText.addTextInstance(guiFlags.infoText[3], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Left, SamUITextVerticalAlignMode.Top);
									txLine5ValueB.localPosition = new Vector3(tabD, -220f, -18f);
								}
						}
							
#endif
					}

				break;
			#endregion CASE 3
			
				// Case 4 -> Player Unlocks
			#region CASE 4
			case 4:
					if (lastMenu == 3)
					{
				
						gui_Manager_NGUI.CloseAllMenu();
						gui_Manager_NGUI.OpenMenu(4, guiFlags);
						lastMenu = 4;
#if USING_UITOOLKIT
							// remove label stuff ...
						txEndHeader.destroy();
						if (guiFlags.isQuick)
						{
							txLine1Value.destroy();
							txLine1ValueA.destroy();
						}
						txLine1ValueB.destroy();
						txLine1Label.destroy();
						if (guiFlags.isQuick)
						{
							txLine2Value.destroy();
							txLine2ValueA.destroy();
						}
						txLine2ValueB.destroy();
						txLine2Label.destroy();
						if (guiFlags.isQuick)
						{
							txLine3Value.destroy();
							txLine3ValueA.destroy();
						}
						txLine3ValueB.destroy();
						txLine3Label.destroy();
						if (guiFlags.botCount > 2)
						{	
							if (guiFlags.isQuick)
							{
								txLine4Value.destroy();
								txLine4ValueA.destroy();
							}
							txLine4ValueB.destroy();
							txLine4Label.destroy();
						}
						if (guiFlags.botCount > 3)
						{	
							if (guiFlags.isQuick)
							{
								txLine5Value.destroy();
								txLine5ValueA.destroy();
							}
							txLine5ValueB.destroy();
							txLine5Label.destroy();
						}
					
							// print unlocks
						txEndHeader = screenText.addTextInstance( guiFlags.infoText[4], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
						txEndHeader.localPosition = new Vector3(240f, -10f, -18f);
				
							// print info
						txLine1Value = screenText.addTextInstance( guiFlags.trackUnlocks, 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
						txLine1Value.localPosition = new Vector3(240f, -40f, -18f);
#endif
					}
				break;
			
			#endregion CASE 4
			
				// Case 9 -> Debug Menu
			
				// Case 10 -> Silent/ decide next menu (Podium or raceEnd Screen)
			#region case 9
			case 9:
						// debug menu delete texts
					if (lastMenu == 4)
					{
						lastMenu = 10;
						gui_Manager_NGUI.CloseAllMenu();
						gui_Manager_NGUI.OpenMenu(9, guiFlags);
#if USING_UITOOLKIT
							// remove texts
						txEndHeader.destroy();
						txLine1Value.destroy();
				
							// print Badges
						txEndHeader = screenText.addTextInstance( guiFlags.infoText[5], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
						txEndHeader.localPosition = new Vector3(240f, -10f, -18f);
#endif
					}

					else if(lastMenu != 10)
					{
						lastMenu = 10;
						gui_Manager_NGUI.CloseAllMenu();	
						gui_Manager_NGUI.OpenMenu(9, guiFlags);
				
#if USING_UITOOLKIT
							// remove label stuff ...
						txEndHeader.destroy();
						if (guiFlags.isQuick)
						{
							txLine1Value.destroy();
							txLine1ValueA.destroy();
						}
						txLine1ValueB.destroy();
						txLine1Label.destroy();
						if (guiFlags.isQuick)
						{
							txLine2Value.destroy();
							txLine2ValueA.destroy();
						}
						txLine2ValueB.destroy();
						txLine2Label.destroy();
						if (guiFlags.isQuick)
						{
							txLine3Value.destroy();
							txLine3ValueA.destroy();
						}
						txLine3ValueB.destroy();
						txLine3Label.destroy();
						if (guiFlags.botCount > 2)
						{	
							if (guiFlags.isQuick)
							{
								txLine4Value.destroy();
								txLine4ValueA.destroy();
							}
							txLine4ValueB.destroy();
							txLine4Label.destroy();
						}
						if (guiFlags.botCount > 3)
						{	
							if (guiFlags.isQuick)
							{
								txLine5Value.destroy();
								txLine5ValueA.destroy();
							}
							txLine5ValueB.destroy();
							txLine5Label.destroy();
						}
							// print Badges
						txEndHeader = screenText.addTextInstance( guiFlags.infoText[5], 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
						txEndHeader.localPosition = new Vector3(240f, -10f, -18f);
#endif
					}

				break;
			#endregion case 9
			case 10:
					gui_Manager_NGUI.CloseAllMenu();
					break;
			
				// Case 11 -> Podium Screen
			#region case 11
			case 11:
						// show podium
					if (lastMenu == 10)
					{
						lastMenu = 11;
						gui_Manager_NGUI.CloseAllMenu();
						gui_Manager_NGUI.OpenMenu(11,guiFlags);
				
#if USING_UITOOLKIT
							// delete last heading
						txEndHeader.destroy();
#endif
			/*
						if (guiFlags.gameBeat)
						{
								// write new header
							txEndHeader = screenText.addTextInstance( "You have beaten all the circuits and have \ntaken the Shocking Circuit Cup!\n Congratulations!", 0, 0, 0.4f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
							txEndHeader.localPosition = new Vector3(240f, -200f, -18f);
							txEndHeader.localScale = new Vector3(0.6f,0.6f,0.6f);
						}
			*/
					}
				break;
			#endregion case 11
			
				// Case 20 -> End Buttons Screen ... (Text handled here, attached to existing Buttons handled by pause Manager - Speed is not so important here)
			#region case 20
			case 20:
						// show podium
					if ( (lastMenu == 11) || (lastMenu == 10) )
					{
						// lastMenu = 20;
				
							// delete last heading
						gui_Manager_NGUI.CloseAllMenu();
						gui_Manager_NGUI.OpenMenu(20,guiFlags);
#if USING_UITOOLKIT
						txTouchContinue.destroy();
#endif
				/*
						if (guiFlags.gameBeat)
						{
								// delete last heading
							txEndHeader.destroy();
						}
				 */
					}
						// manage end handling!! (menu text)
					if (lastMenu != 20)
					{
							// set run once stuff
						lastMenu = 20;
				/*
							// write the labels for our end buttons
						txLine1Label = screenText.addTextInstance( "Continue", 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
							txLine1Label.parent = centerContinue;
							txLine1Label.localPosition = new Vector3(0f, 0f, 10f);
				
						txLine2Label = screenText.addTextInstance( "Main Menu", 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
							txLine2Label.parent = centerMenu;
							txLine2Label.localPosition = new Vector3(0f, 0f, 10f);
				
						txLine3Label = screenText.addTextInstance( "Retry", 0, 0, 0.3f, 0, Color.white, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Top);
							txLine3Label.parent = centerRetry;
							txLine3Label.localPosition = new Vector3(0f, 0f, 10f);
				*/
					}
				/*	
						// update text pos
					txLine1Label.localPosition = new Vector3(0f, -15f, 15f);
					txLine2Label.localPosition = new Vector3(0f, -15f, 15f);
					txLine3Label.localPosition = new Vector3(0f, -15f, 15f);
				*/
				break;
			#endregion case 20
		}	// End Active Menu 0 (HUD)
	}

}


