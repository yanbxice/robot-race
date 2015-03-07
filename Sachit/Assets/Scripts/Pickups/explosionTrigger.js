var explosionA : ExplodeScript;
var explosionB : ExplodeScript;
var audioSource : AudioSource;
var explosion : AudioClip;



function Explode () 
{
	explosionA.playAnim = true;
	explosionB.playAnim = true;
	
		// play hit sound
	audioSource.clip = explosion;
	audioSource.Play ();
}