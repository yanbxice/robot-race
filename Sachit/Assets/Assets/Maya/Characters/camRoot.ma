//Maya ASCII 2012 scene
//Name: camRoot.ma
//Last modified: Fri, Oct 28, 2011 05:08:28 PM
//Codeset: 1252
requires maya "2012";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 Hotfix 4 x64";
fileInfo "cutIdentifier" "001200000000-806479";
fileInfo "osv" "Microsoft Windows 7 Ultimate Edition, 64-bit Windows 7  (Build 7600)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 10.09708260053913 1.8091600747161063 -2.5825669566381841 ;
	setAttr ".r" -type "double3" 177.24671457384099 92.207518376235043 -180.00000006601954 ;
	setAttr ".rp" -type "double3" 7.9936057773011271e-015 1.4352963262354024e-012 -1.2562395568238571e-011 ;
	setAttr ".rpt" -type "double3" 4.3271961239165911e-013 -7.1834815643770579e-013 
		8.2732391555111344e-014 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".ovr" 1.3;
	setAttr ".fl" 34.999999999999986;
	setAttr ".fcp" 100000;
	setAttr ".fd" 152.4;
	setAttr ".coi" 9.8257913134418793;
	setAttr ".ow" 94.179033360733243;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".dr" yes;
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -4.2801840926790859 3051.0479999999998 9.2091117988870455 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 100000;
	setAttr ".fd" 152.4;
	setAttr ".coi" 3051.0479999999998;
	setAttr ".ow" 244.10649935875412;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.98187486621869369 -1.8155667084510902 3051.3187464409298 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 100000;
	setAttr ".fd" 152.4;
	setAttr ".coi" 3051.0479999999998;
	setAttr ".ow" 127.63007296261679;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3052.4866313974112 22.327871192662535 -7.2891246924999642 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 100000;
	setAttr ".fd" 152.4;
	setAttr ".coi" 3051.0479999999998;
	setAttr ".ow" 103.46501553607456;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode joint -n "camRoot";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "cam_Pos" -p "camRoot";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "cam_Trgt" -p "camRoot";
	setAttr ".t" -type "double3" 0 1.1 0 ;
	setAttr -av ".ty";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 4 ".lnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 5;
	setAttr -s 7 ".dli[1:6]"  5 1 2 3 4 6;
	setAttr -s 7 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n"
		+ "            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n"
		+ "                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n"
		+ "                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n"
		+ "            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n"
		+ "                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n"
		+ "                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n"
		+ "                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n"
		+ "                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n"
		+ "            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n"
		+ "            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n"
		+ "                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n"
		+ "            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n"
		+ "            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n"
		+ "                -showUpstreamCurves 1\n                -clipTime \"on\" \n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n"
		+ "                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -clipTime \"on\" \n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n"
		+ "                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n"
		+ "                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n"
		+ "                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range -1 -1 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n"
		+ "                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range -1 -1 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Model Panel5\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Model Panel5\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n"
		+ "                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Model Panel5\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n"
		+ "            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -objectFilterShowInHUD 1\n            -isFiltered 0\n"
		+ "            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 21 100 -ps 2 79 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Side View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -camera \\\"persp\\\" \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 4 4 \\n    -bumpResolution 4 4 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -camera \\\"persp\\\" \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 4 4 \\n    -bumpResolution 4 4 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 10 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 300 -ast 0 -aet 4630 ";
	setAttr ".st" 6;
createNode lambert -n "masumi_material";
createNode shadingEngine -n "masumi_shader";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
createNode displayLayer -n "Mesh_Layer";
	setAttr ".dt" 2;
	setAttr ".do" 1;
createNode multiplyDivide -n "Masumi_RoboRun_L_FK_MUltiply_UTL";
	setAttr ".i2" -type "float3" 0.5 1 1 ;
createNode multiplyDivide -n "Masumi_RoboRun_L_IK_MUltiply_UTL";
	setAttr ".i2" -type "float3" 0.5 1 1 ;
createNode multiplyDivide -n "Masumi_RoboRun_R_FK_MUltiply_UTL";
	setAttr ".i2" -type "float3" 0.5 1 1 ;
createNode multiplyDivide -n "Masumi_RoboRun_R_IK_MUltiply_UTL";
	setAttr ".i2" -type "float3" 0.5 1 1 ;
createNode displayLayer -n "Layer_Control";
	setAttr ".v" no;
	setAttr ".c" 17;
	setAttr ".do" 2;
createNode displayLayer -n "L_IK";
	setAttr ".v" no;
	setAttr ".c" 13;
	setAttr ".do" 3;
createNode displayLayer -n "R_IK";
	setAttr ".v" no;
	setAttr ".c" 6;
	setAttr ".do" 4;
createNode displayLayer -n "Layer_Skeleton";
	setAttr ".v" no;
	setAttr ".do" 5;
createNode displayLayer -n "Layer_Skeleton_FK";
	setAttr ".v" no;
	setAttr ".do" 6;
