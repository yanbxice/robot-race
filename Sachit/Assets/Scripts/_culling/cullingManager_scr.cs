using UnityEngine;
using System.Collections;

public class cullingManager_scr : MonoBehaviour {

	public cullingGrp_scr[] cullingGroups = new cullingGrp_scr[64];
	public cullingArea_scr startingArea;
	
	private int grpCount = 0;
	private bool[] visibleGrps = new bool[64];
	private bool[] areaGrps = new bool [64];
	
	void toggleGrps()
	{
			// go through arrays and set correct visibility
		for (var i = 0; i < grpCount; i++)
		{
				// check that the current group slot is used
			if (cullingGroups[i] == null)
			{
				//Debug.Log("Slot " + i + " is empty");	
			}
			else
			{		// do we need to change anything??
				if (areaGrps[i] != visibleGrps[i])
				{
						// do we need to enable the group
					if (areaGrps[i])
					{
							// show the group and store state
						cullingGroups[i].showGrp();
						visibleGrps[i] = true;
					}
					else
					{
							// hide the group and store state
						cullingGroups[i].hideGrp();
						visibleGrps[i] = false;
					}
				}
			}
		}
	}
	
	void Start()
	{
			// parent under main Camera
		transform.parent = Camera.main.transform;
		transform.localPosition = new Vector3(0,0,0);
		
			// fill all groups based on index
		cullingGrp_scr[] allGroups = FindObjectsOfType(typeof(cullingGrp_scr)) as cullingGrp_scr[];		// select all cullingGrps in scene
		
			// NO ERROR CHECKING HERE. MAKE SURE INDICES ARE CORRECTLY NUMBERED
			// fill array based on index
		grpCount = allGroups.Length;
		for (var grp = 0; grp < allGroups.Length; grp++)
		{
			cullingGroups[ allGroups[grp].groupID ] = allGroups[grp];
		}
		
			// init visArray as true
		for (var vis = 0; vis < 64; vis++)
		{
			visibleGrps[vis] = true;
		}

			// on Start enable the first Area visible groups
		areaGrps = startingArea.visibleGrps;
		
			// Invoke initial toggle the groups at the current state
		Invoke("toggleGrps", 0.25f);
	}
	
	void OnTriggerEnter (Collider hit)
	{
		//DEBUG
		//print ("Collider : " + hit);
		areaGrps = hit.GetComponent<cullingArea_scr>().visibleGrps;
		
			// toggle groups
		toggleGrps();
	}
	
}
