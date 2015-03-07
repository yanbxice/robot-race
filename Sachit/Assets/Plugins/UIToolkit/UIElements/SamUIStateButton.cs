using UnityEngine;
using System.Collections.Generic;


public class SamUIStateButton : SamUIButton
{
	public delegate void SamUIStateButtonStateChange( SamUIStateButton sender, int state );
	public event SamUIStateButtonStateChange onStateChange;
	
	private bool _rollOverState = true;
	private int _state = 0;
	private int maxState = 0;
		
	private SamUIUVRect[] _uvFrames;
	private SamUIUVRect[] _uvHighlightFrames;
	

	#region Constructors/Destructor
	
	new public static SamUIStateButton create( string filename, string highlightedFilename, int xPos, int yPos )
	{
		return SamUIStateButton.create( SamUI.firstToolkit, filename, highlightedFilename, xPos, yPos );
	}
	
	
	new public static SamUIStateButton create( SamUIToolkit manager, string filename, string highlightedFilename, int xPos, int yPos )
	{
		return SamUIStateButton.create( manager, filename, highlightedFilename, xPos, yPos, 1 );
	}
	
	
	new public static SamUIStateButton create( SamUIToolkit manager, string filename, string highlightedFilename, int xPos, int yPos, int depth )
	{
		var filenames = new string[1] {filename};
		var highlightedFilenames = new string[1] {highlightedFilename};
		return SamUIStateButton.create( manager, filenames, highlightedFilenames, xPos, yPos, depth );
	}	
	
	
	public static SamUIStateButton create( string[] filenames, string[] highlightedFilenames, int xPos, int yPos )
	{
		return SamUIStateButton.create( SamUI.firstToolkit, filenames, highlightedFilenames, xPos, yPos );
	}
	
	
	public static SamUIStateButton create( SamUIToolkit manager, string[] filenames, string[] highlightedFilenames, int xPos, int yPos )
	{
		return SamUIStateButton.create( manager, filenames, highlightedFilenames, xPos, yPos, 1 );
	}
		
	
	public static SamUIStateButton create( SamUIToolkit manager, string[] filenames, string[] highlightedFilenames, int xPos, int yPos, int depth )
	{
		
		// grab the texture details for the initial state
		var firstNormalTI = manager.textureInfoForFilename( filenames[0] );
		var frame = new Rect( xPos, yPos, firstNormalTI.frame.width, firstNormalTI.frame.height );

		// get the initial highlighted state
		var firstHighlightedTI = firstNormalTI;
		if (highlightedFilenames.Length > 0) {
			manager.textureInfoForFilename( highlightedFilenames[0] );
		}
		
		var button = new SamUIStateButton( manager, frame, depth, firstNormalTI.uvRect, firstHighlightedTI.uvRect );

		button.addFrames(filenames, highlightedFilenames);
		
		return button;
	}
	
	
	public SamUIStateButton( SamUIToolkit manager, Rect frame, int depth, SamUIUVRect uvFrame, SamUIUVRect highlightedUVframe ):base( manager, frame, depth, uvFrame, highlightedUVframe )
	{
	}


	#endregion;
	
	
	/// <summary>
	/// Flag whether state wraps back to 0 after last state hit
	/// </summary>
	public bool rollOverState
	{
		get { return _rollOverState; }
		set { _rollOverState = value; }
	}
	
	
	public int state
	{
		get { return _state; }
		set
		{
			if( _state == value )
				return ;

			_state = value;
			adjustForStateRollover( _state );	
			setFramesForState( _state );
		}
	}
	
	
	public SamUIUVRect[] uvFrames
	{
		get { return _uvFrames; }
	}
	
	
	public SamUIUVRect[] uvHighlightFrames
	{
		get { return _uvHighlightFrames; }
	}
	
	
	public void addFrames( string[] normal, string[] highlighted )
	{
		var normals = loadFrames( normal );
		var highlights = loadFrames( highlighted );
		addFrames( normals, highlights );
	}
	
	
	public void addFrames( SamUIUVRect[] normal, SamUIUVRect[] highlighted )
	{
		_uvFrames = normal;
		maxState = _uvFrames.Length;
		_state = 0;
		
		if( highlighted == null || highlighted.Length == 0 )
		{
			_uvHighlightFrames = normal;
		}
		else if( normal.Length == highlighted.Length )
		{
			_uvHighlightFrames = highlighted;
		}
		else
		{
			// don't have same number of highlighted as normal
			Debug.LogError( "Highlight frames count does not match normal frames count" );
			_uvHighlightFrames = normal;
		}
	}
	

#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN || UNITY_WEBPLAYER
	public override void onTouchEnded( SamUIFakeTouch touch, Vector2 touchPos, bool touchWasInsideTouchFrame )
#else
	public override void onTouchEnded( Touch touch, Vector2 touchPos, bool touchWasInsideTouchFrame )
#endif
	{
		if( touchWasInsideTouchFrame )
		{
			_state++;
			adjustForStateRollover( _state );
		}
		
		base.onTouchEnded( touch, touchPos, touchWasInsideTouchFrame );

		if( touchWasInsideTouchFrame )
		{
			setFramesForState( _state );
			
			// If the touch was inside our touchFrame and we have an action, call it
			if( onStateChange != null )
				onStateChange( this , _state);
		}
	}
	
	
	private void adjustForStateRollover( int newState )
	{
		if( _state >= maxState )
		{
			if( _rollOverState )
				_state = 0;
			else
				_state = maxState - 1;
		}
	}
	
	
	private void setFramesForState( int newState )
	{
		uvFrame = _uvFrames[newState];
		highlightedUVframe = _uvHighlightFrames[newState];
	}
	
	
	private SamUIUVRect[] loadFrames( string[] filenames )
	{
		var frames = new SamUIUVRect[filenames.Length];
		for( var i = 0; i < filenames.Length; i++ )
		{
			var uv = this.manager.textureInfoForFilename( filenames[i] ).uvRect;
			frames[i] = uv;
		}
		return frames;
	}
	

}