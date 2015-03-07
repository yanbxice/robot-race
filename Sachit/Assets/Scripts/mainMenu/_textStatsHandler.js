var _touchHandler : touchHandler;
var headline : TextMesh;
var pageText : TextMesh;
var countText : TextMesh;
var pageIndicator : TextMesh;

var pageHdln : UILocalize;
var pageLocal : UILocalize;
var countInfo : UILabel;

var inactive : boolean = true;

private var headlineText : String[] = new String[14];
private var pageTexts : String[] = new String[14];
private var countTexts : String[] = new String[14];
var numPages : int = 14;

var currPage : int = 0;
var menuPage : int = 23;

private var visPage : int = 99;

function Start()
{
	//headline.renderer.material.color = Color(1,1,0,1);
	//countText.renderer.material.color = Color(1,1,0,1);

}

function Update()
{

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
		if (visPage != currPage)
		{
				// show actual page
			//pageText.text = pageTexts[currPage];
			//countText.text = countTexts[currPage];
			//headline.text = headlineText[currPage];
				
				// NGUI show correct text
			pageHdln.key = "statsHdln" + (currPage + 1).ToString();
			
				// set the rest
			switch (currPage) {
				case 0: 
						pageLocal.key = "finishesText";
						countInfo.text = ("\n" + DataTransfer.storeStats[0] + "\n" + DataTransfer.storeStats[1] + "\n" + DataTransfer.storeStats[2] + "\n" + DataTransfer.storeStats[3]);
					break;
				case 1:
						pageLocal.key = "badgesStats1";
						countInfo.text = ("\n" + DataTransfer.badgesCareer[0] + "\n" + DataTransfer.badgesCareer[1] + "\n" + DataTransfer.badgesCareer[2] + "\n" + DataTransfer.badgesCareer[3] + "\n" + DataTransfer.badgesCareer[4] + "\n" + DataTransfer.badgesCareer[5]);
					break;
				case 2:
						pageLocal.key = "badgesStats2";
						countInfo.text = ("\n" + DataTransfer.badgesCareer[6] + "\n" + DataTransfer.badgesCareer[7] + "\n" + DataTransfer.badgesCareer[8] + "\n" + DataTransfer.badgesCareer[9] + "\n" + DataTransfer.badgesCareer[10]);
					break;
				case 3:
						pageLocal.key = "finishesText";
						countInfo.text = ("\n" + DataTransfer.storeStats[4] + "\n" + DataTransfer.storeStats[5] + "\n" + DataTransfer.storeStats[6] + "\n" + DataTransfer.storeStats[7]);
					break;
				case 4:
						pageLocal.key = "damageTakenTxt";
						countInfo.text = ("\n" + DataTransfer.damageCareer[0] + "\n" + DataTransfer.damageCareer[1] + "\n" + DataTransfer.damageCareer[2] + "\n" + DataTransfer.damageCareer[3] + "\n" + DataTransfer.damageCareer[4] + "\n" + DataTransfer.damageCareer[5] + "\n" + DataTransfer.damageCareer[6]);
					break;
				case 5:
						pageLocal.key = "damageDealtTxt";
						countInfo.text = ("\n" + DataTransfer.hitsCareer[2] + "\n" + DataTransfer.hitsCareer[0] + "\n" + DataTransfer.hitsCareer[1] + "\n" + DataTransfer.hitsCareer[10] + "\n" + DataTransfer.hitsCareer[3] + "\n" + DataTransfer.hitsCareer[4]);
					break;
				case 6:
						pageLocal.key = "countingTxt";
						countInfo.text = ("\n\n" + DataTransfer.hitsCareer[6] + "\n" + DataTransfer.hitsCareer[7] + "\n" + DataTransfer.hitsCareer[8]);
					break;
				case 7:
						pageLocal.key = "finishesText";
						countInfo.text = ("\n" + DataTransfer.storeStats[8] + "\n" + DataTransfer.storeStats[9] + "\n" + DataTransfer.storeStats[10] + "\n" + DataTransfer.storeStats[11]);
					break;
				case 8:
						pageLocal.key = "finishesText";
						countInfo.text = ("\n" + DataTransfer.storeStats[12] + "\n" + DataTransfer.storeStats[13] + "\n" + DataTransfer.storeStats[14] + "\n" + DataTransfer.storeStats[15]);
					break;
				case 9:
						pageLocal.key = "finishesText";
						countInfo.text = ("\n" + DataTransfer.storeStats[16] + "\n" + DataTransfer.storeStats[17] + "\n" + DataTransfer.storeStats[18] + "\n" + DataTransfer.storeStats[19]);
					break;
				case 10:
						pageLocal.key = "finishesText";
						countInfo.text = ("\n" + DataTransfer.storeStats[20] + "\n" + DataTransfer.storeStats[21] + "\n" + DataTransfer.storeStats[22] + "\n" + DataTransfer.storeStats[23]);
					break;
				case 11:
						pageLocal.key = "finishesText";
						countInfo.text = ("\n" + DataTransfer.storeStats[24] + "\n" + DataTransfer.storeStats[25] + "\n" + DataTransfer.storeStats[26] + "\n" + DataTransfer.storeStats[27]);
					break;
				case 12:
						pageLocal.key = "finishesText";
						countInfo.text = ("\n" + DataTransfer.storeStats[28] + "\n" + DataTransfer.storeStats[29] + "\n" + DataTransfer.storeStats[30] + "\n" + DataTransfer.storeStats[31]);
					break;
				case 13:
						pageLocal.key = "finishesText";
						countInfo.text = ("\n" + DataTransfer.storeStats[32] + "\n" + DataTransfer.storeStats[33] + "\n" + DataTransfer.storeStats[34] + "\n" + DataTransfer.storeStats[35]);
					break;
					
					// trigger localize refresh
				NGUI_Handler.locUpdate = true;
				Debug.Log ("textStatsHandler");
			}
				// page indicator
			//pageIndicator.text = ( LanguageHandler.page + " " + (currPage + 1) + " of " + (numPages) );
			//if (numPages == 1)
			//{
			//	pageIndicator.text =  " ";
			//}
				
				// update curr page holder
			visPage = currPage;
		}
	}
	else 
	{
		inactive = true;
	}
}

