using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class SamUIVerticalLayout : SamUIAbstractContainer
{	
	public SamUIVerticalLayout( int spacing ) : base( SamUILayoutType.Vertical )
	{
		_spacing = spacing;
	}
}
