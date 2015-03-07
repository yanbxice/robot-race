using UnityEngine;


public struct SamUIUVRect
{
	public Vector2 lowerLeftUV;
	public Vector2 uvDimensions;
	public bool clippingTop; // used internally for clipping
	
	private Vector2 _originalCoordinates; // used internally for clipping


	/// <summary>
	/// Convenience property to return a UVRect of all zeros
	/// </summary>
	public static SamUIUVRect zero;
	

	/// <summary>
	/// Automatically converts coordinates to UV space as specified by textureSize
	/// </summary>
	public SamUIUVRect( int x, int y, int width, int height, Vector2 textureSize )
	{
		_originalCoordinates.x = x;
		_originalCoordinates.y = y;
		
		lowerLeftUV = new Vector2( x / textureSize.x, 1.0f - ( ( y + height ) / textureSize.y ) );
		uvDimensions = new Vector2( width / textureSize.x, height / textureSize.y );
		clippingTop = false;
	}
	
	
	public SamUIUVRect rectClippedToBounds( float width, float height, bool clippingTop, Vector2 textureSize )
	{
		var uv = this;
		uv.clippingTop = clippingTop;
		
		// if we are clipping the top, only the uvDimensions need adjusting
		if( clippingTop )
		{
			uv.uvDimensions = new Vector2( width / textureSize.x, height / textureSize.y );
		}
		else
		{
			uv.lowerLeftUV = new Vector2( _originalCoordinates.x / textureSize.x, 1.0f - ( ( _originalCoordinates.y + height ) / textureSize.y ) );
			uv.uvDimensions = new Vector2( width / textureSize.x, height / textureSize.y );
		}
		
		return uv;
	}
	
	
	public float getWidth( Vector2 textureSize )
	{
		return uvDimensions.x * textureSize.x;
	}
	
	
	public float getHeight( Vector2 textureSize )
	{
		return uvDimensions.y * textureSize.y;
	}
	
	
	/// <summary>
	/// doubles everything for retina texture
	/// </summary>
	public void doubleForHD()
	{
		lowerLeftUV.x *= 2;
		lowerLeftUV.y *= 2;
		uvDimensions.x *= 2;
		uvDimensions.y *= 2;
	}


	#region Operator overloads
	
	public static bool operator ==( SamUIUVRect lhs, SamUIUVRect rhs )
	{
		return ( lhs.lowerLeftUV == rhs.lowerLeftUV && lhs.uvDimensions == rhs.uvDimensions );
	}


	public static bool operator !=( SamUIUVRect lhs, SamUIUVRect rhs )
	{
		return ( lhs.lowerLeftUV != rhs.lowerLeftUV || lhs.uvDimensions != rhs.uvDimensions );
	}


	public override bool Equals( object obj )
	{
		if( ( obj is SamUIUVRect ) && this == (SamUIUVRect)obj )
			return true;
		
		return false;
	}


	public override int GetHashCode()
	{
		return lowerLeftUV.GetHashCode() ^ uvDimensions.GetHashCode();
	}
	
	
	public override string ToString()
	{
		return string.Format( "x: {0}, y: {1}, w: {2}, h: {3}", lowerLeftUV.x, lowerLeftUV.y, uvDimensions.x, uvDimensions.y );
	}

	#endregion;

}
