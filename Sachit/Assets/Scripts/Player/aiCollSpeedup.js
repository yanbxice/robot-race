// This scripts fuction is run when player is hit from behind ...
//
//	It speeds him up temporarily
//
//		frontHit.collider.gameObject.SendMessage("collectPickup")
//

var robotScript : aiMove;

function hitBack () 
{

	robotScript.backColl = true;

}