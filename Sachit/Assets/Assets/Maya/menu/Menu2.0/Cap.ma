//Maya ASCII 2012 scene
//Name: Cap.ma
//Last modified: Fri, Jul 06, 2012 07:24:22 PM
//Codeset: 1252
requires maya "2012";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 Hotfix 4 x64";
fileInfo "cutIdentifier" "001200000000-806479";
fileInfo "osv" "Microsoft Windows 7 Ultimate Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.8296718578041461 1.6504682146852905 3.573727016822474 ;
	setAttr ".r" -type "double3" 350.39999999994183 0.39999999999999453 -8.6970411478847302e-017 ;
	setAttr ".rp" -type "double3" -1.1102230246251565e-016 1.1102230246251565e-016 -2.2204460492503131e-016 ;
	setAttr ".rpt" -type "double3" 1.4301131068237424e-019 -3.2946792060450533e-016 
		1.1132499390310125e-016 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".fcp" 1000;
	setAttr ".coi" 4.2727845048199038;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.76127453387266264 0.93308605537150102 -0.58947071680989249 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.73328859432043103 100.1 -0.55353257652266519 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 1000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.3987759272509681;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 1000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0.70460079529492892 -0.62393234640677231 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 1000;
	setAttr ".coi" 100.1;
	setAttr ".ow" 1.9465639145280957;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "_coverRoot";
createNode locator -n "_coverRootShape" -p "_coverRoot";
	setAttr -k off ".v";
createNode transform -n "_botCover" -p "_coverRoot";
createNode locator -n "_botCoverShape" -p "_botCover";
	setAttr -k off ".v";
createNode transform -n "Interface_Cap" -p "_botCover";
	addAttr -is true -ci true -h true -k true -sn "MaxHandle" -ln "MaxHandle" -smn 
		0 -smx 0 -at "long";
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999978 0.99999999999999978 ;
	setAttr -k on ".MaxHandle" 2;
