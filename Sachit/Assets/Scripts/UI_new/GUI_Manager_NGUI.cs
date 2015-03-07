using UnityEngine;
using System.Collections;

public class GUI_Manager_NGUI : MonoBehaviour 
{
	
	public InGameMenu1 Menu1;
	public InGameMenu2 Menu2;
	public InGameMenu3 Menu3;
	public InGameMenu4 Menu4;
	public InGameMenu9 Menu9;
	public InGameMenu1 Menu11;
	public InGameMenu20 Menu20;

	// Use this for initialization
	void Start () 
	{
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public void CloseAllMenu()
	{
		//Close all the menus
		Menu1.CloseMenu();
		Menu2.CloseMenu();
		Menu3.CloseMenu();
		Menu4.CloseMenu();
		Menu9.CloseMenu();
		Menu11.CloseMenu();
		Menu20.CloseMenu();
	}
	
	public void OpenMenu(int menuIndex, GUI_Flags guiFlags)
	{
		CloseAllMenu();
		switch(menuIndex)
		{
		case 1:
			Menu1.OpenMenu(guiFlags);
			break;
		case 2:
			Menu2.OpenMenu(guiFlags);
			break;
		case 3:
			Menu3.OpenMenu(guiFlags);
			break;
		case 4:
			Menu4.OpenMenu(guiFlags);
			break;
		case 9:
			Menu9.OpenMenu(guiFlags);
			break;
		case 11:
			Menu11.OpenMenu(guiFlags);
			break;
		case 20:
			Menu20.OpenMenu(guiFlags);
			break;
		default:
			break;
		}
		
	}
}
