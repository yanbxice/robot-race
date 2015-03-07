//
//	Provide the material you want to flow
//

var turnsignMat : Material;
var frequency : float = 1.3;

private var ammount : float;
private var count : float = 0.0;
private var dTime : float;



function Start ()
{
		// initialize default state
	turnsignMat.mainTextureOffset.x = 0;
	
		// get the exact ammount
	ammount = 1.0f / 3.0f;

}


function Update()
{
	count += Time.deltaTime;
	
	if (count >= frequency)
	{
		turnsignMat.mainTextureOffset.x += ammount;
		count = 0;
	}
}