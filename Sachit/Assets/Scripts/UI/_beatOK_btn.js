var inputScr : pInput;
var beatMenu : Transform;

function Start()
{
	inputScr = GameObject.Find("Player_Construct").GetComponent(pInput) as pInput;
}

function execute () 
{
	beatMenu.localPosition = Vector3(-2000, -2000, 0);
	inputScr.loopCounter = 0;
	inputScr.gameBeat = false;
	//inputScr.showEndMenu();
}