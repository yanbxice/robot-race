var moverTrns : Transform;
var pauseTime : float;
var startDelay : float;

var startPos : Vector3 = new Vector3(0, 0, 0);
var targetPos : Vector3 = new Vector3(5, 0, 0);
var moveSpeed : float = 4.0;

var moveActive : boolean = false;
var movePingPong : boolean = true;

private var moveTo : boolean = false;
private var moveBack : boolean = false;

function Start ()
{
	if (moveActive)
	{
			// get into start position
		moverTrns.localPosition = startPos;
		
			// invoke movement
		Invoke("setMoveTo", startDelay);
	}
}

function setMoveTo()
{
	moveTo = true;
}

function setMoveBack()
{
	moveBack = true;
}

function Update () 
{
	if (moveActive)
	{
			// move into position
		if(moveTo)
		{
				// move in position
			moverTrns.localPosition = Vector3.MoveTowards(moverTrns.localPosition, targetPos, Time.deltaTime *  moveSpeed);
			
				// check if we reached our target
			// if (Mathf.Abs(moverTrns.localPosition.x - targetPos.x) < 0.01 )
			if ((moverTrns.localPosition - targetPos).sqrMagnitude < 0.04 )
			{
				if (movePingPong)
				{		// if we move back and forth
					moveTo = false;
					Invoke ("setMoveBack", pauseTime);
				}
				else
				{		// if we just restart
					moverTrns.localPosition = startPos;
					Invoke ("setMoveTo", pauseTime);
				}
			}
		}
		else if (moveBack)
		{
				// move in position
			moverTrns.localPosition = Vector3.MoveTowards(moverTrns.localPosition, startPos, moveSpeed * Time.deltaTime);
			
				// check if we reached our target
			if ((moverTrns.localPosition - startPos).sqrMagnitude < 0.04 )
			{
				moveBack = false;
				Invoke ("setMoveTo", pauseTime);
			}
		}
	}
}