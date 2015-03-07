#pragma strict

var flags : Material[];
var flagGeo : GameObject;
var current : int = -99;

function Update () {
	
	if (current != DataTransfer.lang) {
		
		flagGeo.renderer.material = flags[DataTransfer.lang];
		current = DataTransfer.lang;
		
	}

}