createNode script -n "MoveLister";
	addAttr -ci true -sn "totalMoves" -ln "totalMoves" -at "long";
	addAttr -ci true -sn "move0Name" -ln "move0Name" -dt "string";
	addAttr -ci true -sn "move0Min" -ln "move0Min" -at "long";
	addAttr -ci true -sn "move0Max" -ln "move0Max" -at "long";
	addAttr -ci true -sn "move0Chk" -ln "move0Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move1Name" -ln "move1Name" -dt "string";
	addAttr -ci true -sn "move1Min" -ln "move1Min" -at "long";
	addAttr -ci true -sn "move1Max" -ln "move1Max" -at "long";
	addAttr -ci true -sn "move1Chk" -ln "move1Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move2Name" -ln "move2Name" -dt "string";
	addAttr -ci true -sn "move2Min" -ln "move2Min" -at "long";
	addAttr -ci true -sn "move2Max" -ln "move2Max" -at "long";
	addAttr -ci true -sn "move2Chk" -ln "move2Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move3Name" -ln "move3Name" -dt "string";
	addAttr -ci true -sn "move3Min" -ln "move3Min" -at "long";
	addAttr -ci true -sn "move3Max" -ln "move3Max" -at "long";
	addAttr -ci true -sn "move3Chk" -ln "move3Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move4Name" -ln "move4Name" -dt "string";
	addAttr -ci true -sn "move4Min" -ln "move4Min" -at "long";
	addAttr -ci true -sn "move4Max" -ln "move4Max" -at "long";
	addAttr -ci true -sn "move4Chk" -ln "move4Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move5Name" -ln "move5Name" -dt "string";
	addAttr -ci true -sn "move5Min" -ln "move5Min" -at "long";
	addAttr -ci true -sn "move5Max" -ln "move5Max" -at "long";
	addAttr -ci true -sn "move5Chk" -ln "move5Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move6Name" -ln "move6Name" -dt "string";
	addAttr -ci true -sn "move6Min" -ln "move6Min" -at "long";
	addAttr -ci true -sn "move6Max" -ln "move6Max" -at "long";
	addAttr -ci true -sn "move6Chk" -ln "move6Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move7Name" -ln "move7Name" -dt "string";
	addAttr -ci true -sn "move7Min" -ln "move7Min" -at "long";
	addAttr -ci true -sn "move7Max" -ln "move7Max" -at "long";
	addAttr -ci true -sn "move7Chk" -ln "move7Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move8Name" -ln "move8Name" -dt "string";
	addAttr -ci true -sn "move8Min" -ln "move8Min" -at "long";
	addAttr -ci true -sn "move8Max" -ln "move8Max" -at "long";
	addAttr -ci true -sn "move8Chk" -ln "move8Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move9Name" -ln "move9Name" -dt "string";
	addAttr -ci true -sn "move9Min" -ln "move9Min" -at "long";
	addAttr -ci true -sn "move9Max" -ln "move9Max" -at "long";
	addAttr -ci true -sn "move9Chk" -ln "move9Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move10Name" -ln "move10Name" -dt "string";
	addAttr -ci true -sn "move10Min" -ln "move10Min" -at "long";
	addAttr -ci true -sn "move10Max" -ln "move10Max" -at "long";
	addAttr -ci true -sn "move10Chk" -ln "move10Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move11Name" -ln "move11Name" -dt "string";
	addAttr -ci true -sn "move11Min" -ln "move11Min" -at "long";
	addAttr -ci true -sn "move11Max" -ln "move11Max" -at "long";
	addAttr -ci true -sn "move11Chk" -ln "move11Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move12Name" -ln "move12Name" -dt "string";
	addAttr -ci true -sn "move12Min" -ln "move12Min" -at "long";
	addAttr -ci true -sn "move12Max" -ln "move12Max" -at "long";
	addAttr -ci true -sn "move12Chk" -ln "move12Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move13Name" -ln "move13Name" -dt "string";
	addAttr -ci true -sn "move13Min" -ln "move13Min" -at "long";
	addAttr -ci true -sn "move13Max" -ln "move13Max" -at "long";
	addAttr -ci true -sn "move13Chk" -ln "move13Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move14Name" -ln "move14Name" -dt "string";
	addAttr -ci true -sn "move14Min" -ln "move14Min" -at "long";
	addAttr -ci true -sn "move14Max" -ln "move14Max" -at "long";
	addAttr -ci true -sn "move14Chk" -ln "move14Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move15Name" -ln "move15Name" -dt "string";
	addAttr -ci true -sn "move15Min" -ln "move15Min" -at "long";
	addAttr -ci true -sn "move15Max" -ln "move15Max" -at "long";
	addAttr -ci true -sn "move15Chk" -ln "move15Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move16Name" -ln "move16Name" -dt "string";
	addAttr -ci true -sn "move16Min" -ln "move16Min" -at "long";
	addAttr -ci true -sn "move16Max" -ln "move16Max" -at "long";
	addAttr -ci true -sn "move16Chk" -ln "move16Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move17Name" -ln "move17Name" -dt "string";
	addAttr -ci true -sn "move17Min" -ln "move17Min" -at "long";
	addAttr -ci true -sn "move17Max" -ln "move17Max" -at "long";
	addAttr -ci true -sn "move17Chk" -ln "move17Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move18Name" -ln "move18Name" -dt "string";
	addAttr -ci true -sn "move18Min" -ln "move18Min" -at "long";
	addAttr -ci true -sn "move18Max" -ln "move18Max" -at "long";
	addAttr -ci true -sn "move18Chk" -ln "move18Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move19Name" -ln "move19Name" -dt "string";
	addAttr -ci true -sn "move19Min" -ln "move19Min" -at "long";
	addAttr -ci true -sn "move19Max" -ln "move19Max" -at "long";
	addAttr -ci true -sn "move19Chk" -ln "move19Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move20Name" -ln "move20Name" -dt "string";
	addAttr -ci true -sn "move20Min" -ln "move20Min" -at "long";
	addAttr -ci true -sn "move20Max" -ln "move20Max" -at "long";
	addAttr -ci true -sn "move20Chk" -ln "move20Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move21Name" -ln "move21Name" -dt "string";
	addAttr -ci true -sn "move21Min" -ln "move21Min" -at "long";
	addAttr -ci true -sn "move21Max" -ln "move21Max" -at "long";
	addAttr -ci true -sn "move21Chk" -ln "move21Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move22Name" -ln "move22Name" -dt "string";
	addAttr -ci true -sn "move22Min" -ln "move22Min" -at "long";
	addAttr -ci true -sn "move22Max" -ln "move22Max" -at "long";
	addAttr -ci true -sn "move22Chk" -ln "move22Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move23Name" -ln "move23Name" -dt "string";
	addAttr -ci true -sn "move23Min" -ln "move23Min" -at "long";
	addAttr -ci true -sn "move23Max" -ln "move23Max" -at "long";
	addAttr -ci true -sn "move23Chk" -ln "move23Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move24Name" -ln "move24Name" -dt "string";
	addAttr -ci true -sn "move24Min" -ln "move24Min" -at "long";
	addAttr -ci true -sn "move24Max" -ln "move24Max" -at "long";
	addAttr -ci true -sn "move24Chk" -ln "move24Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move25Name" -ln "move25Name" -dt "string";
	addAttr -ci true -sn "move25Min" -ln "move25Min" -at "long";
	addAttr -ci true -sn "move25Max" -ln "move25Max" -at "long";
	addAttr -ci true -sn "move25Chk" -ln "move25Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move26Name" -ln "move26Name" -dt "string";
	addAttr -ci true -sn "move26Min" -ln "move26Min" -at "long";
	addAttr -ci true -sn "move26Max" -ln "move26Max" -at "long";
	addAttr -ci true -sn "move26Chk" -ln "move26Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move27Name" -ln "move27Name" -dt "string";
	addAttr -ci true -sn "move27Min" -ln "move27Min" -at "long";
	addAttr -ci true -sn "move27Max" -ln "move27Max" -at "long";
	addAttr -ci true -sn "move27Chk" -ln "move27Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move28Name" -ln "move28Name" -dt "string";
	addAttr -ci true -sn "move28Min" -ln "move28Min" -at "long";
	addAttr -ci true -sn "move28Max" -ln "move28Max" -at "long";
	addAttr -ci true -sn "move28Chk" -ln "move28Chk" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "move29Name" -ln "move29Name" -dt "string";
	addAttr -ci true -sn "move29Min" -ln "move29Min" -at "long";
	addAttr -ci true -sn "move29Max" -ln "move29Max" -at "long";
	addAttr -ci true -sn "move29Chk" -ln "move29Chk" -min 0 -max 1 -at "bool";
	setAttr ".totalMoves" 30;
	setAttr ".move0Name" -type "string" "Skate_Slow";
	setAttr ".move0Min" 100;
	setAttr ".move0Max" 130;
	setAttr ".move1Name" -type "string" "Skate_Fast";
	setAttr ".move1Min" 900;
	setAttr ".move1Max" 930;
	setAttr ".move2Name" -type "string" "Stand_Idle";
	setAttr ".move2Min" 500;
	setAttr ".move2Max" 530;
	setAttr ".move3Name" -type "string" "Skate_Idle";
	setAttr ".move3Min" 2400;
	setAttr ".move3Max" 2430;
	setAttr ".move4Name" -type "string" "Jump_Over";
	setAttr ".move4Min" 300;
	setAttr ".move4Max" 330;
	setAttr ".move5Name" -type "string" "Grind_Idle";
	setAttr ".move5Min" 400;
	setAttr ".move5Max" 430;
	setAttr ".move6Name" -type "string" "Attack";
	setAttr ".move6Min" 1000;
	setAttr ".move6Max" 1030;
	setAttr ".move7Name" -type "string" "Plane_Idle";
	setAttr ".move7Min" 1700;
	setAttr ".move7Max" 1730;
	setAttr ".move8Name" -type "string" "Idle2Plane";
	setAttr ".move8Min" 600;
	setAttr ".move8Max" 630;
	setAttr ".move9Name" -type "string" "Plane_Idle";
	setAttr ".move9Min" 1700;
	setAttr ".move9Max" 1730;
	setAttr ".move10Name" -type "string" "Plane2Idle";
	setAttr ".move10Min" 1400;
	setAttr ".move10Max" 1430;
	setAttr ".move11Name" -type "string" "Idle2Car";
	setAttr ".move11Min" 700;
	setAttr ".move11Max" 730;
	setAttr ".move12Name" -type "string" "Car_Idle";
	setAttr ".move12Min" 1600;
	setAttr ".move12Max" 1630;
	setAttr ".move13Name" -type "string" "Car2Idle";
	setAttr ".move13Min" 1500;
	setAttr ".move13Max" 1530;
	setAttr ".move14Name" -type "string" "CarLeft";
	setAttr ".move14Min" 1800;
	setAttr ".move14Max" 1830;
	setAttr ".move15Name" -type "string" "CarRight";
	setAttr ".move15Min" 1900;
	setAttr ".move15Max" 1930;
	setAttr ".move16Name" -type "string" "PlaneLeft";
	setAttr ".move16Min" 2000;
	setAttr ".move16Max" 2030;
	setAttr ".move17Name" -type "string" "PlaneRight";
	setAttr ".move17Min" 2100;
	setAttr ".move17Max" 2130;
	setAttr ".move18Name" -type "string" "SkateLeft";
	setAttr ".move18Min" 2200;
	setAttr ".move18Max" 2230;
	setAttr ".move19Name" -type "string" "SkateRight";
	setAttr ".move19Min" 2300;
	setAttr ".move19Max" 2330;
	setAttr ".move20Name" -type "string" "Wreck";
	setAttr ".move20Min" 1200;
	setAttr ".move20Max" 1270;
	setAttr ".move21Name" -type "string" "Damage";
	setAttr ".move21Min" 1100;
	setAttr ".move21Max" 1130;
	setAttr ".move22Name" -type "string" "Win";
	setAttr ".move22Min" 1300;
	setAttr ".move22Max" 1360;
	setAttr ".move23Name" -type "string" "ChoosePlayer";
	setAttr ".move23Min" 3600;
	setAttr ".move23Max" 3680;
	setAttr ".move24Name" -type "string" "Get_Ready2";
	setAttr ".move24Min" 3800;
	setAttr ".move24Max" 4000;
	setAttr ".move25Name" -type "string" "Win2";
	setAttr ".move25Min" 4100;
	setAttr ".move25Max" 4220;
	setAttr ".move26Name" -type "string" "PlaneHit";
	setAttr ".move26Min" 4300;
	setAttr ".move26Max" 4330;
	setAttr ".move27Name" -type "string" "CarHit";
	setAttr ".move27Min" 4400;
	setAttr ".move27Max" 4430;
	setAttr ".move28Name" -type "string" "LowTurnLeft";
	setAttr ".move28Min" 4500;
	setAttr ".move28Max" 4530;
	setAttr ".move28Chk" yes;
	setAttr ".move29Name" -type "string" "LowTurnRight";
	setAttr ".move29Min" 4600;
	setAttr ".move29Max" 4630;
	setAttr ".move29Chk" yes;
createNode file -n "masumi_texture";
	setAttr ".ftn" -type "string" "H:/_root/00_VAULT/02_Unity/samRobotRace/Project/Assets/Assets/Maya/Characters/vektor/vektor_final_texture.jpg";
