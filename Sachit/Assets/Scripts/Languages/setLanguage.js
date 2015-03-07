//
// This is just quick and dirty .. based on the current language setting, I manually 
// override what is stored in the global language handler. 
//
//	I am also not taking care of the text that is in textures ...
//

var english : LanguageHandler_EN;
var german : LanguageHandler_DE;


function switchLang()
{
		// this function loads all items from the different lang files onto our static language handler
	switch (DataTransfer.lang)
	{
			case 0:
					 LanguageHandler.botNames = english.botNames;
					 LanguageHandler.circuitNames = english.circuitNames;
					 
					 LanguageHandler.touchContinue = english.touchContinue;
					 LanguageHandler.winMessage = english.winMessage;
					 LanguageHandler.infoText = english.infoText;
				break;
				
			case 1:

					LanguageHandler.botNames = german.botNames;
					LanguageHandler.circuitNames = german.circuitNames;
					
					LanguageHandler.touchContinue = german.touchContinue;
					LanguageHandler.winMessage = german.winMessage;
					LanguageHandler.infoText = german.infoText;
				break;
		}
}

function Awake () 
{
	DataTransfer.lang = PlayerPrefs.GetInt("lang", 0);			// default language is english
	switchLang();
}