var _menuHandler : debugMenuStates;
var _touchHandler : touchHandler;
var _btnScript : HUD_SingleButton;

//var badgeName : TextMesh;
//var badgeDescription : TextMesh;
//var badgeState : TextMesh;

var badgeNameLoc : UILocalize;
var badgeDescriptionLoc : UILocalize;
var badgeStateLoc : UILocalize;

//var badgeNames : String[] = [];
//var badgeDescriptions : String[] = new String[11];
//var badgeStates : String[] = new String[2];

private var visBadge : int = 99;

function Start()
{
	//badgeName.renderer.material.color = Color(1,1,0,1);
}

function Update()
{
		// is the badge screen active?
	//if (_menuHandler.badgeScreen)
	if (_touchHandler.debugMenu == 40)
	{
			// do we need to change our badge?
		if (_menuHandler.currBadge != visBadge)
		{
				// if not achieved yet, set to dark
			if (DataTransfer.badgesCareer[_menuHandler.currBadge] == 0)
			{
					// set to dark state
				_btnScript.changeState((_menuHandler.currBadge * 2) + 1);
				
					// set text to disabled mode
				// badgeState.text = LanguageHandler.badgeStates[0];
				badgeStateLoc.key = "badgeStates0";
				
			}
				// else light up
			else
			{
					// set to active state
				_btnScript.changeState(_menuHandler.currBadge * 2);
				
					// set text to enabled mode
				// badgeState.text = LanguageHandler.badgeStates[1];
				badgeStateLoc.key = "badgeStates1";
			}
			
				// set our global texts ...
			//badgeName.text = LanguageHandler.badgesNames[_menuHandler.currBadge];
			//badgeDescription.text = LanguageHandler.badgeDescriptions[_menuHandler.currBadge];
			
			badgeNameLoc.key = "badgesNames" + (_menuHandler.currBadge + 1).ToString();
			badgeDescriptionLoc.key = "badgeDescriptions" + (_menuHandler.currBadge + 1).ToString();
			
				// trigger localize refresh
			NGUI_Handler.locUpdate = true;
			Debug.Log ("badge_screen");
			
			
				// save our current state
			visBadge = _menuHandler.currBadge;
			DataTransfer.currentBadge = _menuHandler.currBadge;
		}
	}
}

