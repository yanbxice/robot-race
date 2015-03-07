using UnityEngine;
using System.Collections;


public class SamUIVerticalPanel : SamUIAbstractContainer
{
	private SamUISprite _topStrip;
	private SamUISprite _middleStrip;
	private SamUISprite _bottomStrip;
	
	private int _topStripHeight;
	private int _bottomStripHeight;
	
	protected bool _sizeToFit = true; // should the panel make itself the proper size to fit?
	public bool sizeToFit { get { return _sizeToFit; } set { _sizeToFit = value; layoutChildren(); } } // relayout when sizeToFit changes

	public override Vector3 position
	{
		get { return clientTransform.position; }
		set
		{
			base.position = value;
			layoutChildren();
		}
	}
	
	/// <summary>
	/// Hides the container and all of it's children along with the top, middle and bottom strip
	/// </summary>
    public override bool hidden
    {
        set
        {
            // No need to do anything if we're already in this state
            if( value == hidden )
                return;
			
			// let super handle hiding the children
			base.hidden = value;

			_topStrip.hidden = _middleStrip.hidden = _bottomStrip.hidden = value;
        }
    }


	public static SamUIVerticalPanel create( string topFilename, string middleFilename, string bottomFilename )
	{
		return create( SamUI.firstToolkit, topFilename, middleFilename, bottomFilename );
	}
	
	
	public static SamUIVerticalPanel create( SamUIToolkit manager, string topFilename, string middleFilename, string bottomFilename )
	{
		return new SamUIVerticalPanel( manager, topFilename, middleFilename, bottomFilename );
	}


	public SamUIVerticalPanel( SamUIToolkit manager, string topFilename, string middleFilename, string bottomFilename ) : base( SamUILayoutType.Vertical )
	{
		var texInfo = manager.textureInfoForFilename( topFilename );
		_topStrip = manager.addSprite( topFilename, 0, 0, 5 );
		_topStrip.parentSamUIObject = this;
		_topStripHeight = (int)texInfo.frame.height;
		_width = texInfo.frame.width;
		
		// we overlap the topStrip 1 pixel to ensure we get a good blend here
		_middleStrip = manager.addSprite( middleFilename, 0, _topStripHeight , 5 );
		_middleStrip.parentSamUIObject = this;
		
		texInfo = manager.textureInfoForFilename( middleFilename );
		_bottomStrip = manager.addSprite( bottomFilename, 0, 0, 5 );
		_bottomStrip.parentSamUIObject = this;
		_bottomStripHeight = (int)texInfo.frame.height;
	}


	/// <summary>
	/// Override so that we can set the zIndex to be higher than our background sprites
	/// </summary>
	public new void addChild( params SamUISprite[] children )
	{
		foreach( var child in children )
			child.zIndex = this.zIndex + 1;
		
		base.addChild( children );
	}


	/// <summary>
	/// Responsible for laying out the child SamUISprites
	/// </summary>
	protected override void layoutChildren()
	{
		base.layoutChildren();
		
		// make sure we have enough height to work with.  totalAvailableHeight will be calculated as the minimum required height for the panel
		// if _height is greater than that, we will use it
		var totalAvailableHeight = _topStripHeight + _bottomStripHeight + 1 + _edgeInsets.top + _edgeInsets.bottom;
		if( _height > totalAvailableHeight )
			totalAvailableHeight = (int)_height;

		// now we move our sprites into position.  we have the proper height now so we can use that with a couple extra pixels to fill the gap
		var leftoverHeight = totalAvailableHeight - _topStripHeight - _bottomStripHeight + 3;
		
		_middleStrip.setSize( _middleStrip.width, leftoverHeight );
		_bottomStrip.localPosition = new Vector3( _bottomStrip.localPosition.x, -_height - _bottomStripHeight, _bottomStrip.localPosition.z );
	}

}
