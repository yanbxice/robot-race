var HUD_Jump_btn : HUD_SingleButton;
var HUD_Slide_btn : HUD_SingleButton;

var HUD_Speed_anim : HUD_SingleButton;

private var HUD_Jump : boolean = false;
private var HUD_Slide : boolean = false;
private var SpeedActive : boolean = false;

function Update () 
{
		// #####   HANDLE JUMP   #####
		// #####   HANDLE JUMP   #####
		// #####   HANDLE JUMP   #####
	if (Input.GetButton ("Jump"))
	{
		if (!HUD_Jump)
		{		// if button not yet active ... else don't change hud
					
				// change the jump button
			HUD_Jump_btn.changeState(1);
			HUD_Jump = true;
		}
	}else if (HUD_Jump){HUD_Jump_btn.changeState(0); HUD_Jump = false;}
	
	
		// #####   HANDLE Slide   #####
		// #####   HANDLE Slide   #####
		// #####   HANDLE Slide   #####
	if (Input.GetButton ("Slide"))
	{
		if (!HUD_Slide)
		{		// if button not yet active ... else don't change hud
					
				// change the slide button
			HUD_Slide_btn.changeState(1);
			HUD_Slide = true;
			
				// toggle the speed animation
			if (SpeedActive)
			{
				SpeedActive = false;
				HUD_Speed_anim.playAnim = false;
			}
			else
			{
				SpeedActive = true;
				HUD_Speed_anim.playAnim = true;
			}
		}
	}
	else if (HUD_Slide)
	{
			// change button back
		HUD_Slide_btn.changeState(0);
		HUD_Slide = false;
	}
}