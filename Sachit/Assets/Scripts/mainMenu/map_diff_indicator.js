// Single Race Button handling

var buttonScript : HUD_SingleButton;

var diff : int = 0;
var lastState : int = 0;								// the last state we had ..

function Update()
{
	if (lastState != (DataTransfer.trackUnlocks[(DataTransfer.activeLevel-1)]))
	{
			// if the currently selected map is unlocked at this difficulty ... highlight
			// EDIT -> Check if unlocked ONLY (No Diff)
		if (DataTransfer.trackUnlocks[(DataTransfer.activeLevel-1)] > 0)
		{
			buttonScript.changeState(1);
		}
		else
		{	
			buttonScript.changeState(0);
		}
		
			// register the change
		lastState = (DataTransfer.trackUnlocks[(DataTransfer.activeLevel-1)]);
	}
}