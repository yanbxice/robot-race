
	// currently active menu handling
var menuChanged : boolean = false;
var activeMenu : int = 0;
var jumpPressed : boolean = false;

	// transform handling
var isTransformed : boolean = false;

	// pickup handling
var pickupType : int = 0;
var pickupChanged : boolean = false;
var pickupActive : boolean = false;

	// Hit message handling
var hitChanged : boolean = false;
var hitWeapon : int = 0;
var hitBot : int = 0;

	// TextMessage Handling
var warningChanged : boolean = false;
var warningType : int = 0;
var warningTime : float = 2.0;

	// Virus Warning Handling
var virusChanged : boolean = false;
var virusState : int = 0;
var virusWarningExit : float = 0.0;

	// Juice Handling
var juiceChanged : boolean = false;
var juiceCharged : boolean = false;
var juiceFull : float = 5.0;
var juiceLeft : float = 0.0;

	// Lap Handling
var lapChanged : boolean = false;
var lapCount : int = 3;
var lapCurr : int = 0;

	// place Handling
var placeChanged : boolean = false;
var placeCurr : int = 1;

	// flash handling
var flashChanged : boolean = false;

var buttonState : int = 0;

	// MinimapSettings
var minimapMulti : float = 0.29;
var vertOffset : float = -3.5;
var horizOffset : float = 4.7;

	// change this on init level
var numBots : int = 6;

	// badges
var badgeChanged : boolean = false;
var badgeType : int = 99;

	// race summary info
var robotNames : String[] = ["Vektroid", "Zipbot", "Wrekker", "DaBomb", "Podbot", "Speedbot", "Tribot"];
var playerRank : int = 0;
var playerCredits : int;
var badgesRace : int[] = new int[11];
var podiumBots : int[] = new int[7];
var podiumConstructs : int[] = new int[7];
var Lap1Time : float[] = new float[7];
var Lap2Time : float[] = new float[7];
var Lap3Time : float[] = new float[7];
var racePoints : int[] = new int[7];
var circuitPoints : int[] = new int [7];
var botCount : int = 3;
var hasUnlock : boolean = false;
var trackUnlocks : String = "";

var isQuick : boolean = true;

var flashAnim : Animation;
var flashVirus : Animation;
var playerMesh : int;

var gameBeat : boolean = false;

var touchContinue : String;
var winMessage : String[];
var infoText : String[];

function Start()
{
flashAnim = GameObject.Find("HUD_flashAnim").GetComponent(Animation) as Animation;
flashAnim.Play("Warning_Anim");

flashVirus = GameObject.Find("anim_virusWarning").GetComponent(Animation) as Animation;
flashVirus.Play("Warning_Anim");

robotNames = LanguageHandler.botNames;
touchContinue = LanguageHandler.touchContinue;
winMessage = LanguageHandler.winMessage;
infoText = LanguageHandler.infoText;

racePoints = new int[7];
circuitPoints = new int [7];
podiumBots = new int [7];
podiumConstructs = new int [7];
Lap1Time = new float [7];
Lap2Time = new float [7];
Lap3Time = new float [7];
}