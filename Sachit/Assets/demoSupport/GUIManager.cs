using UnityEngine;
using System.Collections;

public class GUIManager : MonoBehaviour
{
	void OnGUI()
	{
		if( GUI.Button( new Rect( 0, 0, 150, 40 ), "Track 'oneOne' variants" ) )
		{
			// log some page views and events for the page 'one' and some subpages
			Google.analytics.logPageView( "/oneOne/partTwo/partThree/partFour", "Really long url" );
			Google.analytics.logEvent( "/oneOne/partTwo", "twoCategory", "twoAction" );
			Google.analytics.logPageView( "/oneOne/partTwo", "This is the partTwo page title" );
			Google.analytics.logEvent( "/oneOne/partTwo/partThree/partFour", "oneCategory", "oneAction" );
			
			// used for testing persistance
			//Google.analytics.OnApplicationExit();
			
			Google.analytics.logEvent( "/pageView/part2", "categoryName", "actionName", "labelName", 100 );
		}
		
		
		if( GUI.Button( new Rect( 0, 55, 150, 40 ), "Track 'twoTwo' variants" ) )
		{
			Google.analytics.logPageView( "/twoTwo" );
			Google.analytics.logEvent( "/twoTwo", "twoCategory", "twoAction", "twoLabel", 669 );
		}
		
		
		if( GUI.Button( new Rect( 0, 110, 150, 40 ), "Track 'threeThree' variants" ) )
		{
			Google.analytics.logPageView( "/threeThree", "Im the page title" );
			Google.analytics.logPageView( "/threeThree/subElement" );
			Google.analytics.logEvent( "/threeThree/subElement", "twoCategory", "twoAction", "twoLabel", 669 );
		}
	}
}
