using UnityEngine;
using System;


public class SamUIProgressBar : SamUISprite
{
	public bool resizeTextureOnChange = false;
	public bool rightToLeft;
	
	private float _value = 0;
	private SamUISprite _bar;
	private float _barOriginalWidth;
	private SamUIUVRect _barOriginalUVframe;
	
	
	
	public static SamUIProgressBar create( string barFilename, string borderFilename, int barxPos, int baryPos, int borderxPos, int borderyPos )
	{
		return create( SamUI.firstToolkit, barFilename, borderFilename, barxPos, baryPos, borderxPos, borderyPos, false );
	}


	public static SamUIProgressBar create( string barFilename, string borderFilename, int barxPos, int baryPos, int borderxPos, int borderyPos, bool rightToLeft )
	{
		return create( SamUI.firstToolkit, barFilename, borderFilename, barxPos, baryPos, borderxPos, borderyPos, rightToLeft );
	}

	
	// the bars x/y coordinates should be relative to the borders
	public static SamUIProgressBar create( SamUIToolkit manager, string barFilename, string borderFilename, int barxPos, int baryPos, int borderxPos, int borderyPos, bool rightToLeft )
	{
		var borderTI = manager.textureInfoForFilename( borderFilename );
	
		var borderFrame = new Rect( borderxPos, borderyPos, borderTI.frame.width, borderTI.frame.height );
		
		SamUISprite bar;
		
		if( rightToLeft )
			bar = manager.addSprite( barFilename, borderxPos - barxPos + ((int)borderTI.frame.width), borderyPos + baryPos, 2 );
		else
			bar = manager.addSprite( barFilename, borderxPos + barxPos, borderyPos + baryPos, 2 );

		var progressBar = new SamUIProgressBar( manager, borderFrame, 1, borderTI.uvRect, bar );
		progressBar.rightToLeft = rightToLeft;
		
		return progressBar;
	}
	
	
	public SamUIProgressBar( SamUIToolkit manager, Rect frame, int depth, SamUIUVRect uvFrame, SamUISprite bar ):base( frame, depth, uvFrame )
	{
		// Save the bar and make it a child of the container/border for organization purposes
		_bar = bar;
		_bar.parentSamUIObject = this;
		
		// Save the bars original size
		_barOriginalWidth = _bar.width;
		_barOriginalUVframe = _bar.uvFrame;
		
		manager.addSprite( this );
	}


    public override bool hidden
    {
        get { return ___hidden; }
        set
        {
            // No need to do anything if we're already in this state:
            if( value == ___hidden )
                return;
			
			base.hidden = value;
			
			// pass the call down to our bar
			_bar.hidden = value;
        }
    }
	
	
	public override void destroy()
	{
		_bar.destroy();
		base.destroy();
	}

	// Current value of the progress bar.  Value is always between 0 and 1.
	public float value
	{
		get { return _value; }
		
		set
		{
			if( value != _value )
			{
				// Set the value being sure to clamp it to our min/max values
				_value = Mathf.Clamp( value, 0, 1 );
				
				// Update the bar UV's if resizeTextureOnChange is set
				if( resizeTextureOnChange )
				{
					// Set the uvFrame's width based on the value
					SamUIUVRect newUVframe = _barOriginalUVframe;
					newUVframe.uvDimensions.x *= _value;
					_bar.uvFrame = newUVframe;
				}

				// Update the bar size based on the value
				if( rightToLeft )
					_bar.setSize( _value * -_barOriginalWidth, _bar.height );	
				else
					_bar.setSize( _value * _barOriginalWidth, _bar.height );
			}
		}
	}

	
}