createNode place2dTexture -n "place2dTexture1";
createNode script -n "SequencerData";
	addAttr -ci true -sn "UniqueId" -ln "UniqueId" -at "long";
	addAttr -ci true -sn "Ordering" -ln "Ordering" -dt "Int32Array";
	addAttr -ci true -sn "Animations" -ln "Animations" -at "compound" -nc 58;
	addAttr -ci true -sn "Animation0" -ln "Animation0" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name0" -ln "Name0" -dt "string" -p "Animation0";
	addAttr -ci true -sn "StartFrame0" -ln "StartFrame0" -at "long" -p "Animation0";
	addAttr -ci true -sn "EndFrame0" -ln "EndFrame0" -at "long" -p "Animation0";
	addAttr -ci true -sn "Selected0" -ln "Selected0" -min 0 -max 1 -at "bool" -p "Animation0";
	addAttr -ci true -sn "Animation1" -ln "Animation1" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name1" -ln "Name1" -dt "string" -p "Animation1";
	addAttr -ci true -sn "StartFrame1" -ln "StartFrame1" -at "long" -p "Animation1";
	addAttr -ci true -sn "EndFrame1" -ln "EndFrame1" -at "long" -p "Animation1";
	addAttr -ci true -sn "Selected1" -ln "Selected1" -min 0 -max 1 -at "bool" -p "Animation1";
	addAttr -ci true -sn "Animation2" -ln "Animation2" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name2" -ln "Name2" -dt "string" -p "Animation2";
	addAttr -ci true -sn "StartFrame2" -ln "StartFrame2" -at "long" -p "Animation2";
	addAttr -ci true -sn "EndFrame2" -ln "EndFrame2" -at "long" -p "Animation2";
	addAttr -ci true -sn "Selected2" -ln "Selected2" -min 0 -max 1 -at "bool" -p "Animation2";
	addAttr -ci true -sn "Animation3" -ln "Animation3" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name3" -ln "Name3" -dt "string" -p "Animation3";
	addAttr -ci true -sn "StartFrame3" -ln "StartFrame3" -at "long" -p "Animation3";
	addAttr -ci true -sn "EndFrame3" -ln "EndFrame3" -at "long" -p "Animation3";
	addAttr -ci true -sn "Selected3" -ln "Selected3" -min 0 -max 1 -at "bool" -p "Animation3";
	addAttr -ci true -sn "Animation4" -ln "Animation4" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name4" -ln "Name4" -dt "string" -p "Animation4";
	addAttr -ci true -sn "StartFrame4" -ln "StartFrame4" -at "long" -p "Animation4";
	addAttr -ci true -sn "EndFrame4" -ln "EndFrame4" -at "long" -p "Animation4";
	addAttr -ci true -sn "Selected4" -ln "Selected4" -min 0 -max 1 -at "bool" -p "Animation4";
	addAttr -ci true -sn "Animation5" -ln "Animation5" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name5" -ln "Name5" -dt "string" -p "Animation5";
	addAttr -ci true -sn "StartFrame5" -ln "StartFrame5" -at "long" -p "Animation5";
	addAttr -ci true -sn "EndFrame5" -ln "EndFrame5" -at "long" -p "Animation5";
	addAttr -ci true -sn "Selected5" -ln "Selected5" -min 0 -max 1 -at "bool" -p "Animation5";
	addAttr -ci true -sn "Animation6" -ln "Animation6" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name6" -ln "Name6" -dt "string" -p "Animation6";
	addAttr -ci true -sn "StartFrame6" -ln "StartFrame6" -at "long" -p "Animation6";
	addAttr -ci true -sn "EndFrame6" -ln "EndFrame6" -at "long" -p "Animation6";
	addAttr -ci true -sn "Selected6" -ln "Selected6" -min 0 -max 1 -at "bool" -p "Animation6";
	addAttr -ci true -sn "Animation7" -ln "Animation7" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name7" -ln "Name7" -dt "string" -p "Animation7";
	addAttr -ci true -sn "StartFrame7" -ln "StartFrame7" -at "long" -p "Animation7";
	addAttr -ci true -sn "EndFrame7" -ln "EndFrame7" -at "long" -p "Animation7";
	addAttr -ci true -sn "Selected7" -ln "Selected7" -min 0 -max 1 -at "bool" -p "Animation7";
	addAttr -ci true -sn "Animation8" -ln "Animation8" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name8" -ln "Name8" -dt "string" -p "Animation8";
	addAttr -ci true -sn "StartFrame8" -ln "StartFrame8" -at "long" -p "Animation8";
	addAttr -ci true -sn "EndFrame8" -ln "EndFrame8" -at "long" -p "Animation8";
	addAttr -ci true -sn "Selected8" -ln "Selected8" -min 0 -max 1 -at "bool" -p "Animation8";
	addAttr -ci true -sn "Animation9" -ln "Animation9" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name9" -ln "Name9" -dt "string" -p "Animation9";
	addAttr -ci true -sn "StartFrame9" -ln "StartFrame9" -at "long" -p "Animation9";
	addAttr -ci true -sn "EndFrame9" -ln "EndFrame9" -at "long" -p "Animation9";
	addAttr -ci true -sn "Selected9" -ln "Selected9" -min 0 -max 1 -at "bool" -p "Animation9";
	addAttr -ci true -sn "Animation10" -ln "Animation10" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name10" -ln "Name10" -dt "string" -p "Animation10";
	addAttr -ci true -sn "StartFrame10" -ln "StartFrame10" -at "long" -p "Animation10";
	addAttr -ci true -sn "EndFrame10" -ln "EndFrame10" -at "long" -p "Animation10";
	addAttr -ci true -sn "Selected10" -ln "Selected10" -min 0 -max 1 -at "bool" -p "Animation10";
	addAttr -ci true -sn "Animation11" -ln "Animation11" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name11" -ln "Name11" -dt "string" -p "Animation11";
	addAttr -ci true -sn "StartFrame11" -ln "StartFrame11" -at "long" -p "Animation11";
	addAttr -ci true -sn "EndFrame11" -ln "EndFrame11" -at "long" -p "Animation11";
	addAttr -ci true -sn "Selected11" -ln "Selected11" -min 0 -max 1 -at "bool" -p "Animation11";
	addAttr -ci true -sn "Animation12" -ln "Animation12" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name12" -ln "Name12" -dt "string" -p "Animation12";
	addAttr -ci true -sn "StartFrame12" -ln "StartFrame12" -at "long" -p "Animation12";
	addAttr -ci true -sn "EndFrame12" -ln "EndFrame12" -at "long" -p "Animation12";
	addAttr -ci true -sn "Selected12" -ln "Selected12" -min 0 -max 1 -at "bool" -p "Animation12";
	addAttr -ci true -sn "Animation13" -ln "Animation13" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name13" -ln "Name13" -dt "string" -p "Animation13";
	addAttr -ci true -sn "StartFrame13" -ln "StartFrame13" -at "long" -p "Animation13";
	addAttr -ci true -sn "EndFrame13" -ln "EndFrame13" -at "long" -p "Animation13";
	addAttr -ci true -sn "Selected13" -ln "Selected13" -min 0 -max 1 -at "bool" -p "Animation13";
	addAttr -ci true -sn "Animation14" -ln "Animation14" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name14" -ln "Name14" -dt "string" -p "Animation14";
	addAttr -ci true -sn "StartFrame14" -ln "StartFrame14" -at "long" -p "Animation14";
	addAttr -ci true -sn "EndFrame14" -ln "EndFrame14" -at "long" -p "Animation14";
	addAttr -ci true -sn "Selected14" -ln "Selected14" -min 0 -max 1 -at "bool" -p "Animation14";
	addAttr -ci true -sn "Animation15" -ln "Animation15" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name15" -ln "Name15" -dt "string" -p "Animation15";
	addAttr -ci true -sn "StartFrame15" -ln "StartFrame15" -at "long" -p "Animation15";
	addAttr -ci true -sn "EndFrame15" -ln "EndFrame15" -at "long" -p "Animation15";
	addAttr -ci true -sn "Selected15" -ln "Selected15" -min 0 -max 1 -at "bool" -p "Animation15";
	addAttr -ci true -sn "Animation16" -ln "Animation16" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name16" -ln "Name16" -dt "string" -p "Animation16";
	addAttr -ci true -sn "StartFrame16" -ln "StartFrame16" -at "long" -p "Animation16";
	addAttr -ci true -sn "EndFrame16" -ln "EndFrame16" -at "long" -p "Animation16";
	addAttr -ci true -sn "Selected16" -ln "Selected16" -min 0 -max 1 -at "bool" -p "Animation16";
	addAttr -ci true -sn "Animation17" -ln "Animation17" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name17" -ln "Name17" -dt "string" -p "Animation17";
	addAttr -ci true -sn "StartFrame17" -ln "StartFrame17" -at "long" -p "Animation17";
	addAttr -ci true -sn "EndFrame17" -ln "EndFrame17" -at "long" -p "Animation17";
	addAttr -ci true -sn "Selected17" -ln "Selected17" -min 0 -max 1 -at "bool" -p "Animation17";
	addAttr -ci true -sn "Animation18" -ln "Animation18" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name18" -ln "Name18" -dt "string" -p "Animation18";
	addAttr -ci true -sn "StartFrame18" -ln "StartFrame18" -at "long" -p "Animation18";
	addAttr -ci true -sn "EndFrame18" -ln "EndFrame18" -at "long" -p "Animation18";
	addAttr -ci true -sn "Selected18" -ln "Selected18" -min 0 -max 1 -at "bool" -p "Animation18";
	addAttr -ci true -sn "Animation19" -ln "Animation19" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name19" -ln "Name19" -dt "string" -p "Animation19";
	addAttr -ci true -sn "StartFrame19" -ln "StartFrame19" -at "long" -p "Animation19";
	addAttr -ci true -sn "EndFrame19" -ln "EndFrame19" -at "long" -p "Animation19";
	addAttr -ci true -sn "Selected19" -ln "Selected19" -min 0 -max 1 -at "bool" -p "Animation19";
	addAttr -ci true -sn "Animation20" -ln "Animation20" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name20" -ln "Name20" -dt "string" -p "Animation20";
	addAttr -ci true -sn "StartFrame20" -ln "StartFrame20" -at "long" -p "Animation20";
	addAttr -ci true -sn "EndFrame20" -ln "EndFrame20" -at "long" -p "Animation20";
	addAttr -ci true -sn "Selected20" -ln "Selected20" -min 0 -max 1 -at "bool" -p "Animation20";
	addAttr -ci true -sn "Animation21" -ln "Animation21" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name21" -ln "Name21" -dt "string" -p "Animation21";
	addAttr -ci true -sn "StartFrame21" -ln "StartFrame21" -at "long" -p "Animation21";
	addAttr -ci true -sn "EndFrame21" -ln "EndFrame21" -at "long" -p "Animation21";
	addAttr -ci true -sn "Selected21" -ln "Selected21" -min 0 -max 1 -at "bool" -p "Animation21";
	addAttr -ci true -sn "Animation22" -ln "Animation22" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name22" -ln "Name22" -dt "string" -p "Animation22";
	addAttr -ci true -sn "StartFrame22" -ln "StartFrame22" -at "long" -p "Animation22";
	addAttr -ci true -sn "EndFrame22" -ln "EndFrame22" -at "long" -p "Animation22";
	addAttr -ci true -sn "Selected22" -ln "Selected22" -min 0 -max 1 -at "bool" -p "Animation22";
	addAttr -ci true -sn "Animation23" -ln "Animation23" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name23" -ln "Name23" -dt "string" -p "Animation23";
	addAttr -ci true -sn "StartFrame23" -ln "StartFrame23" -at "long" -p "Animation23";
	addAttr -ci true -sn "EndFrame23" -ln "EndFrame23" -at "long" -p "Animation23";
	addAttr -ci true -sn "Selected23" -ln "Selected23" -min 0 -max 1 -at "bool" -p "Animation23";
	addAttr -ci true -sn "Animation24" -ln "Animation24" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name24" -ln "Name24" -dt "string" -p "Animation24";
	addAttr -ci true -sn "StartFrame24" -ln "StartFrame24" -at "long" -p "Animation24";
	addAttr -ci true -sn "EndFrame24" -ln "EndFrame24" -at "long" -p "Animation24";
	addAttr -ci true -sn "Selected24" -ln "Selected24" -min 0 -max 1 -at "bool" -p "Animation24";
	addAttr -ci true -sn "Animation25" -ln "Animation25" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name25" -ln "Name25" -dt "string" -p "Animation25";
	addAttr -ci true -sn "StartFrame25" -ln "StartFrame25" -at "long" -p "Animation25";
	addAttr -ci true -sn "EndFrame25" -ln "EndFrame25" -at "long" -p "Animation25";
	addAttr -ci true -sn "Selected25" -ln "Selected25" -min 0 -max 1 -at "bool" -p "Animation25";
	addAttr -ci true -sn "Animation26" -ln "Animation26" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name26" -ln "Name26" -dt "string" -p "Animation26";
	addAttr -ci true -sn "StartFrame26" -ln "StartFrame26" -at "long" -p "Animation26";
	addAttr -ci true -sn "EndFrame26" -ln "EndFrame26" -at "long" -p "Animation26";
	addAttr -ci true -sn "Selected26" -ln "Selected26" -min 0 -max 1 -at "bool" -p "Animation26";
	addAttr -ci true -sn "Animation27" -ln "Animation27" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name27" -ln "Name27" -dt "string" -p "Animation27";
	addAttr -ci true -sn "StartFrame27" -ln "StartFrame27" -at "long" -p "Animation27";
	addAttr -ci true -sn "EndFrame27" -ln "EndFrame27" -at "long" -p "Animation27";
	addAttr -ci true -sn "Selected27" -ln "Selected27" -min 0 -max 1 -at "bool" -p "Animation27";
	addAttr -ci true -sn "Animation28" -ln "Animation28" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name28" -ln "Name28" -dt "string" -p "Animation28";
	addAttr -ci true -sn "StartFrame28" -ln "StartFrame28" -at "long" -p "Animation28";
	addAttr -ci true -sn "EndFrame28" -ln "EndFrame28" -at "long" -p "Animation28";
	addAttr -ci true -sn "Selected28" -ln "Selected28" -min 0 -max 1 -at "bool" -p "Animation28";
	addAttr -ci true -sn "Animation29" -ln "Animation29" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name29" -ln "Name29" -dt "string" -p "Animation29";
	addAttr -ci true -sn "StartFrame29" -ln "StartFrame29" -at "long" -p "Animation29";
	addAttr -ci true -sn "EndFrame29" -ln "EndFrame29" -at "long" -p "Animation29";
	addAttr -ci true -sn "Selected29" -ln "Selected29" -min 0 -max 1 -at "bool" -p "Animation29";
	addAttr -ci true -sn "Animation30" -ln "Animation30" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name30" -ln "Name30" -dt "string" -p "Animation30";
	addAttr -ci true -sn "StartFrame30" -ln "StartFrame30" -at "long" -p "Animation30";
	addAttr -ci true -sn "EndFrame30" -ln "EndFrame30" -at "long" -p "Animation30";
	addAttr -ci true -sn "Selected30" -ln "Selected30" -min 0 -max 1 -at "bool" -p "Animation30";
	addAttr -ci true -sn "Animation31" -ln "Animation31" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name31" -ln "Name31" -dt "string" -p "Animation31";
	addAttr -ci true -sn "StartFrame31" -ln "StartFrame31" -at "long" -p "Animation31";
	addAttr -ci true -sn "EndFrame31" -ln "EndFrame31" -at "long" -p "Animation31";
	addAttr -ci true -sn "Selected31" -ln "Selected31" -min 0 -max 1 -at "bool" -p "Animation31";
	addAttr -ci true -sn "Animation32" -ln "Animation32" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name32" -ln "Name32" -dt "string" -p "Animation32";
	addAttr -ci true -sn "StartFrame32" -ln "StartFrame32" -at "long" -p "Animation32";
	addAttr -ci true -sn "EndFrame32" -ln "EndFrame32" -at "long" -p "Animation32";
	addAttr -ci true -sn "Selected32" -ln "Selected32" -min 0 -max 1 -at "bool" -p "Animation32";
	addAttr -ci true -sn "Animation33" -ln "Animation33" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name33" -ln "Name33" -dt "string" -p "Animation33";
	addAttr -ci true -sn "StartFrame33" -ln "StartFrame33" -at "long" -p "Animation33";
	addAttr -ci true -sn "EndFrame33" -ln "EndFrame33" -at "long" -p "Animation33";
	addAttr -ci true -sn "Selected33" -ln "Selected33" -min 0 -max 1 -at "bool" -p "Animation33";
	addAttr -ci true -sn "Animation34" -ln "Animation34" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name34" -ln "Name34" -dt "string" -p "Animation34";
	addAttr -ci true -sn "StartFrame34" -ln "StartFrame34" -at "long" -p "Animation34";
	addAttr -ci true -sn "EndFrame34" -ln "EndFrame34" -at "long" -p "Animation34";
	addAttr -ci true -sn "Selected34" -ln "Selected34" -min 0 -max 1 -at "bool" -p "Animation34";
	addAttr -ci true -sn "Animation35" -ln "Animation35" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name35" -ln "Name35" -dt "string" -p "Animation35";
	addAttr -ci true -sn "StartFrame35" -ln "StartFrame35" -at "long" -p "Animation35";
	addAttr -ci true -sn "EndFrame35" -ln "EndFrame35" -at "long" -p "Animation35";
	addAttr -ci true -sn "Selected35" -ln "Selected35" -min 0 -max 1 -at "bool" -p "Animation35";
	addAttr -ci true -sn "Animation36" -ln "Animation36" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name36" -ln "Name36" -dt "string" -p "Animation36";
	addAttr -ci true -sn "StartFrame36" -ln "StartFrame36" -at "long" -p "Animation36";
	addAttr -ci true -sn "EndFrame36" -ln "EndFrame36" -at "long" -p "Animation36";
	addAttr -ci true -sn "Selected36" -ln "Selected36" -min 0 -max 1 -at "bool" -p "Animation36";
	addAttr -ci true -sn "Animation37" -ln "Animation37" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name37" -ln "Name37" -dt "string" -p "Animation37";
	addAttr -ci true -sn "StartFrame37" -ln "StartFrame37" -at "long" -p "Animation37";
	addAttr -ci true -sn "EndFrame37" -ln "EndFrame37" -at "long" -p "Animation37";
	addAttr -ci true -sn "Selected37" -ln "Selected37" -min 0 -max 1 -at "bool" -p "Animation37";
	addAttr -ci true -sn "Animation38" -ln "Animation38" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name38" -ln "Name38" -dt "string" -p "Animation38";
	addAttr -ci true -sn "StartFrame38" -ln "StartFrame38" -at "long" -p "Animation38";
	addAttr -ci true -sn "EndFrame38" -ln "EndFrame38" -at "long" -p "Animation38";
	addAttr -ci true -sn "Selected38" -ln "Selected38" -min 0 -max 1 -at "bool" -p "Animation38";
	addAttr -ci true -sn "Animation39" -ln "Animation39" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name39" -ln "Name39" -dt "string" -p "Animation39";
	addAttr -ci true -sn "StartFrame39" -ln "StartFrame39" -at "long" -p "Animation39";
	addAttr -ci true -sn "EndFrame39" -ln "EndFrame39" -at "long" -p "Animation39";
	addAttr -ci true -sn "Selected39" -ln "Selected39" -min 0 -max 1 -at "bool" -p "Animation39";
	addAttr -ci true -sn "Animation40" -ln "Animation40" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name40" -ln "Name40" -dt "string" -p "Animation40";
	addAttr -ci true -sn "StartFrame40" -ln "StartFrame40" -at "long" -p "Animation40";
	addAttr -ci true -sn "EndFrame40" -ln "EndFrame40" -at "long" -p "Animation40";
	addAttr -ci true -sn "Selected40" -ln "Selected40" -min 0 -max 1 -at "bool" -p "Animation40";
	addAttr -ci true -sn "Animation41" -ln "Animation41" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name41" -ln "Name41" -dt "string" -p "Animation41";
	addAttr -ci true -sn "StartFrame41" -ln "StartFrame41" -at "long" -p "Animation41";
	addAttr -ci true -sn "EndFrame41" -ln "EndFrame41" -at "long" -p "Animation41";
	addAttr -ci true -sn "Selected41" -ln "Selected41" -min 0 -max 1 -at "bool" -p "Animation41";
	addAttr -ci true -sn "Animation42" -ln "Animation42" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name42" -ln "Name42" -dt "string" -p "Animation42";
	addAttr -ci true -sn "StartFrame42" -ln "StartFrame42" -at "long" -p "Animation42";
	addAttr -ci true -sn "EndFrame42" -ln "EndFrame42" -at "long" -p "Animation42";
	addAttr -ci true -sn "Selected42" -ln "Selected42" -min 0 -max 1 -at "bool" -p "Animation42";
	addAttr -ci true -sn "Animation43" -ln "Animation43" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name43" -ln "Name43" -dt "string" -p "Animation43";
	addAttr -ci true -sn "StartFrame43" -ln "StartFrame43" -at "long" -p "Animation43";
	addAttr -ci true -sn "EndFrame43" -ln "EndFrame43" -at "long" -p "Animation43";
	addAttr -ci true -sn "Selected43" -ln "Selected43" -min 0 -max 1 -at "bool" -p "Animation43";
	addAttr -ci true -sn "Animation44" -ln "Animation44" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name44" -ln "Name44" -dt "string" -p "Animation44";
	addAttr -ci true -sn "StartFrame44" -ln "StartFrame44" -at "long" -p "Animation44";
	addAttr -ci true -sn "EndFrame44" -ln "EndFrame44" -at "long" -p "Animation44";
	addAttr -ci true -sn "Selected44" -ln "Selected44" -min 0 -max 1 -at "bool" -p "Animation44";
	addAttr -ci true -sn "Animation45" -ln "Animation45" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name45" -ln "Name45" -dt "string" -p "Animation45";
	addAttr -ci true -sn "StartFrame45" -ln "StartFrame45" -at "long" -p "Animation45";
	addAttr -ci true -sn "EndFrame45" -ln "EndFrame45" -at "long" -p "Animation45";
	addAttr -ci true -sn "Selected45" -ln "Selected45" -min 0 -max 1 -at "bool" -p "Animation45";
	addAttr -ci true -sn "Animation46" -ln "Animation46" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name46" -ln "Name46" -dt "string" -p "Animation46";
	addAttr -ci true -sn "StartFrame46" -ln "StartFrame46" -at "long" -p "Animation46";
	addAttr -ci true -sn "EndFrame46" -ln "EndFrame46" -at "long" -p "Animation46";
	addAttr -ci true -sn "Selected46" -ln "Selected46" -min 0 -max 1 -at "bool" -p "Animation46";
	addAttr -ci true -sn "Animation47" -ln "Animation47" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name47" -ln "Name47" -dt "string" -p "Animation47";
	addAttr -ci true -sn "StartFrame47" -ln "StartFrame47" -at "long" -p "Animation47";
	addAttr -ci true -sn "EndFrame47" -ln "EndFrame47" -at "long" -p "Animation47";
	addAttr -ci true -sn "Selected47" -ln "Selected47" -min 0 -max 1 -at "bool" -p "Animation47";
	addAttr -ci true -sn "Animation48" -ln "Animation48" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name48" -ln "Name48" -dt "string" -p "Animation48";
	addAttr -ci true -sn "StartFrame48" -ln "StartFrame48" -at "long" -p "Animation48";
	addAttr -ci true -sn "EndFrame48" -ln "EndFrame48" -at "long" -p "Animation48";
	addAttr -ci true -sn "Selected48" -ln "Selected48" -min 0 -max 1 -at "bool" -p "Animation48";
	addAttr -ci true -sn "Animation49" -ln "Animation49" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name49" -ln "Name49" -dt "string" -p "Animation49";
	addAttr -ci true -sn "StartFrame49" -ln "StartFrame49" -at "long" -p "Animation49";
	addAttr -ci true -sn "EndFrame49" -ln "EndFrame49" -at "long" -p "Animation49";
	addAttr -ci true -sn "Selected49" -ln "Selected49" -min 0 -max 1 -at "bool" -p "Animation49";
	addAttr -ci true -sn "Animation50" -ln "Animation50" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name50" -ln "Name50" -dt "string" -p "Animation50";
	addAttr -ci true -sn "StartFrame50" -ln "StartFrame50" -at "long" -p "Animation50";
	addAttr -ci true -sn "EndFrame50" -ln "EndFrame50" -at "long" -p "Animation50";
	addAttr -ci true -sn "Selected50" -ln "Selected50" -min 0 -max 1 -at "bool" -p "Animation50";
	addAttr -ci true -sn "Animation51" -ln "Animation51" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name51" -ln "Name51" -dt "string" -p "Animation51";
	addAttr -ci true -sn "StartFrame51" -ln "StartFrame51" -at "long" -p "Animation51";
	addAttr -ci true -sn "EndFrame51" -ln "EndFrame51" -at "long" -p "Animation51";
	addAttr -ci true -sn "Selected51" -ln "Selected51" -min 0 -max 1 -at "bool" -p "Animation51";
	addAttr -ci true -sn "Animation52" -ln "Animation52" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name52" -ln "Name52" -dt "string" -p "Animation52";
	addAttr -ci true -sn "StartFrame52" -ln "StartFrame52" -at "long" -p "Animation52";
	addAttr -ci true -sn "EndFrame52" -ln "EndFrame52" -at "long" -p "Animation52";
	addAttr -ci true -sn "Selected52" -ln "Selected52" -min 0 -max 1 -at "bool" -p "Animation52";
	addAttr -ci true -sn "Animation53" -ln "Animation53" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name53" -ln "Name53" -dt "string" -p "Animation53";
	addAttr -ci true -sn "StartFrame53" -ln "StartFrame53" -at "long" -p "Animation53";
	addAttr -ci true -sn "EndFrame53" -ln "EndFrame53" -at "long" -p "Animation53";
	addAttr -ci true -sn "Selected53" -ln "Selected53" -min 0 -max 1 -at "bool" -p "Animation53";
	addAttr -ci true -sn "Animation54" -ln "Animation54" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name54" -ln "Name54" -dt "string" -p "Animation54";
	addAttr -ci true -sn "StartFrame54" -ln "StartFrame54" -at "long" -p "Animation54";
	addAttr -ci true -sn "EndFrame54" -ln "EndFrame54" -at "long" -p "Animation54";
	addAttr -ci true -sn "Selected54" -ln "Selected54" -min 0 -max 1 -at "bool" -p "Animation54";
	addAttr -ci true -sn "Animation55" -ln "Animation55" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name55" -ln "Name55" -dt "string" -p "Animation55";
	addAttr -ci true -sn "StartFrame55" -ln "StartFrame55" -at "long" -p "Animation55";
	addAttr -ci true -sn "EndFrame55" -ln "EndFrame55" -at "long" -p "Animation55";
	addAttr -ci true -sn "Selected55" -ln "Selected55" -min 0 -max 1 -at "bool" -p "Animation55";
	addAttr -ci true -sn "Animation56" -ln "Animation56" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name56" -ln "Name56" -dt "string" -p "Animation56";
	addAttr -ci true -sn "StartFrame56" -ln "StartFrame56" -at "long" -p "Animation56";
	addAttr -ci true -sn "EndFrame56" -ln "EndFrame56" -at "long" -p "Animation56";
	addAttr -ci true -sn "Selected56" -ln "Selected56" -min 0 -max 1 -at "bool" -p "Animation56";
	addAttr -ci true -sn "Animation57" -ln "Animation57" -at "compound" -p "Animations" 
		-nc 4;
	addAttr -ci true -sn "Name57" -ln "Name57" -dt "string" -p "Animation57";
	addAttr -ci true -sn "StartFrame57" -ln "StartFrame57" -at "long" -p "Animation57";
	addAttr -ci true -sn "EndFrame57" -ln "EndFrame57" -at "long" -p "Animation57";
	addAttr -ci true -sn "Selected57" -ln "Selected57" -min 0 -max 1 -at "bool" -p "Animation57";
	setAttr ".UniqueId" 58;
	setAttr ".Ordering" -type "Int32Array" 58 0 1 2 3 4
		 5 6 7 8 9 10 11 12 13 14 15 16
		 17 18 19 20 21 22 23 24 25 26 27 28
		 29 30 31 32 33 34 35 36 37 38 39 40
		 41 42 43 44 45 46 47 48 49 50 51 52
		 53 54 55 56 57 ;
	setAttr ".Name0" -type "string" "skateslow";
	setAttr ".StartFrame0" 1;
	setAttr ".EndFrame0" 30;
	setAttr ".Selected0" yes;
	setAttr ".Name1" -type "string" "skatefast";
	setAttr ".StartFrame1" 100;
	setAttr ".EndFrame1" 130;
	setAttr ".Selected1" yes;
	setAttr ".Name2" -type "string" "stand_idle";
	setAttr ".StartFrame2" 200;
	setAttr ".EndFrame2" 230;
	setAttr ".Selected2" yes;
	setAttr ".Name3" -type "string" "skate_idle";
	setAttr ".StartFrame3" 300;
	setAttr ".EndFrame3" 330;
	setAttr ".Selected3" yes;
	setAttr ".Name4" -type "string" "jump_over";
	setAttr ".StartFrame4" 400;
	setAttr ".EndFrame4" 430;
	setAttr ".Selected4" yes;
	setAttr ".Name5" -type "string" "grind_idle";
	setAttr ".StartFrame5" 500;
	setAttr ".EndFrame5" 530;
	setAttr ".Selected5" yes;
	setAttr ".Name6" -type "string" "attack";
	setAttr ".StartFrame6" 600;
	setAttr ".EndFrame6" 630;
	setAttr ".Selected6" yes;
	setAttr ".Name7" -type "string" "idle2plane";
	setAttr ".StartFrame7" 700;
	setAttr ".EndFrame7" 730;
	setAttr ".Selected7" yes;
	setAttr ".Name8" -type "string" "plane_idle";
	setAttr ".StartFrame8" 800;
	setAttr ".EndFrame8" 830;
	setAttr ".Selected8" yes;
	setAttr ".Name9" -type "string" "plane2idle";
	setAttr ".StartFrame9" 900;
	setAttr ".EndFrame9" 930;
	setAttr ".Selected9" yes;
	setAttr ".Name10" -type "string" "idle2car";
	setAttr ".StartFrame10" 1000;
	setAttr ".EndFrame10" 1030;
	setAttr ".Selected10" yes;
	setAttr ".Name11" -type "string" "car_idle";
	setAttr ".StartFrame11" 1100;
	setAttr ".EndFrame11" 1130;
	setAttr ".Selected11" yes;
	setAttr ".Name12" -type "string" "car2idle";
	setAttr ".StartFrame12" 1200;
	setAttr ".EndFrame12" 1230;
	setAttr ".Selected12" yes;
	setAttr ".Name13" -type "string" "get_ready";
	setAttr ".StartFrame13" 1300;
	setAttr ".EndFrame13" 1500;
	setAttr ".Selected13" yes;
	setAttr ".Name14" -type "string" "car_left";
	setAttr ".StartFrame14" 1600;
	setAttr ".EndFrame14" 1630;
	setAttr ".Selected14" yes;
	setAttr ".Name15" -type "string" "car_right";
	setAttr ".StartFrame15" 1700;
	setAttr ".EndFrame15" 1730;
	setAttr ".Selected15" yes;
	setAttr ".Name16" -type "string" "plane_left";
	setAttr ".StartFrame16" 1800;
	setAttr ".EndFrame16" 1830;
	setAttr ".Selected16" yes;
	setAttr ".Name17" -type "string" "plane_right";
	setAttr ".StartFrame17" 1900;
	setAttr ".EndFrame17" 1930;
	setAttr ".Selected17" yes;
	setAttr ".Name18" -type "string" "skate_left";
	setAttr ".StartFrame18" 2000;
	setAttr ".EndFrame18" 2030;
	setAttr ".Selected18" yes;
	setAttr ".Name19" -type "string" "skate_right";
	setAttr ".StartFrame19" 2100;
	setAttr ".EndFrame19" 2130;
	setAttr ".Selected19" yes;
	setAttr ".Name20" -type "string" "wreck";
	setAttr ".StartFrame20" 2200;
	setAttr ".EndFrame20" 2270;
	setAttr ".Selected20" yes;
	setAttr ".Name21" -type "string" "damage";
	setAttr ".StartFrame21" 2300;
	setAttr ".EndFrame21" 2330;
	setAttr ".Selected21" yes;
	setAttr ".Name22" -type "string" "win";
	setAttr ".StartFrame22" 2400;
	setAttr ".EndFrame22" 2520;
	setAttr ".Selected22" yes;
	setAttr ".Name23" -type "string" "chooseplayer";
	setAttr ".StartFrame23" 2600;
	setAttr ".EndFrame23" 2680;
	setAttr ".Selected23" yes;
	setAttr ".Name24" -type "string" "planehit";
	setAttr ".StartFrame24" 2700;
	setAttr ".EndFrame24" 2730;
	setAttr ".Selected24" yes;
	setAttr ".Name25" -type "string" "carhit";
	setAttr ".StartFrame25" 2800;
	setAttr ".EndFrame25" 2830;
	setAttr ".Selected25" yes;
	setAttr ".Name26" -type "string" "LowTurnLeft";
	setAttr ".StartFrame26" 2900;
	setAttr ".EndFrame26" 2930;
	setAttr ".Selected26" yes;
	setAttr ".Name27" -type "string" "LowTurnRight";
	setAttr ".StartFrame27" 3000;
	setAttr ".EndFrame27" 3030;
	setAttr ".Selected27" yes;
	setAttr ".Name28" -type "string" "Skate_Slow";
	setAttr ".StartFrame28" 100;
	setAttr ".EndFrame28" 130;
	setAttr ".Name29" -type "string" "Skate_Fast";
	setAttr ".StartFrame29" 900;
	setAttr ".EndFrame29" 930;
	setAttr ".Name30" -type "string" "Stand_Idle";
	setAttr ".StartFrame30" 500;
	setAttr ".EndFrame30" 530;
	setAttr ".Name31" -type "string" "Skate_Idle";
	setAttr ".StartFrame31" 2400;
	setAttr ".EndFrame31" 2430;
	setAttr ".Name32" -type "string" "Jump_Over";
	setAttr ".StartFrame32" 300;
	setAttr ".EndFrame32" 330;
	setAttr ".Name33" -type "string" "Grind_Idle";
	setAttr ".StartFrame33" 400;
	setAttr ".EndFrame33" 430;
	setAttr ".Name34" -type "string" "Attack";
	setAttr ".StartFrame34" 1000;
	setAttr ".EndFrame34" 1030;
	setAttr ".Name35" -type "string" "Plane_Idle";
	setAttr ".StartFrame35" 1700;
	setAttr ".EndFrame35" 1730;
	setAttr ".Name36" -type "string" "Idle2Plane";
	setAttr ".StartFrame36" 600;
	setAttr ".EndFrame36" 630;
	setAttr ".Name37" -type "string" "Plane_Idle";
	setAttr ".StartFrame37" 1700;
	setAttr ".EndFrame37" 1730;
	setAttr ".Name38" -type "string" "Plane2Idle";
	setAttr ".StartFrame38" 1400;
	setAttr ".EndFrame38" 1430;
	setAttr ".Name39" -type "string" "Idle2Car";
	setAttr ".StartFrame39" 700;
	setAttr ".EndFrame39" 730;
	setAttr ".Name40" -type "string" "Car_Idle";
	setAttr ".StartFrame40" 1600;
	setAttr ".EndFrame40" 1630;
	setAttr ".Name41" -type "string" "Car2Idle";
	setAttr ".StartFrame41" 1500;
	setAttr ".EndFrame41" 1530;
	setAttr ".Name42" -type "string" "CarLeft";
	setAttr ".StartFrame42" 1800;
	setAttr ".EndFrame42" 1830;
	setAttr ".Name43" -type "string" "CarRight";
	setAttr ".StartFrame43" 1900;
	setAttr ".EndFrame43" 1930;
	setAttr ".Name44" -type "string" "PlaneLeft";
	setAttr ".StartFrame44" 2000;
	setAttr ".EndFrame44" 2030;
	setAttr ".Name45" -type "string" "PlaneRight";
	setAttr ".StartFrame45" 2100;
	setAttr ".EndFrame45" 2130;
	setAttr ".Name46" -type "string" "SkateLeft";
	setAttr ".StartFrame46" 2200;
	setAttr ".EndFrame46" 2230;
	setAttr ".Name47" -type "string" "SkateRight";
	setAttr ".StartFrame47" 2300;
	setAttr ".EndFrame47" 2330;
	setAttr ".Name48" -type "string" "Wreck";
	setAttr ".StartFrame48" 1200;
	setAttr ".EndFrame48" 1270;
	setAttr ".Name49" -type "string" "Damage";
	setAttr ".StartFrame49" 1100;
	setAttr ".EndFrame49" 1130;
	setAttr ".Name50" -type "string" "Win";
	setAttr ".StartFrame50" 1300;
	setAttr ".EndFrame50" 1360;
	setAttr ".Name51" -type "string" "ChoosePlayer";
	setAttr ".StartFrame51" 3600;
	setAttr ".EndFrame51" 3680;
	setAttr ".Name52" -type "string" "Get_Ready2";
	setAttr ".StartFrame52" 3800;
	setAttr ".EndFrame52" 4000;
	setAttr ".Name53" -type "string" "Win2";
	setAttr ".StartFrame53" 4100;
	setAttr ".EndFrame53" 4220;
	setAttr ".Name54" -type "string" "PlaneHit";
	setAttr ".StartFrame54" 4300;
	setAttr ".EndFrame54" 4330;
	setAttr ".Name55" -type "string" "CarHit";
	setAttr ".StartFrame55" 4400;
	setAttr ".EndFrame55" 4430;
	setAttr ".Name56" -type "string" "LowTurnLeft";
	setAttr ".StartFrame56" 4500;
	setAttr ".EndFrame56" 4530;
	setAttr ".Name57" -type "string" "LowTurnRight";
	setAttr ".StartFrame57" 4600;
	setAttr ".EndFrame57" 4630;
