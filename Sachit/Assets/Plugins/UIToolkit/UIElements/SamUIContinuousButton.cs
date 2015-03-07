using UnityEngine;
using System.Collections;


public class SamUIContinuousButton : SamUIButton
{
	public delegate void SamUIContinousButtonDelegate( SamUIButton sender );
	public event SamUIContinousButtonDelegate onTouchIsDown;
	public event SamUIContinousButtonDelegate onActivationStarted;
	public event SamUIContinousButtonDelegate onActivationEnded;
	
	public bool onlyFireStartAndEndEvents = false;
	
	
	public static new SamUIContinuousButton create( string filename, string highlightedFilename, int xPos, int yPos )
	{
		return create( SamUI.firstToolkit, filename, highlightedFilename, xPos, yPos );
	}

	
	public static new SamUIContinuousButton create( SamUIToolkit manager, string filename, string highlightedFilename, int xPos, int yPos )
	{
		return create( manager, filename, highlightedFilename, xPos, yPos, 1 );
	}
	
	
	public static new SamUIContinuousButton create( SamUIToolkit manager, string filename, string highlightedFilename, int xPos, int yPos, int depth )
	{
		// grab the texture details for the normal state
		var normalTI = manager.textureInfoForFilename( filename );
		var frame = new Rect( xPos, yPos, normalTI.frame.width, normalTI.frame.height );
		
		// get the highlighted state
		var highlightedTI = manager.textureInfoForFilename( highlightedFilename );
		
		// create the button
		return new SamUIContinuousButton( manager, frame, depth, normalTI.uvRect, highlightedTI.uvRect );
	}


	public SamUIContinuousButton( SamUIToolkit manager, Rect frame, int depth, SamUIUVRect uvFrame, SamUIUVRect highlightedUVframe ):base( manager, frame, depth, uvFrame, highlightedUVframe )
	{
	}


	// Touch handlers
#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	public override void onTouchBegan( SamUIFakeTouch touch, Vector2 touchPos )
#else
	public override void onTouchBegan( Touch touch, Vector2 touchPos )
#endif
	{
		base.onTouchBegan( touch, touchPos );

		if( onlyFireStartAndEndEvents && onActivationStarted != null )
			onActivationStarted( this );
	}

	
#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	public override void onTouchMoved( SamUIFakeTouch touch, Vector2 touchPos )
#else
	public override void onTouchMoved( Touch touch, Vector2 touchPos )
#endif
	{
		// dont fire this continously if we were asked to only fire start and end
		if( !onlyFireStartAndEndEvents && onTouchIsDown != null )
			onTouchIsDown( this );
	}
	

#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	public override void onTouchEnded( SamUIFakeTouch touch, Vector2 touchPos, bool touchWasInsideTouchFrame )
#else
	public override void onTouchEnded( Touch touch, Vector2 touchPos, bool touchWasInsideTouchFrame )
#endif
	{
		base.onTouchEnded( touch, touchPos, touchWasInsideTouchFrame );
		
		if( onlyFireStartAndEndEvents && onActivationEnded != null )
			onActivationEnded( this );
	}
}
