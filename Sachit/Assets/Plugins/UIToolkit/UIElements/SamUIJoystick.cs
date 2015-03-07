using System;
using UnityEngine;


struct SamUIBoundary 
{
	public float minX;
	public float maxX;
	public float minY;
	public float maxY;
	
	public static SamUIBoundary boundaryFromPoint( Vector2 point, float maxDistance )
	{
		SamUIBoundary boundary = new SamUIBoundary();
		
		boundary.minX = point.x - maxDistance;
		boundary.maxX = point.x + maxDistance;
		boundary.minY = point.y - maxDistance;
		boundary.maxY = point.y + maxDistance;
		
		return boundary;
	}
}


public class SamUIJoystick : SamUITouchableSprite
{
	public Vector2 joystickPosition;
	public Vector2 deadZone = Vector2.zero; // Controls when position output occurs
	public bool normalize = true; // Normalize output after the dead-zone?  If true, we start at 0 even though the joystick is moved deadZone pixels already
	public SamUIUVRect highlightedUVframe = SamUIUVRect.zero; // Highlighted UV's for the joystick
	
	private SamUISprite _joystickSprite;
	private SamUISprite _backgroundSprite;
	private Vector3 _joystickOffset;
	private SamUIBoundary _joystickBoundary;
	private float _maxJoystickMovement = 40.0f; // max distance from _joystickOffset that the joystick will move
	private SamUIToolkit _manager; // we need this for getting at texture details after the constructor
	
	
	/// <summary>
	/// Hides the all joystick sprites
	/// </summary>
    public override bool hidden
    {
        set
        {
            // No need to do anything if we're already in this state
            if( value == ___hidden )
                return;
			___hidden = value;

			// apply state to the children
			_joystickSprite.hidden = value;
			
			if( _backgroundSprite != null )
				_backgroundSprite.hidden = value;
			base.hidden = value;
        }
    }
	
	
	public static SamUIJoystick create( string joystickFilename, Rect hitAreaFrame, float xPos, float yPos )
	{
		return create( SamUI.firstToolkit, joystickFilename, hitAreaFrame, xPos, yPos );
	}

	
	// 
	public static SamUIJoystick create( SamUIToolkit manager, string joystickFilename, Rect hitAreaFrame, float xPos, float yPos )
	{
		// create the joystrick sprite
		var joystick = manager.addSprite( joystickFilename, 0, 0, 1, true );
		
		return new SamUIJoystick( manager, hitAreaFrame, 1, joystick, xPos, yPos );
	}

	
	public SamUIJoystick( SamUIToolkit manager, Rect frame, int depth, SamUISprite joystickSprite, float xPos, float yPos ):base( frame, depth, SamUIUVRect.zero )
	{
		// Save out the uvFrame for the sprite so we can highlight
		_tempUVframe = joystickSprite.uvFrame;
		
		// Save the joystickSprite and make it a child of the us for organization purposes
		_joystickSprite = joystickSprite;
		_joystickSprite.parentSamUIObject = this;
		
		// Move the joystick to its default position after converting the offset to a vector3
		_joystickOffset = new Vector3( xPos, yPos );
		
		// Set the maxMovement which will in turn calculate the _joystickBoundary
		this.maxJoystickMovement = _maxJoystickMovement;
		
		resetJoystick();
		
		manager.addTouchableSprite( this );
		_manager = manager;
	}
	

	public float maxJoystickMovement
	{
		get { return _maxJoystickMovement; }
		set
		{
			_maxJoystickMovement = value;
			_joystickBoundary = SamUIBoundary.boundaryFromPoint( _joystickOffset, _maxJoystickMovement );
		}
	}


	// Sets the image to be displayed when the joystick is highlighted
	public void setJoystickHighlightedFilename( string filename )
	{
		var textureInfo = _manager.textureInfoForFilename( filename );
		highlightedUVframe = textureInfo.uvRect;
	}
	

