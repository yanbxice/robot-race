var initWaypoint : Transform;
var initWaypointScr : wpAttribs;
var doInit : boolean = false;
private var defaultRespawn : boolean = false;
var reconnect : boolean = false;
private var doShortcuts : boolean = false;

private var currWp : Transform;
private var currWpScr : wpAttribs;
private var nextWp : Transform;
private var nextWpScr : wpAttribs;

private var altWp : Transform;
private var altWpScr : wpAttribs;
 
private var shortcutList : wpAttribs[] = new wpAttribs[8];
private var shortcutTrn : Transform[] = new Transform[8];
private var shortcutCount : int = 0;


function OnDrawGizmosSelected () 
{
	if (reconnect)
	{
		reconnect = false;
	
		var initLevelGO = GameObject.Find("_levelSettings_grp_doNotMove");
				
		if (initLevelGO == null)
		{
			print ("OOPS! Looks like you have no _levelSettings_grp_doNotMove object in your scene!!!");		
		}
		else
		{
			var firstWP = GameObject.Find("waypoint_0");
			
			
			if(firstWP == null)
			{
				print ("OOPS! You either have NO, or more than one object called waypoint_0 in your scene");
			}
			else
			{
				var initLevel_Scr : initLevel = GameObject.Find("_levelSettings_grp_doNotMove").GetComponent(initLevel) as initLevel;
			
				initLevel_Scr.waypoint = firstWP.transform;
				
			}
		}
	}


	if (doInit)
	{
		var counter : int = 0;
		shortcutCount = 0;
		shortcutList = new wpAttribs[8];
		shortcutTrn = new Transform[8];
		
		// #################
		//
		//	FIRST NEXT WP LOOP
			
			// init current stuff
		currWp = initWaypoint;
		currWpScr = initWaypointScr;
		
			// get the next wp script
		nextWp = initWaypointScr.nextWp;	
		nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility

			// this time correct order ...
		altWp = initWaypointScr.altWp;
		altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
		
			// for the second waypoint, set prevStart to true!!
		altWpScr.prevStart = true;
		nextWpScr.prevStart = true;
		
			// now loop through all next wps
		while(!nextWpScr.isStart)
		{
				// set default spawnpoint
			currWpScr.dropRespawn = currWpScr.nextWp;
		
				// get the next waypoints optimal offset setting
			currWpScr.nextOptimalOffset = nextWpScr.optimalOffset;
			currWpScr.altOptimalOffset = altWpScr.optimalOffset;
			
				// get the next segments width
			currWpScr.nextWidth = nextWpScr.segmentWidth;
			currWpScr.altWidth = altWpScr.segmentWidth;
		
				// get the seglen first ...
			currWpScr.segLen = Vector3.Distance(currWp.position, nextWp.position) + 20.0;
			
				// set the index (they just need to be all different and above -99)
			currWpScr.waypointIndex = counter;
			counter++;
			
				// align the aimVector to the next waypoint..
			currWpScr.aimVector.LookAt(nextWp);
			
				// if the next waypoint is a shortcut .. store it
			if (altWpScr.firstShortcut)
			{
				shortcutList[shortcutCount] = altWpScr;
				shortcutTrn[shortcutCount] = altWp;
				shortcutCount++;
			}
			
				// get the next Waypoints
			currWp = nextWp;
			currWpScr = nextWpScr;
			
			nextWp = currWpScr.nextWp;									// using the script that was nextWpSr 2 lines before ..
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
			
			altWp = currWpScr.altWp;
			altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
		}
		
			// if our next wp is the start, set the current to nextStart
		currWpScr.nextStart = true;	
		
			// set default spawnpoint
		currWpScr.dropRespawn = currWpScr.nextWp;

			// get the next waypoints optimal offset setting
		currWpScr.nextOptimalOffset = nextWpScr.optimalOffset;
		currWpScr.altOptimalOffset = altWpScr.optimalOffset;
		
			// get the next segments width
		currWpScr.nextWidth = nextWpScr.segmentWidth;
		currWpScr.altWidth = altWpScr.segmentWidth;
		
			// get the seglen first ...
		currWpScr.segLen = Vector3.Distance(currWp.position, nextWp.position) + 20.0;
		
			// set the index (they just need to be all different and above -99)
		currWpScr.waypointIndex = counter;
		counter++;
		
			// align the aimVector to the next waypoint..
		currWpScr.aimVector.LookAt(nextWp);
		
		
		// #################
		//
		//	TrackPassed NEXT LOOP	(and next Loop at the end ...)
		
			// init first WP track Passed as 0
		initWaypointScr.trackPassed = 0.0;
		
			// set all other lengths...
			
			// init current stuff
		currWp = initWaypoint;
		currWpScr = initWaypointScr;
		
			// get the next wp script
		nextWp = initWaypointScr.nextWp;	
		nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility	
		
			// this time correct order ...
		altWp = initWaypointScr.altWp;
		altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
		
			// now loop through all alt wps
		while(!nextWpScr.isStart)
		{
				// set the track passed value...
			nextWpScr.trackPassed = currWpScr.trackPassed + currWpScr.segLen;
			altWpScr.trackPassed = nextWpScr.trackPassed;
			
				// get the next Waypoints
			currWp = nextWp;
			currWpScr = nextWpScr;
			
			nextWp = currWpScr.nextWp;									// using the script that was nextWpSr 2 lines before ..
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
			
				// this time correct order ...
			altWp = currWpScr.altWp;
			altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
		}
		
		
			// Finally get the full len at the initial Waypoint ... (currWp is still the last set wp)
		initWaypointScr.fullLen = currWpScr.trackPassed + currWpScr.segLen;
		
			// end update
		doInit = false;
		doShortcuts = true;
	}
	
	if (doShortcuts)
	{
		for (var i = 0; i<shortcutCount; i++)
		{
			var shortCount : int = 0;
			
			shortCount = shortCount + (1000 * (i+1) );
			
			// #################
			//
			//	ALT WP LOOP			(This one first as it will alter out nextWP distances)
			
					// init current stuff
			currWp = shortcutTrn[i];
			currWpScr = shortcutList[i];
			// var prevScr : wpAttribs = (prevWp.GetComponent(wpAttribs) as wpAttribs);
			
				// get the next wp script
			nextWp = currWpScr.nextWp;	
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility

				// get the alt WP (reversed here as later added for offset and width handling)
			altWp = currWpScr.altWp;
			altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);

				// now loop through all alt WPs
			while(!currWpScr.lastShortcut)
			{
					// set default spawnpoint
				currWpScr.dropRespawn = currWpScr.nextWp;
				
					// get the alt waypoints optimal offset setting
				currWpScr.altOptimalOffset = altWpScr.optimalOffset;
				currWpScr.nextOptimalOffset = nextWpScr.optimalOffset;
				
					// get the next segments width
				currWpScr.nextWidth = nextWpScr.segmentWidth;
				currWpScr.altWidth = altWpScr.segmentWidth;
				
					// get the seglen first ...
				currWpScr.segLen = Vector3.Distance(currWp.position, nextWp.position) + 20.0;
				
					// store the actual shortcut length
				nextWpScr.trackPassed = currWpScr.trackPassed + currWpScr.segLen;
				altWpScr.trackPassed = nextWpScr.trackPassed;
				
					// set the index (they just need to be all different and above -99)
				currWpScr.waypointIndex = shortCount;
				shortCount++;
				
					// align the aimVector to the next waypoint..
				currWpScr.aimVector.LookAt(nextWp);
				
					// get the next Waypoints
				currWp = nextWp;
				currWpScr = nextWpScr;
				
				nextWp = currWpScr.nextWp;									// using the script that was nextWpSr 2 lines before ..
				nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
				
				altWp = currWpScr.altWp;
				altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
			}
			
			//
			//	handle the last WP
			//
			
				// set default spawnpoint
				currWpScr.dropRespawn = currWpScr.nextWp;
			
				// calc this stuff for the last shortcut WP, too
			// get the alt waypoints optimal offset setting
			currWpScr.altOptimalOffset = altWpScr.optimalOffset;
			currWpScr.nextOptimalOffset = nextWpScr.optimalOffset;
				
				// get the next segments width
			currWpScr.nextWidth = nextWpScr.segmentWidth;
			currWpScr.altWidth = altWpScr.segmentWidth;
				
				// get the seglen first ...
			currWpScr.segLen = Vector3.Distance(currWp.position, nextWp.position) + 20.0;
				
				// set the index (they just need to be all different and above -99)
			currWpScr.waypointIndex = shortCount;
			shortCount++;
				
				// align the aimVector to the next waypoint..
			currWpScr.aimVector.LookAt(nextWp);
				
				// get the next Waypoints
			//currWp = nextWp;
			//currWpScr = nextWpScr;
				
			//nextWp = currWpScr.nextWp;									// using the script that was nextWpSr 2 lines before ..
			//nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
				
			//altWp = currWpScr.altWp;
			//altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
			
				// now get the existing distances ...
			var endPassed : float = nextWpScr.trackPassed;
			var startPassed : float = shortcutList[i].trackPassed;
			
			var distAll : float = endPassed - startPassed;
			var distActual : float = (currWpScr.trackPassed + currWpScr.segLen) - startPassed;
			
			var ratio : float = distAll / distActual;
			
			//print ("Dist All: " + distAll + " Dist Actual: " + distActual + " Ratio " + ratio);
			
				// now go through them again and set revised lengths
			currWp = shortcutTrn[i];
			currWpScr = shortcutList[i];
			
				// get the next wp script
			nextWp = currWpScr.nextWp;	
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility

				// get the alt WP (reversed here as later added for offset and width handling)
			altWp = currWpScr.altWp;
			altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);

				


				// now loop through all alt WPs
			while(!currWpScr.lastShortcut)
			{

					// get the correctseglen first ...
				currWpScr.segLen = currWpScr.segLen * ratio;
				
					// store the actual shortcut length
				nextWpScr.trackPassed = currWpScr.trackPassed + currWpScr.segLen;
				altWpScr.trackPassed = nextWpScr.trackPassed;

					// get the next Waypoints
				currWp = nextWp;
				currWpScr = nextWpScr;
				
				nextWp = currWpScr.nextWp;									// using the script that was nextWpSr 2 lines before ..
				nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
				
				altWp = currWpScr.altWp;
				altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
			}
			
			// same on last WP
				// get the correctseglen first ...
			currWpScr.segLen = currWpScr.segLen * ratio;
				
				// store the actual shortcut length
			//nextWpScr.trackPassed = currWpScr.trackPassed + currWpScr.segLen;
			//altWpScr.trackPassed = nextWpScr.trackPassed;
			
			
				// end update
			doShortcuts = false;
		}
	}

