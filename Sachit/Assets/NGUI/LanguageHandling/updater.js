#pragma strict

private var update : boolean = false;


function Update () {

		// check if some vars have updated..
	if (DataTransfer.lang != NGUI_Handler.lang)	{
		NGUI_Handler.lang = DataTransfer.lang;
		update = true;
		//Debug.Log ("lang");
	}
	if (DataTransfer.currPage != NGUI_Handler.currPage)	{
		NGUI_Handler.currPage = DataTransfer.currPage;
		update = true;
		//Debug.Log ("currPage");
	}
	if (DataTransfer.numPages != NGUI_Handler.numPages)	{
		NGUI_Handler.numPages = DataTransfer.numPages;
		update = true;
		//Debug.Log ("numPage");
	}
	/*
	if (DataTransfer.locUpdates != NGUI_Handler.locUpdate)	{
		NGUI_Handler.locUpdate = DataTransfer.locUpdates;
		update = true;
		//Debug.Log ("locUpdate");
	}
	*/
	if (DataTransfer.accState != NGUI_Handler.accState)	{
		NGUI_Handler.accState = DataTransfer.accState;
		update = true;
		//Debug.Log ("accstate");
	}
	if (DataTransfer.credits != NGUI_Handler.credits)	{
		NGUI_Handler.credits = DataTransfer.credits;
		update = true;
		//Debug.Log ("credits");
	}
	if (DataTransfer.activeBot != NGUI_Handler.activeBot)	{
		NGUI_Handler.activeBot = DataTransfer.activeBot;
		update = true;
		//Debug.Log ("locUpdate");
	}
	if (DataTransfer.activeLevel != NGUI_Handler.activeLevel)	{
		NGUI_Handler.activeLevel = DataTransfer.activeLevel;
		update = true;
		//Debug.Log ("activeLevel");
	}
		// Now Update is necessary
	if (update) {
			// trigger localize refresh
		//DataTransfer.locUpdates = false;
		NGUI_Handler.locUpdate = true;
		update = false;
		//Debug.Log ("update");
	}
}