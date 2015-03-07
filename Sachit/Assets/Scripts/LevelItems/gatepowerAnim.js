//
//	Provide the material you want to flow
//

var gatepowerMat : Material;
var frequency : float = 2.0;

private var ammount : float = 0.25;
private var count : float = 0.0;
private var dTime : float;



function Start ()
{
		// initialize default state
	gatepowerMat.mainTextureOffset.x = 0;

}


function Update()
{
	count += Time.deltaTime;
	
	if (count >= frequency)
	{
		gatepowerMat.mainTextureOffset.x += ammount;
		count = 0;
	}
}