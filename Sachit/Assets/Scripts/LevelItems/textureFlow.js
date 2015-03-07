//
//	Provide the material you want to flow
//

var flowMat : Material[] = new Material[1];
var flowUSpeed : float[] = new float[1];
var flowVSpeed : float[] = new float[1];
var flicker : boolean = false;
var flickerRange : float = 0.2;
var flickerBase : float = 0.3;
var flickerFreq : float = 0.25;
var flickerCounter : float = 0;

private var dTime : float;

function Awake ()
{
	for (var matIndex = 0; matIndex < flowMat.length; matIndex++)
	{
			// initialize texture offsets
		flowMat[matIndex].mainTextureOffset.x = 0;
		flowMat[matIndex].mainTextureOffset.y = 0;
	}
}

function Update () 
{
		// get our dTime
	dTime = Time.deltaTime;
		
		// check every Material that should flow ...
	for (var matIndex = 0; matIndex < flowMat.length; matIndex++)
	{
			// offset the texture
		flowMat[matIndex].mainTextureOffset.x += flowUSpeed[matIndex] * dTime;
		flowMat[matIndex].mainTextureOffset.y += flowVSpeed[matIndex] * dTime;
		
		if (flicker)
		{
			if (flickerCounter >= flickerFreq)
			{
				flowMat[matIndex].color = new Color(1,1,1,(flickerBase + (Random.value * flickerRange)));
				flickerCounter = 0;
			}
			else
			{
				flickerCounter += dTime;
			}
		}
	}

}

function OnApplicationQuit()
{
		// reset textures when exiting ..
	for (var matIndex = 0; matIndex < flowMat.length; matIndex++)
	{
			// initialize texture offsets
		flowMat[matIndex].mainTextureOffset.x = 0;
		flowMat[matIndex].mainTextureOffset.y = 0;
	}
}