createNode animCurveTL -n "cam_Trgt_translateX";
	setAttr ".tan" 2;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 31 0 60 0 61 0 91 0 121 0 200 0;
createNode animCurveTL -n "cam_Pos_translateX";
	setAttr ".tan" 2;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 31 0 60 0 61 0 91 0 120 0 121 -5
		 200 0;
	setAttr -s 9 ".kit[3:8]"  3 2 2 2 2 1;
	setAttr -s 9 ".kot[3:8]"  3 2 2 2 1 1;
	setAttr -s 9 ".ktl[7:8]" no yes;
	setAttr -s 9 ".kwl[8]" no;
	setAttr -s 9 ".kix[8]"  3.7056472301483154;
	setAttr -s 9 ".kiy[8]"  0;
	setAttr -s 9 ".kox[7:8]"  1.3377376794815063 3.7056472301483154;
	setAttr -s 9 ".koy[7:8]"  6.8429722785949707 0;
createNode animCurveTL -n "cam_Trgt_translateY";
	setAttr ".tan" 2;
	setAttr -s 11 ".ktv[0:10]"  0 2 1 2 30 0.9 31 0.9 60 2 61 2 90 1.1 91 1.1
		 120 2 121 1.5 200 2;
	setAttr -s 11 ".kit[0:10]"  1 1 3 2 3 2 3 2 
		3 2 2;
	setAttr -s 11 ".kot[0:10]"  1 1 3 2 3 2 3 2 
		3 2 2;
	setAttr -s 11 ".kix[0:10]"  0.98962455987930298 0.032929651439189911 
		0.96666663885116577 0.033333301544189453 0.96666669845581055 0.033333301544189453 
		0.96666669845581055 0.033333301544189453 0.96666669845581055 0.033333301544189453 
		2.6333332061767578;
	setAttr -s 11 ".kiy[0:10]"  -0.9275519847869873 -0.033387597650289536 
		0 0 0 0 0 0 0 -0.5 0.5;
	setAttr -s 11 ".kox[0:10]"  0.96737009286880493 0.93092906475067139 
		0.033333301544189453 0.96666669845581055 0.033333301544189453 0.96666669845581055 
		0.033333301544189453 0.96666669845581055 0.033333301544189453 2.6333332061767578 
		1;
	setAttr -s 11 ".koy[0:10]"  -1.9171770811080933 -1.9561327695846558 
		0 1.1000000238418579 0 -0.89999997615814209 0 0.89999997615814209 0 0.5 0;
