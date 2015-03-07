
var delay : float = 0.0;
var anim : Animation;


function startRail()
{
	anim.Play();
}


function Start () 
{
	Invoke("startRail", delay);
}