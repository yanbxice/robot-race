using UnityEngine;
using System;
using System.Collections;


public class SamUIZoomButton : SamUIButton
{
	private SamUIAnimation _zoomInAnimation;
	private SamUIAnimation _zoomOutAnimation;
	
	
	public float animationDuration
	{
		set
		{
			_zoomOutAnimation.setDuration( value );
			_zoomInAnimation.setDuration( value );
		}
	}
	
	
	public Vector3 animationTargetScale
	{
		set
		{
			_zoomInAnimation.setTarget( value );
		}
	}
	

	#region Constructors/Destructor
	
	public static new SamUIZoomButton create( string filename, string highlightedFilename, int xPos, int yPos )
	{
		return SamUIZoomButton.create( SamUI.firstToolkit, filename, highlightedFilename, xPos, yPos );
	}
	
	
	public static new SamUIZoomButton create( SamUIToolkit manager, string filename, string highlightedFilename, int xPos, int yPos )
	{
		return SamUIZoomButton.create( manager, filename, highlightedFilename, xPos, yPos, 1 );
	}

	
	public static new SamUIZoomButton create( SamUIToolkit manager, string filename, string highlightedFilename, int xPos, int yPos, int depth )
	{
		// grab the texture details for the normal state
		var normalTI = manager.textureInfoForFilename( filename );
		var frame = new Rect( xPos, yPos, normalTI.frame.width, normalTI.frame.height );
		
		// get the highlighted state
		var highlightedTI = manager.textureInfoForFilename( highlightedFilename );
		
		// create the button
		return new SamUIZoomButton( manager, frame, depth, normalTI.uvRect, highlightedTI.uvRect );
	}


	public SamUIZoomButton( SamUIToolkit manager, Rect frame, int depth, SamUIUVRect uvFrame, SamUIUVRect highlightedUVframe ):base( manager, frame, depth, uvFrame, highlightedUVframe )
	{
		centerize();
		_zoomInAnimation = new SamUIAnimation( this, 0.3f, SamUIAnimationProperty.LocalScale, new Vector3( 1, 1, 1 ), new Vector3( 1.3f, 1.3f, 1.3f ), Easing.Quartic.easeInOut );
		_zoomOutAnimation = new SamUIAnimation( this, 0.3f, SamUIAnimationProperty.LocalScale, new Vector3( 1.3f, 1.3f, 1.3f ), new Vector3( 1, 1, 1 ), Easing.Quartic.easeInOut );
	}

	#endregion;



	// Touch handlers
#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	public override void onTouchBegan( SamUIFakeTouch touch, Vector2 touchPos )
#else
	public override void onTouchBegan( Touch touch, Vector2 touchPos )
#endif
	{
		base.onTouchBegan( touch, touchPos );
		
		_zoomInAnimation.restartStartToCurrent();
		SamUI.instance.StartCoroutine( _zoomInAnimation.animate() );
	}



#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	public override void onTouchEnded( SamUIFakeTouch touch, Vector2 touchPos, bool touchWasInsideTouchFrame )
#else
	public override void onTouchEnded( Touch touch, Vector2 touchPos, bool touchWasInsideTouchFrame )
#endif
	{
		base.onTouchEnded( touch, touchPos, touchWasInsideTouchFrame );
		
		_zoomInAnimation.stop();
		_zoomOutAnimation.restartStartToCurrent();
		SamUI.instance.StartCoroutine( _zoomOutAnimation.animate() );
	}
	
}