/*	OLD INIT
		// if enabled traverse through all waypoints and set their segLen
	if(doInit)
	{
	
		var counter : int = 0;
		
		// #################
		//
		//	ALT WP LOOP			(This one first as it will alter out nextWP distances)
		
				// init current stuff
		currWp = initWaypoint;
		currWpScr = initWaypointScr;
		
			// get the next wp script
		nextWp = initWaypointScr.altWp;	
		nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility
		
		
		
			// get the alt WP (reversed here as later added for offset and width handling)
		altWp = initWaypointScr.nextWp;
		altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
		
			// for the second waypoint, set prevStart to true!!
		altWpScr.prevStart = true;
		nextWpScr.prevStart = true;
				
			// now loop through all alt WPs
		while(!nextWpScr.isStart)
		{
				// get the alt waypoints optimal offset setting
			currWpScr.altOptimalOffset = nextWpScr.optimalOffset;
			currWpScr.nextOptimalOffset = altWpScr.optimalOffset;
			
				// get the next segments width
			currWpScr.altWidth = nextWpScr.segmentWidth;
			currWpScr.nextWidth = altWpScr.segmentWidth;
			
				// get the seglen first ...
			currWpScr.segLen = Vector3.Distance(currWp.position, nextWp.position) + 20.0;
			
				// set the index (they just need to be all different and above -99)
			currWpScr.waypointIndex = counter;
			counter++;
			
				// align the aimVector to the next waypoint..
			currWpScr.aimVector.LookAt(nextWp);
			
				// get the next Waypoints
			currWp = nextWp;
			currWpScr = nextWpScr;
			
			nextWp = currWpScr.altWp;									// using the script that was nextWpSr 2 lines before ..
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
			
			altWp = currWpScr.nextWp;
			altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
		}
			// if our next wp is the start, set the current to nextStart
		currWpScr.nextStart = true;	
		
		counter++;
	
		// #################
		//
		//	NEXT WP LOOP
			
			// init current stuff
		currWp = initWaypoint;
		currWpScr = initWaypointScr;
		
			// get the next wp script
		nextWp = initWaypointScr.nextWp;	
		nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility

			// this time correct order ...
		altWp = initWaypointScr.altWp;
		altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
		
			// now loop through all alt wps
		while(!nextWpScr.isStart)
		{
				// get the next waypoints optimal offset setting
			currWpScr.nextOptimalOffset = nextWpScr.optimalOffset;
			currWpScr.altOptimalOffset = altWpScr.optimalOffset;
			
				// get the next segments width
			currWpScr.nextWidth = nextWpScr.segmentWidth;
			currWpScr.altWidth = altWpScr.segmentWidth;
		
				// get the seglen first ...
			currWpScr.segLen = Vector3.Distance(currWp.position, nextWp.position) + 20.0;
			
				// set the index (they just need to be all different and above -99)
			currWpScr.waypointIndex = counter;
			counter++;
			
				// align the aimVector to the next waypoint..
			currWpScr.aimVector.LookAt(nextWp);
			
				// get the next Waypoints
			currWp = nextWp;
			currWpScr = nextWpScr;
			
			nextWp = currWpScr.nextWp;									// using the script that was nextWpSr 2 lines before ..
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
			
			altWp = currWpScr.altWp;
			altWpScr = (altWp.GetComponent(wpAttribs) as wpAttribs);
		}
		// if our next wp is the start, set the current to nextStart
		currWpScr.nextStart = true;	
		
			// since the script starte before executing the last waypoint .. do that here ..

			// get the next waypoints optimal offset setting
		currWpScr.nextOptimalOffset = nextWpScr.optimalOffset;
		currWpScr.altOptimalOffset = altWpScr.optimalOffset;
		
			// get the next segments width
		currWpScr.nextWidth = nextWpScr.segmentWidth;
		currWpScr.altWidth = altWpScr.segmentWidth;
		
			// get the seglen first ...
		currWpScr.segLen = Vector3.Distance(currWp.position, nextWp.position) + 20.0;
		
			// set the index (they just need to be all different and above -99)
		currWpScr.waypointIndex = counter;
		counter++;
		
			// align the aimVector to the next waypoint..
		currWpScr.aimVector.LookAt(nextWp);
						

		
		
	
		// #################
		//
		//	TrackPassed ALT LOOP	(start with ALT loop again)
		
			// init first WP track Passed as 0
		initWaypointScr.trackPassed = 0.0;
		
			// set all other lengths...
			
			// init current stuff
		currWp = initWaypoint;
		currWpScr = initWaypointScr;
		
			// get the next wp script
		nextWp = initWaypointScr.altWp;	
		nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility	
		
			// now loop through all alt wps
		while(!nextWpScr.isStart)
		{
				// set the track passed value...
			nextWpScr.trackPassed = currWpScr.trackPassed + currWpScr.segLen;
			
				// get the next Waypoints
			currWp = nextWp;
			currWpScr = nextWpScr;
			
			nextWp = currWpScr.altWp;									// using the script that was nextWpSr 2 lines before ..
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
		}	
			
			
			
		// #################
		//
		//	TrackPassed NEXT LOOP	(and next Loop at the end ...)
		
			// init first WP track Passed as 0
		initWaypointScr.trackPassed = 0.0;
		
			// set all other lengths...
			
			// init current stuff
		currWp = initWaypoint;
		currWpScr = initWaypointScr;
		
			// get the next wp script
		nextWp = initWaypointScr.nextWp;	
		nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility	
		
			// now loop through all alt wps
		while(!nextWpScr.isStart)
		{
				// set the track passed value...
			nextWpScr.trackPassed = currWpScr.trackPassed + currWpScr.segLen;
			
				// get the next Waypoints
			currWp = nextWp;
			currWpScr = nextWpScr;
			
			nextWp = currWpScr.nextWp;									// using the script that was nextWpSr 2 lines before ..
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
		}
		
		
			// Finally get the full len at the initial Waypoint ... (currWp is still the last set wp)
		initWaypointScr.fullLen = currWpScr.trackPassed + currWpScr.segLen;
			
	}
*/
	

	
		// init respawn
			// if enabled traverse through all waypoints and set their segLen
	if(defaultRespawn)
	{
		
		// #################
		//
		//	ALT WP LOOP			(This one first as it will alter out nextWP distances)
		
				// init current stuff
		currWp = initWaypoint;
		currWpScr = initWaypointScr;
		
			// get the next wp script
		nextWp = initWaypointScr.altWp;	
		nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility
		
			// now loop through all alt WPs
		while(!nextWpScr.isStart)
		{
				// set default spawnpoint
			currWpScr.dropRespawn = currWpScr.nextWp;
			
				// get the next Waypoints
			currWp = nextWp;
			currWpScr = nextWpScr;
			
			nextWp = currWpScr.altWp;									// using the script that was nextWpSr 2 lines before ..
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
			
		}

	
		// #################
		//
		//	NEXT WP LOOP
			
			// init current stuff
		currWp = initWaypoint;
		currWpScr = initWaypointScr;
		
			// get the next wp script
		nextWp = initWaypointScr.nextWp;	
		nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs); 	// cast as Type for iPhone compatibility
		
			// now loop through all alt wps
		while(!nextWpScr.isStart)
		{
				// set default spawnpoint
			currWpScr.dropRespawn = currWpScr.nextWp;
			
				// get the next Waypoints
			currWp = nextWp;
			currWpScr = nextWpScr;
			
			nextWp = currWpScr.nextWp;									// using the script that was nextWpSr 2 lines before ..
			nextWpScr = (nextWp.GetComponent(wpAttribs) as wpAttribs);
		}
		
			// since the script starte before executing the last waypoint .. do that here ..

			// set default spawnpoint
		currWpScr.dropRespawn = currWpScr.nextWp;
						
	
	}
}