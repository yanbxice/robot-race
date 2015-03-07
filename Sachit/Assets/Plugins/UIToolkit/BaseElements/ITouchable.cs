using UnityEngine;
using System.Collections;


public interface ITouchable
{
#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	bool hoveredOver { get; set; }
#endif
	bool highlighted { get; set; }
	bool hidden { get; set; }
	Rect touchFrame { get; }
	Vector3 position { get; set; }
	
	
	bool hitTest( Vector2 point );
	
	
#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	void onTouchBegan( SamUIFakeTouch touch, Vector2 touchPos );
#else
	void onTouchBegan( Touch touch, Vector2 touchPos );
#endif


#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	void onTouchMoved( SamUIFakeTouch touch, Vector2 touchPos );
#else
	void onTouchMoved( Touch touch, Vector2 touchPos );
#endif
	

#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	void onTouchEnded( SamUIFakeTouch touch, Vector2 touchPos, bool touchWasInsideTouchFrame );
#else
	void onTouchEnded( Touch touch, Vector2 touchPos, bool touchWasInsideTouchFrame );
#endif

}
