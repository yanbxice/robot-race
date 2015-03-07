#pragma strict

private var myTrans : Transform;
private var lastX : float;

function Start () {

	myTrans = transform;
	lastX = myTrans.localPosition.x;
	

}

function Update () {

	if (lastX != myTrans.localPosition.x) {
	
		myTrans.localPosition.x = 0;
	
	}

}