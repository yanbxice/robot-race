// if hit send a far dist message to player to stop warning

var missleGO : GameObject;
var missleGuidance : missleShoot;
var playerInfo : getInfo;


var explosionPref : Transform;


function OnTriggerEnter (hit : Collider)
// function OnCollisionEnter (hit : Collider)
{

	if (hit.collider.CompareTag("Player"))
	{

					
		if (missleGuidance.isDeployed)
		{


				//if robot is jumping, don't trigger explosion and move along waypoints ..
					
				//get hit objects info script..
			var hitInfoScr = hit.collider.GetComponent(getInfo) as getInfo;
			
			if(hitInfoScr.jumping)
			{
					// if jumped over .. lose target focus ...
				missleGuidance.locked = false;
			}
			else
			{
					// destroy here ... and send hitMessage to target
				//hit.collider.gameObject.SendMessage("missleImpact");
				
					// make sure to disable warning on player screen ..
				playerInfo.missleClose = false;
				
					// start explosion
				var explosion = Instantiate(explosionPref, transform.position, transform.rotation);
				
					// start anim
				explosion.SendMessage("Explode");
				
					// destroy missle
				Destroy(missleGO);

			}
	
		}
	}
}
