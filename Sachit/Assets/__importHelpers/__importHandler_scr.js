#if !UNITY_IPHONE 
//#if !UNITY_WEBPLAYER
private var targetGo : GameObject;

private var meshColl : MeshCollider;

var HUD_pref : GameObject;
var _refHolder_pref : GameObject;
var podium_pref : GameObject;
var matHandler_pref : GameObject;

var _airGate_pref : GameObject;
var _airGate_replace : String;

var _airMine_pref : GameObject;
var _airMine_replace : String;

var _hoop_pref : GameObject;
var _hoop_replace : String;

var _boxObstacle_pref : GameObject;
var _boxObstacle_replace : String;

var _speedPad_pref : GameObject;
var _speedPad_replace : String;

var _turnsign_pref : GameObject;
var _turnsign_replace : String;

var _pickup_pref : GameObject;
var _pickup_replace : String;

var _barrier_pref : GameObject;
var _barrier_replace : String;

var physMat : PhysicMaterial;
var startNum : int = 1;
var endNum : int = 30;
var objName : String = "";

var doImport : boolean = false;
var doRun : boolean = false;
var doPickups : boolean = false;
var doColliders : boolean = false;
var doPlayerSetup : boolean = false;
var doCamConnect : boolean = false;
var doRenderConnect : boolean = false;
var doTurnsign : boolean = false;

// var strikeSound : AudioClip;


