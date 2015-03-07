var thisTrans : Transform;
//var skyshotSpritesF : HUD_SingleButton;
//var skyshotSpritesS : HUD_SingleButton;
var skyshotAnim : Animation;
var skyshotSound : AudioClip;
var setTag : String = "leader";

private var fireShot : boolean = false;
private var fireTimer : float;
private var thisGO : GameObject;

function Start()
{
	thisGO = gameObject;
	
	thisGO.GetComponent(BoxCollider).size = Vector3(0.8,80,0.8);
}

function doFire()
{
		// set fire shot to on
	fireShot = true;

		// start Sprite animation
	//skyshotSpritesF.playAnim = true;
	//skyshotSpritesS.playAnim = true;

		// set correct tag
	thisGO.tag = setTag;
		
		// start skyshot anim
	skyshotAnim.Play("idle");
		
		// play hit sound
	audio.clip = skyshotSound;
	audio.Play ();
	
		// set our timer
	fireTimer = Time.time + 3.0;
}

function Update () 
{
	if(fireShot)
	{
			// after shooting 2 seconds ..
		if(Time.time > fireTimer)
		{
			//skyshotSpritesF.playAnim = false;
			//skyshotSpritesS.playAnim = false;
			thisTrans.localPosition = Vector3(0,0,0);
			
			skyshotAnim.Stop();
			fireShot = false;
		}
	}
}
