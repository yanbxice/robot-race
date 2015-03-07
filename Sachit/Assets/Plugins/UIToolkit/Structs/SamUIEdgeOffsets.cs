using UnityEngine;

public struct SamUIEdgeOffsets
{
	public int top;
	public int left;
	public int bottom;
	public int right;
	
	
	// conveninece constructor to create offsets evenly for all 4 sides
	public SamUIEdgeOffsets( int offsetForAllSides ) : this( offsetForAllSides, offsetForAllSides, offsetForAllSides, offsetForAllSides )
	{
	
	}

	
	public SamUIEdgeOffsets( int top, int left, int bottom, int right )
	{
		var multiplier = SamUI.instance.isHD ? 2 : 1;
		
		this.top = top * multiplier;
		this.left = left * multiplier;
		this.bottom = bottom * multiplier;
		this.right = right * multiplier;
	}
	
	
	// Used to expand or contract a rect by this
	public Rect addToRect( Rect frame )
	{
		// Clamp x and y to be greater than zero
		return new Rect
		(
			 Mathf.Clamp( frame.x - left, 0, Screen.width ),
			 Mathf.Clamp( frame.y - top, 0, Screen.height ),
			 frame.width + right + left,
			 frame.height + bottom + top
		);
	}
}