function OnDrawGizmosSelected () 
{
	if (doRenderConnect)
	{
		doRenderConnect = false;
		
		var initLevel_ScrP : initLevel = GameObject.Find("_levelSettings_grp_doNotMove").GetComponent(initLevel) as initLevel;
		initLevel_ScrP.robotHips[0] = GameObject.Find("Masumi_RoboRun_Joint_Root").transform;
		initLevel_ScrP.robotHips[1] = GameObject.Find("iRobot_Joint_Root").transform;
		initLevel_ScrP.robotHips[2] = GameObject.Find("Van_Joint_Root").transform;
		initLevel_ScrP.robotHips[3] = GameObject.Find("steamball_Joint_Root").transform;
		initLevel_ScrP.robotHips[4] = GameObject.Find("Blue_Joint_Root").transform;
		initLevel_ScrP.robotHips[5] = GameObject.Find("Monobot_Joint_Root").transform;
		initLevel_ScrP.robotHips[6] = GameObject.Find("Purple_Joint_Root").transform;
		
	}

	if (doCamConnect)
	{
		print ("Connecting");
	
		// Connect Cam Stuff
		var Cam_Scr1 : FollowCamRR = GameObject.Find("_camSystem").GetComponent(FollowCamRR) as FollowCamRR;
			Cam_Scr1.camTrgt = GameObject.Find("cam_Trgt").GetComponent(Transform) as Transform;
			Cam_Scr1.camPos = GameObject.Find("cam_Pos").GetComponent(Transform) as Transform;
			Cam_Scr1.skyboxCam = GameObject.Find("SkyBoxCamera").GetComponent(samSkybox) as samSkybox;
			
		doCamConnect = false;
	}

	if (doPlayerSetup)
	{
		doPlayerSetup = false;
		var playerGO1 : GameObject = GameObject.Find("Player_Construct");
		var playerMove_scr1 : pMove = playerGO1.GetComponent(pMove) as pMove;
		var playerInput_scr1 : pInput = playerGO1.GetComponent(pInput) as pInput;
			playerMove_scr1.camSpeed = GameObject.Find("camSpeed_holder").GetComponent(Animation) as Animation;
			playerMove_scr1.HUD_Speed = GameObject.Find("speedlines").GetComponent(HUD_SingleButton) as HUD_SingleButton;
			playerMove_scr1.HUD_bZort = GameObject.Find("bZort").GetComponent(HUD_SingleButton) as HUD_SingleButton;
			//playerMove_scr1.strikeSound = strikeSound;
			playerInput_scr1.loadScreen = GameObject.Find("loadScreen");
			playerMove_scr1.badgeSource = GameObject.Find("_badgeSounds").GetComponent(AudioSource) as AudioSource;
			playerMove_scr1.speedSource = GameObject.Find("_speedSound").GetComponent(AudioSource) as AudioSource;
			playerMove_scr1.virusSource = GameObject.Find("_virusSounds").GetComponent(AudioSource) as AudioSource;
	}

	if (doImport)
	{
			// reset flag
		doImport = false;

			// import HUD Into scene
		var HUD_Import : GameObject = PrefabUtility.InstantiatePrefab(HUD_pref);
		//var HUD_Scr : GUI_Manager = HUD_Import.GetComponentInChildren(GUI_Manager) as GUI_Manager;

			// import matHandler
		var matHandler : GameObject = PrefabUtility.InstantiatePrefab(matHandler_pref);
		
		// GameObject.Find("reticle").GetComponent(Transform) as Transform;		
		
			// import _refHolder Into scene
		var _refHolder_Import : GameObject = PrefabUtility.InstantiatePrefab(_refHolder_pref);
		var _refHolder_Scr : refHolder = _refHolder_Import.GetComponent(refHolder) as refHolder;
		
			// import podium
		var podium_Import : GameObject = PrefabUtility.InstantiatePrefab(podium_pref);
		
			// fill _refHolder
		_refHolder_Scr.levelSettings = GameObject.Find("_levelSettings_grp_doNotMove").GetComponent(initLevel) as initLevel;
		_refHolder_Scr.allConstructs[0] = GameObject.Find("Player_Construct").GetComponent(Transform) as Transform;
		_refHolder_Scr.allConstructs[1] = GameObject.Find("AI_Construct_01").GetComponent(Transform) as Transform;
		_refHolder_Scr.allConstructs[2] = GameObject.Find("AI_Construct_02").GetComponent(Transform) as Transform;
		_refHolder_Scr.allConstructs[3] = GameObject.Find("AI_Construct_03").GetComponent(Transform) as Transform;
		_refHolder_Scr.allConstructs[4] = GameObject.Find("AI_Construct_04").GetComponent(Transform) as Transform;
		_refHolder_Scr.allConstructs[5] = GameObject.Find("AI_Construct_05").GetComponent(Transform) as Transform;
		_refHolder_Scr.allConstructs[6] = GameObject.Find("AI_Construct_06").GetComponent(Transform) as Transform;
		
			// Connect Cam Stuff
		var Cam_Scr : FollowCamRR = GameObject.Find("_camSystem").GetComponent(FollowCamRR) as FollowCamRR;
			Cam_Scr.camTrgt = GameObject.Find("cam_Trgt").GetComponent(Transform) as Transform;
			Cam_Scr.camPos = GameObject.Find("cam_Pos").GetComponent(Transform) as Transform;
			Cam_Scr.skyboxCam = GameObject.Find("SkyBoxCamera").GetComponent(samSkybox) as samSkybox;
		
			// Connect Player Stuff
		var playerGO : GameObject = GameObject.Find("Player_Construct");
		var playerMove_scr : pMove = playerGO.GetComponent(pMove) as pMove;
		var playerInput_scr : pInput = playerGO.GetComponent(pInput) as pInput;
			playerMove_scr.camSpeed = GameObject.Find("camSpeed_holder").GetComponent(Animation) as Animation;
			playerMove_scr.HUD_Speed = GameObject.Find("speedlines").GetComponent(HUD_SingleButton) as HUD_SingleButton;
			playerMove_scr.HUD_bZort = GameObject.Find("bZort").GetComponent(HUD_SingleButton) as HUD_SingleButton;
			playerInput_scr.loadScreen = GameObject.Find("loadScreen");

			// Connect rendernodes
		var initLevel_Scr : initLevel = _refHolder_Scr.levelSettings;
			initLevel_Scr.robotHips[0] = GameObject.Find("Masumi_RoboRun_Joint_Root").transform;
			initLevel_Scr.robotHips[1] = GameObject.Find("iRobot_Joint_Root").transform;
			initLevel_Scr.robotHips[2] = GameObject.Find("Van_Joint_Root").transform;
			initLevel_Scr.robotHips[3] = GameObject.Find("steamball_Joint_Root").transform;
			initLevel_Scr.robotHips[4] = GameObject.Find("Blue_Joint_Root").transform;
			initLevel_Scr.robotHips[5] = GameObject.Find("Monobot_Joint_Root").transform;
			initLevel_Scr.robotHips[6] = GameObject.Find("Purple_Joint_Root").transform;
			
			// set start time
			initLevel_Scr.startTimer = 5;

	}

	if (doRun)
	{

			// now get a list of all objects in scene, and check against our wanted prefab names
		var allObjects : GameObject[] = FindObjectsOfType(GameObject) as GameObject[];
		var delObjects : GameObject[] = new GameObject[allObjects.Length];
		
		var delCount : int = 0;
		
			// now check all of them for stuff
		for (var i = 0; i < allObjects.Length; i++)
		{
				// check air gate
			if (allObjects[i].name == _airGate_replace)
			{
					// create new prefab
				var newAirGate : GameObject = PrefabUtility.InstantiatePrefab(_airGate_pref);
				
					// match Parent
				newAirGate.transform.parent = allObjects[i].transform.parent;
				
					// match prs
				newAirGate.transform.localPosition = allObjects[i].transform.localPosition;
				newAirGate.transform.localRotation = allObjects[i].transform.localRotation;
				newAirGate.transform.localScale = allObjects[i].transform.localScale;

					// get attached scripts
				var newAirGateScr : variableMover = newAirGate.GetComponentInChildren(variableMover) as variableMover;
				var oldAirGateScr : variableMover = allObjects[i].GetComponentInChildren(variableMover) as variableMover;
				
				if (oldAirGateScr != null)
				{
						// match important values
					newAirGateScr.pauseTime = oldAirGateScr.pauseTime;
					newAirGateScr.startDelay = oldAirGateScr.startDelay;				
					newAirGateScr.startPos = oldAirGateScr.startPos;
					newAirGateScr.targetPos = oldAirGateScr.targetPos;
					newAirGateScr.moveSpeed = oldAirGateScr.moveSpeed;
					newAirGateScr.moveActive = oldAirGateScr.moveActive;
					newAirGateScr.movePingPong = oldAirGateScr.movePingPong;
				}
					// destroy old item
				// DestroyImmediate(currItem);
				delObjects[delCount] = allObjects[i];
				
					// count
				delCount++;
			}
			
			
				// check air mine
			if (allObjects[i].name == _airMine_replace)
			{
					// create new prefab
				var newAirMine : GameObject = PrefabUtility.InstantiatePrefab(_airMine_pref);
				
					// match Parent
				newAirMine.transform.parent = allObjects[i].transform.parent;
				
					// match prs
				newAirMine.transform.localPosition = allObjects[i].transform.localPosition;
				newAirMine.transform.localRotation = allObjects[i].transform.localRotation;
				newAirMine.transform.localScale = allObjects[i].transform.localScale;

					// get attached scripts
				var newAirMineScr : variableMover = newAirMine.GetComponentInChildren(variableMover) as variableMover;
				var oldAirMineScr : variableMover = allObjects[i].GetComponentInChildren(variableMover) as variableMover;
				
				if (oldAirMineScr != null)
				{
						// match important values
					newAirMineScr.pauseTime = oldAirMineScr.pauseTime;
					newAirMineScr.startDelay = oldAirMineScr.startDelay;				
					newAirMineScr.startPos = oldAirMineScr.startPos;
					newAirMineScr.targetPos = oldAirMineScr.targetPos;
					newAirMineScr.moveSpeed = oldAirMineScr.moveSpeed;
					newAirMineScr.moveActive = oldAirMineScr.moveActive;
					newAirMineScr.movePingPong = oldAirMineScr.movePingPong;
				}
					// destroy old item
				// DestroyImmediate(currItem);
				delObjects[delCount] = allObjects[i];
				
					// count
				delCount++;
			}
			
				// check hoop
			if (allObjects[i].name == _hoop_replace)
			{
					// create new prefab
				var newHoop : GameObject = PrefabUtility.InstantiatePrefab(_hoop_pref);
				
					// match Parent
				newHoop.transform.parent = allObjects[i].transform.parent;
				
					// match prs
				newHoop.transform.localPosition = allObjects[i].transform.localPosition;
				newHoop.transform.localRotation = allObjects[i].transform.localRotation;
				newHoop.transform.localScale = allObjects[i].transform.localScale;

					// get attached scripts
				var newHoopScr : variableMover = newHoop.GetComponentInChildren(variableMover) as variableMover;
				var oldHoopScr : variableMover = allObjects[i].GetComponentInChildren(variableMover) as variableMover;
				
				if (oldHoopScr != null)
				{
						// match important values
					newHoopScr.pauseTime = oldHoopScr.pauseTime;
					newHoopScr.startDelay = oldHoopScr.startDelay;				
					newHoopScr.startPos = oldHoopScr.startPos;
					newHoopScr.targetPos = oldHoopScr.targetPos;
					newHoopScr.moveSpeed = oldHoopScr.moveSpeed;
					newHoopScr.moveActive = oldHoopScr.moveActive;
					newHoopScr.movePingPong = oldHoopScr.movePingPong;
				}
					// destroy old item
				// DestroyImmediate(currItem);
				delObjects[delCount] = allObjects[i];
				
					// count
				delCount++;
			}

				// check boxObstacle
			if (allObjects[i].name == _boxObstacle_replace)
			{
					// create new prefab
				var newBox : GameObject = PrefabUtility.InstantiatePrefab(_boxObstacle_pref);
				
					// match Parent
				newBox.transform.parent = allObjects[i].transform.parent;
				
					// match prs
				newBox.transform.localPosition = allObjects[i].transform.localPosition;
				newBox.transform.localRotation = allObjects[i].transform.localRotation;
				newBox.transform.localScale = allObjects[i].transform.localScale;

					// destroy old item
				// DestroyImmediate(currItem);
				delObjects[delCount] = allObjects[i];
				
					// count
				delCount++;
			}
			
				
				// check speedpad
			if (allObjects[i].name == _speedPad_replace)
			{
					// create new prefab
				var newSpeed : GameObject = PrefabUtility.InstantiatePrefab(_speedPad_pref);
				
					// match Parent
				newSpeed.transform.parent = allObjects[i].transform.parent;
				
					// match prs
				newSpeed.transform.localPosition = allObjects[i].transform.localPosition;
				newSpeed.transform.localRotation = allObjects[i].transform.localRotation;
				newSpeed.transform.localScale = allObjects[i].transform.localScale;

					// destroy old item
				// DestroyImmediate(currItem);
				delObjects[delCount] = allObjects[i];
				
					// count
				delCount++;
			}
			
				
				// check turnsign
			if (allObjects[i].name == _turnsign_replace)
			{
					// create new prefab
				var newTurn : GameObject = PrefabUtility.InstantiatePrefab(_turnsign_pref);
				
					// match Parent
				newTurn.transform.parent = allObjects[i].transform.parent;
				
					// match prs
				newTurn.transform.localPosition = allObjects[i].transform.localPosition;
				newTurn.transform.localRotation = allObjects[i].transform.localRotation;
				newTurn.transform.localScale = allObjects[i].transform.localScale;

					// destroy old item
				// DestroyImmediate(currItem);
				delObjects[delCount] = allObjects[i];
				
					// count
				delCount++;
			}
			
			
				// check pickup
			if (allObjects[i].name == _pickup_replace)
			{
					// create new prefab
				var newPickup : GameObject = PrefabUtility.InstantiatePrefab(_pickup_pref);
				
					// match Parent
				newPickup.transform.parent = allObjects[i].transform.parent;
				
					// match prs
				newPickup.transform.localPosition = allObjects[i].transform.localPosition;
				newPickup.transform.localRotation = allObjects[i].transform.localRotation;
				newPickup.transform.localScale = allObjects[i].transform.localScale;

					// destroy old item
				// DestroyImmediate(currItem);
				delObjects[delCount] = allObjects[i];
				
					// count
				delCount++;
			}
			
			
			
				// check Barrier
			else if (allObjects[i].name == _barrier_replace)
			{
				
					// create new prefab
				var newBarrier : GameObject = PrefabUtility.InstantiatePrefab(_barrier_pref);
				
					// match Parent
				newBarrier.transform.parent = allObjects[i].transform.parent;
				
					// match prs
				newBarrier.transform.localPosition = allObjects[i].transform.localPosition;
				newBarrier.transform.localRotation = allObjects[i].transform.localRotation;
				newBarrier.transform.localScale = allObjects[i].transform.localScale;

					// get attached scripts
				var newBarrierScr : energyBarrier = newBarrier.GetComponentInChildren(energyBarrier) as energyBarrier;
				var oldBarrierScr : energyBarrier = allObjects[i].GetComponentInChildren(energyBarrier) as energyBarrier;
				
					// match important values
				newBarrierScr.height = oldBarrierScr.height;
				newBarrierScr.width = oldBarrierScr.width;
				newBarrierScr.anim = oldBarrierScr.anim;
				newBarrierScr.delay = oldBarrierScr.delay;

					// destroy old item
				// DestroyImmediate(currItem);
				delObjects[delCount] = allObjects[i];
				
					// count
				delCount++;
				
			}
			
		}
		for (var j = 0; j < delCount; j++)
		{
			DestroyImmediate(delObjects[j]);
		}

		
		
		
		// var getItemTest : GameObject = GameObject.Find("airGate_final");
		// print ("Name: " + hudImport.name);
		
		
		// get our attached scripts.. GetComponentInChildren(ScriptName);
		
	/*
	
	Find with Tag, or Type (MeshCollider) or both
	
		for (var i = startNum; i < endNum; i++)
		{
		
		//HUD_Reticule = GameObject.Find("reticle").GetComponent(Transform) as Transform;
		
			//if (i < 10)
			//{
			//	targetGo = GameObject.Find(objName + "_00" + i);
			//}
			if (i<10)
			{
				targetGo = GameObject.Find(objName + "_0" + i);
			}
			else
			{
				targetGo = GameObject.Find(objName + "_" + i);
			}

			meshColl = (targetGo.GetComponent(MeshCollider) as MeshCollider); 
			
			meshColl.material = physMat;
			
			meshColl.smoothSphereCollisions = true;

		}
	*/
	
		doRun = false;
	}


	if (doPickups)
	{

			// now get a list of all objects in scene, and check against our wanted prefab names
		var allPickups : GameObject[] = FindObjectsOfType(GameObject) as GameObject[];
		var delPickups : GameObject[] = new GameObject[allPickups.Length];
		
		var delCountP : int = 0;
		
			// now check all of them for stuff
		for (var iP = 0; iP < allPickups.Length; iP++)
		{
				// check pickup
			if (allPickups[iP].name == _pickup_replace)
			{
					// create new prefab
				var newPickupP : GameObject = PrefabUtility.InstantiatePrefab(_pickup_pref);
				
					// match Parent
				newPickupP.transform.parent = allPickups[iP].transform.parent;
				
					// match prs
				newPickupP.transform.localPosition = allPickups[iP].transform.localPosition;
				newPickupP.transform.localRotation = allPickups[iP].transform.localRotation;
				newPickupP.transform.localScale = allPickups[iP].transform.localScale;

					// destroy old item
				// DestroyImmediate(currItem);
				delPickups[delCountP] = allPickups[iP];
				
					// count
				delCountP++;
			}

		}
		for (var jP = 0; jP < delCountP; jP++)
		{
			DestroyImmediate(delPickups[jP]);
		}
		
			// exit loop
		doPickups = false;
	}

	if (doTurnsign)
	{

			// now get a list of all objects in scene, and check against our wanted prefab names
		var allTurnsigns : GameObject[] = FindObjectsOfType(GameObject) as GameObject[];
		var delTurnsigns : GameObject[] = new GameObject[allTurnsigns.Length];
		
		var delCountT : int = 0;
		
			// now check all of them for stuff
		for (var iT = 0; iT < allTurnsigns.Length; iT++)
		{
				// check pickup
			if (allTurnsigns[iT].name == _turnsign_replace)
			{
					// create new prefab
				var newTurnsignT : GameObject = PrefabUtility.InstantiatePrefab(_turnsign_pref);
				
					// match Parent
				newTurnsignT.transform.parent = allTurnsigns[iT].transform.parent;
				
					// match prs
				newTurnsignT.transform.localPosition = allTurnsigns[iT].transform.localPosition;
				newTurnsignT.transform.localRotation = allTurnsigns[iT].transform.localRotation;
				newTurnsignT.transform.localScale = allTurnsigns[iT].transform.localScale;

					// destroy old item
				// DestroyImmediate(currItem);
				delTurnsigns[delCountT] = allTurnsigns[iT];
				
					// count
				delCountT++;
			}

		}
		for (var jT = 0; jT < delCountT; jT++)
		{
			DestroyImmediate(delTurnsigns[jT]);
		}
		
			// exit loop
		doTurnsign = false;
	}		

	if (doColliders)
	{

			// now get a list of all objects in scene, and check against our wanted prefab names
		var allColl : MeshCollider[] = FindObjectsOfType(MeshCollider) as MeshCollider[];

			// now check all of them for stuff
		for (var iC = 0; iC < allColl.Length; iC++)
		{
			allColl[iC].material = physMat;
			
			allColl[iC].smoothSphereCollisions = true;
		}
		
			// exit loop
		doColliders = false;
	}

}
#endif
//#endif