createNode animCurveTL -n "cam_Pos_translateY";
	setAttr ".tan" 2;
	setAttr -s 11 ".ktv[0:10]"  0 2.8 1 2.8 30 1 31 1 60 2.8 61 2.8 90 1.6
		 91 1.6 120 2.8 121 15 200 2.8;
	setAttr -s 11 ".kit[2:10]"  3 2 3 2 3 2 3 2 
		1;
	setAttr -s 11 ".kot[2:10]"  3 2 3 2 3 2 3 1 
		1;
	setAttr -s 11 ".ktl[9:10]" no yes;
	setAttr -s 11 ".kix[10]"  3.5818471908569336;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[9:10]"  2.5460109710693359 3.5818471908569336;
	setAttr -s 11 ".koy[9:10]"  -23.247430801391602 0;
createNode animCurveTL -n "cam_Trgt_translateZ";
	setAttr ".tan" 2;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 31 0 60 0 61 0 91 0 121 0 200 0;
createNode animCurveTL -n "cam_Pos_translateZ";
	setAttr ".tan" 2;
	setAttr -s 11 ".ktv[0:10]"  0 -3 1 -3 30 -3 31 -3 60 -3 61 -3 90 -2.5
		 91 -2.5 120 -3 121 -50 200 -3;
	setAttr -s 11 ".kit[2:10]"  3 2 3 2 3 2 3 2 
		1;
	setAttr -s 11 ".kot[2:10]"  3 2 3 2 3 2 3 1 
		1;
	setAttr -s 11 ".ktl[9:10]" no yes;
	setAttr -s 11 ".kix[10]"  3.5818471908569336;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[9:10]"  2.1834242343902588 3.5818471908569336;
	setAttr -s 11 ".koy[9:10]"  62.416416168212891 0;