createNode mesh -n "Interface_CapShape" -p "Interface_Cap";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "UVChannel_1";
	setAttr -s 84 ".uvst[0].uvsp[0:83]" -type "float2" 0.93751115 0.82199121
		 0.67720532 0.82199109 0.89819533 0.22807446 0.94043505 0.22807497 0.64236283 0.82199109
		 0.89819968 0.1446082 0.64292222 0.82199109 0.58050966 0.84977645 0.59486878 0.90925699
		 0.89819515 0.31154069 0.47025892 0.85115188 0.52505308 0.82391715 0.45738828 0.91097236
		 0.55731761 0.957569 0.64268023 0.82199103 0.49613306 0.95833236 0.89815819 0.72887129
		 0.73467243 0.82199103 0.94039792 0.72886908 0.82241398 0.82199115 0.89815098 0.64540482
		 0.73694307 0.82199132 0.94039077 0.64540368 0.66999018 0.82199121 0.8981511 0.56193709
		 0.73687625 0.82199109 0.94039088 0.5619396 0.73743564 0.82199109 0.89817154 0.4784697
		 0.73799461 0.82199103 0.94041127 0.47847527 0.73775327 0.82199103 0.89819491 0.39500508
		 0.82241398 0.97158122 0.73775327 0.9715811 0.73467243 0.9715811 0.73799455 0.9715811
		 0.64268023 0.9715811 0.73743564 0.9715811 0.64292222 0.9715811 0.73687625 0.9715811
		 0.64236283 0.9715811 0.73694307 0.9715814 0.6772055 0.9715811 0.66999018 0.97158128
		 0.93751115 0.97158128 0.94043458 0.39500812 0.94043946 0.14460935 0.94043487 0.31154069
		 0.68989921 0.9715811 0.68989921 0.82199109 0.47676069 0.93465239 0.94039434 0.68713641
		 0.89815462 0.68713808 0.70704091 0.9715811 0.70704079 0.82199109 0.52672541 0.95795071
		 0.94043726 0.18634219 0.89819753 0.18634132 0.70346665 0.97158134 0.70346665 0.82199126
		 0.5760932 0.93341297 0.94043493 0.26980788 0.89819527 0.26980758 0.87996256 0.97158122
		 0.87996256 0.82199121 0.58768916 0.87951672 0.94043469 0.35327441 0.89819503 0.35327291
		 0.77854317 0.97158116 0.77854323 0.82199109 0.94042289 0.43674171 0.89818323 0.43673742
		 0.55278134 0.83684683 0.69021678 0.9715811 0.69021678 0.82199103 0.94040108 0.52020741
		 0.89816129 0.52020335 0.49765596 0.83753455 0.69045842 0.9715811 0.69045842 0.82199109
		 0.94039083 0.60367167 0.89815104 0.60367095 0.46382362 0.88106215;
	setAttr ".cuvs" -type "string" "UVChannel_1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 42 ".vt[0:41]"  0.3039512 -0.00022086708 -4.9042343e-020
		 0.18951046 -0.00022086708 -0.23763862 -0.067635506 -0.00022086708 -0.29633051 -0.27385056 -0.00022086708 -0.13187943
		 -0.27385056 -0.00022086708 0.13187948 -0.067635521 -0.00022086708 0.29633051 0.18951043 -0.00022086708 0.23763865
		 0.26713669 0.43444675 3.9071901e-009 0.16655636 0.43444675 -0.20885715 -0.059445534 0.43444675 -0.26044062
		 -0.24068499 0.43444675 -0.11590695 -0.24068499 0.43444675 0.11590699 -0.059445549 0.43444675 0.26044065
		 0.16655633 0.43444675 0.20885721 0.18951043 0.37457883 0.23763865 -0.067635521 0.37457883 0.29633051
		 -0.27385056 0.37457883 0.13187948 -0.27385056 0.37457883 -0.13187943 -0.067635506 0.37457883 -0.29633051
		 0.18951046 0.37457883 -0.23763862 0.3039512 0.37457883 8.3173209e-017 -0.18893661 -0.00018858495 -0.23888709
		 -0.18893661 0.3745954 -0.23888709 -0.16605528 0.43437654 -0.2099545 0.069560356 -0.00018858495 -0.29788741
		 0.069560282 0.3745954 -0.29788744 0.06113407 0.43437654 -0.26180896 0.27685887 -0.00018858495 -0.13257238
		 0.27685884 0.3745954 -0.13257241 0.24332564 0.43437654 -0.11651587 0.27685884 -0.00018858495 0.1325724
		 0.27685884 0.3745954 0.13257243 0.24332559 0.43437654 0.11651598 0.069560334 -0.00018858495 0.29788744
		 0.069560312 0.3745954 0.29788744 0.061133929 0.43437654 0.26180899 -0.18893661 -0.00018858495 0.23888712
		 -0.18893661 0.3745954 0.23888712 -0.16605535 0.43437654 0.20995444 -0.30397859 0.3745954 4.0037435e-008
		 -0.30397859 -0.00018858495 2.2496483e-008 -0.26716408 0.43437654 2.3679025e-008;
	setAttr -s 72 ".ed[0:71]"  2 21 0 21 3 0 21 22 0 1 24 0 2 18 0 18 25 0
		 9 23 0 9 26 0 22 23 0 9 18 0 18 22 0 24 2 0 25 26 0 24 25 0 0 27 0 1 19 0 19 28 0
		 19 25 0 27 1 0 27 28 0 6 30 0 0 20 0 20 31 0 20 28 0 30 0 0 30 31 0 5 33 0 6 14 0
		 14 34 0 14 31 0 33 6 0 33 34 0 4 36 0 5 15 0 15 37 0 12 38 0 13 35 0 12 35 0 13 32 0
		 31 32 0 13 14 0 34 35 0 12 15 0 15 34 0 36 5 0 37 38 0 36 37 0 3 17 0 17 22 0 8 26 0
		 8 29 0 10 23 0 8 19 0 16 39 0 3 40 0 4 16 0 17 39 0 11 41 0 10 17 0 7 11 0 11 38 0
		 7 32 0 10 41 0 7 29 0 8 10 0 7 20 0 28 29 0 11 16 0 16 37 0 40 4 0 39 41 0 39 40 0;
	setAttr -s 67 ".n[0:66]" -type "float3"  1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020 1e+020
		 1e+020 1e+020 1e+020 1e+020 1e+020;
	setAttr -s 31 ".fc[0:30]" -type "polyFaces" 
		f 4 -14 11 4 5
		mu 0 4 54 55 25 40
		f 4 -13 -6 -10 7
		mu 0 4 57 58 5 47
		f 4 10 8 -7 9
		mu 0 4 16 53 52 18
		f 4 0 2 -11 -5
		mu 0 4 4 50 49 41
		f 4 -20 18 15 16
		mu 0 4 59 60 21 42
		f 4 3 13 -18 -16
		mu 0 4 1 55 54 43
		f 4 -26 24 21 22
		mu 0 4 64 65 0 45
		f 4 14 19 -24 -22
		mu 0 4 23 60 59 44
		f 4 -32 30 27 28
		mu 0 4 69 70 19 33
		f 4 20 25 -30 -28
		mu 0 4 19 65 64 33
		f 4 -47 44 33 34
		mu 0 4 74 75 31 34
		f 4 -46 -35 -43 35
		mu 0 4 76 77 28 30
		f 4 36 -42 -29 -41
		mu 0 4 46 71 72 32
		f 4 40 29 39 -39
		mu 0 4 46 32 68 67
		f 4 43 41 -38 42
		mu 0 4 28 72 71 30
		f 4 26 31 -44 -34
		mu 0 4 17 70 69 35
		f 4 48 -3 1 47
		mu 0 4 38 49 50 27
		f 5 -52 -65 49 -8 6
		mu 0 5 51 12 13 56 15
		f 4 50 -67 -17 -53
		mu 0 4 3 62 63 2
		f 4 -49 -59 51 -9
		mu 0 4 53 20 22 52
		f 4 52 17 12 -50
		mu 0 4 3 2 58 57
		f 4 71 69 55 53
		mu 0 4 79 80 29 36
		f 4 -71 -54 -68 57
		mu 0 4 81 82 24 26
		f 7 -62 59 60 -36 37 -37 38
		mu 0 7 66 8 10 78 11 73 7
		f 4 -23 -66 61 -40
		mu 0 4 68 9 48 67
		f 6 62 -58 -60 63 -51 64
		mu 0 6 12 83 10 8 61 13
		f 4 66 -64 65 23
		mu 0 4 63 62 48 9
		f 4 68 45 -61 67
		mu 0 4 24 77 76 26
		f 4 32 46 -69 -56
		mu 0 4 14 75 74 37
		f 4 70 -63 58 56
		mu 0 4 82 81 22 20
		f 4 -72 -57 -48 54
		mu 0 4 80 79 39 6;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 9 ".lnk";
	setAttr -s 9 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr -s 5 ".dli[1:5]"  13 14 16 17 18;
	setAttr -s 6 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode phong -n "MaterialFBXASC032FBXASC03525";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.588 0.588 0.588 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "Interface_CapSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "MapFBXASC032FBXASC0351";
	setAttr ".ftn" -type "string" "C:\\Users\\AaronWolford\\Desktop\\Robot_Race\\Interface\\MechTable_and_Podium_Diffuse.png";
