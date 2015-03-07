var _touchHandler : touchHandler;
var Localize : UILocalize;
//var headline : TextMesh;
// var pageText : TextMesh;
// var pageIndicator : TextMesh;

var pageImage : Renderer;
var pageImages : Material[];

var headlineText : String;
var pageTexts : String[] = new String[10];
var numPages : int = 10;

var inactive : boolean = true;

var menuPage : int = 22;

var isImage : boolean = false;

var isHistory : boolean = false;
var isControls : boolean = false;
var isLanguage : boolean = false;

private var visPage : int = 99;

function Start()
{
	if (isHistory)
	{
		//headlineText = LanguageHandler.histHdln;
		//pageTexts = LanguageHandler.histTxt;

	}
	
	if (isControls)
	{
		//headlineText = LanguageHandler.buttonText[13];
	}
	
	if (isLanguage)
	{
		//headlineText = LanguageHandler.buttonText[49];
		//pageTexts = LanguageHandler.languages;
		//DataTransfer.currPage = DataTransfer.lang;
	}

	DataTransfer.numPages = numPages;

	//headline.renderer.material.color = Color(1,1,0,1);
	//headline.text = headlineText;
}

function Update()
{
		// is the badge screen active?
	//if (_menuHandler.badgeScreen)
	if (_touchHandler.debugMenu == menuPage)
	{
		// I need the actual Page info on the DataTransfer so make sure we reset it when we switch here
		if (inactive)
		{
			inactive = false;
			DataTransfer.currPage = 0;
			DataTransfer.numPages = numPages;	
		}
			// do we need to change our badge?
		if (visPage != DataTransfer.currPage)
		{
				// if this is an image page instead of a text page ....
			if (isImage)
			{
					// set texture
				pageImage.material = pageImages[DataTransfer.currPage];
				// pageText.text = " ";
			}
			else
			{		
					// show actual page
				// pageText.text = pageTexts[DataTransfer.currPage];
			}
				// page indicator
			// pageIndicator.text = ( LanguageHandler.page + " " + (DataTransfer.currPage + 1) + " " + LanguageHandler.of + " " + (numPages) );
			if (numPages == 1)
			{
				// pageIndicator.text =  " ";
			}
			
				// update curr page holder
			visPage = DataTransfer.currPage;
		}
	}
	else 
	{
		inactive = true;
	}
}

