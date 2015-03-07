var badgeIndex : int = 0;
var _btnScript : HUD_SingleButton;

function Start()
{
		// if not achieved yet, set to dark
	if (DataTransfer.badgesCareer[badgeIndex] == 0)
	{
		_btnScript.changeState(0);
	}
		// else light up
	else
	{
		_btnScript.changeState(1);
	}
}