createNode place2dTexture -n "place2dTexture1";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n"
		+ "            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n"
		+ "            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n"
		+ "                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n"
		+ "                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n"
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n"
		+ "            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n"
		+ "                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n"
		+ "            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n"
		+ "            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n"
		+ "                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n"
		+ "                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n"
		+ "                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n"
		+ "                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n"
		+ "                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n"
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
		+ "                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n"
		+ "\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 21 100 -ps 2 79 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 32.808399 -size 65.616798 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 40 -ast 1 -aet 60 ";
	setAttr ".st" 6;
createNode script -n "character:MoveLister";
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
createNode script -n "character:SequencerData";
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
createNode displayLayer -n "menuScene_Dome_layer";
	setAttr ".c" 18;
	setAttr ".do" 1;
createNode shadingEngine -n "menuScene____Default";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "menuScene_materialInfo1";
createNode file -n "menuScene_file1";
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/Project/Assets/Assets/Textures/menuScene/MechTable_and_Podium_Diffuse.png";
createNode place2dTexture -n "menuScene_place2dTexture1";
createNode lambert -n "menuScene_glow_shader";
createNode shadingEngine -n "menuScene_lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "menuScene_materialInfo2";
createNode file -n "menuScene_glow_file";
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/Project/Assets/Assets/Textures/menuScene/Glow.png";
createNode place2dTexture -n "menuScene_place2dTexture2";
	setAttr ".c" -type "float2" 1 1.01 ;
	setAttr ".re" -type "float2" 5 1 ;
createNode script -n "menuScene_MoveLister";
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
	setAttr ".totalMoves" 7;
	setAttr ".move0Name" -type "string" "Robots";
	setAttr ".move0Min" 1;
	setAttr ".move0Max" 20;
	setAttr ".move1Name" -type "string" "Tracks";
	setAttr ".move1Min" 20;
	setAttr ".move1Max" 40;
	setAttr ".move2Name" -type "string" "Main";
	setAttr ".move2Min" 40;
	setAttr ".move2Max" 60;
	setAttr ".move3Name" -type "string" "ATM";
	setAttr ".move3Min" 60;
	setAttr ".move3Max" 80;
	setAttr ".move4Name" -type "string" "ATM_2_Main";
	setAttr ".move4Min" 80;
	setAttr ".move4Max" 100;
	setAttr ".move5Name" -type "string" "Main_2_ATM";
	setAttr ".move5Min" 101;
	setAttr ".move5Max" 120;
	setAttr ".move6Name" -type "string" "ATM_2_Robots";
	setAttr ".move6Min" 121;
	setAttr ".move6Max" 140;
createNode blindDataTemplate -n "menuScene_blindDataTemplate1";
	addAttr -ci true -sn "MaxVisibility" -ln "MaxVisibility" -min 0 -max 1 -at "bool";
	setAttr ".tid" 16180;
createNode displayLayer -n "menuScene_Button_layer";
	setAttr ".c" 22;
	setAttr ".do" 2;
createNode displayLayer -n "menuScene_Robot_Stats_Layer";
	setAttr ".c" 13;
	setAttr ".do" 3;
createNode displayLayer -n "menuScene_Holodeck_layer";
	setAttr ".c" 15;
	setAttr ".do" 4;
createNode displayLayer -n "menuScene_Turntable_layer";
	setAttr ".c" 29;
	setAttr ".do" 5;
