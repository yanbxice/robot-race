var controlsTrns : Transform;

function Awake () 
{
#if UNITY_STANDALONE_WIN
	controlsTrns.localPosition.y = 0.0;
#endif
}