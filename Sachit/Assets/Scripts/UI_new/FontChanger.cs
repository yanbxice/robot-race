using UnityEngine;
using System.Collections;

//English - 0
//Germany - 1
//Chinese - 2
//Dutch	  - 3
//French  - 4
//Italian - 5
//Russian - 6
//Spanish - 7


public class FontChanger : MonoBehaviour 
{
	public UIFont englishFont;
	public UIFont chineseFont;
	static FontChanger fontChanger;
	public Transform GUI_root;
	
	private bool inChinese = false;
	
	// Use this for initialization
	void Start () 
	{
		if(fontChanger == null)
		{
			fontChanger = this;
		}
		ChangeFont();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public static void ChangeFont()
	{
		UIFont newFont;
		switch(PlayerPrefs.GetInt("lang"))
		{
		case 0: //English
			newFont = fontChanger.englishFont;
			Localization.instance.currentLanguage = "English";
			break;
		case 1: //Germany
			newFont = fontChanger.englishFont;
			Localization.instance.currentLanguage = "Germany";
			break;
		case 2: //Chinese
			newFont = fontChanger.chineseFont;
			Localization.instance.currentLanguage = "Chinese";
			break;
		case 3: //Dutch
			newFont = fontChanger.englishFont;
			Localization.instance.currentLanguage = "Dutch";
			break;
		case 4: //French
			newFont = fontChanger.englishFont;
			Localization.instance.currentLanguage = "French";
			break;
		case 5: //Italian
			newFont = fontChanger.englishFont;
			Localization.instance.currentLanguage = "Italian";
			break;
		case 6: //Russian
			newFont = fontChanger.englishFont;
			Localization.instance.currentLanguage = "Russian";
			break;
		case 7: //Spanish
			newFont = fontChanger.englishFont;
			Localization.instance.currentLanguage = "Spanish";
			break;
		default:
			newFont = fontChanger.englishFont;
			Localization.instance.currentLanguage = "English";
			break;
		}
		
		if(newFont != null)
		{
			foreach(UILabel uiLabel in fontChanger.GUI_root.GetComponentsInChildren<UILabel>(true))
			{
				uiLabel.font = newFont;
				//Debug.Log(uiLabel.gameObject.name);
			}
		}
		
	}
}
