private var bestCam : Camera; 
private var bestCamTrns : Transform;
private var selfTrns : Transform;

function Awake()
{
	bestCam = Camera.main;
	bestCam.clearFlags = CameraClearFlags.Depth;
	bestCamTrns = bestCam.transform;
	selfTrns = transform;
}

// function skyboxUpdate()
function DoUpdate()  
{ 
  selfTrns.rotation = bestCamTrns.rotation; 
} 