createNode animCurveTU -n "cam_Trgt_visibility";
	setAttr ".tan" 9;
	setAttr -s 4 ".ktv[0:3]"  1 1 31 1 60 1 200 1;
	setAttr -s 4 ".kit[0:3]"  2 9 9 9;
	setAttr -s 4 ".kot[0:3]"  2 5 5 5;
createNode animCurveTA -n "cam_Trgt_rotateX";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 0 31 0 60 0 200 0;
createNode animCurveTA -n "cam_Trgt_rotateY";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 0 31 0 60 0 200 0;
createNode animCurveTA -n "cam_Trgt_rotateZ";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 0 31 0 60 0 200 0;
createNode animCurveTU -n "cam_Trgt_scaleX";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 1 31 1 60 1 200 1;
createNode animCurveTU -n "cam_Trgt_scaleY";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 1 31 1 60 1 200 1;
createNode animCurveTU -n "cam_Trgt_scaleZ";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 1 31 1 60 1 200 1;
createNode animCurveTU -n "cam_Pos_visibility";
	setAttr ".tan" 3;
	setAttr -s 4 ".ktv[0:3]"  1 1 31 1 60 1 200 1;
	setAttr -s 4 ".kit[0:3]"  2 9 3 3;
	setAttr -s 4 ".kot[0:3]"  2 5 3 3;
