//var tipsMesh : TextMesh;
var tipsLoc : UILocalize;

//var tips : String[];

function Start () 
{
	var currTip : int;
	currTip = Random.Range(1, 55);
	
	//print (currTip);
	
	//tipsMesh.text = LanguageHandler.tips[currTip];
	tipsLoc.key = "tips" + (currTip).ToString();
	
		// trigger localize refresh
	NGUI_Handler.locUpdate = true;
	
		// trigger localize refresh
	//NGUI_Handler.locUpdate = true;
}