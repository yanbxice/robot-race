// This scripts fuction is run when player is hit from behind ...
//
//	It speeds him up temporarily
//
//		frontHit.collider.gameObject.SendMessage("collectPickup")
//

var robotScript : pMove;

function hitBack () 
{
	robotScript.backColl = true;
}