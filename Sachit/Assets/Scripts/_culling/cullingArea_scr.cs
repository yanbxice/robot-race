using UnityEngine;
using System.Collections;

public class cullingArea_scr : MonoBehaviour 
{

	public bool[] visibleGrps = new bool[64];

	/*
	public bool showArea = false;
	public bool showNoGizmos = false;
	public Color gizmoColor;
	
	void OnDrawGizmos()
	{
		if (showArea)
		{
			Gizmos.color = gizmoColor;  
   			Gizmos.DrawCube(transform.position, transform.localScale);
		}
	}
	
	void OnDrawGizmosSelected()
	{
		if (!showArea)
		{
			if (!showNoGizmos)
			{
				Gizmos.color = gizmoColor;  
	       		Gizmos.DrawCube(transform.position, transform.localScale);
			}
		}
	}
	*/
}
