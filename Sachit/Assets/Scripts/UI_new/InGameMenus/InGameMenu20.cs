using UnityEngine;
using System.Collections;

public class InGameMenu20 : InGameMenu 
{
	public EndMenuFigure endMenuFigure;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public override void OpenMenu (GUI_Flags guiFlags)
	{
		endMenuFigure.ShowFigure();
	}
	
	public override void CloseMenu()
	{
		endMenuFigure.HideFigure();
	}
}