createNode lambert -n "menuScene_buttons_shader";
createNode shadingEngine -n "menuScene_lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "menuScene_materialInfo4";
createNode file -n "menuScene_buttons_file";
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/RRDrop/Dropbox/RobotRace/UI/menuScene/UI_Redesign/New/Realtime_button.jpg";
createNode place2dTexture -n "menuScene_place2dTexture5";
createNode file -n "menuScene_buttons_file_alpha";
	setAttr ".i" yes;
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/RRDrop/Dropbox/RobotRace/UI/menuScene/UI_Redesign/New/ATM_Credits_Alpha.jpg";
createNode place2dTexture -n "menuScene_place2dTexture6";
createNode lambert -n "menuScene_holodeck_shader";
	setAttr ".ambc" -type "float3" 0.56099999 0.56099999 0.56099999 ;
createNode materialInfo -n "Tanks:materialInfo3";
createNode shadingEngine -n "Tanks:tank01SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode phong -n "menuScene_BGmachinery_shader";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.588 0.588 0.588 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode file -n "menuScene_BG_machinery_file";
	setAttr ".cg" -type "float3" 0.671 0.671 0.671 ;
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/RRDrop/Dropbox/RobotRace/UI/menuScene/UI_Redesign/New/Tanks_Texture.psd";
	setAttr ".ft" 0;
createNode place2dTexture -n "Tanks:place2dTexture3";
	setAttr ".rf" 0.000333;
createNode lambert -n "menuScene_map_shader";
createNode shadingEngine -n "menuScene_lambert8SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "menuScene_materialInfo9";
createNode file -n "menuScene_map_file";
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/RRDrop/Dropbox/RobotRace/UI/menuScene/UI_Redesign/New/Electric.png";
createNode place2dTexture -n "menuScene_place2dTexture9";
	setAttr ".rf" -90;
createNode ramp -n "menuScene_map_file_ambient";
	setAttr ".t" 4;
	setAttr -s 2 ".cel";
	setAttr ".cel[0].ep" 0.98500001430511475;
	setAttr ".cel[0].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[2].ep" 0;
	setAttr ".cel[2].ec" -type "float3" 0.671 0.671 0.671 ;
createNode place2dTexture -n "menuScene_place2dTexture10";
createNode lambert -n "menuScene_Misc_shader";
	setAttr ".ambc" -type "float3" 0.56099999 0.56099999 0.56099999 ;
createNode shadingEngine -n "menuScene_lambert10SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "menuScene_materialInfo12";
createNode file -n "menuScene_file2";
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/RRDrop/Dropbox/RobotRace/UI/menuScene/UI_Redesign/New/Main_texture.psd";
createNode place2dTexture -n "menuScene_place2dTexture11";
createNode reference -n "menuScene_Main_CamRN";
	setAttr -s 6 ".phl";
	setAttr ".phl[1]" -0.15851213997784591;
	setAttr ".phl[2]" 0.72491766872218821;
	setAttr ".phl[3]" 1.8045967411094903;
	setAttr ".phl[4]" 0.010471606091021487;
	setAttr ".phl[5]" -0.020943951023932129;
	setAttr ".phl[6]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"menuScene_Main_CamRN"
		"Main_CamRN" 8
		2 "|Main_Cam:Scott_Main_Cam" "visibility" " 1"
		2 "|Main_Cam:Scott_Main_Cam" "scale" " -type \"double3\" 1 1 1"
		5 4 "menuScene_Main_CamRN" "|Main_Cam:Scott_Main_Cam.translateX" "menuScene_Main_CamRN.placeHolderList[1]" 
		""
		5 4 "menuScene_Main_CamRN" "|Main_Cam:Scott_Main_Cam.translateY" "menuScene_Main_CamRN.placeHolderList[2]" 
		""
		5 4 "menuScene_Main_CamRN" "|Main_Cam:Scott_Main_Cam.translateZ" "menuScene_Main_CamRN.placeHolderList[3]" 
		""
		5 4 "menuScene_Main_CamRN" "|Main_Cam:Scott_Main_Cam.rotateX" "menuScene_Main_CamRN.placeHolderList[4]" 
		""
		5 4 "menuScene_Main_CamRN" "|Main_Cam:Scott_Main_Cam.rotateY" "menuScene_Main_CamRN.placeHolderList[5]" 
		""
		5 4 "menuScene_Main_CamRN" "|Main_Cam:Scott_Main_Cam.rotateZ" "menuScene_Main_CamRN.placeHolderList[6]" 
		"";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode materialInfo -n "menuScene_materialInfo13";
createNode animCurveTL -n "_botCover_translateX";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  1 0.76128822837871157 40 0.76128822837871157;
createNode animCurveTL -n "_botCover_translateY";
	setAttr ".tan" 2;
	setAttr -s 3 ".ktv[0:2]"  1 0.46434606989303528 20 2 40 0.46434606989303528;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[2]"  0.63333332538604736;
	setAttr -s 3 ".koy[2]"  1.5356539487838745;