createNode animCurveTA -n "cam_Pos_rotateX";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 0 31 0 60 0 200 0;
	setAttr -s 4 ".kit[2:3]"  3 3;
	setAttr -s 4 ".kot[2:3]"  3 3;
createNode animCurveTA -n "cam_Pos_rotateY";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 0 31 0 60 0 200 0;
	setAttr -s 4 ".kit[2:3]"  3 3;
	setAttr -s 4 ".kot[2:3]"  3 3;
createNode animCurveTA -n "cam_Pos_rotateZ";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 0 31 0 60 0 200 0;
	setAttr -s 4 ".kit[2:3]"  3 3;
	setAttr -s 4 ".kot[2:3]"  3 3;
createNode animCurveTU -n "cam_Pos_scaleX";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 1 31 1 60 1 200 1;
	setAttr -s 4 ".kit[2:3]"  3 3;
	setAttr -s 4 ".kot[2:3]"  3 3;
createNode animCurveTU -n "cam_Pos_scaleY";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 1 31 1 60 1 200 1;
	setAttr -s 4 ".kit[2:3]"  3 3;
	setAttr -s 4 ".kot[2:3]"  3 3;
createNode animCurveTU -n "cam_Pos_scaleZ";
	setAttr ".tan" 2;
	setAttr -s 4 ".ktv[0:3]"  1 1 31 1 60 1 200 1;
	setAttr -s 4 ".kit[2:3]"  3 3;
	setAttr -s 4 ".kot[2:3]"  3 3;
createNode materialInfo -n "charStetes_ref_materialInfo8";
createNode shadingEngine -n "charStetes_ref_masumi_shader";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "charStetes_ref_masumi_material";
createNode file -n "charStetes_ref_masumi_texture";
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/Project/Assets/Assets/Maya/Characters/vektor/vektor_final_texture.jpg";
createNode place2dTexture -n "charStetes_ref_place2dTexture1";
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".o" 91;
	setAttr ".unw" 91;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 4 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 4 ".s";
