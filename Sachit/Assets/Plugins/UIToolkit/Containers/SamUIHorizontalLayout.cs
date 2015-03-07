using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class SamUIHorizontalLayout : SamUIAbstractContainer
{
	public SamUIHorizontalLayout( int spacing ) : base( SamUILayoutType.Horizontal )
	{
		_spacing = spacing;
	}


}
