	// Whatever falls out of the activeZone triggers the OnDeath message
function OnTriggerExit (other: Collider) 
{
	other.gameObject.SendMessage ("OnExitAZ", SendMessageOptions.DontRequireReceiver);
	print ("Oooops! You dropped out of the active zone!!");

		// for now .. if you fall off the track .. restart the level ... (more advanced handling coming soon)
	Application.LoadLevel (0);
}

	// function where I could add an Icon ...
function OnDrawGizmos ()
{
	// Gizmos.DrawIcon (transform.position, "nameOfImage.png");
}