select -ne :defaultTextureList1;
	setAttr -cb on ".cch";
	setAttr -cb on ".ihi";
	setAttr -cb on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".tx";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -s 6 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultRenderGlobals;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -k on ".gama";
	setAttr ".fs" 1;
	setAttr ".ef" 10;
	setAttr -k on ".bfs";
	setAttr -k on ".be";
	setAttr -k on ".fec";
	setAttr -k on ".ofc";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -k on ".sp";
	setAttr -k on ".shs";
	setAttr -k on ".lpr";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -av -k on ".mbf";
	setAttr -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -av -k on ".bll";
	setAttr -k on ".bls";
	setAttr -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
select -ne :defaultResolution;
	setAttr ".w" 480;
	setAttr ".h" 320;
	setAttr ".pa" 1;
	setAttr ".dar" 1.5;
select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -k on ".mwc";
	setAttr ".ro" yes;
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
select -ne :defaultHardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rp";
	setAttr -k on ".cai";
	setAttr -k on ".coi";
	setAttr -cb on ".bc";
	setAttr -av -k on ".bcb";
	setAttr -av -k on ".bcg";
	setAttr -av -k on ".bcr";
	setAttr -k on ".ei";
	setAttr -k on ".ex";
	setAttr -k on ".es";
	setAttr -av -k on ".ef";
	setAttr -cb on ".bf";
	setAttr -k on ".fii";
	setAttr -cb on ".sf";
	setAttr -k on ".gr";
	setAttr -k on ".li";
	setAttr -k on ".ls";
	setAttr -k on ".mb";
	setAttr -k on ".ti";
	setAttr -k on ".txt";
	setAttr -k on ".mpr";
	setAttr -k on ".wzd";
	setAttr ".fn" -type "string" "im";
	setAttr -k on ".if";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
	setAttr -k on ".as";
	setAttr -k on ".ds";
	setAttr -k on ".lm";
	setAttr -k on ".fir";
	setAttr -k on ".aap";
	setAttr -k on ".gh";
	setAttr -cb on ".sd";
connectAttr "cam_Pos_translateY.o" "cam_Pos.ty";
connectAttr "cam_Pos_translateZ.o" "cam_Pos.tz";
connectAttr "cam_Pos_translateX.o" "cam_Pos.tx";
connectAttr "camRoot.s" "cam_Pos.is";
connectAttr "cam_Pos_visibility.o" "cam_Pos.v";
connectAttr "cam_Pos_rotateX.o" "cam_Pos.rx";
connectAttr "cam_Pos_rotateY.o" "cam_Pos.ry";
connectAttr "cam_Pos_rotateZ.o" "cam_Pos.rz";
connectAttr "cam_Pos_scaleX.o" "cam_Pos.sx";
connectAttr "cam_Pos_scaleY.o" "cam_Pos.sy";
connectAttr "cam_Pos_scaleZ.o" "cam_Pos.sz";
connectAttr "cam_Trgt_translateY.o" "cam_Trgt.ty";
connectAttr "cam_Trgt_translateX.o" "cam_Trgt.tx";
connectAttr "cam_Trgt_translateZ.o" "cam_Trgt.tz";
connectAttr "camRoot.s" "cam_Trgt.is";
connectAttr "cam_Trgt_visibility.o" "cam_Trgt.v";
connectAttr "cam_Trgt_rotateX.o" "cam_Trgt.rx";
connectAttr "cam_Trgt_rotateY.o" "cam_Trgt.ry";
connectAttr "cam_Trgt_rotateZ.o" "cam_Trgt.rz";
connectAttr "cam_Trgt_scaleX.o" "cam_Trgt.sx";
connectAttr "cam_Trgt_scaleY.o" "cam_Trgt.sy";
connectAttr "cam_Trgt_scaleZ.o" "cam_Trgt.sz";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "masumi_shader.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "charStetes_ref_masumi_shader.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "masumi_texture.oc" "masumi_material.c";
connectAttr "masumi_material.oc" "masumi_shader.ss";
connectAttr "masumi_shader.msg" "materialInfo8.sg";
connectAttr "masumi_material.msg" "materialInfo8.m";
connectAttr "masumi_texture.msg" "materialInfo8.t" -na;
connectAttr "layerManager.dli[1]" "Mesh_Layer.id";
connectAttr "layerManager.dli[2]" "Layer_Control.id";
connectAttr "layerManager.dli[3]" "L_IK.id";
connectAttr "layerManager.dli[4]" "R_IK.id";
connectAttr "layerManager.dli[5]" "Layer_Skeleton.id";
connectAttr "layerManager.dli[6]" "Layer_Skeleton_FK.id";
connectAttr "place2dTexture1.c" "masumi_texture.c";
connectAttr "place2dTexture1.tf" "masumi_texture.tf";
connectAttr "place2dTexture1.rf" "masumi_texture.rf";
connectAttr "place2dTexture1.mu" "masumi_texture.mu";
connectAttr "place2dTexture1.mv" "masumi_texture.mv";
connectAttr "place2dTexture1.s" "masumi_texture.s";
connectAttr "place2dTexture1.wu" "masumi_texture.wu";
connectAttr "place2dTexture1.wv" "masumi_texture.wv";
connectAttr "place2dTexture1.re" "masumi_texture.re";
connectAttr "place2dTexture1.of" "masumi_texture.of";
connectAttr "place2dTexture1.r" "masumi_texture.ro";
connectAttr "place2dTexture1.n" "masumi_texture.n";
connectAttr "place2dTexture1.vt1" "masumi_texture.vt1";
connectAttr "place2dTexture1.vt2" "masumi_texture.vt2";
connectAttr "place2dTexture1.vt3" "masumi_texture.vt3";
connectAttr "place2dTexture1.vc1" "masumi_texture.vc1";
connectAttr "place2dTexture1.o" "masumi_texture.uv";
connectAttr "place2dTexture1.ofs" "masumi_texture.fs";
connectAttr "charStetes_ref_masumi_shader.msg" "charStetes_ref_materialInfo8.sg"
		;
connectAttr "charStetes_ref_masumi_material.msg" "charStetes_ref_materialInfo8.m"
		;
connectAttr "charStetes_ref_masumi_texture.msg" "charStetes_ref_materialInfo8.t"
		 -na;
connectAttr "charStetes_ref_masumi_material.oc" "charStetes_ref_masumi_shader.ss"
		;
connectAttr "charStetes_ref_masumi_texture.oc" "charStetes_ref_masumi_material.c"
		;
connectAttr "charStetes_ref_place2dTexture1.c" "charStetes_ref_masumi_texture.c"
		;
connectAttr "charStetes_ref_place2dTexture1.tf" "charStetes_ref_masumi_texture.tf"
		;
connectAttr "charStetes_ref_place2dTexture1.rf" "charStetes_ref_masumi_texture.rf"
		;
connectAttr "charStetes_ref_place2dTexture1.mu" "charStetes_ref_masumi_texture.mu"
		;
connectAttr "charStetes_ref_place2dTexture1.mv" "charStetes_ref_masumi_texture.mv"
		;
connectAttr "charStetes_ref_place2dTexture1.s" "charStetes_ref_masumi_texture.s"
		;
connectAttr "charStetes_ref_place2dTexture1.wu" "charStetes_ref_masumi_texture.wu"
		;
connectAttr "charStetes_ref_place2dTexture1.wv" "charStetes_ref_masumi_texture.wv"
		;
connectAttr "charStetes_ref_place2dTexture1.re" "charStetes_ref_masumi_texture.re"
		;
connectAttr "charStetes_ref_place2dTexture1.of" "charStetes_ref_masumi_texture.of"
		;
connectAttr "charStetes_ref_place2dTexture1.r" "charStetes_ref_masumi_texture.ro"
		;
connectAttr "charStetes_ref_place2dTexture1.n" "charStetes_ref_masumi_texture.n"
		;
connectAttr "charStetes_ref_place2dTexture1.vt1" "charStetes_ref_masumi_texture.vt1"
		;
connectAttr "charStetes_ref_place2dTexture1.vt2" "charStetes_ref_masumi_texture.vt2"
		;
connectAttr "charStetes_ref_place2dTexture1.vt3" "charStetes_ref_masumi_texture.vt3"
		;
connectAttr "charStetes_ref_place2dTexture1.vc1" "charStetes_ref_masumi_texture.vc1"
		;
connectAttr "charStetes_ref_place2dTexture1.o" "charStetes_ref_masumi_texture.uv"
		;
connectAttr "charStetes_ref_place2dTexture1.ofs" "charStetes_ref_masumi_texture.fs"
		;
connectAttr "masumi_shader.pa" ":renderPartition.st" -na;
connectAttr "charStetes_ref_masumi_shader.pa" ":renderPartition.st" -na;
connectAttr "masumi_material.msg" ":defaultShaderList1.s" -na;
connectAttr "charStetes_ref_masumi_material.msg" ":defaultShaderList1.s" -na;
connectAttr "masumi_texture.msg" ":defaultTextureList1.tx" -na;
connectAttr "charStetes_ref_masumi_texture.msg" ":defaultTextureList1.tx" -na;
connectAttr "Masumi_RoboRun_L_FK_MUltiply_UTL.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Masumi_RoboRun_L_IK_MUltiply_UTL.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Masumi_RoboRun_R_FK_MUltiply_UTL.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Masumi_RoboRun_R_IK_MUltiply_UTL.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "charStetes_ref_place2dTexture1.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of camRoot.ma
