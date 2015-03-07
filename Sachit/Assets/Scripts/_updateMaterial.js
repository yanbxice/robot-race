var player_mat : Material[] = new Material[7];

var skinDef : Texture[] = new Texture[7];
var skinA : Texture[] = new Texture[7];
var skinB : Texture[] = new Texture[7];
var skinC : Texture[] = new Texture[7];

var hudTextMat : Material;
var hudText : Texture[];



function doUpdate () 
{
		// first reset all materials
	player_mat[0].mainTexture = skinDef[0];
	player_mat[1].mainTexture = skinDef[1];
	player_mat[2].mainTexture = skinDef[2];
	player_mat[3].mainTexture = skinDef[3];
	player_mat[4].mainTexture = skinDef[4];
	player_mat[5].mainTexture = skinDef[5];
	player_mat[6].mainTexture = skinDef[6];

		// default skin
	if ( DataTransfer.currentSkin[(DataTransfer.playerBot - 1)] == 0 )
	{
		player_mat[(DataTransfer.playerBot - 1)].mainTexture = skinDef[(DataTransfer.playerBot - 1)];
	}
	else if ( DataTransfer.currentSkin[(DataTransfer.playerBot - 1)] == 1 )
	{
		player_mat[(DataTransfer.playerBot - 1)].mainTexture = skinA[(DataTransfer.playerBot - 1)];
	}
	else if ( DataTransfer.currentSkin[(DataTransfer.playerBot - 1)] == 2 )
	{
		player_mat[(DataTransfer.playerBot - 1)].mainTexture = skinB[(DataTransfer.playerBot - 1)];
	}
	else if ( DataTransfer.currentSkin[(DataTransfer.playerBot - 1)] == 3 )
	{
		player_mat[(DataTransfer.playerBot - 1)].mainTexture = skinC[(DataTransfer.playerBot - 1)];
	}

		// language handling
	try { hudTextMat.mainTexture = hudText[PlayerPrefs.GetInt("lang")]; }	catch (err) { Debug.Log ("Error setting Texture for hudText: " + err); };

}