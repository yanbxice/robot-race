// Scanner script to handle jumpTiggering if we have contact with them ...
//
//
//	Scanners should have a seperate Layer and Ignore each other ...
//
//	To Do:
//		Keep track of players! Learn to avoid them, too
//

var moveScript : aiMove;

	// keep track of how many objects are inside our trigger
// var insideObjects : int = 0;


function OnTriggerEnter (hit : Collider)
{
	// insideObjects++;
	
		// set our obstacle flag
	//if (insideObjects > 0)
	//{
		moveScript.jumpCall = true;
	//}
}

/*
function OnTriggerExit (hit : Collider)
{
		insideObjects--;
		
			// set our obstacle flag
		if (insideObjects <= 0)
		{
			insideObjects = 0;
			moveScript.jumpCall = false;
		}
}
*/