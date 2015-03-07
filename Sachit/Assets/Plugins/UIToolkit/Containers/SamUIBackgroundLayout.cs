using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class SamUIBackgroundLayout : SamUIAbstractContainer
{	
	public SamUIBackgroundLayout( string filename ) : this( SamUI.firstToolkit, filename ) {}
	
	
	public SamUIBackgroundLayout( SamUIToolkit manager, string filename ) : base( SamUILayoutType.BackgroundLayout ) 
	{
		var background = manager.addSprite( filename, 0, 0, 2 );
		addChild( background );
		
		//set dimensions of container based on background texture dimensions
		_width = background.width;
		_height = background.height;
	}
}
