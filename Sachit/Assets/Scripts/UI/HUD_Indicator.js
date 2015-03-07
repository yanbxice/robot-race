var playerIndicator : Transform;	// store the map Indicator for the player
var playerTransform : Transform;
var guiFlags : GUI_Flags;

function Awake()
{
	playerIndicator = transform;
}


function FixedUpdate()
{
	if(Time.frameCount % 2 == 0)
	{		// update Map every second frame
			// Now move the Map Indicator..
		playerIndicator.localPosition.x = ((playerTransform.position.z) * guiFlags.minimapMulti) + guiFlags.horizOffset;
		playerIndicator.localPosition.y = -((playerTransform.position.x) * guiFlags.minimapMulti) + guiFlags.vertOffset;
	}
}
