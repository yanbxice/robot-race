#pragma strict

function Start () {
PlayerPrefs.SetInt("credits", 9999999);
DataTransfer.credits = PlayerPrefs.GetInt("credits");
iOSPlugin.reset();
}

function Update () {
}