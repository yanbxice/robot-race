var inputScript : pInput;
var _refHolder : refHolder;
var publicInfo : getInfo;

var enable : boolean = true;
var iPhone : boolean = false;
var uiCam : Camera;

var hudMask = 1<<9;

//var start_grp : Transform;
var base_grp : Transform;
// var debug_grp : Transform;
var control_grp : Transform;
var main_grp : Transform;
var end_grp : Transform;

var pauseActive : boolean = false;

private var screenPos : Vector2;
var overPlayed : boolean = false;


	// tutorial handling
var tut_grp : Transform;
var control_trn : Transform;
var Overlay_A : Transform;
var Overlay_B : Transform;
var Overlay_A_anim : HUD_SingleButton;
var Overlay_B_anim : HUD_SingleButton;

var messageText : String[] = new String[7];
//var messageObj : TextMesh;
var messageLocalized : UILocalize;
var messageTrn : Transform;

//private var startActive : boolean = false;
private var endActive : boolean = false;
private var baseActive : boolean = false;
private var mainActive : boolean = false;
// private var debugActive : boolean = false;
private var controlsActive : boolean = false;
private var allClear : boolean = false;

private var wRatio : float;
private var hRatio : float;
private var sHeight : float;
private var sWidth : float;

private var itemScale : float = 1.0;
private var invScreenRatio : float = 1.0;
private var rEdgeOffset : float = 0.0;
private var lEdgeOffset : float = 0.0;

function Start()
{
		// get our settings holder
	var playerConstruct = GameObject.Find("Player_Construct");
	inputScript = (playerConstruct.GetComponent(pInput) as pInput); 
	publicInfo = (playerConstruct.GetComponent(getInfo) as getInfo);
	
		// get our refHolder
	var refConstruct = GameObject.Find("_refHolder");
	_refHolder = (refConstruct.GetComponent(refHolder) as refHolder); 
	
		// get our camera
	var camConstruct = GameObject.Find("SamUICamera");
	uiCam = (camConstruct.GetComponent(Camera) as Camera);
		// add the fog disable to camera
	camConstruct.AddComponent(DisableFog);

	sHeight = Screen.height;
	sWidth = Screen.width;
	
	wRatio = 480.0 / sWidth;
	hRatio = 320.0 / sHeight;
	
	invScreenRatio = (sWidth / sHeight) / 1.5f;
	if (invScreenRatio < 1f)
	{
		itemScale = 0.75f;
	}
		
	lEdgeOffset = (480 - (480 * invScreenRatio)) / 2;
	rEdgeOffset = 480 - lEdgeOffset;

}