	// Sets the background image for display behind the joystick sprite
	public void addBackgroundSprite( string filename )
	{
		_backgroundSprite = _manager.addSprite( filename, 0, 0, 2, true );
		_backgroundSprite.parentSamUIObject = this;
		_backgroundSprite.localPosition = new Vector3( _joystickOffset.x, _joystickOffset.y, 2 );
	}
	
	
	// Resets the sprite to default position and zeros out the position vector
	private void resetJoystick()
	{
		_joystickSprite.localPosition = _joystickOffset;
		joystickPosition.x = joystickPosition.y = 0.0f;
		
		// If we have a highlightedUVframe, swap the original back in
		if( highlightedUVframe != SamUIUVRect.zero )
			_joystickSprite.uvFrame = _tempUVframe;
	}
	
	
	private void layoutJoystick( Vector2 localTouchPosition )
	{
		// Clamp the new position based on the boundaries we have set.  Dont forget to reverse the Y axis!
		Vector3 newPosition = Vector3.zero;
		
		//adjust the touches with the scale
		float X = localTouchPosition.x * _joystickSprite.localScale.x;
		float Y = localTouchPosition.y * _joystickSprite.localScale.y;
		
		//fixed to adjust the touches to the scale of the image
		newPosition.x = Mathf.Clamp( localTouchPosition.x + X, _joystickBoundary.minX, _joystickBoundary.maxX );
		newPosition.y = Mathf.Clamp( -(localTouchPosition.y + Y), _joystickBoundary.minY, _joystickBoundary.maxY );
		
		// Set the new position and update the transform		
		_joystickSprite.localPosition = newPosition;
		
		// Get a value between -1 and 1 for position
		joystickPosition.x = ( newPosition.x - _joystickOffset.x ) / _maxJoystickMovement;
		joystickPosition.y = ( newPosition.y - _joystickOffset.y ) / _maxJoystickMovement;
		
		// Adjust for dead zone	
		float absoluteX = Mathf.Abs( joystickPosition.x );
		float absoluteY = Mathf.Abs( joystickPosition.y );
	
		if( absoluteX < deadZone.x )
		{
			// Report the joystick as being at the center if it is within the dead zone
			joystickPosition.x = 0;
		}
		else if( normalize )
		{
			// Rescale the output after taking the dead zone into account
			joystickPosition.x = Mathf.Sign( joystickPosition.x ) * ( absoluteX - deadZone.x ) / ( 1 - deadZone.x );
		}
		
		if( absoluteY < deadZone.y )
		{
			// Report the joystick as being at the center if it is within the dead zone
			joystickPosition.y = 0;
		}
		else if( normalize )
		{
			// Rescale the output after taking the dead zone into account
			joystickPosition.y = Mathf.Sign( joystickPosition.y ) * ( absoluteY - deadZone.y ) / ( 1 - deadZone.y );
		}
	}
	

#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	public override void onTouchBegan( SamUIFakeTouch touch, Vector2 touchPos )
#else
	public override void onTouchBegan( Touch touch, Vector2 touchPos )
#endif
	{
		highlighted = true;
		
		this.layoutJoystick( this.inverseTranformPoint( touchPos ) );
		
		// If we have a highlightedUVframe, swap it in
		if( highlightedUVframe != SamUIUVRect.zero )
			_joystickSprite.uvFrame = highlightedUVframe;
	}
	

#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	public override void onTouchMoved( SamUIFakeTouch touch, Vector2 touchPos )
#else
	public override void onTouchMoved( Touch touch, Vector2 touchPos )
#endif
	{
		this.layoutJoystick( this.inverseTranformPoint( touchPos ) );
	}
	

#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	public override void onTouchEnded( SamUIFakeTouch touch, Vector2 touchPos, bool touchWasInsideTouchFrame )
#else
	public override void onTouchEnded( Touch touch, Vector2 touchPos, bool touchWasInsideTouchFrame )
#endif
	{
		// Set highlighted to avoid calling super
		highlighted = false;
		
		// Reset back to default state
		this.resetJoystick();
	}
	
}


