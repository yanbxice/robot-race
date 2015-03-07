using UnityEngine;
using System.Collections;




public class langSwith : MonoBehaviour {
	
	public string language = "English";
	public int langID = 0;

	
	// Update is called once per frame
	void execute () {
		
			// set correct language
		Localization.instance.currentLanguage = language;
		
			// store correct language in DataTransfer (This stores 2 versions in Player prefs, but I have no time to dump one UI system and replace it with the other)
		DataTransfer.lang = langID;
		PlayerPrefs.SetInt("lang", DataTransfer.lang);			// default language is english
		FontChanger.ChangeFont();
		
		switch (DataTransfer.lang)
		{
				case 0:
						 LanguageHandler.botNames = LanguageHandler_EN.botNames;
						 LanguageHandler.circuitNames = LanguageHandler_EN.circuitNames;
						 
						 LanguageHandler.touchContinue = LanguageHandler_EN.touchContinue;
						 LanguageHandler.winMessage = LanguageHandler_EN.winMessage;
						 LanguageHandler.infoText = LanguageHandler_EN.infoText;
					break;
					
				case 1:
	
						LanguageHandler.botNames = LanguageHandler_DE.botNames;
						LanguageHandler.circuitNames = LanguageHandler_DE.circuitNames;
			
						LanguageHandler.touchContinue = LanguageHandler_DE.touchContinue;
						LanguageHandler.winMessage = LanguageHandler_DE.winMessage;
						LanguageHandler.infoText = LanguageHandler_DE.infoText;
					break;
		}
	}
}
