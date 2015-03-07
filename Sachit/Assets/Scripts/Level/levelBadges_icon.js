var badgeIndex : int = 0;
var _btnScript : HUD_SingleButton;
private var isActual : boolean = false;
var badgeRewardLabel : UILabel;
var ref_holder : refHolder;
private var badgeRewards = [[15,20,30],[25,35,50],[10,15,20],[15,20,30],[5,10,15],[20,30,40],[10,15,20],[25,35,50],[5,10,15],[5,10,15],[20,30,40]];
var reward : int;

function Start()
{
	badgeRewards = [[15,20,30],[25,35,50],[10,15,20],[15,20,30],[5,10,15],[20,30,40],[10,15,20],[25,35,50],[5,10,15],[5,10,15],[20,30,40]];
}

function Update()
{
	if (DataTransfer.badgeUpdate)
	{
		if (!isActual)
		{
				// if not achieved yet, set to dark
			if (DataTransfer.badgesRace[badgeIndex] == 0)
			{
				_btnScript.changeState(0);
				badgeRewardLabel.text = "";
			}
				// else light up
			else
			{
				_btnScript.changeState(1);
				reward = badgeRewards[badgeIndex][ref_holder.aiDiff];
				badgeRewardLabel.text = "+" + badgeRewards[badgeIndex][ref_holder.aiDiff];
			}
			isActual = true;
		}
	}
}

