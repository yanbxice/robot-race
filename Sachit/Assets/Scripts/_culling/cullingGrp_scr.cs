using UnityEngine;
using System.Collections;

public class cullingGrp_scr : MonoBehaviour {

	public Renderer[] grpRenderers;
	public int grpItems = 0;
	public bool doUpdate = false;
	public int groupID = 0;

	void OnDrawGizmosSelected () 
	{
		if (doUpdate)
		{
				// get the randerers of all children
			Renderer[] childRenderers = transform.GetComponentsInChildren<Renderer>();
			grpItems = childRenderers.Length;
				
				// reInitialize our array (if needed)
			if (childRenderers != null)
			{
					// reInit
				grpRenderers = new Renderer[grpItems];
				
					// fill the array with our renderers
				for (var i = 0; i < grpItems; i++)
				{
					grpRenderers[i] = childRenderers[i];
				}
				
				Debug.Log (grpItems + " Renderers added to group!!! ");
			}
			else
			{
				Debug.Log ("There are no Renderes in this group! Nothing added");
			}
				// make sure this is run ONCE
			doUpdate = false;
		}
	}
	
	public void hideGrp()
	{
		
			// make sure we have renderers in our group
		if (grpItems > 0)
		{
			for (var hideItem = 0; hideItem < grpItems; hideItem++)
			{
					// make item invisible
				grpRenderers[hideItem].enabled = false;
			}
		}
	}
	
	public void showGrp()
	{
			// make sure we have renderers in our group
		if (grpItems > 0)
		{
			for (var showItem = 0; showItem < grpItems; showItem++)
			{
					// make item invisible
				grpRenderers[showItem].enabled = true;
			}
		}
	}
}
