using UnityEngine;
using System.Collections;

public class EndMenuFigure : MonoBehaviour 
{
	public Transform figureTransform;
	public GameObject figureParent;
	private GameObject figure;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		if(figureParent.transform.GetChildCount() > 0 && figure == null)
		{
			GameObject.Find("SamUICamera").GetComponent<Camera>().depth = 99;
			figure = Instantiate(figureParent.transform.GetChild(0).gameObject, figureTransform.position, figureTransform.rotation) as GameObject;
			figure.transform.parent = transform;
			figure.SetActiveRecursively(false);
		}
	}
	
	public void ShowFigure()
	{
		if(figure)
		{
			figure.SetActiveRecursively(true);
			figure.animation.Play("Stand_Idle");
		}
	}
	
	public void HideFigure()
	{
		if(figure)
		{
			figure.SetActiveRecursively(false);
		}
	}
}
