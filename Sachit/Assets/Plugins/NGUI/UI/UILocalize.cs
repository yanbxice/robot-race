//----------------------------------------------
//            NGUI: Next-Gen UI kit
// Copyright © 2011-2013 Tasharen Entertainment
//----------------------------------------------

using UnityEngine;

/// <summary>
/// Simple script that lets you localize a UIWidget.
/// </summary>

[RequireComponent(typeof(UIWidget))]
[AddComponentMenu("NGUI/UI/Localize")]
public class UILocalize : MonoBehaviour
{
	/// <summary>
	/// Localization key.
	/// </summary>

	public string key;
	
	public bool credInfo;
	public bool multiPage;
	public int currPage;
	public bool botName;
	public bool mapName;
	public bool isPageNo;
	public bool accState;
	public bool isCritical;
	private string baseKey;
	public string suffix = "";
	
	string mLanguage;
	bool mStarted = false;

	/// <summary>
	/// This function is called by the Localization manager via a broadcast SendMessage.
	/// </summary>

	void OnLocalize (Localization loc) { if (mLanguage != loc.currentLanguage) Localize(); }

	/// <summary>
	/// Localize the widget on enable, but only if it has been started already.
	/// </summary>

	void OnEnable () { if (mStarted && Localization.instance != null) Localize(); }

	/// <summary>
	/// Localize the widget on start.
	/// </summary>

	void Start ()
	{
		baseKey = key; 
		mStarted = true;
		if (Localization.instance != null) Localize();
	}

	/// <summary>
	/// Force-localize the widget.
	/// </summary>

	public void Localize ()
	{
		//Debug.Log ("calling Localize");
		
		Localization loc = Localization.instance;
		UIWidget w = GetComponent<UIWidget>();
		UILabel lbl = w as UILabel;
		UISprite sp = w as UISprite;

		// If no localization key has been specified, use the label's text as the key
		if (string.IsNullOrEmpty(mLanguage) && string.IsNullOrEmpty(key) && lbl != null) key = lbl.text;
		
		// check if we have a multi page label
		if (multiPage) {
			key = baseKey + (NGUI_Handler.currPage + 1).ToString();
		}
		else if (botName) {
			key = baseKey + (NGUI_Handler.activeBot).ToString();
		}
		else if (mapName) {
			key = baseKey + (NGUI_Handler.activeLevel).ToString();
		}
		else if (accState) {
			key = NGUI_Handler.accState;
		}
		
		// If we still don't have a key, use the widget's name
		string val = string.IsNullOrEmpty(key) ? loc.Get(w.name) : loc.Get(key);

		if (lbl != null)
		{

			// If this is a label used by input, we should localize its default value instead
			UIInput input = NGUITools.FindInParents<UIInput>(lbl.gameObject);
			if (input != null && input.label == lbl) input.defaultText = val;
			else {
				if (credInfo) {
					lbl.text = val + ": " + NGUI_Handler.credits.ToString();
				}
				else if (isPageNo){

					if (NGUI_Handler.numPages < 2) {
						lbl.text = " ";	
					}
					else {
						string page = val;
						string of = loc.Get ("of");
						lbl.text = page + " " + (NGUI_Handler.currPage + 1) + " " + of + " " + NGUI_Handler.numPages;
					}
				}
				else {
					lbl.text = val + suffix;
				}
			}
		}
		else if (sp != null)
		{
			sp.spriteName = val;
			sp.MakePixelPerfect();
		}
		mLanguage = loc.currentLanguage;
	}
	
	public void Update () {
		if (!isCritical) {
				
			if (NGUI_Handler.locUpdate) {
				//Debug.Log ("calling");
					// broadcast Localize
				UIRoot.Broadcast("Localize");
				
				NGUI_Handler.locUpdate = false;
			}
		}
	}
}
