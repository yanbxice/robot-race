using UnityEngine;
using System.Collections;

public class placeMe : MonoBehaviour {
	
		// transforms to align 
	public Transform targetPos;
	private Transform myTrans;
	private Vector3 lastPos;
	public bool scaleOnly;
	
		// will this items position be updated?
	public bool isStatic = false;
	public bool doUpdate = false;

	// Use this for initialization
	void Start () {
		myTrans = transform;
		if (!scaleOnly)
		{
			myTrans.position = targetPos.position;
			myTrans.rotation = targetPos.rotation;
			myTrans.localScale = targetPos.localScale;
			
			lastPos = myTrans.position;
		}
	}
	
	// Update is called once per frame
	void Update () {

		if (!isStatic) {
			if (lastPos != myTrans.position) {
				if (!scaleOnly)
				{
					myTrans.position = targetPos.position;
					myTrans.rotation = targetPos.rotation;
				}
				myTrans.localScale = targetPos.localScale;
				lastPos = myTrans.position;
			}
		}

	}
	
	void OnDrawGizmosSelected () {
		if (!scaleOnly)
		{
	
			if (doUpdate) {
				doUpdate = false;
				myTrans = transform;
				myTrans.position = targetPos.position;
				myTrans.rotation = targetPos.rotation;
				myTrans.localScale = targetPos.localScale;
				print ("Moved !!");
			}
		}
	}
}