function Update () 
{
//print ("Time: " + Time.time);
//print ("Time Scale: " + Time.timeScale);
	if (enable)
	{

	
			// define some vars
		var screenRay : Ray;
		var buttonHit : RaycastHit;
		var cTime : float = Time.time;
		
			// handle level end
		if (inputScript.endMenu)
		{
				// init button placement
			if (!endActive)
			{
					// disable the other menus
				//startActive = false;
				endActive = true;
				baseActive = false;
				mainActive = false;
				//debugActive = false;
				controlsActive = false;
				allClear = false;
				
				
					// move menus into view
				//start_grp.localPosition.y = -2000.0;
				base_grp.localPosition.y = -2000.0;
				//debug_grp.localPosition.y = -2000.0;
				control_grp.localPosition.y = -2000.0;
				main_grp.localPosition.y = -2000.0;
				end_grp.localPosition.y = 0.0;
				tut_grp.localPosition.y = -2000.0;
		
					// kill update on pause scripts
				pauseActive = false;
			}
		}
		
			// handle tutorial (7 is the total number of tutorials)
		else if (DataTransfer.tutEnable && DataTransfer.currTut < 7)
		{

				// show / hide menus
			//start_grp.localPosition.y = -2000.0;
			base_grp.localPosition.y = -2000.0;
			control_grp.localPosition.y = -2000.0;
			main_grp.localPosition.y = -2000.0;
			end_grp.localPosition.y = -2000.0;
			tut_grp.localPosition.y = 0.0;
			
			allClear = false;
		
				// Accelerometer steering
			if (DataTransfer.currTut == 0)
			{
					// show control image
				control_trn.localPosition = Vector3( -84, -40, 0);
				
					// hide overlay planes
				Overlay_A.localPosition = Vector3( 0, -2000, 0);
				Overlay_B.localPosition = Vector3( 0, -2000, 0);
				
					// Update text
				// messageObj.text = LanguageHandler.messageText[0];
				messageLocalized.key = "messageText1";
					// direct update to button
				messageLocalized.Localize();
				messageTrn.localPosition.y = 92;
				
					// mark current tutorial as already shown
				DataTransfer.tutFinish[0] = true;
			}
				// Touch Steering
			else if (DataTransfer.currTut == 1)
			{
					// show control image
				control_trn.localPosition = Vector3( -2000, -2000, 0);
				
					// hide overlay planes
				Overlay_A.localPosition = Vector3( 0, -(86 * itemScale) , 0);
				Overlay_A.localScale = Vector3( 75, (320 -(206 * itemScale)), 1); 		//(x was 160 but in Menu)
				Overlay_B.localPosition = Vector3( 405, -(86 * itemScale) , 0);			// (x was 320 but in Menu frame)
				Overlay_B.localScale = Vector3( 75, (320 -(206 * itemScale)), 1);
				Overlay_A_anim.playAnim = true;
				Overlay_B_anim.playAnim = true;
				
					// Update text
				//messageObj.text = LanguageHandler.messageText[1];
				messageLocalized.key = "messageText2";
					// direct update to button
				messageLocalized.Localize();
				messageTrn.localPosition.y = 70;
				
					// mark current tutorial as already shown
				DataTransfer.tutFinish[1] = true;
			}
				// Pause
			else if (DataTransfer.currTut == 2)
			{
					// show control image
				control_trn.localPosition = Vector3( -2000, -2000, 0);
				
					// hide overlay planes
				Overlay_A.localPosition = Vector3( ((42 * itemScale) + lEdgeOffset), -(46 * itemScale) , 0);
				Overlay_A.localScale = Vector3( (40 * itemScale), (40 * itemScale), 1);
				Overlay_B.localPosition = Vector3( 0, -2000, 0);
				Overlay_B.localScale = Vector3( 1,1,1);
				Overlay_A_anim.playAnim = true;
				
					// Update text
				//messageObj.text = LanguageHandler.messageText[2];
				messageLocalized.key = "messageText3";
					// direct update to button
				messageLocalized.Localize();
				messageTrn.localPosition.y = 70;
				
					// mark current tutorial as already shown
				DataTransfer.tutFinish[2] = true;
			}
				// Juice
			else if (DataTransfer.currTut == 3)
			{
					// show control image
				control_trn.localPosition = Vector3( -2000, -2000, 0);
				
					// hide overlay planes
				Overlay_A.localPosition = Vector3( ((45 * itemScale) + lEdgeOffset), -(320 - ((320-260) * itemScale)) , 0);
				Overlay_A.localScale = Vector3( (55 * itemScale), (55 * itemScale), 1);
				Overlay_B.localPosition = Vector3( 0, -2000, 0);
				Overlay_A_anim.playAnim = true;
				
					// Update text
				//messageObj.text = LanguageHandler.messageText[3];
				messageLocalized.key = "messageText4";
					// direct update to button
				messageLocalized.Localize();
				messageTrn.localPosition.y = 95;
				
					// mark current tutorial as already shown
				DataTransfer.tutFinish[3] = true;
			}
				// Slide
			else if (DataTransfer.currTut == 4)
			{
					// show control image
				control_trn.localPosition = Vector3( -2000, -2000, 0);
				
					// hide overlay planes
				Overlay_A.localPosition = Vector3( ((240 - (130 * itemScale))), -(320 - ((320-252) * itemScale)) , 0);
				Overlay_A.localScale = Vector3( (260 * itemScale), (80 * itemScale), 1);
				Overlay_B.localPosition = Vector3( 0, -2000, 0);
				Overlay_A_anim.playAnim = true;
				
					// Update text
				//messageObj.text = LanguageHandler.messageText[4];
				messageLocalized.key = "messageText5";
					// direct update to button
				messageLocalized.Localize();
				messageTrn.localPosition.y = 95;
				
					// mark current tutorial as already shown
				DataTransfer.tutFinish[4] = true;
			}
				// Jump
			else if (DataTransfer.currTut == 5)
			{
					// show control image
				control_trn.localPosition = Vector3( -2000, -2000, 0);
				
					// hide overlay planes
				Overlay_A.localPosition = Vector3( (480 - (87 * itemScale) - lEdgeOffset), -(320 - ((320-222) * itemScale)) , 0);
				Overlay_A.localScale = Vector3( (75 * itemScale), (75 * itemScale), 1);
				Overlay_B.localPosition = Vector3( 0, -2000, 0);
				Overlay_A_anim.playAnim = true;
				
					// Update text
				//messageObj.text = LanguageHandler.messageText[5];
				messageLocalized.key = "messageText6";
					// direct update to button
				messageLocalized.Localize();
				messageTrn.localPosition.y = 95;
				
					// mark current tutorial as already shown
				DataTransfer.tutFinish[5] = true;
			}
				// Pickup
			else if (DataTransfer.currTut == 6)
			{
					// show control image
				control_trn.localPosition = Vector3( -2000, -2000, 0);
				
					// hide overlay planes
				Overlay_A.localPosition = Vector3( ((15 * itemScale) + lEdgeOffset), -(320 - ((320-200) * itemScale)) , 0);
				Overlay_A.localScale = Vector3( (55 * itemScale), (55 * itemScale), 1);
				Overlay_B.localPosition = Vector3( 0, -2000, 0);
				Overlay_A_anim.playAnim = true;
				
					// Update text
				//messageObj.text = LanguageHandler.messageText[6];
				messageLocalized.key = "messageText7";
					// direct update to button
				messageLocalized.Localize();
				messageTrn.localPosition.y = 70;
				
					// mark current tutorial as already shown
				DataTransfer.tutFinish[6] = true;
			}
			
			var result : boolean = true;
			for (var slot = 0; slot < 7; slot++)
			{
				if (!DataTransfer.tutFinish[slot])
				{
					result = false;
				}
			}

			if (result && DataTransfer.tutExit)
			{
					// if all tuts shown .. disable tutorial ...
				DataTransfer.tutEnable = false;
				Overlay_A_anim.playAnim = false;
				Overlay_B_anim.playAnim = false;
			}

		}

			// handle level pause
		//else if (!inputScript.gameEnabled)
		else if ((!inputScript.gameEnabled) && (!_refHolder.raceOver) && (!inputScript.startPause))
		{

				// enable update on pause scripts
			pauseActive = true;
		
				// handle main menu
			if (!baseActive)
			{
					// disable the other menus
				//startActive = false;
				endActive = false;
				baseActive = true;
				mainActive = false;
				//debugActive = false;
				controlsActive = false;
				allClear = false;
				
				
					// move menus into view
				//start_grp.localPosition.y = -2000.0;
				base_grp.localPosition.y = 0.0;
				//debug_grp.localPosition.y = -2000.0;
				control_grp.localPosition.y = -2000.0;
				main_grp.localPosition.y = -2000.0;
				end_grp.localPosition.y = -2000.0;
				tut_grp.localPosition.y = -2000.0;
			}
				// handle main menu
			if (DataVault.baseMenu)
			{
				if(!mainActive)
				{
						// disable the other menus
					//startActive = false;
					endActive = false;
					mainActive = true;
					//debugActive = false;
					controlsActive = false;
					allClear = false;
					
					
						// move menus into view
					//start_grp.localPosition.y = -2000.0;
					//debug_grp.localPosition.y = -2000.0;
					control_grp.localPosition.y = -2000.0;
					main_grp.localPosition.y = 0.0;
					end_grp.localPosition.y = -2000.0;
					tut_grp.localPosition.y = -2000.0;
				}
			}
			
			
				// handle controls menu
			else if (DataVault.controlsMenu)
			{
				if(!controlsActive)
				{
						// disable the other menus
					//startActive = false;
					endActive = false;
					mainActive = false;
					//debugActive = false;
					controlsActive = true;
					allClear = false;
					
					
						// move menus into view
					//start_grp.localPosition.y = -2000.0;
					//debug_grp.localPosition.y = -2000.0;
					control_grp.localPosition.y = 0.0;
					main_grp.localPosition.y = -2000.0;
					end_grp.localPosition.y = -2000.0;
					tut_grp.localPosition.y = -2000.0;
				}
			}

				// handle debug menu
			else if (DataVault.developerMenu)
			{
				if(!controlsActive)
				{
						// disable the other menus
					//startActive = false;
					endActive = false;
					mainActive = false;
					//debugActive = true;
					controlsActive = false;
					allClear = false;
					
					
						// move menus into view
					//start_grp.localPosition.y = -2000.0;
					//debug_grp.localPosition.y = 0.0;
					control_grp.localPosition.y = -2000.0;
					main_grp.localPosition.y = -2000.0;
					end_grp.localPosition.y = -2000.0;
					tut_grp.localPosition.y = -2000.0;
				}
			}	// end debug

//
//	NEW TOUCH HANDLING POSITION
//


//
//	END NEW TOUCH HANDLING POSITION
//

		}	// end game enabled
		
			// remove everything
		else
		{

				// check if we have already cleared the screen
			if(!allClear)
			{
					// disable the other menus
				//startActive = false;
				endActive = false;
				baseActive = false;
				mainActive = false;
				//debugActive = false;
				controlsActive = false;
				allClear = true;
				
					// move menus into view
				//start_grp.localPosition.y = -2000.0;
				base_grp.localPosition.y = -2000.0;
				//debug_grp.localPosition.y = -2000.0;
				control_grp.localPosition.y = -2000.0;
				main_grp.localPosition.y = -2000.0;
				end_grp.localPosition.y = -2000.0;
				tut_grp.localPosition.y = -2000.0;
				
					// kill update on pause scripts
				pauseActive = false;
			}
		}
			
//
//	OLD TOUCH HANDLING POSITION
//

	if ((!inputScript.gameEnabled) || (_refHolder.raceOver))
	{
#if UNITY_IPHONE	

				// check if display pressed
			for(var touch: Touch in Input.touches)
			{
			
				var pos: Vector2 = touch.position;		// get the touch input and it's position
				screenPos = pos;
				var currPhase = touch.phase;

					// set the start point
				if(TouchPhase.Began == currPhase)
				{
					screenRay = uiCam.ScreenPointToRay(pos);
					
						// handle buttons lighting up if holding over them
					if (Physics.Raycast(screenRay, buttonHit, 200, hudMask)) 
			        {
							// execute button
			        	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
			        	
			        }
				}
				if( (TouchPhase.Moved == currPhase) || (TouchPhase.Stationary == currPhase) )
				{
						// only light up buttons under finger if no swipe active

						screenRay = uiCam.ScreenPointToRay(pos);
					
							// handle buttons lighting up if holding over them
						if (Physics.Raycast(screenRay, buttonHit, 200, hudMask)) 
				        {
								// execute button
				        	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
				        }
				}
				if(TouchPhase.Ended == currPhase)
				{
						// we touch ended. Enable over sound again ...
					overPlayed = false;

							screenRay = uiCam.ScreenPointToRay(pos);
				
				        	if (Physics.Raycast(screenRay, buttonHit, 200, hudMask)) 
				        	{
				        			// play button sound
				        		//audio.clip = buttonSound;
								//audio.Play ();
				        			
				        			// execute button
				            	buttonHit.collider.gameObject.SendMessage("execute");						// run the code attached to button
				        	}


			    }  
			}	
		//}
#endif

#if !UNITY_IPHONE
		//else
		//{

				// get mouse position
			screenPos = Input.mousePosition;
			
				// check if mouse pressed
			if (Input.GetMouseButtonDown(0)) 
			{
				screenRay = uiCam.ScreenPointToRay(screenPos);
				
					// handle buttons lighting up if holding over them
				if (Physics.Raycast(screenRay, buttonHit, 200, hudMask)) 
			    {
						// execute button
			       	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
			    }
			}
			if (Input.GetMouseButton(0)) 
			{
				screenRay = uiCam.ScreenPointToRay(screenPos);

						// handle buttons lighting up if holding over them
					if (Physics.Raycast(screenRay, buttonHit, 200, hudMask)) 
				    {
							// execute button
				       	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
				    }
			}
				// check if mouse released
			if (Input.GetMouseButtonUp(0)) 
			{
					// we touch ended. Enable over sound again ...
				overPlayed = false;

				screenRay = uiCam.ScreenPointToRay(Input.mousePosition);
			
	        	if (Physics.Raycast(screenRay, buttonHit, 200, hudMask)) 
	        	{
		        		// execute button
		       		buttonHit.collider.gameObject.SendMessage("execute");						// run the code attached to button
		    	} 
			}
		//}
#endif
	}
	
	
//
	//* /		
/* OLD HANDLING			
			// handle touch detection ...
#if UNITY_IPHONE
			if (inputScript.nextTouch < Time.time)
			{				
					// check if display pressed
				for(var touch: Touch in Input.touches)
				{
					var pos: Vector2 = touch.position;		// get the touch input and it's position
					var currPhase = touch.phase;
					
					if(TouchPhase.Ended == currPhase)
					{					
						screenRay = uiCam.ScreenPointToRay(pos);
				
				       	if (Physics.Raycast(screenRay, buttonHit, 200)) 
				       	{
				       			// store new touch timer only if actually touched something
							//inputScript.nextTouch = Time.time + 1.0;
				       	
				           	buttonHit.collider.gameObject.SendMessage("execute");						// run the code attached to button
				       	}
				    }
				    else if (TouchPhase.Began == currPhase || TouchPhase.Ended == currPhase || TouchPhase.Moved == currPhase)
				    {
				    	screenRay = uiCam.ScreenPointToRay(pos);
				
				       	if (Physics.Raycast(screenRay, buttonHit, 200)) 
				       	{
				           	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
				       	}
				    }
				}	
			}
#endif

#if !UNITY_IPHONE

				// check if mouse pressed
			if (Input.GetMouseButtonUp(0)) 
			{
				//if (inputScript.nextTouch < Time.time)
				//{					
					print ("called");
						// scan touch
					screenRay = uiCam.ScreenPointToRay(Input.mousePosition);
			
		        	if (Physics.Raycast(screenRay, buttonHit, 200)) 
		        	{
		        			// setup next interval
						//inputScript.nextTouch = Time.time + 1.0;
						
		            	buttonHit.collider.gameObject.SendMessage("execute");						// run the code attached to button
		        	}
		        //}
	    	}
	    	if (Input.GetMouseButton(0))
	    	{
	    		//if (inputScript.nextTouch < Time.time)
				//{
						// setup next interval
					inputScript.nextTouch = Time.time + 1.0;
						
						
			
		        	if (Physics.Raycast(screenRay, buttonHit, 200)) 
		        	{
		        			// scan touch
		    			//screenRay = uiCam.ScreenPointToRay(Input.mousePosition);
		    			
		            	buttonHit.collider.gameObject.SendMessage("over");						// run the code attached to button
		        	}
		        //}
	    	}
	    	
#endif
*/ // END OLD HANDLING			
			
	}

}