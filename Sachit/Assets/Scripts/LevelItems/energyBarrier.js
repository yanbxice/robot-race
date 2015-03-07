	// Energy Barrier Object
	
	// First get our needed Transforms

var barrierColl : BoxCollider;						// collider

var barrierMover : Animation;						// anim holders
var barrierAnim : Animation;

var barrierTR : Transform;							// the corner geometry
var barrierTL : Transform;
var barrierBR : Transform;
var barrierBL : Transform;

var barrierGeo : Transform;

var height : float = 2.0;							// size of barrier
var width : float = 4.0;

var anim : int = 1;									// which animation to play 2m, 4m, 6m or 8m

var delay : float = 0.0;							// how long to delay start of animation

var updateGizmos : boolean = false;

function Awake()
{
		// init collider on object
	barrierColl.center.y = 0;
	
		// set the collider size
	barrierColl.size.x = width;
	barrierColl.size.y = height;
	barrierColl.size.z = 1.5;
	
		// set the barrier corner positions
	barrierTR.localPosition.x = width * -0.48;
	barrierTR.localPosition.y = height * 0.44;
		
	barrierBR.localPosition.x = width * -0.48;
	barrierBR.localPosition.y = height * -0.44;
		
	barrierTL.localPosition.x = width * 0.48;
	barrierTL.localPosition.y = height * 0.44;
		
	barrierBL.localPosition.x = width * 0.48;
	barrierBL.localPosition.y = height * -0.44;
	
		// set the barrier scale
	barrierGeo.localScale = Vector3(width, height, 1);
	
		// check that we have a valid animation set
	if (anim > 3)
	{
		anim = 3;
	}
	else if (anim < 0)
	{
		anim = 0;
	}
	
		// invoke start of anim at specified time
	Invoke("startAnim", delay);
}

function startAnim ()
{
		// now start playing the animation
	if (anim == 0)
	{
		barrierMover.Play("barrier_2m");
	}
	else if (anim == 1)
	{
		barrierMover.Play("barrier_4m");
	}
	else if (anim == 2)
	{
		barrierMover.Play("barrier_6m");
	}
	else
	{
		barrierMover.Play("barrier_8m");
	}
}

function resetBarrier () 
{
		// init collider on object
	barrierColl.center.y = 0;
	
		// play the restore barrier anim
	barrierAnim.Play("barrier_on");
}

function OnDrawGizmosSelected()
{
	if (updateGizmos)
	{
	
			// set the collider size
		barrierColl.size.x = width;
		barrierColl.size.y = height;
		
			// set the barrier corner positions
		barrierTR.localPosition.x = width * -0.48;
		barrierTR.localPosition.y = height * 0.44;
		
		barrierBR.localPosition.x = width * -0.48;
		barrierBR.localPosition.y = height * -0.44;
		
		barrierTL.localPosition.x = width * 0.48;
		barrierTL.localPosition.y = height * 0.44;
		
		barrierBL.localPosition.x = width * 0.48;
		barrierBL.localPosition.y = height * -0.44;
		
			// set the barrier scale
		barrierGeo.localScale = Vector3(width, height, 1);
		
	}
}

function OnTriggerEnter(hit : Collider)
{
	if (hit.collider.CompareTag("Player"))
	{
			// move collider down collider on object
		barrierColl.center.y = -2000;
		
			// invoke resetting of barrier in 10 s
		Invoke("resetBarrier", 10.0);
		
			// play disable anim
		barrierAnim.Play("barrier_off");
	}
}

