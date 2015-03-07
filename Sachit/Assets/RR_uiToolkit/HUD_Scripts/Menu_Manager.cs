// Test this with the new Atlas I made and recreate the HUD.
// Then have the buttons do something!!

using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class Menu_Manager : MonoBehaviour
{
	// private Color textColor = new Color(0.2f, 0.5f, 0.65f, 0.5f);	// transparent text!!

		// !!!
		// Variable Definitions
	#region Variable Definitions
	
		// get access to our menu flags
 	public Menu_Flags menuFlags;
	
		// Here	we define our actual text
	//private SamUIText text;

		// define our virus message
	//private SamUITextInstance virusText;
	
		//
		// define our circuit icons
	private SamUIObject circuitMenu;
	
	private SamUIUVRect[] uvRect_circuits = new SamUIUVRect[14];
	private string[] circuitIcons = new string[] { "circuit_toasted_active.png", "circuit_toasted_inActive.png", "circuit_connected_active.png", "circuit_connected_inActive.png", "circuit_offline_active.png", "circuit_offline_inActive.png", "circuit_short_active.png", "circuit_short_inActive.png", "circuit_wired_active.png", "circuit_wired_inActive.png", "circuit_shocking_active.png", "circuit_shocking_inActive.png", "circuit_circus_active.png", "circuit_circus_inActive.png" };
	
	private SamUISprite sprite_toasted;
	private SamUISprite sprite_connected;
	private SamUISprite sprite_offline;
	private SamUISprite sprite_short;
	private SamUISprite sprite_wired;
	private SamUISprite sprite_shocking;
	

	private bool doUpdate = true;
	
		// use simple sprites instead of buttons for the HUD -> no SendMessage crap
	#endregion Variable Definitions
		// end Variable Definitions
		// !!!
	
	
	void Start()
	{
			// add a panel with which we can animate stuff out of frame

		/*
			// first create our HUD Panels that we can parent everything under ...
		
		HUD_MidAnchor = new SamUIObject();
		HUD_Anchor = new SamUIObject();
		HUD_JuiceFill = new SamUIObject();
		HUD_MinimapRoot = new SamUIObject();
				
		
			// setup our text instance which will parse our .fnt file and allow us to
		text = new SamUIText( "prototypeM", "prototypeM.png" );
		text.alignMode = SamUITextAlignMode.Center;
		 */

			// !!!
			// add our Pickup Button
		#region circuit buttons create	
		
			// create parent object
		circuitMenu = new SamUIObject();
		
			// init our Sprite positions
		sprite_toasted = SamUI.firstToolkit.addSprite( circuitIcons[0], 20, 10, 1 );		// create sprite
		sprite_toasted.localScale = new Vector3(0.4f, 0.4f, 1f);						// set correct scale
		sprite_toasted.parentSamUIObject = circuitMenu;									// set the parent
		
			// init our sprites ONCE
		for (var i = 0; i < 14; i++)
		{
			uvRect_circuits[i] = sprite_toasted.manager.uvRectForFilename( circuitIcons[i] ); 		// set initial rect
		}
		
			// init our Sprite positions
		sprite_connected = SamUI.firstToolkit.addSprite( circuitIcons[3], 20, 120, 1 );		// create sprite
		sprite_connected.localScale = new Vector3(0.4f, 0.4f, 1f);						// set correct scale
		sprite_connected.parentSamUIObject = circuitMenu;										// set the parent
		
			
		sprite_offline = SamUI.firstToolkit.addSprite( circuitIcons[5], 140, 10, 1 );			// create sprite
		sprite_offline.localScale = new Vector3(0.4f, 0.4f, 1f);							// set correct scale
		sprite_offline.parentSamUIObject = circuitMenu;										// set the parent
		
		
		sprite_short = SamUI.firstToolkit.addSprite( circuitIcons[7], 140, 120, 1 );		// create sprite
		sprite_short.localScale = new Vector3(0.4f, 0.4f, 1f);						// set correct scale
		sprite_short.parentSamUIObject = circuitMenu;										// set the parent
		
		
		sprite_wired = SamUI.firstToolkit.addSprite( circuitIcons[9], 260, 10, 1 );		// create sprite
		sprite_wired.localScale = new Vector3(0.4f, 0.4f, 1f);						// set correct scale
		sprite_wired.parentSamUIObject = circuitMenu;										// set the parent
		
		
		sprite_shocking = SamUI.firstToolkit.addSprite( circuitIcons[11], 260, 120, 1 );		// create sprite
		sprite_shocking.localScale = new Vector3(0.4f, 0.4f, 1f);						// set correct scale
		sprite_shocking.parentSamUIObject = circuitMenu;										// set the parent
		
		
			// move out of the way initially
		circuitMenu.position = new Vector3(0, -20000, 1);

		#endregion circuit buttons create
		
		/*
		 	// !!!
			// add slide bar
		#region slidebar
			// create Object
		sprite_slide = new SamUIObject();
		
			// parent and place object
		sprite_slide.parentSamUIObject = HUD_Anchor;
		sprite_slide.localPosition = new Vector3(110f, -232f, 10);
		
			// left side
		var slideTL = SamUI.firstToolkit.addSprite( "HUD_slidebarTL.png", 110, 232, 10);
			slideTL.parentSamUIObject = sprite_slide;
		var slideML = SamUI.firstToolkit.addSprite( "HUD_slidebarML.png", 110, 238, 10);
			slideML.parentSamUIObject = sprite_slide;
		var slideBL = SamUI.firstToolkit.addSprite( "HUD_slidebarBL.png", 110, 290, 10);
			slideBL.parentSamUIObject = sprite_slide;
		
			// stuff to scale
		var slideT = SamUI.firstToolkit.addSprite( "HUD_slidebarT.png", 116, 232, 10);
			slideT.localScale = new Vector3(248f/52f, 1f, 1f);
			slideT.parentSamUIObject = sprite_slide;
		var slideM = SamUI.firstToolkit.addSprite( "HUD_slidebarM.png", 116, 238, 10);
			slideM.localScale = new Vector3(248f/52f, 1f, 1f);
			slideM.parentSamUIObject = sprite_slide;
		var slideB = SamUI.firstToolkit.addSprite( "HUD_slidebarB.png", 116, 290, 10);
			slideB.localScale = new Vector3(248f/52f, 1f, 1f);
			slideB.parentSamUIObject = sprite_slide;
		
			// right side
		var slideMR = SamUI.firstToolkit.addSprite( "HUD_slidebarMR.png", 364, 238, 10);
			slideMR.parentSamUIObject = sprite_slide;
		var slideTR = SamUI.firstToolkit.addSprite( "HUD_slidebarTR.png", 364, 232, 10);
			slideTR.parentSamUIObject = sprite_slide;
		var slideBR = SamUI.firstToolkit.addSprite( "HUD_slidebarBR.png", 364, 290, 10);
			slideBR.parentSamUIObject = sprite_slide;
			
			// reposition
		sprite_slide.localPosition = new Vector3(110f, -232f, 10);
		
		#endregion slidebar 
		*/
		
		
		/*
			// !!!
			// add our Virus Message
		#region virus message
			
			// init stuff
		virusText = text.addTextInstance( " ", Screen.width / 2, 0, 1.2f, 1, Color.red, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Middle  );
		virusText.parent = flashAnim;
		virusText.localPosition = new Vector3 (0f, 0f, 1f);
		virusText.localScale = new Vector3 (1f, 1f, 1f);
		
		#endregion virus message
		 */
	}
	

	// Add a function for creating a sliced sprite -> Will need to add all slices as seperate textures to Atlas file
	
	void Update()
	{
			// Handle coircuit menu...
		if (menuFlags.debugMenu == 10)
		{
				// check all unlocks and adjust flags ...
			if (DataTransfer.circuitUnlocks > 1)
			{
				sprite_connected.uvFrame = uvRect_circuits[2];
			}
			if (DataTransfer.circuitUnlocks > 2)
			{
				sprite_offline.uvFrame = uvRect_circuits[4];
			}
			if (DataTransfer.circuitUnlocks > 3)
			{
				sprite_short.uvFrame = uvRect_circuits[6];
			}
			if (DataTransfer.circuitUnlocks > 4)
			{
				sprite_wired.uvFrame = uvRect_circuits[8];
			}
			if (DataTransfer.circuitUnlocks > 5)
			{
				sprite_shocking.uvFrame = uvRect_circuits[10];
			}
			
				// move in view
			circuitMenu.position = new Vector3(0, 0, 1);	
		}
		else
		{
				// move out of the way initially
			circuitMenu.position = new Vector3(0, -2000, 1);	
		}
		
		
		/*	
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
						sprite_pickup.position = new Vector3(15, -20000, pickupDepth);
				
					break;
				
				case 1:
							// Change the sprite and reset the flag
						sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
						guiFlags.pickupChanged = false;

								// show button
						sprite_pickup.position = new Vector3(15, -200, pickupDepth);
					break;
				
				case 2:
							// Change the sprite and reset the flag
						sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
						guiFlags.pickupChanged = false;

							// show button
						sprite_pickup.position = new Vector3(15, -200, pickupDepth);
					break;
				
				case 4:
							// Change the sprite and reset the flag
						sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
						guiFlags.pickupChanged = false;
				
							// show button
						sprite_pickup.position = new Vector3(15, -200, pickupDepth);
					break;
				
				case 5:
							// Change the sprite and reset the flag
						sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
						guiFlags.pickupChanged = false;
				
							// show button
						sprite_pickup.position = new Vector3(15, -200, pickupDepth);
					break;
				
				case 6:
							// Change the sprite and reset the flag
						sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
						guiFlags.pickupChanged = false;

							// show button
						sprite_pickup.position = new Vector3(15, -200, pickupDepth);
					break;
				
				case 7:
							// Change the sprite and reset the flag
						sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
						guiFlags.pickupChanged = false;

							// show button
						sprite_pickup.position = new Vector3(15, -200, pickupDepth);
					break;
				
				case 8:
							// Change the sprite and reset the flag
						sprite_pickup.uvFrame = uvRect_pickup[guiFlags.pickupType];
						guiFlags.pickupChanged = false;

							// show button
						sprite_pickup.position = new Vector3(15, -200, pickupDepth);
					break;
			}
		}	
		#endregion PickupButton Handling Code
		*/
		/*
			// !!!
			// Virus message handling
		#region virus msg handling

			// Handle timer (so that warning is removed)
		if (virusWarningActive)
		{
				// if warning is active handle exit timer
			if (Time.time > virusWarningExit)
			{
					// add break
				if (warningState < 2)
				{
						// advance
					warningState = 2;
					virusWarningExit = Time.time + messageTwo;
					
						// adjust message
					virusText.destroy();
					virusText = text.addTextInstance( " ", Screen.width / 2, 0, 1.2f, 1, Color.red, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Middle  );
					virusText.parent = flashAnim;
					virusText.localPosition = new Vector3 (0f, 0f, 1f);
					virusText.localScale = new Vector3 (1f, 1f, 1f);

				}
				else if (warningState < 3)
				{
						// final message
					warningState = 3;
					virusWarningExit = Time.time + messageThree;
					
						// adjust message
					virusText.destroy();
					virusText = text.addTextInstance( "REBOOT", Screen.width / 2, 0, 1.2f, 1, Color.red, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Middle  );
					virusText.parent = flashAnim;
					virusText.localPosition = new Vector3 (0f, 0f, 1f);
					virusText.localScale = new Vector3 (1f, 1f, 1f);
				}
				else
				{
						// disable
					warningState = 0;
					virusWarningActive = false;
					
						// adjust message
					virusText.destroy();
					virusText = text.addTextInstance( " ", Screen.width / 2, 0, 1.2f, 1, Color.red, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Middle  );
					virusText.parent = flashAnim;
					virusText.localPosition = new Vector3 (0f, 0f, 1f);
					virusText.localScale = new Vector3 (1f, 1f, 1f);
					
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
			virusWarningExit = Time.time + messageOne;
			warningState = 1;
			
				// set first message
			virusText.destroy();
			virusText = text.addTextInstance( "VIRUS DETECTED", Screen.width / 2, 0, 1.2f, 1, Color.red, SamUITextAlignMode.Center, SamUITextVerticalAlignMode.Middle  );
			virusText.parent = flashAnim;
			virusText.localPosition = new Vector3 (0f, 0f, 0f);
			virusText.localScale = new Vector3 (1f, 1f, 1f);
			
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
		
		*/
		
		//sprite_slide.localPosition = new Vector3 (10, -30, 10);
		
			// at the end of all stuff update our sprites if needed (update manually or virus active)
		if (doUpdate)
		{

			// sprite_pickup.updateTransform();

			//virusText.localPosition = new Vector3 (0f, 0f, 0f);

				// after update set to false
			//doUpdate = false;
		}

	}

}


