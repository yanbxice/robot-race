var _touchHandler : touchHandler;
//var headline : TextMesh;
//var pageText : TextMesh;
var scrollObj : Transform;

//var headlineText : String;
//var scrollText : String;

private var isVisible : boolean = false;
var scrollSpeed : float;
var startPos : float;
var endPos : float;
var endPause : float = 5.0;
private var hasEnded : boolean = false;

var pageIndex : int = 22;

function Start()
{
	//headline.renderer.material.color = Color(1,1,0,1);
	//headline.text = LanguageHandler.creditsHdln;
	//pageText.text = LanguageHandler.creditsTxt;
	
}

function endReset()
{
	isVisible = false;
	hasEnded = false;
}

function Update()
{

	if (_touchHandler.debugMenu == pageIndex)
	{
			// if needed reset position
		if (!isVisible)
		{
			scrollObj.localPosition.y = startPos;
			isVisible = true;			
		}
		else
		{		
			if (!hasEnded)
			{
					// move text up
				scrollObj.localPosition.y += scrollSpeed * Time.deltaTime;
					
					// if passed end position
				if (scrollObj.localPosition.y >= endPos)
				{
					scrollObj.localPosition.y = endPos;
					hasEnded = true;
					Invoke("endReset", endPause);
				}
			
			}
			
		}
	}
	else if (isVisible)
	{
			// reset the text on exit
		scrollObj.localPosition.y = startPos;
		isVisible = false;
	}
}