createNode animCurveTL -n "_botCover_translateZ";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  1 -0.58947074100513297 40 -0.58947074100513297;
createNode animCurveTU -n "_botCover_visibility";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  1 1 40 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "_botCover_rotateX";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  1 0 40 0;
createNode animCurveTA -n "_botCover_rotateY";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  1 0 40 0;
createNode animCurveTA -n "_botCover_rotateZ";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  1 0 40 0;
createNode animCurveTU -n "_botCover_scaleX";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  1 0.99999999999999989 40 0.99999999999999989;
createNode animCurveTU -n "_botCover_scaleY";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  1 1.0000000000000002 40 1.0000000000000002;
createNode animCurveTU -n "_botCover_scaleZ";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  1 1.0000000000000002 40 1.0000000000000002;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 9 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 9 ".s";
select -ne :defaultTextureList1;
	setAttr -s 9 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 9 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :defaultRenderGlobals;
	setAttr ".mcfr" 30;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr ".hwfr" 30;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "_botCover_translateX.o" "_botCover.tx";
connectAttr "_botCover_translateY.o" "_botCover.ty";
connectAttr "_botCover_translateZ.o" "_botCover.tz";
connectAttr "_botCover_visibility.o" "_botCover.v";
connectAttr "_botCover_rotateX.o" "_botCover.rx";
connectAttr "_botCover_rotateY.o" "_botCover.ry";
connectAttr "_botCover_rotateZ.o" "_botCover.rz";
connectAttr "_botCover_scaleX.o" "_botCover.sx";
connectAttr "_botCover_scaleY.o" "_botCover.sy";
connectAttr "_botCover_scaleZ.o" "_botCover.sz";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Interface_CapSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "menuScene____Default.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "menuScene_lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "menuScene_lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Tanks:tank01SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "menuScene_lambert8SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "menuScene_lambert10SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Interface_CapSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "menuScene____Default.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "menuScene_lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "menuScene_lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Tanks:tank01SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "menuScene_lambert8SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "menuScene_lambert10SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "MapFBXASC032FBXASC0351.oc" "MaterialFBXASC032FBXASC03525.c";
connectAttr "MaterialFBXASC032FBXASC03525.oc" "Interface_CapSG.ss";
connectAttr "Interface_CapSG.msg" "materialInfo1.sg";
connectAttr "MaterialFBXASC032FBXASC03525.msg" "materialInfo1.m";
connectAttr "MapFBXASC032FBXASC0351.msg" "materialInfo1.t" -na;
connectAttr "place2dTexture1.o" "MapFBXASC032FBXASC0351.uv";
connectAttr "place2dTexture1.ofu" "MapFBXASC032FBXASC0351.ofu";
connectAttr "place2dTexture1.ofv" "MapFBXASC032FBXASC0351.ofv";
connectAttr "place2dTexture1.rf" "MapFBXASC032FBXASC0351.rf";
connectAttr "place2dTexture1.reu" "MapFBXASC032FBXASC0351.reu";
connectAttr "place2dTexture1.rev" "MapFBXASC032FBXASC0351.rev";
connectAttr "place2dTexture1.vt1" "MapFBXASC032FBXASC0351.vt1";
connectAttr "place2dTexture1.vt2" "MapFBXASC032FBXASC0351.vt2";
connectAttr "place2dTexture1.vt3" "MapFBXASC032FBXASC0351.vt3";
connectAttr "place2dTexture1.vc1" "MapFBXASC032FBXASC0351.vc1";
connectAttr "place2dTexture1.ofs" "MapFBXASC032FBXASC0351.fs";
connectAttr "layerManager.dli[1]" "menuScene_Dome_layer.id";
connectAttr "menuScene_holodeck_shader.oc" "menuScene____Default.ss";
connectAttr "Interface_CapShape.iog" "menuScene____Default.dsm" -na;
connectAttr "menuScene____Default.msg" "menuScene_materialInfo1.sg";
connectAttr "menuScene_holodeck_shader.msg" "menuScene_materialInfo1.m";
connectAttr "menuScene_file1.msg" "menuScene_materialInfo1.t" -na;
connectAttr "menuScene_place2dTexture1.c" "menuScene_file1.c";
connectAttr "menuScene_place2dTexture1.tf" "menuScene_file1.tf";
connectAttr "menuScene_place2dTexture1.rf" "menuScene_file1.rf";
connectAttr "menuScene_place2dTexture1.mu" "menuScene_file1.mu";
connectAttr "menuScene_place2dTexture1.mv" "menuScene_file1.mv";
connectAttr "menuScene_place2dTexture1.s" "menuScene_file1.s";
connectAttr "menuScene_place2dTexture1.wu" "menuScene_file1.wu";
connectAttr "menuScene_place2dTexture1.wv" "menuScene_file1.wv";
connectAttr "menuScene_place2dTexture1.re" "menuScene_file1.re";
connectAttr "menuScene_place2dTexture1.of" "menuScene_file1.of";
connectAttr "menuScene_place2dTexture1.r" "menuScene_file1.ro";
connectAttr "menuScene_place2dTexture1.n" "menuScene_file1.n";
connectAttr "menuScene_place2dTexture1.vt1" "menuScene_file1.vt1";
connectAttr "menuScene_place2dTexture1.vt2" "menuScene_file1.vt2";
connectAttr "menuScene_place2dTexture1.vt3" "menuScene_file1.vt3";
connectAttr "menuScene_place2dTexture1.vc1" "menuScene_file1.vc1";
connectAttr "menuScene_place2dTexture1.o" "menuScene_file1.uv";
connectAttr "menuScene_place2dTexture1.ofs" "menuScene_file1.fs";
connectAttr "menuScene_glow_file.oc" "menuScene_glow_shader.c";
connectAttr "menuScene_glow_file.ot" "menuScene_glow_shader.it";
connectAttr "menuScene_glow_shader.oc" "menuScene_lambert2SG.ss";
connectAttr "menuScene_lambert2SG.msg" "menuScene_materialInfo2.sg";
connectAttr "menuScene_glow_shader.msg" "menuScene_materialInfo2.m";
connectAttr "menuScene_glow_file.msg" "menuScene_materialInfo2.t" -na;
connectAttr "menuScene_place2dTexture2.c" "menuScene_glow_file.c";
connectAttr "menuScene_place2dTexture2.tf" "menuScene_glow_file.tf";
connectAttr "menuScene_place2dTexture2.rf" "menuScene_glow_file.rf";
connectAttr "menuScene_place2dTexture2.mu" "menuScene_glow_file.mu";
connectAttr "menuScene_place2dTexture2.mv" "menuScene_glow_file.mv";
connectAttr "menuScene_place2dTexture2.s" "menuScene_glow_file.s";
connectAttr "menuScene_place2dTexture2.wu" "menuScene_glow_file.wu";
connectAttr "menuScene_place2dTexture2.wv" "menuScene_glow_file.wv";
connectAttr "menuScene_place2dTexture2.re" "menuScene_glow_file.re";
connectAttr "menuScene_place2dTexture2.of" "menuScene_glow_file.of";
connectAttr "menuScene_place2dTexture2.r" "menuScene_glow_file.ro";
connectAttr "menuScene_place2dTexture2.n" "menuScene_glow_file.n";
connectAttr "menuScene_place2dTexture2.vt1" "menuScene_glow_file.vt1";
connectAttr "menuScene_place2dTexture2.vt2" "menuScene_glow_file.vt2";
connectAttr "menuScene_place2dTexture2.vt3" "menuScene_glow_file.vt3";
connectAttr "menuScene_place2dTexture2.vc1" "menuScene_glow_file.vc1";
connectAttr "menuScene_place2dTexture2.o" "menuScene_glow_file.uv";
connectAttr "menuScene_place2dTexture2.ofs" "menuScene_glow_file.fs";
connectAttr "layerManager.dli[2]" "menuScene_Button_layer.id";
connectAttr "layerManager.dli[3]" "menuScene_Robot_Stats_Layer.id";
connectAttr "layerManager.dli[4]" "menuScene_Holodeck_layer.id";
connectAttr "layerManager.dli[5]" "menuScene_Turntable_layer.id";
connectAttr "menuScene_buttons_file.oc" "menuScene_buttons_shader.c";
connectAttr "menuScene_buttons_file_alpha.ot" "menuScene_buttons_shader.it";
connectAttr "menuScene_buttons_shader.oc" "menuScene_lambert3SG.ss";
connectAttr "menuScene_lambert3SG.msg" "menuScene_materialInfo4.sg";
connectAttr "menuScene_buttons_shader.msg" "menuScene_materialInfo4.m";
connectAttr "menuScene_buttons_file.msg" "menuScene_materialInfo4.t" -na;
connectAttr "menuScene_place2dTexture5.c" "menuScene_buttons_file.c";
connectAttr "menuScene_place2dTexture5.tf" "menuScene_buttons_file.tf";
connectAttr "menuScene_place2dTexture5.rf" "menuScene_buttons_file.rf";
connectAttr "menuScene_place2dTexture5.mu" "menuScene_buttons_file.mu";
connectAttr "menuScene_place2dTexture5.mv" "menuScene_buttons_file.mv";
connectAttr "menuScene_place2dTexture5.s" "menuScene_buttons_file.s";
connectAttr "menuScene_place2dTexture5.wu" "menuScene_buttons_file.wu";
connectAttr "menuScene_place2dTexture5.wv" "menuScene_buttons_file.wv";
connectAttr "menuScene_place2dTexture5.re" "menuScene_buttons_file.re";
connectAttr "menuScene_place2dTexture5.of" "menuScene_buttons_file.of";
connectAttr "menuScene_place2dTexture5.r" "menuScene_buttons_file.ro";
connectAttr "menuScene_place2dTexture5.n" "menuScene_buttons_file.n";
connectAttr "menuScene_place2dTexture5.vt1" "menuScene_buttons_file.vt1";
connectAttr "menuScene_place2dTexture5.vt2" "menuScene_buttons_file.vt2";
connectAttr "menuScene_place2dTexture5.vt3" "menuScene_buttons_file.vt3";
connectAttr "menuScene_place2dTexture5.vc1" "menuScene_buttons_file.vc1";
connectAttr "menuScene_place2dTexture5.o" "menuScene_buttons_file.uv";
connectAttr "menuScene_place2dTexture5.ofs" "menuScene_buttons_file.fs";
connectAttr "menuScene_place2dTexture6.c" "menuScene_buttons_file_alpha.c";
connectAttr "menuScene_place2dTexture6.tf" "menuScene_buttons_file_alpha.tf";
connectAttr "menuScene_place2dTexture6.rf" "menuScene_buttons_file_alpha.rf";
connectAttr "menuScene_place2dTexture6.mu" "menuScene_buttons_file_alpha.mu";
connectAttr "menuScene_place2dTexture6.mv" "menuScene_buttons_file_alpha.mv";
connectAttr "menuScene_place2dTexture6.s" "menuScene_buttons_file_alpha.s";
connectAttr "menuScene_place2dTexture6.wu" "menuScene_buttons_file_alpha.wu";
connectAttr "menuScene_place2dTexture6.wv" "menuScene_buttons_file_alpha.wv";
connectAttr "menuScene_place2dTexture6.re" "menuScene_buttons_file_alpha.re";
connectAttr "menuScene_place2dTexture6.of" "menuScene_buttons_file_alpha.of";
connectAttr "menuScene_place2dTexture6.r" "menuScene_buttons_file_alpha.ro";
connectAttr "menuScene_place2dTexture6.n" "menuScene_buttons_file_alpha.n";
connectAttr "menuScene_place2dTexture6.vt1" "menuScene_buttons_file_alpha.vt1";
connectAttr "menuScene_place2dTexture6.vt2" "menuScene_buttons_file_alpha.vt2";
connectAttr "menuScene_place2dTexture6.vt3" "menuScene_buttons_file_alpha.vt3";
connectAttr "menuScene_place2dTexture6.vc1" "menuScene_buttons_file_alpha.vc1";
connectAttr "menuScene_place2dTexture6.o" "menuScene_buttons_file_alpha.uv";
connectAttr "menuScene_place2dTexture6.ofs" "menuScene_buttons_file_alpha.fs";
connectAttr "menuScene_file1.oc" "menuScene_holodeck_shader.c";
connectAttr "Tanks:tank01SG.msg" "Tanks:materialInfo3.sg";
connectAttr "menuScene_BGmachinery_shader.msg" "Tanks:materialInfo3.m";
connectAttr "menuScene_BG_machinery_file.msg" "Tanks:materialInfo3.t" -na;
connectAttr "menuScene_BGmachinery_shader.oc" "Tanks:tank01SG.ss";
connectAttr "menuScene_BG_machinery_file.oc" "menuScene_BGmachinery_shader.c";
connectAttr "Tanks:place2dTexture3.o" "menuScene_BG_machinery_file.uv";
connectAttr "Tanks:place2dTexture3.ofu" "menuScene_BG_machinery_file.ofu";
connectAttr "Tanks:place2dTexture3.ofv" "menuScene_BG_machinery_file.ofv";
connectAttr "Tanks:place2dTexture3.rf" "menuScene_BG_machinery_file.rf";
connectAttr "Tanks:place2dTexture3.reu" "menuScene_BG_machinery_file.reu";
connectAttr "Tanks:place2dTexture3.rev" "menuScene_BG_machinery_file.rev";
connectAttr "Tanks:place2dTexture3.vt1" "menuScene_BG_machinery_file.vt1";
connectAttr "Tanks:place2dTexture3.vt2" "menuScene_BG_machinery_file.vt2";
connectAttr "Tanks:place2dTexture3.vt3" "menuScene_BG_machinery_file.vt3";
connectAttr "Tanks:place2dTexture3.vc1" "menuScene_BG_machinery_file.vc1";
connectAttr "Tanks:place2dTexture3.ofs" "menuScene_BG_machinery_file.fs";
connectAttr "menuScene_map_file.oc" "menuScene_map_shader.c";
connectAttr "menuScene_map_file_ambient.oc" "menuScene_map_shader.ambc";
connectAttr "menuScene_map_shader.oc" "menuScene_lambert8SG.ss";
connectAttr "menuScene_lambert8SG.msg" "menuScene_materialInfo9.sg";
connectAttr "menuScene_map_shader.msg" "menuScene_materialInfo9.m";
connectAttr "menuScene_map_file.msg" "menuScene_materialInfo9.t" -na;
connectAttr "menuScene_place2dTexture9.c" "menuScene_map_file.c";
connectAttr "menuScene_place2dTexture9.tf" "menuScene_map_file.tf";
connectAttr "menuScene_place2dTexture9.rf" "menuScene_map_file.rf";
connectAttr "menuScene_place2dTexture9.mu" "menuScene_map_file.mu";
connectAttr "menuScene_place2dTexture9.mv" "menuScene_map_file.mv";
connectAttr "menuScene_place2dTexture9.s" "menuScene_map_file.s";
connectAttr "menuScene_place2dTexture9.wu" "menuScene_map_file.wu";
connectAttr "menuScene_place2dTexture9.wv" "menuScene_map_file.wv";
connectAttr "menuScene_place2dTexture9.re" "menuScene_map_file.re";
connectAttr "menuScene_place2dTexture9.of" "menuScene_map_file.of";
connectAttr "menuScene_place2dTexture9.r" "menuScene_map_file.ro";
connectAttr "menuScene_place2dTexture9.n" "menuScene_map_file.n";
connectAttr "menuScene_place2dTexture9.vt1" "menuScene_map_file.vt1";
connectAttr "menuScene_place2dTexture9.vt2" "menuScene_map_file.vt2";
connectAttr "menuScene_place2dTexture9.vt3" "menuScene_map_file.vt3";
connectAttr "menuScene_place2dTexture9.vc1" "menuScene_map_file.vc1";
connectAttr "menuScene_place2dTexture9.o" "menuScene_map_file.uv";
connectAttr "menuScene_place2dTexture9.ofs" "menuScene_map_file.fs";
connectAttr "menuScene_place2dTexture10.o" "menuScene_map_file_ambient.uv";
connectAttr "menuScene_place2dTexture10.ofs" "menuScene_map_file_ambient.fs";
connectAttr "menuScene_file2.oc" "menuScene_Misc_shader.c";
connectAttr "menuScene_Misc_shader.oc" "menuScene_lambert10SG.ss";
connectAttr "menuScene_lambert10SG.msg" "menuScene_materialInfo12.sg";
connectAttr "menuScene_Misc_shader.msg" "menuScene_materialInfo12.m";
connectAttr "menuScene_file2.msg" "menuScene_materialInfo12.t" -na;
connectAttr "menuScene_place2dTexture11.c" "menuScene_file2.c";
connectAttr "menuScene_place2dTexture11.tf" "menuScene_file2.tf";
connectAttr "menuScene_place2dTexture11.rf" "menuScene_file2.rf";
connectAttr "menuScene_place2dTexture11.mu" "menuScene_file2.mu";
connectAttr "menuScene_place2dTexture11.mv" "menuScene_file2.mv";
connectAttr "menuScene_place2dTexture11.s" "menuScene_file2.s";
connectAttr "menuScene_place2dTexture11.wu" "menuScene_file2.wu";
connectAttr "menuScene_place2dTexture11.wv" "menuScene_file2.wv";
connectAttr "menuScene_place2dTexture11.re" "menuScene_file2.re";
connectAttr "menuScene_place2dTexture11.of" "menuScene_file2.of";
connectAttr "menuScene_place2dTexture11.r" "menuScene_file2.ro";
connectAttr "menuScene_place2dTexture11.n" "menuScene_file2.n";
connectAttr "menuScene_place2dTexture11.vt1" "menuScene_file2.vt1";
connectAttr "menuScene_place2dTexture11.vt2" "menuScene_file2.vt2";
connectAttr "menuScene_place2dTexture11.vt3" "menuScene_file2.vt3";
connectAttr "menuScene_place2dTexture11.vc1" "menuScene_file2.vc1";
connectAttr "menuScene_place2dTexture11.o" "menuScene_file2.uv";
connectAttr "menuScene_place2dTexture11.ofs" "menuScene_file2.fs";
connectAttr "Interface_CapSG.pa" ":renderPartition.st" -na;
connectAttr "menuScene____Default.pa" ":renderPartition.st" -na;
connectAttr "menuScene_lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "menuScene_lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "Tanks:tank01SG.pa" ":renderPartition.st" -na;
connectAttr "menuScene_lambert8SG.pa" ":renderPartition.st" -na;
connectAttr "menuScene_lambert10SG.pa" ":renderPartition.st" -na;
connectAttr "MaterialFBXASC032FBXASC03525.msg" ":defaultShaderList1.s" -na;
connectAttr "menuScene_holodeck_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "menuScene_glow_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "menuScene_buttons_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "menuScene_BGmachinery_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "menuScene_map_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "menuScene_Misc_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "MapFBXASC032FBXASC0351.msg" ":defaultTextureList1.tx" -na;
connectAttr "menuScene_file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "menuScene_glow_file.msg" ":defaultTextureList1.tx" -na;
connectAttr "menuScene_buttons_file.msg" ":defaultTextureList1.tx" -na;
connectAttr "menuScene_buttons_file_alpha.msg" ":defaultTextureList1.tx" -na;
connectAttr "menuScene_BG_machinery_file.msg" ":defaultTextureList1.tx" -na;
connectAttr "menuScene_map_file.msg" ":defaultTextureList1.tx" -na;
connectAttr "menuScene_map_file_ambient.msg" ":defaultTextureList1.tx" -na;
connectAttr "menuScene_file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "menuScene_place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "menuScene_place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "menuScene_place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "menuScene_place2dTexture6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Tanks:place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "menuScene_place2dTexture9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "menuScene_place2dTexture10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "menuScene_place2dTexture11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of Cap.ma
