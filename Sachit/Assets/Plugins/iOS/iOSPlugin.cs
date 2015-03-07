using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class iOSPlugin : MonoBehaviour {

	[DllImport ("__Internal")]
	private static extern void showGameCenter();
	
	[DllImport ("__Internal")]
	private static extern void authenticatePlayer();
	
	[DllImport ("__Internal")]
	private static extern void inviteFriends();
	
	[DllImport ("__Internal")]
	private static extern void getFriends();
	
	[DllImport ("__Internal")]
	private static extern void postScore(string leaderboard,long score);
	
	[DllImport ("__Internal")]
	private static extern void postChallenge(string leaderboard, string message, long score);
	
	[DllImport ("__Internal")]
	private static extern void showChallenges();
	
	[DllImport ("__Internal")]
	private static extern void postAchievement(string achievement, double percentagecomplete);
	
	[DllImport ("__Internal")]
	private static extern void resetAll();
	
	public static void showGC()
	{
		// Call plugin only when running on real device
		if (Application.platform != RuntimePlatform.OSXEditor)
			showGameCenter();
	}
	
	public static void auth()
	{
		// Call plugin only when running on real device
		if (Application.platform != RuntimePlatform.OSXEditor)
			authenticatePlayer();
	}
	
	public static void invFriends()
	{
		// Call plugin only when running on real device
		if (Application.platform != RuntimePlatform.OSXEditor)
			inviteFriends();
	}
	
	public static void gtFriends()
	{
		// Call plugin only when running on real device
		if (Application.platform != RuntimePlatform.OSXEditor)
			getFriends();
	}
	
	public static void pstScore(string leaderboard, long score)
	{
		if(leaderboard==null || leaderboard=="")
		{
			Debug.Log("Empty Leaderboard");
			return;
		}
		// Call plugin only when running on real device
		if (Application.platform != RuntimePlatform.OSXEditor)
			postScore(leaderboard,score);
	}
	
	public static void pstChallenge(string leaderboard, string message, long score)
	{
		if(leaderboard==null || leaderboard=="")
		{
			Debug.Log("Empty Leaderboard");
			return;
		}
		// Call plugin only when running on real device
		if (Application.platform != RuntimePlatform.OSXEditor)
			postChallenge(leaderboard,message,score);
	}
	
	public static void shwChallenges()
	{
		// Call plugin only when running on real device
		if (Application.platform != RuntimePlatform.OSXEditor)
			showChallenges();
	}
	
	public static void pstAchievement(string achievement, double percentagecomplete)
	{
		// Call plugin only when running on real device
		if(achievement==null || achievement=="")
		{
			Debug.Log("Empty Achievement");
			return;
		}
		if(percentagecomplete>100.0||percentagecomplete<0.0)
		{
			Debug.Log("Invalid percentage");
			return;
		}
		Debug.Log("Called Achievement : "+achievement+" "+percentagecomplete);
		
		if (Application.platform != RuntimePlatform.OSXEditor)
		{
			postAchievement(achievement,percentagecomplete);
		}
	}
	
	public static void reset()
	{
		if (Application.platform != RuntimePlatform.OSXEditor)
		{
			resetAll();
		}
	}
}
