var toPosition : Vector3;
var startTime : float = 0.28;

function Start()
{
	Invoke("getInPos", startTime);
}

function getInPos () 
{
	transform.localPosition = toPosition;
}