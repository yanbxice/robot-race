//Maya ASCII 2012 scene
//Name: menuBase.ma
//Last modified: Tue, Jun 12, 2012 01:10:03 PM
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
	setAttr ".t" -type "double3" -5.6841431845999431 2.6408867345346878 5.2315339578301447 ;
	setAttr -av ".tx";
	setAttr -av ".ty";
	setAttr -av ".tz";
	setAttr ".r" -type "double3" -16.538352729876699 -49.799999999991776 -3.6956969549914592e-015 ;
	setAttr -av ".rx";
	setAttr -av ".ry";
	setAttr -av ".rz";
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".ovr" 1.3;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 7.8234160657002043;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.73317313465842482 0.74136477831766889 0.90205584382586146 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".dr" yes;
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.0383784840170454 100.1 0.10118750150757425 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 6.2029942532211084;
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
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "mapscreen";
	setAttr ".t" -type "double3" -0.71739803669500846 0.98921240600642857 -0.85747631372078814 ;
	setAttr ".r" -type "double3" 89.999999999999986 37.471675748144349 -4.0074817720782263e-015 ;
	setAttr ".rp" -type "double3" 3.5388358909926865e-016 4.4408920985006262e-016 0 ;
	setAttr ".rpt" -type "double3" 1.9714778178011045e-016 -4.4408920985006227e-016 
		1.3716139852679061e-016 ;
	setAttr ".sp" -type "double3" 3.5388358909926865e-016 4.4408920985006262e-016 0 ;
createNode mesh -n "mapscreenShape" -p "mapscreen";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 2.9802322e-008 2.9802322e-008
		 1 0 1 1 2.9802322e-008 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -2.220446e-016 4.4751477e-017 
		5.5511151e-017 -2.220446e-016 -4.4751477e-017 -5.5511151e-017 -2.220446e-016 4.4751477e-017 
		5.5511151e-017 -2.220446e-016 -4.4751477e-017 -5.5511151e-017;
	setAttr -s 4 ".vt[0:3]"  -0.806171 1.1920929e-007 0.45347118 0.80617094 0 0.45347118
		 -0.806171 1.1920929e-007 -0.45347124 0.80617094 0 -0.45347124;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "botScreenRotator";
	setAttr ".rp" -type "double3" -1.1102230246251565e-016 1.1102230246251565e-016 
		2.7755575615628914e-017 ;
	setAttr ".rpt" -type "double3" 1.8784706050931014e-016 0 -1.1257467825698379e-016 ;
	setAttr ".sp" -type "double3" -1.1102230246251565e-016 1.1102230246251565e-016 2.7755575615628914e-017 ;
createNode locator -n "botScreenRotatorShape" -p "botScreenRotator";
	setAttr -k off ".v";
	setAttr ".lp" -type "double3" 0 0 9.7144514654701197e-017 ;
createNode transform -n "botScreen" -p "botScreenRotator";
	setAttr ".t" -type "double3" -0.038839827328053245 0.17919107324811678 0.24594433306332064 ;
	setAttr ".r" -type "double3" 89.999999999999517 122.02020886589659 0 ;
	setAttr ".rp" -type "double3" 1.1102230246251565e-016 -2.2204460492503131e-016 0 ;
	setAttr ".rpt" -type "double3" -3.5815135493066235e-016 2.2204460492502941e-016 
		2.3600628097309838e-017 ;
	setAttr ".sp" -type "double3" 1.1102230246251565e-016 -2.2204460492503131e-016 0 ;
createNode mesh -n "botScreenShape" -p "botScreen";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 5.9604645e-008 1.1920929e-007
		 1 5.9604645e-008 1 1 5.9604645e-008 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -0.17379659 5.9604645e-008 0.13668156 0.17379662 5.9604645e-008 0.13668156
		 -0.17379659 5.9604645e-008 -0.13668156 0.17379662 5.9604645e-008 -0.13668156;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "holoEmitters";
createNode transform -n "setting";
createNode transform -n "MenuRoom" -p "setting";
createNode mesh -n "MenuRoomShape" -p "MenuRoom";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 85 ".uvst[0].uvsp[0:84]" -type "float2" 0.032258064 0.29928011
		 0.096774191 0.29928011 0.12903225 0.35515273 0.096774191 0.41102532 0.032258064 0.41102532
		 0 0.35515273 0.22580644 0.29928011 0.29032257 0.29928011 0.32258064 0.35515273 0.29032257
		 0.41102532 0.22580644 0.41102532 0.19354838 0.35515273 0.41935483 0.29928011 0.48387095
		 0.29928011 0.51612902 0.35515273 0.48387095 0.41102532 0.41935483 0.41102532 0.38709676
		 0.35515273 0.61290324 0.29928011 0.6774193 0.29928011 0.7096774 0.35515273 0.6774193
		 0.41102532 0.61290324 0.41102532 0.58064514 0.35515273 0.80645156 0.29928011 0.87096775
		 0.29928011 0.90322578 0.35515273 0.87096775 0.41102532 0.80645156 0.41102532 0.77419353
		 0.35515273 0.77419353 0.46689793 0.7096774 0.46689793 0.6774193 0.52277052 0.61290324
		 0.52277052 0.58064514 0.46689793 0.51612902 0.46689793 0.48387095 0.52277052 0.41935483
		 0.52277052 0.38709676 0.46689793 0.32258064 0.46689793 0.29032257 0.52277052 0.22580644
		 0.52277052 0.19354838 0.46689793 0.12903225 0.46689793 0.096774191 0.52277052 0.19354838
		 0.57864314 0.12903225 0.57864314 0.38709676 0.57864314 0.32258064 0.57864314 0.58064514
		 0.57864314 0.51612902 0.57864314 0.61290324 0.63451576 0.58064514 0.69038838 0.51612902
		 0.69038838 0.48387095 0.63451576 0.41935483 0.63451576 0.38709676 0.69038838 0.32258064
		 0.69038838 0.29032257 0.63451576 0.31025913 0.58412904 0.25806451 0.62205064 0.20586987
		 0.58412904 0.50380754 0.58412904 0.45161289 0.62205064 0.39941823 0.58412904 0.69735593
		 0.58412904 0.64516127 0.62205064 0.59296662 0.58412904 0.10909567 0.40553945 0.16129032
		 0.36761782 0.21348496 0.40553945 0.30264407 0.40553945 0.3548387 0.36761782 0.40703335
		 0.40553945 0.49619243 0.40553945 0.54838705 0.36761782 0.60058177 0.40553945 0.68974078
		 0.40553945 0.74193549 0.36761782 0.79413015 0.40553945 0.20586987 0.23792163 0.25806451
		 0.2 0.31025913 0.23792163 0.22580644 0.29928011 0.29032257 0.29928011;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 48 ".pt[0:47]" -type "float3"  0 3.0627985 6.8007788e-016 
		1.2105644 2.8134072 6.2470189e-016 -0.68234712 2.8134072 -0.99993324 -0.44133994 
		2.8134072 1.1272478 1.7387816 2.3146267 -0.99993324 1.5173962 2.4098856 1.1272478 
		-1.8060343 2.3146267 -0.87262166 -0.15413167 2.3146267 -1.9998695 0.49646431 2.4098856 
		1.823925 -1.5650271 2.3146267 1.2545625 2.5738308 1.412325 -0.87262166 1.0564344 
		2.0652382 -1.9998695 2.3524454 1.5075837 1.2545625 -1.9722953 1.5075837 -1.79387 
		-2.2473743 2.0652382 0.25462717 -0.95136338 1.5075837 -2.4905474 0.31057858 1.5075837 
		2.6479168 -1.7509099 1.412325 2.0785513 2.4075696 0.60528219 -1.79387 2.8806624 1.0088036 
		0.25462717 1.4697684 1.0088036 -2.4905474 2.1665595 0.60528219 2.0785513 -2.5798934 
		0.45115232 -1.5878736 -2.8549721 1.0088036 0.46062568 -0.53802955 0.45115232 -2.9812281 
		1.1456276 0.60528219 2.7752314 -0.8131085 1.0088036 2.7752314 -2.5481405 0.60528219 
		1.5878736 2.5481405 -0.60528219 -1.5878736 3.0212212 -0.20176072 0.46062568 0.67253476 
		0.20176072 -2.9812281 2.5798934 -0.45115232 1.5878736 -2.1665595 -0.60528219 -2.0785513 
		-3.0212212 0.20176072 -0.46062568 -1.1456276 -0.60528219 -2.7752314 0.53802955 -0.45115232 
		2.9812281 -0.67253476 -0.20176072 2.9812281 -2.4075696 -0.60528219 1.79387 1.7509099 
		-1.412325 -2.0785513 2.8549721 -1.0088036 -0.46062568 0.8131085 -1.0088036 -2.7752314 
		1.9722953 -1.5075837 1.79387 -2.3524454 -1.5075837 -1.2545625 -2.8806624 -1.0088036 
		-0.25462717 -0.31057858 -1.5075837 -2.6479168 0.95136338 -1.5075837 2.4905474 -1.4697684 
		-1.0088036 2.4905474 -2.5738308 -1.412325 0.87262166;
	setAttr -s 48 ".vt[0:47]"  0 2.14921188 4.772209e-016 0.84947127 1.97421014 4.3836271e-016
		 -0.47881326 1.97421014 -0.7016682 -0.30969489 1.97421014 0.7910068 1.22012925 1.62420845 -0.7016682
		 1.064779758 1.69105303 0.7910068 -1.26732147 1.62420845 -0.61233175 -0.10815651 1.62420845 -1.40333855
		 0.34837648 1.69105303 1.27987564 -1.098203063 1.62420845 0.8803454 1.80609584 0.99104977 -0.61233175
		 0.74131596 1.44920874 -1.40333855 1.65074635 1.05789423 0.8803454 -1.38398933 1.05789423 -1.25878561
		 -1.57701635 1.44920874 0.17867573 -0.66758603 1.05789423 -1.74765456 0.21793766 1.05789423 1.85808313
		 -1.22863984 0.99104977 1.45855081 1.68942785 0.42473564 -1.25878561 2.021404266 0.70789272 0.17867573
		 1.0313586 0.70789272 -1.74765456 1.52030742 0.42473564 1.45855081 -1.81034994 0.31658038 -1.11423481
		 -2.0033769608 0.70789272 0.32322797 -0.37754345 0.31658038 -2.091972589 0.80390418 0.42473564 1.94742167
		 -0.57057047 0.70789272 1.94742167 -1.78806853 0.42473564 1.11423481 1.78806853 -0.42473564 -1.11423481
		 2.12003636 -0.14157854 0.32322797 0.47192779 0.14157854 -2.091972589 1.81034994 -0.31658038 1.11423481
		 -1.52030742 -0.42473564 -1.45855081 -2.12003636 0.14157854 -0.32322797 -0.80390418 -0.42473564 -1.94742167
		 0.37754345 -0.31658038 2.091972589 -0.47192779 -0.14157854 2.091972589 -1.68942785 -0.42473564 1.25878561
		 1.22863984 -0.99104977 -1.45855081 2.0033769608 -0.70789272 -0.32322797 0.57057047 -0.70789272 -1.94742167
		 1.38398933 -1.05789423 1.25878561 -1.65074635 -1.05789423 -0.8803454 -2.021404266 -0.70789272 -0.17867573
		 -0.21793766 -1.05789423 -1.85808313 0.66758603 -1.05789423 1.74765456 -1.0313586 -0.70789272 1.74765456
		 -1.80609584 -0.99104977 0.61233175;
	setAttr -s 68 ".ed[0:67]"  0 1 1 1 4 1 4 11 1 11 7 1 7 2 1 2 0 1 2 6 1
		 6 14 1 14 9 1 9 3 1 3 0 1 3 8 1 8 5 1 5 1 1 5 12 1 12 19 1 19 10 1 10 4 1 7 15 1
		 15 13 1 13 6 1 9 17 1 17 26 1 26 16 1 16 8 1 10 18 1 18 20 1 20 11 1 16 25 1 25 21 1
		 21 12 1 13 22 1 22 33 1 33 23 1 23 14 1 20 30 1 30 24 1 24 15 1 23 27 1 27 17 1 19 29 1
		 29 39 0 39 28 0 28 18 1 21 31 1 31 29 0 24 34 1 34 32 0 32 22 1 26 36 1 36 35 0 35 25 1
		 27 37 1 37 46 0 46 36 0 28 38 0 38 40 0 40 30 1 35 45 0 45 41 0 41 31 0 32 42 0 42 43 0
		 43 33 1 43 47 0 47 37 0 40 44 0 44 34 0;
	setAttr -s 21 ".fc[0:20]" -type "polyFaces" 
		f 6 -6 -5 -4 -3 -2 -1
		mu 0 6 16 15 14 13 12 17
		f 6 -11 -10 -9 -8 -7 5
		mu 0 6 16 38 37 36 35 15
		f 5 10 0 -14 -13 -12
		mu 0 5 38 73 72 71 39
		f 6 13 1 -18 -17 -16 -15
		mu 0 6 9 8 7 6 11 10
		f 5 4 6 -21 -20 -19
		mu 0 5 75 74 35 34 76
		f 6 9 11 -25 -24 -23 -22
		mu 0 6 37 38 39 40 48 47
		f 5 2 -28 -27 -26 17
		mu 0 5 83 84 82 81 80
		f 6 14 -31 -30 -29 24 12
		mu 0 6 9 10 42 41 40 39
		f 6 7 -35 -34 -33 -32 20
		mu 0 6 35 36 50 49 33 34
		f 6 18 -38 -37 -36 27 3
		mu 0 6 23 22 21 20 19 18
		f 5 21 -40 -39 34 8
		mu 0 5 37 64 63 62 36
		f 6 16 25 -44 -43 -42 -41
		mu 0 6 2 1 0 5 4 3
		f 5 30 15 40 -46 -45
		mu 0 5 42 70 69 68 43
		f 6 31 -49 -48 -47 37 19
		mu 0 6 34 33 32 31 21 22
		f 5 23 28 -52 -51 -50
		mu 0 5 59 40 41 61 60
		f 6 39 22 49 -55 -54 -53
		mu 0 6 55 47 48 58 57 56
		f 6 43 26 35 -58 -57 -56
		mu 0 6 26 25 24 29 28 27
		f 6 44 -61 -60 -59 51 29
		mu 0 6 42 43 44 46 45 41
		f 5 32 -64 -63 -62 48
		mu 0 5 33 67 66 65 32
		f 6 33 38 52 -66 -65 63
		mu 0 6 49 50 54 53 52 51
		f 5 46 -68 -67 57 36
		mu 0 5 77 31 30 79 78;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane1" -p "setting";
	setAttr ".t" -type "double3" 0.00028911054900770949 0 0.48390413014212719 ;
createNode mesh -n "pPlaneShape1" -p "pPlane1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 0.95845789 0
		 0 1 0.95845789 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -5.73687792 -1.3290545e-015 5.98552942 5.73687792 -1.3290545e-015 5.98552942
		 -5.73687792 1.3290545e-015 -5.98552942 5.73687792 1.3290545e-015 -5.98552942;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "initPos_buttons_root";
	setAttr ".t" -type "double3" -0.11992141649633936 0.73868674067404183 1.7936822240042007 ;
createNode locator -n "initPos_buttons_rootShape" -p "initPos_buttons_root";
	setAttr -k off ".v";
createNode transform -n "mainMenu_root" -p "initPos_buttons_root";
	setAttr ".r" -type "double3" 0 0 -2.0278538504223517e-016 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
createNode transform -n "mainMenu_btn_grp" -p "mainMenu_root";
	setAttr ".t" -type "double3" 6.9388939039072284e-017 3.3306690738754696e-016 8.8817841970012523e-016 ;
	setAttr ".r" -type "double3" 0 -1.5902773407317576e-015 0 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1.0000000000000004 1.0000000000000007 ;
	setAttr ".rp" -type "double3" -8.3266726846886778e-017 -1.110223024625157e-016 0 ;
	setAttr ".sp" -type "double3" -8.3266726846886741e-017 -1.1102230246251565e-016 
		0 ;
	setAttr ".spt" -type "double3" -3.6977854932234945e-032 -4.930380657631326e-032 
		0 ;
createNode transform -n "mainMenu_Pos" -p "mainMenu_btn_grp";
	setAttr ".t" -type "double3" 0.11793064842604416 -0.040554382038397056 -0.50000000000000067 ;
	setAttr ".r" -type "double3" 3.1805546814635176e-015 0 -3.9756933518293969e-016 ;
	setAttr ".rp" -type "double3" 1.3877787807814457e-017 1.6653345369377348e-016 0 ;
	setAttr ".sp" -type "double3" 1.3877787807814457e-017 1.6653345369377348e-016 0 ;
createNode transform -n "help_btn" -p "mainMenu_Pos";
	setAttr ".t" -type "double3" 0.11081971137055115 -0.13828134996771568 -2.2204460492503104e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" 0.050310448003269281 0 -0.055753893266453858 ;
	setAttr ".rpt" -type "double3" -0.10606434126972311 0.050310448003269309 0.05575389326645383 ;
	setAttr ".sp" -type "double3" 0.050310448003269281 0 -0.055753893266453858 ;
createNode mesh -n "help_btnShape" -p "help_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  0.030434631 -9.5188967e-017 0.006358061 0.07018625 -5.9234562e-008 0.006358061
		 0.030434616 -9.5025503e-017 -0.11786583 0.07018628 -9.0406732e-017 -0.11786586;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "multi_btn" -p "mainMenu_Pos";
	setAttr ".t" -type "double3" 0.11099999999999995 -0.038281349967715567 -4.0287076872946589e-018 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" 2.2204460492503131e-016 -2.2204460492503131e-016 -0.055844597283628561 ;
	setAttr ".rpt" -type "double3" -0.055844597283628783 4.6888919293214418e-016 0.055844597283628311 ;
	setAttr ".sp" -type "double3" 2.2204460492503131e-016 -2.2204460492503131e-016 -0.055844597283628561 ;
createNode mesh -n "multi_btnShape" -p "multi_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.020124175 -1.9906013e-016 
		-0.11873268 -0.02012416 5.9974731e-008 -0.11873268 0.02012419 -1.9889666e-016 0.007043459 
		-0.02012419 -1.9427789e-016 0.0070434925;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "single_btn" -p "mainMenu_Pos";
	setAttr ".t" -type "double3" -0.20000000000000007 -0.038281349967715567 -5.8099383599726494e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" 2.2204460492503131e-016 0 0.10062089600653792 ;
	setAttr ".rpt" -type "double3" 0.1006208960065377 1.7735995072308257e-016 -0.10062089600653788 ;
	setAttr ".sp" -type "double3" 2.2204460492503131e-016 0 0.10062089600653792 ;
createNode mesh -n "single_btnShape" -p "single_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.020124175 2.1932333e-017 
		0.037732821 -0.02012416 5.9974731e-008 0.037732821 0.02012419 2.2095799e-017 0.16350895 
		-0.02012419 2.6714569e-017 0.16350898;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "options_btn" -p "mainMenu_Pos";
	setAttr ".t" -type "double3" -0.20000000000000007 -0.13828134996771557 -1.1833993239241922e-016 ;
	setAttr ".r" -type "double3" 89.999999999999986 0 89.999999999999972 ;
	setAttr ".rp" -type "double3" 0.050310448003269115 -2.2204460492503131e-016 0.10062089600653798 ;
	setAttr ".rpt" -type "double3" 0.050310448003268886 0.050310448003269267 -0.10062089600653817 ;
	setAttr ".sp" -type "double3" 0.050310448003269115 -2.2204460492503131e-016 0.10062089600653798 ;
createNode mesh -n "options_btnShape" -p "options_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.070434622 -2.1315703e-016 
		0.037732821 0.030186288 5.9974731e-008 0.037732821 0.070434637 -2.1299357e-016 0.16350895 
		0.030186258 -2.0837479e-016 0.16350898;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "play_root" -p "initPos_buttons_root";
	setAttr ".r" -type "double3" 0 0 -2.0278538504223517e-016 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999967 ;
createNode transform -n "playGame_btn_grp" -p "play_root";
	setAttr ".t" -type "double3" 6.9388939039072284e-017 -10 8.8817841970012523e-016 ;
	setAttr ".r" -type "double3" 0 -1.5902773407317576e-015 0 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1.0000000000000004 1.0000000000000007 ;
	setAttr ".rp" -type "double3" -8.3266726846886778e-017 -2.2204460492503141e-016 
		4.4408920985006291e-016 ;
	setAttr ".sp" -type "double3" -8.3266726846886741e-017 -2.2204460492503131e-016 
		4.4408920985006262e-016 ;
	setAttr ".spt" -type "double3" -3.6977854932234945e-032 -9.8607613152626519e-032 
		2.958228394578796e-031 ;
createNode transform -n "playGame_Pos" -p "playGame_btn_grp";
	setAttr ".t" -type "double3" 0.11793064842604416 -0.040554382038397056 -0.50000000000000067 ;
	setAttr ".r" -type "double3" 3.1805546814635176e-015 0 -3.9756933518293969e-016 ;
	setAttr ".rp" -type "double3" -4.163336342344337e-017 1.6653345369377348e-016 0 ;
	setAttr ".sp" -type "double3" -4.163336342344337e-017 1.6653345369377348e-016 0 ;
createNode transform -n "playGame_btn" -p "playGame_Pos";
	setAttr ".t" -type "double3" -0.10910433386837824 -0.067578300208485487 -8.0303844092229664e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" 2.2204460492503131e-016 0 0.10062089600653769 ;
	setAttr ".rpt" -type "double3" 0.10062089600653747 1.7735995072308267e-016 -0.10062089600653765 ;
	setAttr ".sp" -type "double3" 2.2204460492503131e-016 0 0.10062089600653769 ;
createNode mesh -n "playGame_btnShape" -p "playGame_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.00024835765 1.4138347e-016 
		0.099844784 -0.00024835765 7.4017248e-010 0.099844784 0.00024835765 1.417104e-016 
		0.10139702 -0.00024835765 1.5094794e-016 0.10139701;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "charSel_btn_root";
	setAttr ".t" -type "double3" 1.4403540356957611 0.66989598663604633 -0.69424305718551604 ;
	setAttr ".r" -type "double3" 178.80000000000049 77.800000000030892 180 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 0.99999999999999978 ;
	setAttr ".rp" -type "double3" -8.3266726846886765e-017 -1.1102230246251563e-016 
		0 ;
	setAttr ".rpt" -type "double3" 1.031356168690264e-016 2.4349025590713147e-020 8.0894876141661335e-017 ;
	setAttr ".sp" -type "double3" -8.3266726846886741e-017 -1.1102230246251565e-016 
		0 ;
	setAttr ".spt" -type "double3" -2.4651903288156624e-032 2.4651903288156616e-032 
		0 ;
createNode transform -n "charSel_btn_grp" -p "charSel_btn_root";
	setAttr ".r" -type "double3" 3.1805546814635176e-015 0 -3.9756933518293969e-016 ;
	setAttr ".rp" -type "double3" 1.3877787807814457e-017 1.6653345369377348e-016 0 ;
	setAttr ".sp" -type "double3" 1.3877787807814457e-017 1.6653345369377348e-016 0 ;
createNode transform -n "accept_btn" -p "charSel_btn_grp";
	setAttr ".t" -type "double3" 0.22875035979659591 0.27181676099292196 -0.49187971991623392 ;
	setAttr ".r" -type "double3" 89.999999999999972 -1.4287647983136891e-016 89.999999999999972 ;
	setAttr ".rp" -type "double3" -0.14086925440915277 -0.0040853492892636289 -0.055753893266453997 ;
	setAttr ".rpt" -type "double3" 0.085115361142698714 -0.13678390511988911 0.05166854397719034 ;
	setAttr ".sp" -type "double3" -0.14086925440915277 -0.0040853492892636289 -0.055753893266453997 ;
createNode mesh -n "accept_btnShape" -p "accept_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -0.12074508 -0.0040853494 
		-0.11864197 -0.16099341 -0.0040852893 -0.11864197 -0.12074506 -0.0040853494 0.0071341628 
		-0.16099344 -0.0040853494 0.0071341968;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "charBack_btn" -p "charSel_btn_grp";
	setAttr ".t" -type "double3" 0.222781992910254 0.01333006328174305 -0.41040689217215653 ;
	setAttr ".r" -type "double3" 90 0 90 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999967 1.0000000000000007 ;
	setAttr ".rp" -type "double3" 0.065475174686805346 0.0020267313736004313 -0.08807686949229479 ;
	setAttr ".rpt" -type "double3" -0.085842353369084079 0.065204722391749154 0.0037338156169878407 ;
	setAttr ".sp" -type "double3" 0.06547517468680536 0.0020267313736004322 -0.088076869492294735 ;
	setAttr ".spt" -type "double3" -1.3877787807814455e-017 -8.6736173798840326e-019 
		-5.5511151231257864e-017 ;
createNode mesh -n "charBack_btnShape" -p "charBack_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.085599348 0.0020267314 
		-0.18202092 0.045351014 0.0020267915 -0.18202092 0.085599363 0.0020267314 0.0058671548 
		0.045350984 0.0020267314 0.0058672051;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "mapSelect_btn_grp";
	setAttr ".t" -type "double3" 0.78189517242610673 0.73352837804976445 1.4280732879407814 ;
	setAttr ".r" -type "double3" 0.60000000000000031 23.800000000000093 2.7157572428659379e-017 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1 ;
	setAttr ".rp" -type "double3" -8.3266726846886765e-017 -1.1102230246251565e-016 
		0 ;
	setAttr ".rpt" -type "double3" 6.6118677075736363e-018 6.0874232863190192e-021 3.2538162403061671e-017 ;
	setAttr ".sp" -type "double3" -8.3266726846886741e-017 -1.1102230246251565e-016 
		0 ;
	setAttr ".spt" -type "double3" -2.4651903288156624e-032 0 0 ;
createNode transform -n "mapSelect_btn_Pos" -p "mapSelect_btn_grp";
	setAttr ".r" -type "double3" 3.1805546814635176e-015 0 -3.9756933518293969e-016 ;
	setAttr ".rp" -type "double3" 1.3877787807814457e-017 1.6653345369377348e-016 0 ;
	setAttr ".sp" -type "double3" 1.3877787807814457e-017 1.6653345369377348e-016 0 ;
createNode transform -n "next_btn" -p "mapSelect_btn_Pos";
	setAttr ".t" -type "double3" 0.29299740491084414 0.27962896483374189 -0.50402845026040932 ;
	setAttr ".r" -type "double3" 89.999999999999972 0 89.999999999999972 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 1 ;
	setAttr ".rp" -type "double3" -0.14455310713586864 0.0020267313736004318 -0.088076869492294735 ;
	setAttr ".rpt" -type "double3" 0.056476237643573839 -0.14657983850946904 0.090103600865895125 ;
	setAttr ".sp" -type "double3" -0.14455310713586866 0.0020267313736004322 -0.088076869492294735 ;
	setAttr ".spt" -type "double3" 2.7755575615628907e-017 -4.3368086899420168e-019 
		0 ;
createNode mesh -n "next_btnShape" -p "next_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -0.12442894 0.0020267314 
		-0.18202092 -0.16467726 0.0020267915 -0.18202092 -0.12442892 0.0020267314 0.0058671548 
		-0.16467729 0.0020267314 0.0058672051;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "select_btn" -p "mapSelect_btn_Pos";
	setAttr ".t" -type "double3" 0.2183718526014703 0.1808425571064782 -0.49999999999999978 ;
	setAttr ".r" -type "double3" 89.999999999999972 0 89.999999999999972 ;
	setAttr ".s" -type "double3" 1.09 1.09 1.09 ;
	setAttr ".rp" -type "double3" -0.094853222841946389 -6.6613381477509373e-016 -0.051259991896042523 ;
	setAttr ".rpt" -type "double3" 0.043593230945903824 -0.094853222841945695 0.051259991896041836 ;
	setAttr ".sp" -type "double3" -0.094853222841946416 -6.6613381477509392e-016 -0.051259991896042523 ;
	setAttr ".spt" -type "double3" 2.7755575615628907e-017 1.9721522630525291e-031 0 ;
createNode mesh -n "select_btnShape" -p "select_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -0.074729048 -4.1422656e-016 
		-0.11414807 -0.11497738 5.9974724e-008 -0.11414807 -0.074729033 -4.1406311e-016 0.011628064 
		-0.11497741 -4.0944432e-016 0.011628098;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "prev_btn" -p "mapSelect_btn_Pos";
	setAttr ".t" -type "double3" 0.14459919912340594 0.27962896483374211 -0.50402845026040821 ;
	setAttr ".r" -type "double3" 89.999999999999972 0 89.999999999999972 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 1 ;
	setAttr ".rp" -type "double3" -0.14455310713586875 0.0020267313735997656 -0.013417067331821492 ;
	setAttr ".rpt" -type "double3" 0.13113603980404717 -0.14657983850946851 0.015443798705421253 ;
	setAttr ".sp" -type "double3" -0.14455310713586877 0.0020267313735997661 -0.013417067331821492 ;
	setAttr ".spt" -type "double3" 2.7755575615628907e-017 -4.3368086899420168e-019 
		0 ;
createNode mesh -n "prev_btnShape" -p "prev_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -0.12442894 0.0020267314 
		-0.10736112 -0.16467726 0.0020267915 -0.10736112 -0.12442892 0.0020267314 0.080526955 
		-0.16467729 0.0020267314 0.080527008;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "mapBack_btn" -p "mapSelect_btn_Pos";
	setAttr ".t" -type "double3" 0.29299740491084425 -0.19537069730185352 -0.5040284502604091 ;
	setAttr ".r" -type "double3" 89.999999999999972 0 89.999999999999972 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 1 ;
	setAttr ".rp" -type "double3" 0.065475174686805346 0.0020267313736004318 -0.088076869492294735 ;
	setAttr ".rpt" -type "double3" -0.15355204417910004 0.063448443313204955 0.090103600865895125 ;
	setAttr ".sp" -type "double3" 0.06547517468680536 0.0020267313736004322 -0.088076869492294735 ;
	setAttr ".spt" -type "double3" -1.3877787807814454e-017 -4.3368086899420168e-019 
		0 ;
createNode mesh -n "mapBack_btnShape" -p "mapBack_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.085599348 0.0020267314 
		-0.18202092 0.045351014 0.0020267915 -0.18202092 0.085599363 0.0020267314 0.0058671548 
		0.045350984 0.0020267314 0.0058672051;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "screen_btn_root";
createNode transform -n "screenRace_root" -p "screen_btn_root";
	setAttr ".t" -type "double3" 0.28222410920961638 0.40865949489316122 0.54277400847962287 ;
	setAttr ".r" -type "double3" -43.450999999999993 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999978 0.99999999999999967 ;
createNode transform -n "screenRace_btn_grp" -p "screenRace_root";
	setAttr ".t" -type "double3" 0 4.9960036108132074e-016 4.4408920985006252e-016 ;
	setAttr ".r" -type "double3" 0 -1.5902773407317576e-015 0 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1.0000000000000004 1.0000000000000007 ;
	setAttr ".rp" -type "double3" -1.526556658859591e-016 1.6653345369377356e-016 0 ;
	setAttr ".sp" -type "double3" -1.5265566588595902e-016 1.6653345369377348e-016 0 ;
	setAttr ".spt" -type "double3" -7.395570986446989e-032 7.395570986446989e-032 0 ;
createNode transform -n "screenRace_Pos" -p "screenRace_btn_grp";
	setAttr ".r" -type "double3" 3.1805546814635176e-015 0 -3.9756933518293969e-016 ;
	setAttr ".rp" -type "double3" -1.5265566588595902e-016 1.6653345369377348e-016 0 ;
	setAttr ".sp" -type "double3" -1.5265566588595902e-016 1.6653345369377348e-016 0 ;
createNode transform -n "QuickRace_btn" -p "screenRace_Pos";
	setAttr ".t" -type "double3" -0.022519125104754678 0.1 1.6535767448741205e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" -0.069999999999999729 0 0 ;
	setAttr ".rpt" -type "double3" 0.069999999999999701 -0.069999999999999729 0 ;
	setAttr ".sp" -type "double3" -0.069999999999999729 0 0 ;
createNode mesh -n "QuickRace_btnShape" -p "QuickRace_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -0.042000007 -9.298242e-017 
		-0.087500021 -0.097999975 8.3446501e-008 -0.087500021 -0.041999985 -9.295006e-017 
		0.087499991 -0.098000012 -9.0244849e-017 0.087500043;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Storyline_btn" -p "screenRace_Pos";
	setAttr ".t" -type "double3" -0.022519125104754678 1.0000500474285214e-017 1.6535767448741222e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" 4.4408920985006262e-016 0 -2.7755575615628914e-017 ;
	setAttr ".rpt" -type "double3" -4.7184478546569133e-016 4.4408920985006262e-016 
		2.7755575615628901e-017 ;
	setAttr ".sp" -type "double3" 4.4408920985006262e-016 0 -2.7755575615628914e-017 ;
createNode mesh -n "Storyline_btnShape" -p "Storyline_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.027999993 -9.6363934e-017 
		-0.087500021 -0.027999973 8.3446501e-008 -0.087500021 0.028000016 -9.6331568e-017 
		0.087499991 -0.028000016 -9.3626363e-017 0.087500043;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Tournament_btn" -p "screenRace_Pos";
	setAttr ".t" -type "double3" -0.022519125104754685 -0.1 1.6535767448741237e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" 0.070000000000000229 0 -5.5511151231257827e-017 ;
	setAttr ".rpt" -type "double3" -0.070000000000000256 0.070000000000000229 5.5511151231257802e-017 ;
	setAttr ".sp" -type "double3" 0.070000000000000229 0 -5.5511151231257827e-017 ;
createNode mesh -n "Tournament_btnShape" -p "Tournament_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.097999997 -9.9745442e-017 
		-0.087500021 0.042000026 8.3446501e-008 -0.087500021 0.098000012 -9.9713083e-017 
		0.087499991 0.041999985 -9.7007871e-017 0.087500043;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "typeBack_btn" -p "screenRace_Pos";
	setAttr ".t" -type "double3" 0.099570412120873475 -0.068225102075524291 0.00082879106559419213 ;
	setAttr ".r" -type "double3" 89.999999999999972 5.3810109863509086e-015 89.999999999999972 ;
	setAttr ".s" -type "double3" 0.5910700962200387 0.59107009622003848 0.5910700962200397 ;
	setAttr ".rp" -type "double3" 0.038700417802153886 0.0011979403080061781 -0.052059603725570516 ;
	setAttr ".rpt" -type "double3" -0.090760021527724388 0.037502477494147736 0.053257544033576673 ;
	setAttr ".sp" -type "double3" 0.06547517468680536 0.0020267313736004322 -0.088076869492294735 ;
	setAttr ".spt" -type "double3" -0.026774756884651477 -0.00082879106559425426 0.036017265766724219 ;
createNode mesh -n "typeBack_btnShape" -p "typeBack_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.085599348 0.0020267314 
		-0.18202092 0.045351014 0.0020267915 -0.18202092 0.085599363 0.0020267314 0.0058671548 
		0.045350984 0.0020267314 0.0058672051;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "diff_root" -p "screen_btn_root";
	setAttr ".t" -type "double3" 0.28222410920961638 0.40865949489316122 0.54277400847962287 ;
	setAttr ".r" -type "double3" -43.450999999999993 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999978 0.99999999999999967 ;
createNode transform -n "Difficulty_btn_grp" -p "diff_root";
	setAttr ".t" -type "double3" 0 4.9960036108132074e-016 4.4408920985006252e-016 ;
	setAttr ".r" -type "double3" 0 -1.5902773407317576e-015 0 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1.0000000000000004 1.0000000000000007 ;
	setAttr ".rp" -type "double3" -1.526556658859591e-016 1.6653345369377356e-016 0 ;
	setAttr ".sp" -type "double3" -1.5265566588595902e-016 1.6653345369377348e-016 0 ;
	setAttr ".spt" -type "double3" -7.395570986446989e-032 7.395570986446989e-032 0 ;
createNode transform -n "_pos" -p "Difficulty_btn_grp";
	setAttr ".r" -type "double3" 3.1805546814635176e-015 0 -3.9756933518293969e-016 ;
	setAttr ".rp" -type "double3" -1.5265566588595902e-016 1.6653345369377348e-016 0 ;
	setAttr ".sp" -type "double3" -1.5265566588595902e-016 1.6653345369377348e-016 0 ;
createNode transform -n "Difficulty_Label" -p "_pos";
	setAttr ".t" -type "double3" -0.02246081239743114 0.09999999999999995 1.6538357053153158e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" -0.069999999999999729 0 0 ;
	setAttr ".rpt" -type "double3" 0.069999999999999701 -0.069999999999999729 0 ;
	setAttr ".sp" -type "double3" -0.069999999999999729 0 0 ;
createNode mesh -n "Difficulty_LabelShape" -p "Difficulty_Label";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -0.042000007 -9.298242e-017 
		-0.087500021 -0.097999975 8.3446501e-008 -0.087500021 -0.041999985 -9.295006e-017 
		0.087499991 -0.098000012 -9.0244849e-017 0.087500043;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Easy_btn" -p "_pos";
	setAttr ".t" -type "double3" -0.11025605765790418 -0.1001544728045255 1.2639464943521619e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" 0.070108130963168036 0 0.061456671682331099 ;
	setAttr ".rpt" -type "double3" -0.008651459280836906 0.070108130963168008 -0.061456671682331078 ;
	setAttr ".sp" -type "double3" 0.070108130963168036 0 0.061456671682331099 ;
createNode mesh -n "Easy_btnShape" -p "Easy_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.098108128 -9.9727972e-017 
		-0.052293357 0.04210816 8.3446501e-008 -0.052293357 0.098108143 -9.9718264e-017 0.17520666 
		0.042108115 -9.7013059e-017 0.17520672;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Hard_btn" -p "_pos";
	setAttr ".t" -type "double3" 0.065526965269061072 -0.1001544728045255 2.0445799319190723e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" 0.070108130963168036 0 -0.061591444366544554 ;
	setAttr ".rpt" -type "double3" -0.13169957532971258 0.070108130963168064 0.061591444366544526 ;
	setAttr ".sp" -type "double3" 0.070108130963168036 0 -0.061591444366544554 ;
createNode mesh -n "Hard_btnShape" -p "Hard_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.098108128 -9.9750729e-017 
		-0.17534147 0.04210816 8.3446501e-008 -0.17534147 0.098108143 -9.9741021e-017 0.052158549 
		0.042108115 -9.703581e-017 0.052158609;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Normal_btn" -p "_pos";
	setAttr ".t" -type "double3" -0.02152341290565267 -0.1001544728045255 1.6579985953114952e-016 ;
	setAttr ".r" -type "double3" 89.999999999999972 3.180554681463516e-015 89.999999999999972 ;
	setAttr ".rp" -type "double3" 0.070108130963168092 0 -0.00065617964424499742 ;
	setAttr ".rpt" -type "double3" -0.070764310607413061 0.070108130963168092 0.00065617964424499709 ;
	setAttr ".sp" -type "double3" 0.070108130963168092 0 -0.00065617964424499742 ;
createNode mesh -n "Normal_btnShape" -p "Normal_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.098108128 -9.973946e-017 
		-0.11440621 0.04210816 8.3446501e-008 -0.11440621 0.098108143 -9.9729752e-017 0.11309382 
		0.042108115 -9.702454e-017 0.11309388;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "diffBack_btn" -p "_pos";
	setAttr ".t" -type "double3" 0.099570412120873475 -0.068225102075524346 0.00082879106559430316 ;
	setAttr ".r" -type "double3" 89.999999999999972 0 89.999999999999972 ;
	setAttr ".s" -type "double3" 0.59107009622003881 0.59107009622003859 0.5910700962200397 ;
	setAttr ".rp" -type "double3" 0.0387004178021539 0.0011979403080061785 -0.052059603725570516 ;
	setAttr ".rpt" -type "double3" -0.090760021527724402 0.03750247749414775 0.053257544033576673 ;
	setAttr ".sp" -type "double3" 0.06547517468680536 0.0020267313736004322 -0.088076869492294735 ;
	setAttr ".spt" -type "double3" -0.026774756884651463 -0.00082879106559425382 0.036017265766724219 ;
createNode mesh -n "diffBack_btnShape" -p "diffBack_btn";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 1.000000476837 1.1920929e-007
		 1.000000476837 0.99999964 7.1525574e-007 1.000000596046 7.7486038e-007 -3.5762787e-007;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.085599348 0.0020267314 
		-0.18202092 0.045351014 0.0020267915 -0.18202092 0.085599363 0.0020267314 0.0058671548 
		0.045350984 0.0020267314 0.0058672051;
	setAttr -s 4 ".vt[0:3]"  -0.039999992 0 0.12500003 0.039999962 -1.1920929e-007 0.12500003
		 -0.040000021 0 -0.12499999 0.040000021 0 -0.12500006;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 2 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "holoTable";
createNode mesh -n "holoTableShape" -p "holoTable";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:671]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 1433 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.65240002 0.20389999 0.62690002
		 0.25569999 0.26460001 0.25569999 0.23899999 0.20370001 0.7202 0.083099999 0.76709998
		 0.050999999 0.78049999 0.059799999 0.73150003 0.0911 0.79170001 0.070900001 0.74119997
		 0.1012 0.80000001 0.083999999 0.74839997 0.1132 0.80470002 0.098399997 0.75279999
		 0.1266 0.80589998 0.1137 0.75410002 0.1401 0.25060001 0.25749999 0.2226 0.20460001
		 0.2375 0.26280001 0.2071 0.20900001 0.2264 0.2712 0.19329999 0.2166 0.21780001 0.2823
		 0.18189999 0.2271 0.2061 0.29010001 0.1733 0.2401 0.80580002 0.76700002 0.75419998
		 0.74070001 0.2367 0.3001 0.2339 0.31349999 0.2186 0.30000001 0.243 0.2886 0.2525
		 0.27919999 0.2642 0.27320001 0.27700001 0.27129999 0.6146 0.27129999 0.70429999 0.094400004
		 0.71469998 0.102 0.72359997 0.1116 0.73019999 0.1232 0.73430002 0.1358 0.73760003
		 0.15090001 0.73970002 0.7281 0.26820001 0.33180001 0.26589999 0.3441 0.2737 0.32089999
		 0.28220001 0.31209999 0.29210001 0.3066 0.303 0.30469999 0.58850002 0.30469999 0.67909998
		 0.1257 0.67089999 0.1189 0.68660003 0.1347 0.69199997 0.1453 0.69559997 0.1568 0.6965
		 0.1691 0.70300001 0.70020002 0.70300001 0.1806 0.69 0.99620003 0.69 0.99989998 0.68339998
		 0.99989998 0.68339998 0.99620003 0.67690003 0.99989998 0.67690003 0.99620003 0.67049998
		 0.99989998 0.67049998 0.99620003 0.66439998 0.99989998 0.66439998 0.99620003 0.6584
		 0.99620003 0.6584 0.99989998 0.50599998 0.99989998 0.50599998 0.99620003 0.5 0.99989998
		 0.5 0.99620003 0.4939 0.99989998 0.4939 0.99620003 0.48750001 0.99620003 0.48750001
		 0.99989998 0.48100001 0.99620003 0.48100001 0.99989998 0.4743 0.99610001 0.4743 0.99989998
		 0.19230001 0.00050000002 0.20649999 0.001 0.2008 0.1031 0.1866 0.1026 0.2208 0.0012000001
		 0.215 0.1033 0.2351 0.0013 0.22939999 0.1034 0.2494 0.0013 0.244 0.1034 0.26359999
		 0.0012000001 0.2586 0.1031 0.62800002 0.0011 0.63300002 0.1029 1.00039994717 0.067900002
		 0.99980003 0.081799999 0.90079999 0.082800001 0.90140003 0.068599999 0.99919999 0.095600002
		 0.90009999 0.096900001 0.89999998 0.1113 0.99910003 0.1098 0.90039998 0.1251 0.99949998
		 0.1237 0.99940002 0.13779999 0.90009999 0.139 0.89990002 0.74159998 0.99949998 0.74269998
		 0.1698 0.2357 0.1787 0.2228 0.1601 0.18089999 0.17460001 0.18539999 0.1732 0.19050001
		 0.1584 0.18610001 0.19050001 0.2121 0.18960001 0.18889999 0.1886 0.1939 0.20460001
		 0.20029999 0.205 0.1912 0.22059999 0.1987 0.2209 0.1925 0.237 0.19840001 0.23710001
		 0.193 0.65420002 0.1987 0.65439999 0.19310001 0.78469998 0.056499999 0.7712 0.047499999
		 0.82950002 0.035799999 0.8247 0.050999999 0.81940001 0.0502 0.82410002 0.034699999
		 0.796 0.068099998 0.82080001 0.066299997 0.81569999 0.065499999 0.80879998 0.081100002
		 0.81809998 0.081600003 0.81050003 0.096199997 0.81650001 0.096699998 0.81089997 0.1115
		 0.81620002 0.1118 0.81089997 0.76880002 0.81629997 0.76899999 0.86809999 0.1194 0.86809999
		 0.76139998 0.86849999 0.1047 0.87 0.089900002 0.87260002 0.075000003 0.87629998 0.060199998
		 0.88099998 0.045499999 0.2446 0.14040001 0.64670002 0.1402 0.229 0.1402 0.21359999
		 0.139 0.19859999 0.1366 0.184 0.1332 0.1698 0.1288 0.8793 0.75980002 0.8793 0.121
		 0.87980002 0.1064 0.88129997 0.091700003 0.88389999 0.076899998 0.88749999 0.062199999
		 0.89219999 0.047600001 0.6451 0.1288 0.2463 0.12899999 0.2307 0.12890001 0.2155 0.1276
		 0.2006 0.12530001 0.186 0.1219 0.1719 0.1175 0.67680001 0.1045 0.67150003 0.1174
		 0.65630001 0.094099998 0.662 0.080399998 0.68540001 0.093400002 0.67119998 0.068599999
		 0.69679999 0.084899999 0.68330002 0.059599999 0.71020001 0.079599999 0.69749999 0.054000001
		 0.7245 0.0779 0.71280003 0.052200001 0.66549999 0.2545 0.6397 0.2445 0.63999999 0.2305
		 0.66579998 0.2396 0.6613 0.2687 0.6358 0.2579 0.65369999 0.28119999 0.62849998 0.2696
		 0.64310002 0.29100001 0.61860001 0.27880001 0.63050002 0.29769999 0.60659999 0.2852
		 0.86290002 0.97119999 0.86290002 0.82010001 0.89999998 0.82010001 0.89999998 0.97119999
		 0.93709999 0.82010001 0.93709999 0.97119999 0.64039999 0.97119999 0.64039999 0.82010001
		 0.67750001 0.82010001 0.67750001 0.97119999 0.71460003 0.97119999 0.71460003 0.82010001
		 0.75169998 0.82010001 0.75169998 0.97119999 0.7888 0.82010001 0.7888 0.97119999 0.8258
		 0.82010001 0.8258 0.97119999 0.1787 0.85970002 0.15279999 0.84969997 0.199 0.76889998
		 0.20649999 0.8617 0.23360001 0.85530001 0.25760001 0.84119999 0.27630001 0.82059997
		 0.28819999 0.79549998 0.292 0.76789999 0.28760001 0.74040002 0.27520001 0.7155 0.25600001
		 0.6954 0.2317 0.68180001 0.2045 0.676 0.1768 0.6785 0.131 0.83240002 0.2405 0.55669999
		 0.2396 0.58109999 0.17460001 0.5729 0.18000001 0.54930001 0.1197 0.52749997 0.1095
		 0.55000001 0.0656 0.4964 0.051399998 0.5165 0.0184 0.45550001 0.00060000003 0.47260001
		 0.0513 0.5165 0.1197 0.52740002 0.17470001 0.54759997 0.1688 0.5711 0.00050000002
		 0.47260001 0.055500001 0.29640001 0.033300001 0.30489999 0.0189 0.25040001 0.042399999
		 0.24680001 0.016100001 0.19419999;
	setAttr ".uvst[0].uvsp[250:499]" 0.039900001 0.1955 0.0251 0.13860001 0.048099998
		 0.14480001 0.045499999 0.086099997 0.066600002 0.097000003 0.094700001 0.054000001
		 0.076300003 0.039000001 0.1157 -0.00039999999 0.1311 0.0178 0.3538 0.4698 0.3477
		 0.44679999 0.39570001 0.42860001 0.40599999 0.4501 0.29820001 0.47830001 0.29699999
		 0.45460001 0.2419 0.4752 0.2458 0.4517 0.1876 0.46039999 0.1962 0.4382 0.1376 0.4346
		 0.1506 0.4147 0.093900003 0.39899999 0.1108 0.38229999 0.058699999 0.35510001 0.078599997
		 0.34220001 0.1034 0.2374 0.1132 0.27450001 0.1015 0.199 0.1076 0.161 0.1215 0.1252
		 0.1425 0.093000002 0.1698 0.065899998 0.33199999 0.38710001 0.368 0.37349999 0.294
		 0.39300001 0.25569999 0.3908 0.2186 0.38069999 0.18440001 0.36309999 0.15459999 0.33880001
		 0.1305 0.30880001 0.095799997 0.66600001 0.060800001 0.72170001 0.02 0.70740002 0.065300003
		 0.6354 0.1373 0.59020001 0.1516 0.63099998 0.2218 0.5808 0.21699999 0.62370002 0.3021
		 0.60890001 0.2791 0.6455 0.36219999 0.66909999 0.3256 0.69209999 0.39019999 0.74940002
		 0.34729999 0.75419998 0.38060001 0.83389997 0.3398 0.81959999 0.3353 0.90579998 0.3048
		 0.87529999 0.2633 0.95099998 0.249 0.9102 0.1788 0.9605 0.1837 0.91750002 0.098499998
		 0.93239999 0.1216 0.89579999 0.075099997 0.84920001 0.038400002 0.87220001 0.0104
		 0.79189998 0.053399999 0.78710002 0.071599998 0.9957 0.00019999999 0.9957 0.00019999999
		 0.9903 0.071599998 0.9903 0.92839998 0.9957 0.92839998 0.9903 0.99980003 0.9903 0.99980003
		 0.9957 0.85699999 0.9957 0.85699999 0.9903 0.78560001 0.9957 0.78560001 0.9903 0.71420002
		 0.9957 0.71420002 0.9903 0.64279997 0.9957 0.64279997 0.9903 0.57139999 0.9957 0.57139999
		 0.9903 0.5 0.9957 0.5 0.9903 0.42860001 0.9957 0.42860001 0.9903 0.3572 0.9957 0.3572
		 0.9903 0.28580001 0.9957 0.28580001 0.9903 0.21439999 0.9957 0.21439999 0.9903 0.14300001
		 0.9957 0.14300001 0.9903 0.2987 0.75849998 0.29449999 0.75889999 0.28040001 0.71850002
		 0.28400001 0.71630001 0.29370001 0.8028 0.2897 0.80140001 0.26989999 0.84060001 0.2669
		 0.83770001 0.2321 0.86440003 0.2307 0.86040002 0.1877 0.86940002 0.1882 0.86519998
		 0.1455 0.85460001 0.1478 0.85100001 0.114 0.82300001 0.1175 0.82069999 0.099200003
		 0.78079998 0.1034 0.78030002 0.1083 0.7378 0.1043 0.73640001 0.12809999 0.69859999
		 0.131 0.70160002 0.16590001 0.6749 0.1673 0.6789 0.2103 0.6699 0.2098 0.67409998
		 0.25240001 0.68470001 0.2502 0.68830001 0.071599998 0.98110002 0.071599998 0.98940003
		 0.00019999999 0.98940003 0.00019999999 0.98110002 0.14300001 0.98110002 0.14300001
		 0.98940003 0.21439999 0.98940003 0.21439999 0.98110002 0.28580001 0.98110002 0.28580001
		 0.98940003 0.3572 0.98110002 0.3572 0.98940003 0.42860001 0.98110002 0.42860001 0.98940003
		 0.5 0.98110002 0.5 0.98940003 0.57139999 0.98110002 0.57139999 0.98940003 0.64279997
		 0.98110002 0.64279997 0.98940003 0.71420002 0.98110002 0.71420002 0.98940003 0.78560001
		 0.98110002 0.78560001 0.98940003 0.85699999 0.98110002 0.85699999 0.98940003 0.92839998
		 0.98110002 0.92839998 0.98940003 0.99980003 0.98940003 0.99980003 0.98110002 0.0656
		 0.71969998 0.096500002 0.6706 0.1178 0.6911 0.0933 0.73000002 0.1444 0.63779998 0.1558
		 0.66509998 0.2014 0.62690002 0.20100001 0.65640002 0.25799999 0.63950002 0.24590001
		 0.66640002 0.30489999 0.67360002 0.28310001 0.69349998 0.3344 0.72359997 0.30649999
		 0.7331 0.34150001 0.78119999 0.31209999 0.77880001 0.3251 0.8369 0.29910001 0.8229
		 0.2879 0.88139999 0.2696 0.85820001 0.2361 0.90740001 0.22849999 0.87889999 0.1781
		 0.91070002 0.1825 0.88150001 0.13940001 0.86549997 0.1237 0.89060003 0.1061 0.8337
		 0.081799999 0.85049999 0.059300002 0.79699999 0.088299997 0.7913 0.3035 0.7992 0.28549999
		 0.83560002 0.2816 0.8326 0.2987 0.79790002 0.2554 0.8628 0.2529 0.85860002 0.2175
		 0.87709999 0.2166 0.87220001 0.1769 0.87639999 0.1779 0.87159997 0.13940001 0.86089998
		 0.14210001 0.8567 0.1102 0.8326 0.1143 0.82980001 0.093500003 0.79570001 0.098300003
		 0.79449999 0.091499999 0.75510001 0.0964 0.75580001 0.1045 0.71670002 0.1088 0.7191
		 0.13070001 0.6857 0.1338 0.68959999 0.1665 0.66659999 0.168 0.67129999 0.2068 0.66189998
		 0.20649999 0.66680002 0.24600001 0.6724 0.2439 0.67680001 0.27869999 0.6965 0.27500001
		 0.69989997 0.28580001 0.97219998 0.28580001 0.9806 0.21439999 0.9806 0.21439999 0.97219998
		 0.14300001 0.9806 0.14300001 0.97219998 0.071599998 0.9806 0.071599998 0.97219998
		 0.00019999999 0.9806 0.00019999999 0.97219998 0.92839998 0.97219998 0.99980003 0.97219998
		 0.99980003 0.9806 0.92839998 0.9806 0.85699999 0.97219998 0.85699999 0.9806 0.78560001
		 0.97219998 0.78560001 0.9806 0.71420002 0.97219998 0.71420002 0.9806 0.64279997 0.97219998
		 0.64279997 0.9806 0.57139999 0.97219998 0.57139999 0.9806 0.5 0.97219998 0.5 0.9806
		 0.42860001 0.97219998 0.42860001 0.9806 0.3572 0.97219998 0.3572 0.9806 0.1164 0.2053
		 0.12 0.1866 0.15790001 0.19400001 0.1543 0.21269999;
	setAttr ".uvst[0].uvsp[500:749]" 0.16150001 0.1753 0.1236 0.1679 0.12729999
		 0.14920001 0.16509999 0.1566 0.1688 0.13789999 0.1309 0.1305 0.1345 0.1118 0.1724
		 0.1191 0.1128 0.22400001 0.1506 0.2314 0.147 0.25009999 0.1091 0.2428 0.47389999
		 0.76370001 0.4506 0.77469999 0.45089999 0.74489999 0.4276 0.76319999 0.42210001 0.73790002
		 0.43830001 0.71780002 0.4641 0.71810001 0.4799 0.7385 0.4501 0.78210002 0.45050001
		 0.77569997 0.47479999 0.76419997 0.47929999 0.7683 0.42120001 0.76770002 0.42649999
		 0.76370001 0.4208 0.73729998 0.41440001 0.73589998 0.4348 0.71069998 0.4377 0.71640003
		 0.46450001 0.71670002 0.46700001 0.71109998 0.48679999 0.7367 0.48100001 0.73799998
		 0.117 0.1849 0.1204 0.1681 0.1227 0.16850001 0.1194 0.18529999 0.1157 0.2043 0.1133
		 0.20389999 0.112 0.2234 0.1096 0.2229 0.1059 0.2419 0.1083 0.24240001 0.1314 0.111
		 0.1338 0.1114 0.1301 0.1305 0.1277 0.13 0.12639999 0.1495 0.1241 0.149 0.62379998
		 0.80809999 0.41729999 0.8075 0.41229999 0.78210002 0.62889999 0.7827 0.00079999998
		 0.66240001 0.0093 0.66780001 0.0092000002 0.88639998 0.00069999998 0.89179999 0.0277
		 0.4043 0.00069999998 0.4104 0.0011 0.2527 0.012 0.25479999 0.39399999 0.55930001
		 0.40490001 0.55720001 0.40470001 0.71490002 0.3777 0.7087 0.40040001 0.78479999 0.40259999
		 0.78380001 0.40799999 0.80860001 0.4057 0.80930001 0.405 0.78299999 0.41029999 0.80809999
		 0.40740001 0.78250003 0.41260001 0.80779999 0.40990001 0.78219998 0.41499999 0.80760002
		 0.63139999 0.78280002 0.6261 0.8082 0.62849998 0.80839998 0.63389999 0.78310001 0.63630003
		 0.78369999 0.63080001 0.80870003 0.63859999 0.7845 0.63309997 0.80930001 0.64090002
		 0.78549999 0.6354 0.81 0.0144 0.65679997 0.0126 0.65850002 0.0037 0.65240002 0.0055
		 0.6505 0.0111 0.66049999 0.0024000001 0.65469998 0.0101 0.66280001 0.0015 0.65719998
		 0.0094999997 0.66530001 0.001 0.65969998 0.0093999999 0.88889998 0.00079999998 0.8944
		 0.0099999998 0.89130002 0.0013 0.89700001 0.011 0.89359999 0.0022 0.8994 0.0124 0.89569998
		 0.0035999999 0.90170002 0.0143 0.89740002 0.0052999998 0.90369999 0.4025 0.8179 0.40400001
		 0.96090001 0.40270001 0.96179998 0.40090001 0.81690001 0.41069999 0.81019998 0.40970001
		 0.8089 0.62949997 0.80879998 0.62840003 0.81029999 0.63770002 0.96149999 0.63630003
		 0.81849998 0.63749999 0.81760001 0.63929999 0.96240002 0.62949997 0.96920002 0.63129997
		 0.97030002 0.41029999 0.97049999 0.4118 0.9691 0.40149999 0.8143 0.40290001 0.8154
		 0.40290001 0.81209999 0.40419999 0.8132 0.4048 0.81029999 0.40599999 0.81160003 0.4082
		 0.81050003 0.40709999 0.80919999 0.63209999 0.80940002 0.63099998 0.81080002 0.63429999
		 0.81080002 0.63309997 0.81199998 0.63609999 0.81269997 0.63480002 0.81379998 0.6372
		 0.815 0.6358 0.8161 0.40439999 0.96329999 0.403 0.96429998 0.40540001 0.9655 0.4041
		 0.96670002 0.40709999 0.9673 0.4059 0.96859998 0.40799999 0.96990001 0.40920001 0.96859998
		 0.63200003 0.96880001 0.6336 0.97000003 0.63419998 0.96780002 0.63569999 0.9691 0.63599998
		 0.96609998 0.63730001 0.9673 0.63730001 0.96399999 0.63870001 0.96499997 0.4104 0.82539999
		 0.4122 0.95340002 0.62120003 0.81879997 0.41780001 0.81889999 0.62980002 0.954 0.62809998
		 0.82599998 0.419 0.96060002 0.62239999 0.96039999 0.41069999 0.82340002 0.4118 0.82160002
		 0.41339999 0.82020003 0.41549999 0.81919998 0.62330002 0.81910002 0.62519997 0.82010001
		 0.62669998 0.82179999 0.62769997 0.82380003 0.41249999 0.95560002 0.41350001 0.9576
		 0.41499999 0.95920002 0.417 0.96030003 0.62470001 0.9601 0.6268 0.95920002 0.62849998
		 0.95770001 0.62949997 0.95590001 0.6473 0.1301 0.65039998 0.1294 0.68660003 0.30509999
		 0.68349999 0.3057 0.63279998 0.0254 0.63590002 0.024700001 0.69330001 0.3037 0.69019997
		 0.30430001 0.64999998 0.12630001 0.65310001 0.1257 0.68919998 0.30140001 0.68610001
		 0.30199999 0.63639998 0.024499999 0.63950002 0.0239 0.69690001 0.3028 0.69379997
		 0.30340001 0.62959999 0.0097000003 0.63260001 0.0091000004 0.63330001 0.0122 0.63020003
		 0.0128 0.63389999 0.0152 0.63080001 0.015900001 0.63150001 0.018999999 0.63459998
		 0.0184 0.63209999 0.0222 0.63520002 0.021500001 0.64740002 0.1139 0.64679998 0.1107
		 0.64990002 0.1101 0.6505 0.1133 0.6512 0.1165 0.64810002 0.1171 0.65179998 0.1196
		 0.6487 0.1202 0.6494 0.1233 0.65240002 0.1227 0.64969999 0.12639999 0.64660001 0.127
		 0.64600003 0.1239 0.64910001 0.1233 0.64539999 0.1208 0.64850003 0.1202 0.64469999
		 0.1176 0.64780003 0.117 0.64410001 0.1145 0.64709997 0.1138 0.6358 0.021299999 0.63889998
		 0.0207 0.63510001 0.018100001 0.63819999 0.0175 0.63450003 0.015 0.6376 0.0144 0.63380003
		 0.0119 0.63690001 0.0113 0.6868 0.30509999 0.68980002 0.30450001 0.62410003 0.82080001
		 0.62400001 0.95950001 0.41679999 0.95950001 0.41690001 0.82069999 0.18350001 0.99620003
		 0.18350001 0.99989998 0.177 0.99989998 0.177 0.99620003 0.1706 0.99989998 0.1706
		 0.99620003 0.1645 0.99989998 0.1645 0.99620003 0.1585 0.99620003 0.1585 0.99989998
		 0.0060000001 0.99989998 0.0060000001 0.99620003;
	setAttr ".uvst[0].uvsp[750:999]" 0.000099999997 0.99989998 0.000099999997 0.99620003
		 0.99989998 0.99620003 0.99989998 0.99989998 0.99379998 0.99989998 0.99379998 0.99620003
		 0.98750001 0.99620003 0.98750001 0.99989998 0.98089999 0.99620003 0.98089999 0.99989998
		 0.97420001 0.99620003 0.97420001 0.99989998 0.99870002 0.1237 0.89960003 0.1251 0.1901
		 0.99989998 0.1901 0.99589998 0.61720002 0.31990001 0.62440002 0.32120001 0.63090003
		 0.32480001 0.63609999 0.33039999 0.63940001 0.33759999 0.64050001 0.34549999 0.64050001
		 0.6846 0.63940001 0.6925 0.63609999 0.6997 0.63090003 0.70529997 0.62440002 0.70889997
		 0.61720002 0.71020001 0.4312 0.71020001 0.42399999 0.70889997 0.41749999 0.70529997
		 0.41240001 0.6997 0.4091 0.6925 0.40790001 0.6846 0.40790001 0.34549999 0.4091 0.33759999
		 0.41240001 0.33039999 0.41749999 0.32480001 0.42399999 0.32120001 0.4312 0.31990001
		 0.1183 0.81999999 0.1043 0.77990001 0.1989 0.7694 0.1091 0.7378 0.13160001 0.70200002
		 0.16760001 0.67940003 0.2097 0.67470002 0.24969999 0.68870002 0.27959999 0.71869999
		 0.29359999 0.75880003 0.2888 0.80089998 0.26629999 0.83679998 0.23029999 0.85930002
		 0.1882 0.86400002 0.14820001 0.85000002 0.19840001 0.3513 0.1841 0.33809999 0.21089999
		 0.30930001 0.2251 0.32249999 0.19670001 0.29609999 0.1699 0.3249 0.1557 0.3116 0.1825
		 0.28279999 0.1682 0.2696 0.1415 0.29840001 0.12729999 0.2852 0.154 0.25639999 0.21259999
		 0.36449999 0.2394 0.33570001 0.2536 0.34900001 0.22679999 0.37779999 0.34940001 0.96380001
		 0.33250001 0.94270003 0.36289999 0.9357 0.33860001 0.9163 0.36289999 0.90450001 0.38730001
		 0.9163 0.3933 0.94260001 0.37650001 0.96380001 0.32499999 0.94400001 0.33160001 0.94279999
		 0.34909999 0.9648 0.3461 0.97049999 0.33250001 0.9109 0.3378 0.91530001 0.36320001
		 0.90310001 0.36309999 0.8962 0.39359999 0.9109 0.38859999 0.91530001 0.39489999 0.94279999
		 0.4012 0.94389999 0.38 0.97049999 0.37729999 0.9648 0.18099999 0.33970001 0.1683
		 0.32780001 0.17 0.32600001 0.18260001 0.33790001 0.1971 0.35139999 0.1954 0.35319999
		 0.21160001 0.36480001 0.20990001 0.36660001 0.2244 0.38010001 0.2261 0.37830001 0.1249
		 0.28740001 0.1265 0.28560001 0.141 0.29899999 0.1393 0.3008 0.15549999 0.3125 0.1538
		 0.3143 0.78200001 0.040100001 0.7626 0.0403 0.7622 0.001 0.7816 0.00079999998 0.7428
		 0.0011 0.74309999 0.040399998 0.72369999 0.040600002 0.72329998 0.0013 0.70389998
		 0.0015 0.70429999 0.040800001 0.68489999 0.041000001 0.68449998 0.0017 0.80140001
		 0.039900001 0.801 0.00060000003 0.82050002 0.00039999999 0.82080001 0.039700001 0.62169999
		 0.76349998 0.59829998 0.77460003 0.59850001 0.74470001 0.57499999 0.76319999 0.56940001
		 0.73790002 0.58569998 0.71780002 0.61159998 0.71789998 0.62760001 0.73830003 0.59780002
		 0.78189999 0.59820002 0.7755 0.6225 0.764 0.62709999 0.76800001 0.56870002 0.7676
		 0.57389998 0.76359999 0.56809998 0.73729998 0.56169999 0.73589998 0.58209997 0.71069998
		 0.5851 0.71630001 0.61199999 0.71649998 0.61449999 0.71090001 0.63459998 0.73640001
		 0.62870002 0.73769999 0.76139998 0.0436 0.7439 0.043699998 0.7439 0.041200001 0.76139998
		 0.041200001 0.78109998 0.041000001 0.78119999 0.043499999 0.80089998 0.040800001
		 0.80089998 0.043299999 0.82069999 0.043099999 0.82069999 0.040600002 0.68470001 0.044199999
		 0.6846 0.0418 0.7044 0.0416 0.7044 0.044100001 0.72420001 0.0414 0.72420001 0.043900002
		 0.0049000001 0.61000001 0.0049999999 0.59060001 0.044300001 0.59079999 0.044199999
		 0.61019999 0.044399999 0.57139999 0.0051000002 0.57120001 0.0052 0.5517 0.044500001
		 0.55190003 0.044599999 0.53250003 0.0052999998 0.5323 0.0054000001 0.51289999 0.0447
		 0.51310003 0.0048000002 0.62940001 0.044100001 0.62959999 0.044 0.64910001 0.0046999999
		 0.64880002 0.5478 0.76289999 0.52450001 0.77410001 0.52450001 0.74430001 0.5011 0.76289999
		 0.49540001 0.73760003 0.51160002 0.71740001 0.53750002 0.71740001 0.55360001 0.73769999
		 0.52460003 0.78189999 0.52490002 0.7755 0.5492 0.76389998 0.55379999 0.76789999 0.49540001
		 0.76779997 0.50059998 0.76380002 0.4946 0.73750001 0.48820001 0.73619998 0.50840002
		 0.71079999 0.5115 0.71649998 0.53839999 0.71649998 0.54089999 0.71090001 0.56110001
		 0.73629999 0.55519998 0.73760003 0.00089999998 0.58939999 0.0011 0.57190001 0.0035999999
		 0.57190001 0.0033 0.58939999 0.0031999999 0.6092 0.00079999998 0.60909998 0.0031000001
		 0.62889999 0.00069999998 0.62889999 0.00060000003 0.6487 0.003 0.6487 0.0014 0.5126
		 0.0038999999 0.51270002 0.0038000001 0.53240001 0.0013 0.53240001 0.0037 0.55220002
		 0.0012000001 0.55220002 0.3707 0.3682 0.3527 0.37149999 0.34580001 0.3351 0.36379999
		 0.3317 0.32780001 0.33849999 0.33469999 0.37490001 0.31670001 0.37830001 0.3098 0.34189999
		 0.29179999 0.3452 0.2987 0.38170001 0.2807 0.38510001 0.27379999 0.3486 0.38870001
		 0.36480001 0.3818 0.3283 0.3998 0.32499999 0.40669999 0.36140001 0.036400001 0.063000001
		 0.0134 0.0524 0.0359 0.0339 0.0074 0.027899999 0.0228 0.0078999996 0.048 0.0074 0.064099997
		 0.026900001 0.058899999 0.0517 0.0077 0.056699999 0.0126 0.052999999 0.036600001
		 0.064000003 0.036400001 0.069899999 0.000099999997 0.025900001 0.0063 0.0274 0.022399999
		 0.0065000001 0.019400001 0.00079999998 0.051100001 0.00030000001;
	setAttr ".uvst[0].uvsp[1000:1249]" 0.048700001 0.0060999999 0.065499999 0.0264
		 0.071199998 0.024700001 0.0647 0.0557 0.0601 0.052099999 0.35210001 0.37490001 0.33590001
		 0.37779999 0.3355 0.37549999 0.35170001 0.37259999 0.37 0.36919999 0.37040001 0.3714
		 0.3883 0.36570001 0.3888 0.368 0.40709999 0.3646 0.4066 0.36230001 0.28099999 0.3881
		 0.28060001 0.3858 0.29890001 0.38240001 0.29929999 0.3847 0.31720001 0.37900001 0.31760001
		 0.38119999 0.96179998 0.038699999 0.94279999 0.038600001 0.9429 0.00030000001 0.9619
		 0.00039999999 0.92379999 0.00019999999 0.92369998 0.0385 0.9048 0.038400002 0.90490001
		 0.000099999997 0.88609999 0.000099999997 0.88599998 0.038400002 0.86720002 0.038400002
		 0.86729997 0.000099999997 0.98079997 0.038699999 0.98089999 0.00039999999 0.99980003
		 0.00050000002 0.99970001 0.038800001 0.0491 0.89649999 0.066699997 0.91579998 0.037900001
		 0.92430001 0.0625 0.94150001 0.039799999 0.95429999 0.015699999 0.94450003 0.0082
		 0.91949999 0.0231 0.89819998 0.073899999 0.91399997 0.067599997 0.9156 0.0493 0.8955
		 0.051899999 0.88990003 0.068700001 0.94630003 0.063299999 0.94239998 0.039700001
		 0.95569998 0.040199999 0.9623 0.0098999999 0.9501 0.0145 0.94550002 0.0066999998
		 0.91949999 0.00060000003 0.9188 0.019300001 0.89200002 0.022299999 0.89719999 0.94169998
		 0.041900001 0.92470002 0.0418 0.92470002 0.0394 0.94169998 0.039500002 0.96100003
		 0.0396 0.96100003 0.041999999 0.98030001 0.0396 0.98019999 0.041999999 0.99949998
		 0.042100001 0.99949998 0.039700001 0.86699998 0.0416 0.86699998 0.0392 0.88620001
		 0.039299998 0.88620001 0.041700002 0.90549999 0.039299998 0.90549999 0.041700002
		 0.9461 0.92930001 0.94599998 0.90859997 0.9878 0.90829998 0.98790002 0.92900002 0.98760003
		 0.88770002 0.94580001 0.88800001 0.94569999 0.86739999 0.98750001 0.8671 0.98729998
		 0.84640002 0.94550002 0.84670001 0.9454 0.82609999 0.98720002 0.8258 0.94630003 0.94989997
		 0.98799998 0.94959998 0.98820001 0.97030002 0.94639999 0.97060001 0.37220001 0.61449999
		 0.34909999 0.6275 0.34709999 0.597 0.32440001 0.61760002 0.31690001 0.59210002 0.33199999
		 0.5704 0.3585 0.5686 0.37639999 0.58829999 0.34909999 0.63499999 0.34900001 0.62849998
		 0.37310001 0.61489999 0.37810001 0.61870003 0.31830001 0.62260002 0.32339999 0.61809999
		 0.31549999 0.5916 0.30880001 0.59069997 0.32780001 0.56339997 0.33129999 0.56900001
		 0.35890001 0.56720001 0.361 0.56120002 0.38339999 0.58579999 0.3775 0.58759999 0.94239998
		 0.90740001 0.94239998 0.88880002 0.94499999 0.88880002 0.94499999 0.90740001 0.94510001
		 0.92839998 0.9425 0.92839998 0.94529998 0.94940001 0.94270003 0.94940001 0.94279999
		 0.97039998 0.9454 0.97039998 0.94190001 0.8258 0.94459999 0.8258 0.9447 0.84680003
		 0.94209999 0.84680003 0.94489998 0.8678 0.94220001 0.8678 0.18000001 0.54930001 0.17460001
		 0.5729 0.17460001 0.5729 0.18000001 0.54930001 0.0656 0.4964 0.0656 0.4964 0.1095
		 0.55000001 0.1095 0.55000001 0.1197 0.52749997 0.1095 0.55000001 0.0513 0.5165 0.1095
		 0.55000001 0.1197 0.52749997 0.0656 0.4964 0.0656 0.4964 0.0184 0.45550001 0.0513
		 0.5165 0.0656 0.4964 0.0513 0.5165 0.0184 0.45550001 0.0656 0.4964 0.1197 0.52740002
		 0.1095 0.55000001 0.0513 0.5165 0.1095 0.55000001 0.1197 0.52740002 0.65240002 0.20389999
		 0.62690002 0.25569999 0.26460001 0.25569999 0.23899999 0.20370001 0.23899999 0.20370001
		 0.26460001 0.25569999 0.25060001 0.25749999 0.2226 0.20460001 0.2375 0.26280001 0.2071
		 0.20900001 0.2226 0.20460001 0.25060001 0.25749999 0.2071 0.20900001 0.2375 0.26280001
		 0.2264 0.2712 0.19329999 0.2166 0.2264 0.2712 0.21780001 0.2823 0.18189999 0.2271
		 0.19329999 0.2166 0.18189999 0.2271 0.21780001 0.2823 0.2061 0.29010001 0.1733 0.2401
		 0.80580002 0.76700002 0.75419998 0.74070001 0.75410002 0.1401 0.80589998 0.1137 0.2367
		 0.3001 0.2339 0.31349999 0.2186 0.30000001 0.21780001 0.2823 0.2367 0.3001 0.21780001
		 0.2823 0.2264 0.2712 0.243 0.2886 0.2264 0.2712 0.2375 0.26280001 0.2525 0.27919999
		 0.243 0.2886 0.2525 0.27919999 0.2375 0.26280001 0.25060001 0.25749999 0.2642 0.27320001
		 0.25060001 0.25749999 0.26460001 0.25569999 0.27700001 0.27129999 0.2642 0.27320001
		 0.27700001 0.27129999 0.26460001 0.25569999 0.62690002 0.25569999 0.6146 0.27129999
		 0.73760003 0.15090001 0.75410002 0.1401 0.75419998 0.74070001 0.73970002 0.7281 0.2339
		 0.31349999 0.2367 0.3001 0.26820001 0.33180001 0.26589999 0.3441 0.2737 0.32089999
		 0.26820001 0.33180001 0.2367 0.3001 0.243 0.2886 0.243 0.2886 0.2525 0.27919999 0.28220001
		 0.31209999 0.2737 0.32089999 0.2642 0.27320001 0.29210001 0.3066 0.28220001 0.31209999
		 0.2525 0.27919999 0.27700001 0.27129999 0.303 0.30469999 0.29210001 0.3066 0.2642
		 0.27320001 0.27700001 0.27129999 0.6146 0.27129999 0.58850002 0.30469999 0.303 0.30469999
		 0.67909998 0.1257 0.67089999 0.1189 0.70429999 0.094400004 0.71469998 0.102 0.68660003
		 0.1347 0.67909998 0.1257 0.71469998 0.102 0.72359997 0.1116 0.73019999 0.1232 0.69199997
		 0.1453 0.68660003 0.1347 0.72359997 0.1116 0.69559997 0.1568 0.69199997 0.1453 0.73019999
		 0.1232;
	setAttr ".uvst[0].uvsp[1250:1432]" 0.73430002 0.1358 0.73760003 0.15090001 0.6965
		 0.1691 0.69559997 0.1568 0.73430002 0.1358 0.73760003 0.15090001 0.73970002 0.7281
		 0.70300001 0.70020002 0.70300001 0.1806 0.19230001 0.00050000002 0.20649999 0.001
		 0.2008 0.1031 0.1866 0.1026 0.20649999 0.001 0.2208 0.0012000001 0.215 0.1033 0.2008
		 0.1031 0.2208 0.0012000001 0.2351 0.0013 0.22939999 0.1034 0.215 0.1033 0.2494 0.0013
		 0.244 0.1034 0.22939999 0.1034 0.2351 0.0013 0.244 0.1034 0.2494 0.0013 0.26359999
		 0.0012000001 0.2586 0.1031 0.62800002 0.0011 0.63300002 0.1029 0.2586 0.1031 0.26359999
		 0.0012000001 1.00039994717 0.067900002 0.99980003 0.081799999 0.90079999 0.082800001
		 0.90140003 0.068599999 0.99940002 0.13779999 0.90009999 0.139 0.89990002 0.74159998
		 0.90009999 0.139 0.99940002 0.13779999 0.99949998 0.74269998 0.1698 0.2357 0.1787
		 0.2228 0.18189999 0.2271 0.1733 0.2401 0.1601 0.18089999 0.17460001 0.18539999 0.1732
		 0.19050001 0.1584 0.18610001 0.19050001 0.2121 0.19329999 0.2166 0.18189999 0.2271
		 0.1787 0.2228 0.17460001 0.18539999 0.18960001 0.18889999 0.1886 0.1939 0.1732 0.19050001
		 0.19050001 0.2121 0.20460001 0.20029999 0.2071 0.20900001 0.19329999 0.2166 0.18960001
		 0.18889999 0.205 0.1912 0.20460001 0.20029999 0.1886 0.1939 0.2071 0.20900001 0.20460001
		 0.20029999 0.22059999 0.1987 0.2226 0.20460001 0.205 0.1912 0.2209 0.1925 0.22059999
		 0.1987 0.20460001 0.20029999 0.2226 0.20460001 0.22059999 0.1987 0.237 0.19840001
		 0.23899999 0.20370001 0.22059999 0.1987 0.2209 0.1925 0.23710001 0.193 0.237 0.19840001
		 0.23899999 0.20370001 0.237 0.19840001 0.65420002 0.1987 0.65240002 0.20389999 0.23710001
		 0.193 0.65439999 0.19310001 0.65420002 0.1987 0.237 0.19840001 0.81089997 0.76880002
		 0.80580002 0.76700002 0.80589998 0.1137 0.81089997 0.1115 0.81620002 0.1118 0.81629997
		 0.76899999 0.81089997 0.76880002 0.81089997 0.1115 0.86809999 0.1194 0.86809999 0.76139998
		 0.81629997 0.76899999 0.81620002 0.1118 0.2446 0.14040001 0.64670002 0.1402 0.65439999
		 0.19310001 0.23710001 0.193 0.2446 0.14040001 0.23710001 0.193 0.2209 0.1925 0.229
		 0.1402 0.205 0.1912 0.21359999 0.139 0.229 0.1402 0.2209 0.1925 0.19859999 0.1366
		 0.21359999 0.139 0.205 0.1912 0.18960001 0.18889999 0.19859999 0.1366 0.18960001
		 0.18889999 0.17460001 0.18539999 0.184 0.1332 0.184 0.1332 0.17460001 0.18539999
		 0.1601 0.18089999 0.1698 0.1288 0.8793 0.75980002 0.86809999 0.76139998 0.86809999
		 0.1194 0.8793 0.121 0.6451 0.1288 0.64670002 0.1402 0.2446 0.14040001 0.2463 0.12899999
		 0.2463 0.12899999 0.2446 0.14040001 0.229 0.1402 0.2307 0.12890001 0.2307 0.12890001
		 0.229 0.1402 0.21359999 0.139 0.2155 0.1276 0.2155 0.1276 0.21359999 0.139 0.19859999
		 0.1366 0.2006 0.12530001 0.2006 0.12530001 0.19859999 0.1366 0.184 0.1332 0.186 0.1219
		 0.186 0.1219 0.184 0.1332 0.1698 0.1288 0.1719 0.1175 0.8793 0.121 0.90009999 0.139
		 0.89990002 0.74159998 0.8793 0.75980002 0.2463 0.12899999 0.2586 0.1031 0.63300002
		 0.1029 0.6451 0.1288 0.66549999 0.2545 0.6397 0.2445 0.63999999 0.2305 0.66579998
		 0.2396 0.6613 0.2687 0.6358 0.2579 0.6397 0.2445 0.66549999 0.2545 0.6358 0.2579
		 0.6613 0.2687 0.65369999 0.28119999 0.62849998 0.2696 0.62849998 0.2696 0.65369999
		 0.28119999 0.64310002 0.29100001 0.61860001 0.27880001 0.61860001 0.27880001 0.64310002
		 0.29100001 0.63050002 0.29769999 0.60659999 0.2852;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 761 ".vt";
	setAttr ".vt[0:165]"  -0.95848441 0.35179999 0.45629311 -0.8919844 0.44400001 0.40029311
		 -0.8919844 0.44400001 -0.39510679 -0.95848441 0.35179999 -0.45110679 -0.95378441 0.3511 0.49179316
		 -0.88718438 0.44400001 0.43099308 -0.93888438 0.3506 0.52369308 -0.87298441 0.44400001 0.45869327
		 -0.9152844 0.35049999 0.54899311 -0.85098439 0.44400001 0.4806931 -0.88528442 0.35080001 0.56479311
		 -0.82328439 0.44400001 0.49479318 -0.85178441 0.35159999 0.56979322 -0.79258442 0.44400001 0.49969316
		 -0.88718438 0.44400001 -0.42580676 -0.95378441 0.3511 -0.48660684 -0.87298441 0.44400001 -0.45350695
		 -0.93888438 0.3506 -0.5186069 -0.85098439 0.44400001 -0.47550678 -0.9152844 0.35049999 -0.54380679
		 -0.82328439 0.44400001 -0.48970675 -0.88528442 0.35080001 -0.55970693 -0.79298437 0.44400001 -0.49420691
		 -0.85218441 0.35159999 -0.56430674 0.61661553 0.35159999 0.57009315 0.55751562 0.44400001 0.49999309
		 -0.7938844 0.45629999 -0.4562068 -0.76458442 0.45629999 -0.46040678 -0.82058442 0.45629999 -0.44300675
		 -0.84178442 0.45629999 -0.42250681 -0.85538441 0.45629999 -0.39670682 -0.86008441 0.45629999 -0.36810684
		 -0.86008441 0.45629999 0.37319326 -0.85538441 0.45629999 0.40179324 -0.84178442 0.45629999 0.42769313
		 -0.82058442 0.45629999 0.44819307 -0.7938844 0.45629999 0.46129322 -0.76418436 0.45629999 0.46589327
		 0.52911568 0.45629999 0.4661932 -0.72878444 0.4359 -0.38530684 -0.70198441 0.4359 -0.38870692
		 -0.75338435 0.4359 -0.37410688 -0.77278435 0.4359 -0.35680676 -0.7852844 0.4359 -0.33500695
		 -0.7895844 0.4359 -0.31080675 -0.7895844 0.4359 0.31589317 -0.7852844 0.4359 0.34009314
		 -0.77278435 0.4359 0.36189318 -0.75338435 0.4359 0.3792932 -0.72878444 0.4359 0.39039326
		 -0.70158446 0.4359 0.39419317 0.46651554 0.4359 0.39459324 -0.70198441 0.42089999 -0.38870692
		 -0.72878444 0.42089999 -0.38530684 -0.75338435 0.42089999 -0.37410688 -0.77278435 0.42089999 -0.35680676
		 -0.7852844 0.42089999 -0.33500695 -0.7895844 0.42089999 -0.31080675 -0.7895844 0.42089999 0.31589317
		 -0.7852844 0.42089999 0.34009314 -0.77278435 0.42089999 0.36189318 -0.75338435 0.42089999 0.3792932
		 -0.72878444 0.42089999 0.39039326 -0.70158446 0.4201 0.39419317 -0.79758441 -0.065899998 -0.49710679
		 -0.82818443 -0.065899998 -0.49250674 -0.82528442 0.1576 -0.50620675 -0.79508436 0.1575 -0.51090693
		 -0.85598439 -0.065899998 -0.47830677 -0.85288441 0.1576 -0.49160695 -0.87808442 -0.065899998 -0.4562068
		 -0.87478441 0.1576 -0.46890688 -0.89228439 -0.065899998 -0.42830682 -0.88878441 0.1575 -0.44020677
		 -0.89718443 -0.065899998 -0.39740682 -0.89358443 0.1575 -0.40850687 -0.89718443 -0.065899998 0.40259314
		 -0.89358443 0.1575 0.41359305 -0.89228439 -0.065899998 0.43349314 -0.88878441 0.1575 0.44539309
		 -0.87808442 -0.065899998 0.46139312 -0.87478441 0.1576 0.47399306 -0.85288441 0.1576 0.49669313
		 -0.85598439 -0.065899998 0.48349309 -0.82528442 0.1576 0.51129317 -0.82818443 -0.065899998 0.49769306
		 -0.79728436 -0.065899998 0.50259304 -0.79468441 0.1575 0.51629305 0.55961561 0.1575 0.51669312
		 0.56211567 -0.065899998 0.50289321 -0.85628438 0.34130001 -0.56920695 -0.88928443 0.34079999 -0.56420684
		 -0.85668439 0.32910001 -0.56970692 -0.88958442 0.3292 -0.56440687 -0.9192844 0.3407 -0.54800677
		 -0.91948438 0.3292 -0.54820681 -0.94308442 0.3407 -0.52270675 -0.94328439 0.3292 -0.52280688
		 -0.95818442 0.3409 -0.49060678 -0.95848441 0.3292 -0.49090695 -0.96328443 0.34130001 -0.45510674
		 -0.9637844 0.32910001 -0.4555068 -0.96328443 0.34130001 0.46029305 -0.9637844 0.32910001 0.46059322
		 -0.95818442 0.3409 0.4957931 -0.95848441 0.3292 0.49599314 -0.94308442 0.3407 0.52779317
		 -0.94328439 0.3292 0.5279932 -0.9192844 0.3407 0.55319309 -0.91948438 0.3292 0.55329323
		 -0.88928443 0.34079999 0.56929326 -0.88958442 0.3292 0.56959319 -0.85598439 0.34130001 0.5746932
		 -0.8563844 0.32910001 0.57519317 0.62081552 0.34130001 0.57509327 0.62121558 0.32910001 0.5754931
		 -0.83778441 0.2147 0.55409312 0.60561562 0.2147 0.55449319 -0.87178439 0.2148 0.54869318
		 -0.90108442 0.2148 0.53309321 -0.92438442 0.2148 0.50869322 -0.93928438 0.2147 0.47789311
		 -0.94448441 0.2147 0.44379306 -0.94448441 0.2147 -0.43870687 -0.93928438 0.2147 -0.47280693
		 -0.92438442 0.2148 -0.5035069 -0.90108442 0.2148 -0.52790689 -0.87178439 0.2148 -0.54360676
		 -0.83958441 0.2147 -0.54860687 0.6018157 0.1899 0.54989314 -0.83408439 0.1899 0.54959321
		 -0.8678844 0.1899 0.54419327 -0.89708441 0.1899 0.5286932 -0.92028439 0.1899 0.50449324
		 -0.93518442 0.1899 0.47399306 -0.94028443 0.18979999 0.44019318 -0.94028443 0.18979999 -0.43500686
		 -0.93518442 0.1899 -0.46880674 -0.92028439 0.1899 -0.49930692 -0.89708441 0.1899 -0.52350688
		 -0.8678844 0.1899 -0.53910685 -0.83588439 0.1899 -0.54410696 0.95121551 0.3161 -0.68080688
		 0.95121551 -0.063600004 -0.68080688 0.89311552 -0.063600004 -0.7536068 0.89311552 0.3161 -0.7536068
		 0.80921555 -0.063600004 -0.79410696 0.80921555 0.3161 -0.79410696 0.63201571 0.3161 -0.42620683
		 0.63201571 -0.063600004 -0.42620683 0.71601558 -0.063600004 -0.3858068 0.71601558 0.3161 -0.3858068
		 0.80921555 0.3161 -0.3858068 0.80921555 -0.063600004 -0.3858068 0.89311552 -0.063600004 -0.42620683
		 0.89311552 0.3161 -0.42620683 0.95121551 -0.063600004 -0.49910688 0.95121551 0.3161 -0.49910688
		 0.97201562 -0.063600004 -0.58990693 0.97201562 0.3161 -0.58990693 0.76261568 0.1673 -0.58990693
		 0.71601558 -0.063600004 -0.79410696 0.63201571 -0.063600004 -0.7536068 0.57391548 -0.063600004 -0.68080688
		 0.5532155 -0.063600004 -0.58990693 0.57391548 -0.063600004 -0.49910688;
	setAttr ".vt[166:331]" 0.82481551 0.54650003 -0.31730676 0.8295157 0.50190002 -0.29680681
		 0.95001554 0.50190002 -0.3548069 0.93691564 0.54650003 -0.3713069 0.70031548 0.54650003 -0.31730676
		 0.69571567 0.50190002 -0.29680681 0.58821559 0.54650003 -0.3713069 0.57511568 0.50190002 -0.3548069
		 0.51061559 0.54650003 -0.46860695 0.49171567 0.50190002 -0.45950675 0.48291564 0.54650003 -0.58990693
		 0.46191549 0.50190002 -0.58990693 0.51061559 0.54650003 -0.71120691 0.49171567 0.50190002 -0.72040677
		 0.58821559 0.54650003 -0.80850673 0.57511568 0.50190002 -0.82500696 0.70031548 0.54650003 -0.86250687
		 0.69571567 0.50190002 -0.88300681 0.82481551 0.54650003 -0.86250687 0.8295157 0.50190002 -0.88300681
		 0.95001554 0.50190002 -0.82500696 0.93691564 0.54650003 -0.80850673 1.014515638 0.54650003 -0.71120691
		 1.033515692 0.50190002 -0.72040677 1.042215586 0.54650003 -0.58990693 1.063215494 0.50190002 -0.58990693
		 1.014515638 0.54650003 -0.46860695 1.033515692 0.50190002 -0.45950675 0.93691564 0.44819999 -0.3713069
		 0.82481551 0.44819999 -0.31730676 0.70031548 0.44819999 -0.31730676 0.58821559 0.44819999 -0.3713069
		 0.51061559 0.44819999 -0.46860695 0.48291564 0.44819999 -0.58990693 0.51061559 0.44819999 -0.71120691
		 0.58821559 0.44819999 -0.80850673 0.70031548 0.44819999 -0.86250687 0.82481551 0.44819999 -0.86250687
		 0.93691564 0.44819999 -0.80850673 1.014515638 0.44819999 -0.71120691 1.042215586 0.44819999 -0.58990693
		 1.014515638 0.44819999 -0.46860695 0.57391548 0.3161 -0.49910688 0.5532155 0.3161 -0.58990693
		 0.57391548 0.3161 -0.68080688 0.63201571 0.3161 -0.7536068 0.71601558 0.3161 -0.79410696
		 0.89751554 0.54699999 -0.75910687 0.95751548 0.54699999 -0.6838069 0.81071568 0.54699999 -0.8009069
		 0.71441555 0.54699999 -0.8009069 0.62771559 0.54699999 -0.75910687 0.56761551 0.54699999 -0.6838069
		 0.54621553 0.54699999 -0.58990693 0.56761551 0.54699999 -0.49600673 0.62771559 0.54699999 -0.42070675
		 0.71441555 0.54699999 -0.37900686 0.81071568 0.54699999 -0.37900686 0.89751554 0.54699999 -0.42070675
		 0.95751548 0.54699999 -0.49600673 0.97891569 0.54699999 -0.58990693 0.89751554 0.53969997 -0.75910687
		 0.95751548 0.53969997 -0.6838069 0.81071568 0.53969997 -0.8009069 0.71441555 0.53969997 -0.8009069
		 0.62771559 0.53969997 -0.75910687 0.56761551 0.53969997 -0.6838069 0.54621553 0.53969997 -0.58990693
		 0.56761551 0.53969997 -0.49600673 0.62771559 0.53969997 -0.42070675 0.71441555 0.53969997 -0.37900686
		 0.81071568 0.53969997 -0.37900686 0.89751554 0.53969997 -0.42070675 0.95751548 0.53969997 -0.49600673
		 0.97891569 0.53969997 -0.58990693 0.89181566 0.53969997 -0.75200677 0.94931555 0.53969997 -0.67980695
		 0.80871558 0.53969997 -0.79200673 0.71641564 0.53969997 -0.79200673 0.63331556 0.53969997 -0.75200677
		 0.57581568 0.53969997 -0.67980695 0.55531549 0.53969997 -0.58990693 0.57581568 0.53969997 -0.50000691
		 0.63331556 0.53969997 -0.42790675 0.71641564 0.53969997 -0.38780689 0.80871558 0.53969997 -0.38780689
		 0.89181566 0.53969997 -0.42790675 0.94931555 0.53969997 -0.50000691 0.96981549 0.53969997 -0.58990693
		 0.89181566 0.55040002 -0.75200677 0.94931555 0.55040002 -0.67980695 0.80871558 0.55040002 -0.79200673
		 0.71641564 0.55040002 -0.79200673 0.63331556 0.55040002 -0.75200677 0.57581568 0.55040002 -0.67980695
		 0.55531549 0.55040002 -0.58990693 0.57581568 0.55040002 -0.50000691 0.63331556 0.55040002 -0.42790675
		 0.71641564 0.55040002 -0.38780689 0.80871558 0.55040002 -0.38780689 0.89181566 0.55040002 -0.42790675
		 0.94931555 0.55040002 -0.50000691 0.96981549 0.55040002 -0.58990693 0.86511564 0.56950003 -0.71840692
		 0.91071558 0.56950003 -0.66120696 0.79911566 0.56950003 -0.75020695 0.72601557 0.56950003 -0.75020695
		 0.66011548 0.56950003 -0.71840692 0.61451554 0.56950003 -0.66120696 0.59821558 0.56950003 -0.58990693
		 0.61451554 0.56950003 -0.5186069 0.66011548 0.56950003 -0.46140695 0.72601557 0.56950003 -0.42970681
		 0.79911566 0.56950003 -0.42970681 0.86511564 0.56950003 -0.46140695 0.91071558 0.56950003 -0.5186069
		 0.92701554 0.56950003 -0.58990693 0.8604157 0.56459999 -0.71260691 0.90391564 0.56459999 -0.65800691
		 0.79751563 0.56459999 -0.74290681 0.72771549 0.56459999 -0.74290681 0.66481566 0.56459999 -0.71260691
		 0.62121558 0.56459999 -0.65800691 0.60571551 0.56459999 -0.58990693 0.62121558 0.56459999 -0.52180696
		 0.66481566 0.56459999 -0.46730685 0.72771549 0.56459999 -0.43700695 0.79751563 0.56459999 -0.43700695
		 0.8604157 0.56459999 -0.46730685 0.90391564 0.56459999 -0.52180696 0.91951561 0.56459999 -0.58990693
		 0.90391564 0.5564 -0.65800691 0.8604157 0.5564 -0.71260691 0.79751563 0.5564 -0.74290681
		 0.72771549 0.5564 -0.74290681 0.66481566 0.5564 -0.71260691 0.62121558 0.5564 -0.65800691
		 0.60571551 0.5564 -0.58990693 0.62121558 0.5564 -0.52180696 0.66481566 0.5564 -0.46730685
		 0.72771549 0.5564 -0.43700695 0.79751563 0.5564 -0.43700695 0.8604157 0.5564 -0.46730685
		 0.90391564 0.5564 -0.52180696 0.91951561 0.5564 -0.58990693 0.90371561 0.5564 -0.65800691
		 0.86021566 0.5564 -0.71260691 0.7973156 0.5564 -0.74290681 0.7275157 0.5564 -0.74290681
		 0.66461563 0.5564 -0.71260691 0.62101555 0.5564 -0.65800691 0.60551548 0.5564 -0.58990693
		 0.62101555 0.5564 -0.52180696 0.66461563 0.5564 -0.46730685 0.7275157 0.5564 -0.43700695
		 0.7973156 0.5564 -0.43700695 0.86021566 0.5564 -0.46730685 0.90371561 0.5564 -0.52180696
		 0.91931558 0.5564 -0.58990693 0.96361566 0.5205 -0.45060682 0.94481564 0.5205 -0.45490694
		 0.94481564 0.55949998 -0.45490694 0.96361566 0.55949998 -0.45060682 0.92971563 0.55949998 -0.44280696
		 0.92971563 0.5205 -0.44280696 0.92971563 0.5205 -0.42360687;
	setAttr ".vt[332:497]" 0.92971563 0.55949998 -0.42360687 0.94481564 0.55949998 -0.41160679
		 0.94481564 0.5205 -0.41160679 0.96361566 0.5205 -0.41580677 0.96361566 0.55949998 -0.41580677
		 0.97201562 0.5205 -0.4332068 0.97201562 0.55949998 -0.4332068 0.96151567 0.5575 -0.4476068
		 0.94581556 0.5575 -0.45120692 0.94991565 0.5575 -0.4332068 0.93331552 0.5575 -0.44120693
		 0.93331552 0.5575 -0.4252069 0.94581556 0.5575 -0.41520691 0.96151567 0.5575 -0.41880679
		 0.9684155 0.5575 -0.4332068 0.94581556 0.55949998 -0.45120692 0.96151567 0.55949998 -0.4476068
		 0.93331552 0.55949998 -0.44120693 0.93331552 0.55949998 -0.4252069 0.94581556 0.55949998 -0.41520691
		 0.96151567 0.55949998 -0.41880679 0.9684155 0.55949998 -0.4332068 0.35741568 0.36590001 0.57869315
		 0.21201563 0.36590001 0.57869315 0.20851564 0.35210001 0.56729317 0.36101556 0.35210001 0.56729317
		 0.20851564 0.4413 0.50019312 0.21201563 0.44319999 0.50549316 0.35741568 0.44319999 0.50549316
		 0.36101556 0.4413 0.50019312 0.36281562 0.3698 0.57499313 0.36661553 0.3565 0.56399322
		 0.36661553 0.4368 0.50349307 0.36281562 0.43939999 0.50919318 0.20671558 0.43939999 0.50919318
		 0.20291567 0.4368 0.50349307 0.20291567 0.3565 0.56399322 0.20671558 0.3698 0.57499313
		 0.2032156 0.35510001 0.56499314 0.20701551 0.36860001 0.57619309 0.2039156 0.35389999 0.56599307
		 0.20771551 0.36750001 0.57719326 0.20521569 0.3529 0.56669307 0.20891571 0.36669999 0.57799315
		 0.20671558 0.35229999 0.56719327 0.2104156 0.36610001 0.57849312 0.36271548 0.35229999 0.56719327
		 0.3591156 0.36610001 0.57849312 0.36061549 0.36669999 0.57799315 0.36431551 0.3529 0.56669307
		 0.36551571 0.35389999 0.56599307 0.36171556 0.36750001 0.57719326 0.3663156 0.35510001 0.56499314
		 0.36251569 0.36860001 0.57619309 0.20701551 0.44049999 0.50799322 0.2032156 0.4382 0.50249314
		 0.20771551 0.44159999 0.50699306 0.2039156 0.4395 0.50159311 0.20891571 0.4425 0.50619316
		 0.20521569 0.4404 0.50079322 0.2104156 0.44299999 0.5056932 0.20671558 0.4411 0.50029325
		 0.3591156 0.44299999 0.5056932 0.36271548 0.4411 0.50029325 0.36061549 0.4425 0.50619316
		 0.36431551 0.4404 0.50079322 0.36171556 0.44159999 0.50699306 0.36551571 0.4395 0.50159311
		 0.36251569 0.44049999 0.50799322 0.3663156 0.4382 0.50249314 0.20741558 0.3707 0.57509327
		 0.20741558 0.43939999 0.51009321 0.21271563 0.3669 0.57879305 0.35681558 0.3669 0.57879305
		 0.36211562 0.43939999 0.51009321 0.36211562 0.3707 0.57509327 0.35681558 0.44319999 0.50649309
		 0.21271563 0.44319999 0.50649309 0.20771551 0.36950001 0.57629323 0.20841551 0.36849999 0.57729316
		 0.20961571 0.36759999 0.57809305 0.2111156 0.3671 0.57859325 0.3584156 0.3671 0.57859325
		 0.35991549 0.36759999 0.57809305 0.36111569 0.36849999 0.57729316 0.36181569 0.36950001 0.57629323
		 0.20771551 0.44060001 0.50899315 0.20841551 0.44159999 0.50789309 0.20961571 0.4425 0.50709319
		 0.2111156 0.44299999 0.50659323 0.3584156 0.44299999 0.50659323 0.35991549 0.4425 0.50709319
		 0.36111569 0.44159999 0.50789309 0.36181569 0.44060001 0.50899315 0.21251559 0.37290001 0.57039309
		 0.21251559 0.43450001 0.51199317 0.35211563 0.36950001 0.57359314 0.21741557 0.36950001 0.57359314
		 0.35701561 0.43450001 0.51199317 0.35701561 0.37290001 0.57039309 0.21741557 0.43790001 0.50879312
		 0.35211563 0.43790001 0.50879312 0.21271563 0.37189999 0.57139325 0.21341562 0.37090001 0.57229304
		 0.21451569 0.37020001 0.57299304 0.21591568 0.36970001 0.57339311 0.35361552 0.36970001 0.57339311
		 0.35501552 0.37020001 0.57299304 0.35611558 0.37090001 0.57229304 0.35681558 0.37189999 0.57139325
		 0.21271563 0.43560001 0.51099324 0.21341562 0.43650001 0.51009321 0.21451569 0.4373 0.50939322
		 0.21591568 0.43779999 0.50899315 0.35361552 0.43779999 0.50899315 0.35501552 0.4373 0.50939322
		 0.35611558 0.43650001 0.51009321 0.35681558 0.43560001 0.51099324 0.21251559 0.43349999 0.51099324
		 0.21251559 0.37189999 0.56929326 0.21741557 0.36849999 0.57249308 0.35211563 0.36849999 0.57249308
		 0.35701561 0.37189999 0.56929326 0.35701561 0.43349999 0.51099324 0.35211563 0.43689999 0.50769305
		 0.21741557 0.43689999 0.50769305 0.21271563 0.37090001 0.57029319 0.21341562 0.36989999 0.57119322
		 0.21451569 0.36919999 0.57189322 0.21591568 0.3687 0.57239318 0.35361552 0.3687 0.57239318
		 0.35501552 0.36919999 0.57189322 0.35611558 0.36989999 0.57119322 0.35681558 0.37090001 0.57029319
		 0.21271563 0.43450001 0.50999308 0.21341562 0.4355 0.50909305 0.21451569 0.43630001 0.50829315
		 0.21591568 0.43669999 0.50789309 0.35361552 0.43669999 0.50789309 0.35501552 0.43630001 0.50829315
		 0.35611558 0.4355 0.50909305 0.35681558 0.43450001 0.50999308 0.21231556 0.43880001 0.50669312
		 0.21231556 0.36849999 0.57339311 0.35771561 0.36849999 0.57339311 0.35771561 0.43880001 0.50669312
		 0.72301555 0.35179999 -0.45040679 0.6565156 0.44400001 -0.3944068 0.6565156 0.44400001 0.40099311
		 0.72301555 0.35179999 0.4569931 0.65161562 0.44400001 0.43169308 0.7183156 0.3511 0.49249315
		 0.63751554 0.44400001 0.45939326 0.70341563 0.3506 0.52439308 0.61551571 0.44400001 0.4813931
		 0.67981553 0.35049999 0.54959321 0.58781552 0.44400001 0.49549317 0.64981556 0.35080001 0.56549311
		 0.55711555 0.44400001 -0.49380684 0.6163156 0.35159999 -0.56400681 0.55841565 0.45629999 0.46199322
		 0.58511567 0.45629999 0.44889307 0.60631561 0.45629999 0.42839313 0.61991549 0.45629999 0.40249324
		 0.62461567 0.45629999 0.37389326 0.62461567 0.45629999 -0.36740685;
	setAttr ".vt[498:663]" 0.52871561 0.45629999 -0.46000695 0.4933157 0.4359 0.39109325
		 0.51781559 0.4359 0.3799932 0.53731561 0.4359 0.36259317 0.54981565 0.4359 0.34079313
		 0.55411553 0.4359 0.31659317 0.55411553 0.4359 -0.31010675 0.54981565 0.4359 -0.33430696
		 0.61991549 0.45629999 -0.39600682 0.53731561 0.4359 -0.35610676 0.60631561 0.45629999 -0.42180681
		 0.58511567 0.45629999 -0.44230676 0.51781559 0.4359 -0.37340689 0.4933157 0.4359 -0.38460684
		 0.55841565 0.45629999 -0.4555068 0.46611547 0.4359 -0.38840675 0.4933157 0.42089999 0.39109325
		 0.51781559 0.42089999 0.3799932 0.53731561 0.42089999 0.36259317 0.54981565 0.42089999 0.34079313
		 0.55411553 0.42089999 0.31659317 0.55411553 0.42089999 -0.31010675 0.54981565 0.42089999 -0.33430696
		 0.53731561 0.42089999 -0.35610676 0.51781559 0.42089999 -0.37340689 0.4933157 0.42089999 -0.38460684
		 0.46611547 0.42089999 -0.38840675 0.5926156 -0.065899998 0.49839306 0.58981562 0.1576 0.51199317
		 0.62051558 -0.065899998 0.48419309 0.61741567 0.1576 0.49739313 0.64261556 -0.065899998 0.46209311
		 0.63931561 0.1576 0.47469306 0.65681553 -0.065899998 0.43419313 0.65331554 0.1575 0.44609308
		 0.66171551 -0.065899998 0.40329313 0.65811563 0.1575 0.41429305 0.66171551 -0.065899998 -0.39670682
		 0.65811563 0.1575 -0.40780687 0.65681553 -0.065899998 -0.42760682 0.65331554 0.1575 -0.43950677
		 0.5926156 -0.065899998 -0.49180675 0.5617156 -0.065899998 -0.49670672 0.55921555 0.1575 -0.51050687
		 0.58981562 0.1576 -0.50550675 0.65381551 0.34079999 0.56999326 0.65411568 0.3292 0.57029319
		 0.68381548 0.3407 0.55379319 0.68401551 0.3292 0.55399323 0.70751548 0.3407 0.52849317
		 0.70781565 0.3292 0.5286932 0.72271562 0.3409 0.4964931 0.72301555 0.3292 0.49669313
		 0.72781563 0.34130001 0.46099305 0.72821569 0.32910001 0.46129322 0.72781563 0.34130001 -0.45440674
		 0.72821569 0.32910001 -0.4548068 0.62041569 0.34130001 -0.56890678 0.62091565 0.32910001 -0.56930685
		 0.60371566 0.2147 -0.54830694 0.70901561 0.2147 0.44449306 0.70901561 0.2147 -0.43800688
		 0.7038157 0.2147 0.47859311 0.68891549 0.2148 0.50939322 0.66561556 0.2148 0.53379321
		 0.63631558 0.2148 0.54939318 0.60001564 0.1899 -0.54370689 0.70481563 0.18979999 -0.43430686
		 0.70481563 0.18979999 0.44089317 0.69971561 0.1899 0.47469306 0.68481565 0.1899 0.50519323
		 0.66161561 0.1899 0.5293932 0.63241553 0.1899 0.54489326 0.46651554 0.41929999 0.39459324
		 0.55481553 0.42089999 -0.31080675 0.55051565 0.42089999 -0.33500695 0.5380156 0.42089999 -0.35680676
		 0.51861548 0.42089999 -0.37410688 0.49401569 0.42089999 -0.38530684 0.46681571 0.42089999 -0.38910675
		 -0.70158446 0.42089999 -0.38910675 -0.70158446 0.42089999 0.39419317 0.46681571 0.42089999 0.39419317
		 0.49401569 0.42089999 0.39039326 0.51861548 0.42089999 0.3792932 0.5380156 0.42089999 0.36189318
		 0.55051565 0.42089999 0.34009314 0.55481553 0.42089999 0.31589317 0.76241565 0.53670001 -0.58990693
		 1.0042154789 0.5205 -0.51740694 0.9854157 0.5205 -0.52170682 0.9854157 0.55949998 -0.52170682
		 1.0042154789 0.55949998 -0.51740694 0.97041559 0.55949998 -0.50960684 0.97041559 0.5205 -0.50960684
		 0.97041559 0.5205 -0.49040675 0.97041559 0.55949998 -0.49040675 0.9854157 0.55949998 -0.47830677
		 0.9854157 0.5205 -0.47830677 1.0042154789 0.5205 -0.48260689 1.0042154789 0.55949998 -0.48260689
		 1.012615681 0.5205 -0.50000691 1.012615681 0.55949998 -0.50000691 1.0021154881 0.5575 -0.51440692
		 0.98651552 0.5575 -0.5180068 0.99061561 0.5575 -0.50000691 0.97391558 0.5575 -0.50800681
		 0.97391558 0.5575 -0.49200678 0.98651552 0.5575 -0.48200679 1.0021154881 0.5575 -0.48560691
		 1.0090155602 0.5575 -0.50000691 0.98651552 0.55949998 -0.5180068 1.0021154881 0.55949998 -0.51440692
		 0.97391558 0.55949998 -0.50800681 0.97391558 0.55949998 -0.49200678 0.98651552 0.55949998 -0.48200679
		 1.0021154881 0.55949998 -0.48560691 1.0090155602 0.55949998 -0.50000691 1.019515514 0.5205 -0.58260679
		 1.00071549416 0.5205 -0.58690691 1.00071549416 0.55949998 -0.58690691 1.019515514 0.55949998 -0.58260679
		 0.98561549 0.55949998 -0.57490683 0.98561549 0.5205 -0.57490683 0.98561549 0.5205 -0.55560684
		 0.98561549 0.55949998 -0.55560684 1.00071549416 0.55949998 -0.54360676 1.00071549416 0.5205 -0.54360676
		 1.019515514 0.5205 -0.54790688 1.019515514 0.55949998 -0.54790688 1.02781558 0.5205 -0.56520677
		 1.02781558 0.55949998 -0.56520677 1.017315626 0.5575 -0.57970691 1.0017156601 0.5575 -0.58320689
		 1.005815506 0.5575 -0.56520677 0.98921561 0.5575 -0.5732069 0.98921561 0.5575 -0.55720687
		 1.0017156601 0.5575 -0.54720688 1.017315626 0.5575 -0.55080676 1.024315596 0.5575 -0.56520677
		 1.0017156601 0.55949998 -0.58320689 1.017315626 0.55949998 -0.57970691 0.98921561 0.55949998 -0.5732069
		 0.98921561 0.55949998 -0.55720687 1.0017156601 0.55949998 -0.54720688 1.017315626 0.55949998 -0.55080676
		 1.024315596 0.55949998 -0.56520677 1.015915632 0.5205 -0.64800692 0.99711561 0.5205 -0.6523068
		 0.99711561 0.55949998 -0.6523068 1.015915632 0.55949998 -0.64800692 0.98211551 0.55949998 -0.64020681
		 0.98211551 0.5205 -0.64020681 0.98211551 0.5205 -0.62100673 0.98211551 0.55949998 -0.62100673
		 0.99711561 0.55949998 -0.60890675 0.99711561 0.5205 -0.60890675 1.015915632 0.5205 -0.61320686
		 1.015915632 0.55949998 -0.61320686 1.024315596 0.5205 -0.63060689 1.024315596 0.55949998 -0.63060689
		 1.013815641 0.5575 -0.6450069 0.99821568 0.5575 -0.64860678 1.0023155212 0.5575 -0.63060689
		 0.98561549 0.5575 -0.63860679 0.98561549 0.5575 -0.62260675;
	setAttr ".vt[664:760]" 0.99821568 0.5575 -0.61260676 1.013815641 0.5575 -0.61620688
		 1.020715475 0.5575 -0.63060689 0.99821568 0.55949998 -0.64860678 1.013815641 0.55949998 -0.6450069
		 0.98561549 0.55949998 -0.63860679 0.98561549 0.55949998 -0.62260675 0.99821568 0.55949998 -0.61260676
		 1.013815641 0.55949998 -0.61620688 1.020715475 0.55949998 -0.63060689 1.0002155304 0.5205 -0.71000695
		 0.98141551 0.5205 -0.71430683 0.98141551 0.55949998 -0.71430683 1.0002155304 0.55949998 -0.71000695
		 0.96641564 0.55949998 -0.70230675 0.96641564 0.5205 -0.70230675 0.96641564 0.5205 -0.68300676
		 0.96641564 0.55949998 -0.68300676 0.98141551 0.55949998 -0.67100692 0.98141551 0.5205 -0.67100692
		 1.0002155304 0.5205 -0.6753068 1.0002155304 0.55949998 -0.6753068 1.0086154938 0.5205 -0.69260693
		 1.0086154938 0.55949998 -0.69260693 0.99811554 0.5575 -0.70710683 0.98251557 0.5575 -0.71060681
		 0.98661566 0.5575 -0.69260693 0.96991563 0.5575 -0.70060682 0.96991563 0.5575 -0.68460679
		 0.98251557 0.5575 -0.6746068 0.99811554 0.5575 -0.67820692 1.0050156116 0.5575 -0.69260693
		 0.98251557 0.55949998 -0.71060681 0.99811554 0.55949998 -0.70710683 0.96991563 0.55949998 -0.70060682
		 0.96991563 0.55949998 -0.68460679 0.98251557 0.55949998 -0.6746068 0.99811554 0.55949998 -0.67820692
		 1.0050156116 0.55949998 -0.69260693 0.96261549 0.5205 -0.76460695 0.94381571 0.5205 -0.76880693
		 0.94381571 0.55949998 -0.76880693 0.96261549 0.55949998 -0.76460695 0.9288156 0.55949998 -0.75680685
		 0.9288156 0.5205 -0.75680685 0.9288156 0.5205 -0.73760676 0.9288156 0.55949998 -0.73760676
		 0.94381571 0.55949998 -0.72550678 0.94381571 0.5205 -0.72550678 0.96261549 0.5205 -0.7298069
		 0.96261549 0.55949998 -0.7298069 0.97101569 0.5205 -0.74720693 0.97101569 0.55949998 -0.74720693
		 0.9605155 0.5575 -0.76160693 0.94491553 0.5575 -0.76520681 0.94901562 0.5575 -0.74720693
		 0.93231559 0.5575 -0.75520682 0.93231559 0.5575 -0.73920679 0.94491553 0.5575 -0.7292068
		 0.9605155 0.5575 -0.73280692 0.96741557 0.5575 -0.74720693 0.94491553 0.55949998 -0.76520681
		 0.9605155 0.55949998 -0.76160693 0.93231559 0.55949998 -0.75520682 0.93231559 0.55949998 -0.73920679
		 0.94491553 0.55949998 -0.7292068 0.9605155 0.55949998 -0.73280692 0.96741557 0.55949998 -0.74720693
		 0.9071157 0.5205 -0.81910682 0.88831568 0.5205 -0.82340693 0.88831568 0.55949998 -0.82340693
		 0.9071157 0.55949998 -0.81910682 0.87321568 0.55949998 -0.81130695 0.87321568 0.5205 -0.81130695
		 0.87321568 0.5205 -0.79210687 0.87321568 0.55949998 -0.79210687 0.88831568 0.55949998 -0.78000689
		 0.88831568 0.5205 -0.78000689 0.9071157 0.5205 -0.78430676 0.9071157 0.55949998 -0.78430676
		 0.91541553 0.5205 -0.80170679 0.91541553 0.55949998 -0.80170679 0.90491557 0.5575 -0.8161068
		 0.88931561 0.5575 -0.81970692 0.89341569 0.5575 -0.80170679 0.87681556 0.5575 -0.80970693
		 0.87681556 0.5575 -0.79370689 0.88931561 0.5575 -0.7837069 0.90491557 0.5575 -0.78730679
		 0.91191554 0.5575 -0.80170679 0.88931561 0.55949998 -0.81970692 0.90491557 0.55949998 -0.8161068
		 0.87681556 0.55949998 -0.80970693 0.87681556 0.55949998 -0.79370689 0.88931561 0.55949998 -0.7837069
		 0.90491557 0.55949998 -0.78730679 0.91191554 0.55949998 -0.80170679;
	setAttr -s 1424 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 0 0 0 4 0 4 5 0 5 1 0 6 7 0 7 5 0
		 4 6 0 8 9 0 9 7 0 6 8 0 10 11 0 11 9 0 8 10 0 10 12 0 12 13 0 13 11 0 2 14 0 14 15 0
		 15 3 0 16 17 0 17 15 0 14 16 0 16 18 0 18 19 0 19 17 0 18 20 0 20 21 0 21 19 0 20 22 0
		 22 23 0 23 21 0 24 25 0 25 13 0 12 24 0 26 27 0 27 22 0 20 26 0 18 28 0 28 26 0 16 29 0
		 29 28 0 14 30 0 30 29 0 2 31 0 31 30 0 1 32 0 32 31 0 5 33 0 33 32 0 7 34 0 34 33 0
		 35 34 0 9 35 0 11 36 0 36 35 0 13 37 0 37 36 0 25 38 0 38 37 0 26 39 0 39 40 0 40 27 0
		 41 39 0 28 41 0 29 42 0 42 41 0 30 43 0 43 42 0 31 44 0 44 43 0 32 45 0 45 44 0 46 45 0
		 33 46 0 47 46 0 34 47 0 35 48 0 48 47 0 49 48 0 36 49 0 37 50 0 50 49 0 38 51 0 51 50 0
		 52 40 0 39 53 0 53 52 0 41 54 0 54 53 0 42 55 0 55 54 0 43 56 0 56 55 0 57 56 0 44 57 0
		 45 58 0 58 57 0 46 59 0 59 58 0 47 60 0 60 59 0 61 60 0 48 61 0 62 61 0 49 62 0 63 62 0
		 50 63 0 64 65 0 65 66 0 66 67 0 67 64 0 65 68 0 68 69 0 69 66 0 68 70 0 70 71 0 71 69 0
		 72 73 0 73 71 0 70 72 0 72 74 0 74 75 0 75 73 0 76 77 0 77 75 0 74 76 0 76 78 0 78 79 0
		 79 77 0 78 80 0 80 81 0 81 79 0 82 81 0 80 83 0 83 82 0 84 82 0 83 85 0 85 84 0 85 86 0
		 86 87 0 87 84 0 88 87 0 86 89 0 89 88 0 90 91 0 91 21 0 23 90 0 92 93 0 93 91 0 90 92 0
		 94 19 0 91 94 0 93 95 0 95 94 0 94 96 0 96 17 0 95 97 0 97 96 0 96 98 0 98 15 0 97 99 0
		 99 98 0 98 100 0;
	setAttr ".ed[166:331]" 100 3 0 99 101 0 101 100 0 100 102 0 102 0 0 101 103 0
		 103 102 0 104 4 0 102 104 0 103 105 0 105 104 0 104 106 0 106 6 0 105 107 0 107 106 0
		 106 108 0 108 8 0 107 109 0 109 108 0 108 110 0 110 10 0 109 111 0 111 110 0 110 112 0
		 112 12 0 111 113 0 113 112 0 114 24 0 112 114 0 113 115 0 115 114 0 116 117 0 117 115 0
		 113 116 0 118 116 0 111 118 0 109 119 0 119 118 0 107 120 0 120 119 0 121 120 0 105 121 0
		 103 122 0 122 121 0 123 122 0 101 123 0 99 124 0 124 123 0 97 125 0 125 124 0 126 125 0
		 95 126 0 93 127 0 127 126 0 92 128 0 128 127 0 129 117 0 116 130 0 130 129 0 118 131 0
		 131 130 0 132 131 0 119 132 0 120 133 0 133 132 0 121 134 0 134 133 0 122 135 0 135 134 0
		 123 136 0 136 135 0 124 137 0 137 136 0 125 138 0 138 137 0 126 139 0 139 138 0 127 140 0
		 140 139 0 128 141 0 141 140 0 130 87 0 88 129 0 131 84 0 132 82 0 133 81 0 134 79 0
		 135 77 0 136 75 0 137 73 0 138 71 0 139 69 0 140 66 0 141 67 0 142 143 0 143 144 0
		 144 145 0 145 142 0 144 146 0 146 147 0 147 145 0 148 149 0 149 150 0 150 151 0 151 148 0
		 152 151 0 150 153 0 153 152 0 153 154 0 154 155 0 155 152 0 154 156 0 156 157 0 157 155 0
		 156 158 0 158 159 0 159 157 0 158 143 0 142 159 0 143 160 0 160 144 0 160 146 0 161 146 0
		 160 161 0 162 161 0 160 162 0 163 162 0 160 163 0 164 163 0 160 164 0 165 164 0 160 165 0
		 149 165 0 160 149 0 160 150 0 160 153 0 160 154 0 160 156 0 160 158 0 166 167 0 167 168 0
		 168 169 0 169 166 0 166 170 0 170 171 0 171 167 0 172 173 0 173 171 0 170 172 0 174 175 0
		 175 173 0 172 174 0 174 176 0 176 177 0 177 175 0 176 178 0 178 179 0 179 177 0 178 180 0
		 180 181 0 181 179 0 182 183 0 183 181 0 180 182 0 182 184 0 184 185 0;
	setAttr ".ed[332:497]" 185 183 0 186 185 0 184 187 0 187 186 0 187 188 0 188 189 0
		 189 186 0 190 191 0 191 189 0 188 190 0 190 192 0 192 193 0 193 191 0 192 169 0 168 193 0
		 194 168 0 167 195 0 195 194 0 171 196 0 196 195 0 173 197 0 197 196 0 175 198 0 198 197 0
		 199 198 0 177 199 0 179 200 0 200 199 0 181 201 0 201 200 0 183 202 0 202 201 0 185 203 0
		 203 202 0 186 204 0 204 203 0 189 205 0 205 204 0 191 206 0 206 205 0 193 207 0 207 206 0
		 194 207 0 195 152 0 155 194 0 196 151 0 197 148 0 198 208 0 208 148 0 209 208 0 199 209 0
		 200 210 0 210 209 0 201 211 0 211 210 0 202 212 0 212 211 0 147 212 0 203 147 0 204 145 0
		 205 142 0 206 159 0 207 157 0 213 214 0 214 188 0 187 213 0 184 215 0 215 213 0 182 216 0
		 216 215 0 180 217 0 217 216 0 178 218 0 218 217 0 176 219 0 219 218 0 174 220 0 220 219 0
		 172 221 0 221 220 0 170 222 0 222 221 0 166 223 0 223 222 0 169 224 0 224 223 0 225 224 0
		 192 225 0 190 226 0 226 225 0 214 226 0 213 227 0 227 228 0 228 214 0 215 229 0 229 227 0
		 216 230 0 230 229 0 217 231 0 231 230 0 218 232 0 232 231 0 219 233 0 233 232 0 220 234 0
		 234 233 0 221 235 0 235 234 0 222 236 0 236 235 0 223 237 0 237 236 0 224 238 0 238 237 0
		 225 239 0 239 238 0 226 240 0 240 239 0 228 240 0 227 241 0 241 242 0 242 228 0 229 243 0
		 243 241 0 230 244 0 244 243 0 231 245 0 245 244 0 232 246 0 246 245 0 233 247 0 247 246 0
		 234 248 0 248 247 0 235 249 0 249 248 0 250 249 0 236 250 0 237 251 0 251 250 0 238 252 0
		 252 251 0 239 253 0 253 252 0 240 254 0 254 253 0 242 254 0 241 255 0 255 256 0 256 242 0
		 243 257 0 257 255 0 258 257 0 244 258 0 245 259 0 259 258 0 246 260 0 260 259 0 247 261 0
		 261 260 0 248 262 0 262 261 0 249 263 0 263 262 0 250 264 0 264 263 0;
	setAttr ".ed[498:663]" 251 265 0 265 264 0 252 266 0 266 265 0 253 267 0 267 266 0
		 254 268 0 268 267 0 256 268 0 255 269 0 269 270 0 270 256 0 257 271 0 271 269 0 258 272 0
		 272 271 0 259 273 0 273 272 0 260 274 0 274 273 0 261 275 0 275 274 0 262 276 0 276 275 0
		 263 277 0 277 276 0 264 278 0 278 277 0 265 279 0 279 278 0 266 280 0 280 279 0 281 280 0
		 267 281 0 282 281 0 268 282 0 270 282 0 269 283 0 283 284 0 284 270 0 271 285 0 285 283 0
		 272 286 0 286 285 0 273 287 0 287 286 0 274 288 0 288 287 0 275 289 0 289 288 0 276 290 0
		 290 289 0 277 291 0 291 290 0 278 292 0 292 291 0 279 293 0 293 292 0 280 294 0 294 293 0
		 281 295 0 295 294 0 282 296 0 296 295 0 284 296 0 297 284 0 283 298 0 298 297 0 285 299 0
		 299 298 0 286 300 0 300 299 0 287 301 0 301 300 0 302 301 0 288 302 0 303 302 0 289 303 0
		 304 303 0 290 304 0 305 304 0 291 305 0 306 305 0 292 306 0 307 306 0 293 307 0 308 307 0
		 294 308 0 309 308 0 295 309 0 310 309 0 296 310 0 297 310 0 311 312 0 312 313 0 313 314 0
		 314 315 0 315 316 0 316 317 0 317 318 0 318 319 0 319 320 0 320 321 0 321 322 0 322 323 0
		 323 324 0 324 311 0 325 326 0 326 327 0 327 328 0 328 325 0 329 327 0 326 330 0 330 329 0
		 330 331 0 331 332 0 332 329 0 333 332 0 331 334 0 334 333 0 334 335 0 335 336 0 336 333 0
		 337 338 0 338 336 0 335 337 0 337 325 0 328 338 0 339 340 0 340 341 0 341 339 0 340 342 0
		 342 341 0 342 343 0 343 341 0 343 344 0 344 341 0 344 345 0 345 341 0 345 346 0 346 341 0
		 346 339 0 327 347 0 347 348 0 348 328 0 329 349 0 349 347 0 350 349 0 332 350 0 333 351 0
		 351 350 0 352 351 0 336 352 0 338 353 0 353 352 0 348 353 0 339 348 0 347 340 0 349 342 0
		 350 343 0 351 344 0 352 345 0 353 346 0 354 355 0 355 356 0 356 357 0;
	setAttr ".ed[664:829]" 357 354 0 358 359 0 359 360 0 360 361 0 361 358 0 362 363 0
		 363 364 0 364 365 0 365 362 0 366 367 0 367 368 0 368 369 0 369 366 0 368 370 0 370 371 0
		 371 369 0 370 372 0 372 373 0 373 371 0 372 374 0 374 375 0 375 373 0 374 376 0 376 377 0
		 377 375 0 376 356 0 355 377 0 357 378 0 378 379 0 379 354 0 380 379 0 378 381 0 381 380 0
		 381 382 0 382 383 0 383 380 0 382 384 0 384 385 0 385 383 0 384 363 0 362 385 0 366 386 0
		 386 387 0 387 367 0 386 388 0 388 389 0 389 387 0 390 391 0 391 389 0 388 390 0 392 393 0
		 393 391 0 390 392 0 358 393 0 392 359 0 360 394 0 394 395 0 395 361 0 394 396 0 396 397 0
		 397 395 0 396 398 0 398 399 0 399 397 0 398 400 0 400 401 0 401 399 0 400 365 0 364 401 0
		 402 403 0 403 366 0 369 402 0 404 355 0 354 405 0 405 404 0 406 407 0 407 362 0 365 406 0
		 408 360 0 359 409 0 409 408 0 371 410 0 410 402 0 373 411 0 411 410 0 375 412 0 412 411 0
		 413 412 0 377 413 0 404 413 0 379 414 0 414 405 0 380 415 0 415 414 0 383 416 0 416 415 0
		 385 417 0 417 416 0 407 417 0 403 418 0 418 386 0 419 388 0 418 419 0 420 390 0 419 420 0
		 420 421 0 421 392 0 421 409 0 408 422 0 422 394 0 423 396 0 422 423 0 424 398 0 423 424 0
		 424 425 0 425 400 0 425 406 0 402 426 0 426 427 0 427 403 0 428 429 0 429 404 0 405 428 0
		 406 430 0 430 431 0 431 407 0 409 432 0 432 433 0 433 408 0 410 434 0 434 426 0 435 434 0
		 411 435 0 412 436 0 436 435 0 437 436 0 413 437 0 429 437 0 414 438 0 438 428 0 415 439 0
		 439 438 0 440 439 0 416 440 0 417 441 0 441 440 0 431 441 0 427 442 0 442 418 0 443 419 0
		 442 443 0 444 420 0 443 444 0 445 421 0 444 445 0 445 432 0 433 446 0 446 422 0 447 423 0
		 446 447 0 448 424 0 447 448 0 449 425 0 448 449 0 449 430 0 450 427 0;
	setAttr ".ed[830:995]" 426 451 0 451 450 0 452 429 0 428 453 0 453 452 0 454 431 0
		 430 455 0 455 454 0 456 433 0 432 457 0 457 456 0 434 458 0 458 451 0 435 459 0 459 458 0
		 460 459 0 436 460 0 461 460 0 437 461 0 452 461 0 462 453 0 438 462 0 439 463 0 463 462 0
		 440 464 0 464 463 0 465 464 0 441 465 0 454 465 0 450 466 0 466 442 0 467 443 0 466 467 0
		 468 444 0 467 468 0 469 445 0 468 469 0 469 457 0 470 446 0 456 470 0 470 471 0 471 447 0
		 471 472 0 472 448 0 472 473 0 473 449 0 473 455 0 474 475 0 475 476 0 476 477 0 477 474 0
		 478 479 0 479 480 0 480 481 0 481 478 0 480 482 0 482 483 0 483 481 0 484 485 0 485 483 0
		 482 484 0 484 486 0 486 487 0 487 485 0 486 488 0 488 489 0 489 487 0 488 25 0 24 489 0
		 22 490 0 490 491 0 491 23 0 492 38 0 488 492 0 486 493 0 493 492 0 484 494 0 494 493 0
		 482 495 0 495 494 0 480 496 0 496 495 0 479 497 0 497 496 0 498 490 0 27 498 0 492 499 0
		 499 51 0 500 499 0 493 500 0 494 501 0 501 500 0 495 502 0 502 501 0 496 503 0 503 502 0
		 497 504 0 504 503 0 505 504 0 497 506 0 506 505 0 507 505 0 506 508 0 508 507 0 509 510 0
		 510 507 0 508 509 0 511 510 0 509 512 0 512 511 0 498 513 0 513 511 0 512 498 0 40 513 0
		 514 499 0 500 515 0 515 514 0 501 516 0 516 515 0 502 517 0 517 516 0 518 517 0 503 518 0
		 504 519 0 519 518 0 505 520 0 520 519 0 507 521 0 521 520 0 522 521 0 510 522 0 523 522 0
		 511 523 0 524 523 0 513 524 0 52 524 0 89 525 0 525 526 0 526 88 0 525 527 0 527 528 0
		 528 526 0 527 529 0 529 530 0 530 528 0 531 532 0 532 530 0 529 531 0 531 533 0 533 534 0
		 534 532 0 535 536 0 536 534 0 533 535 0 535 537 0 537 538 0 538 536 0 539 540 0 540 541 0
		 541 542 0 542 539 0 67 541 0 540 64 0 114 543 0 543 489 0 115 544 0;
	setAttr ".ed[996:1161]" 544 543 0 545 487 0 543 545 0 544 546 0 546 545 0 545 547 0
		 547 485 0 546 548 0 548 547 0 547 549 0 549 483 0 548 550 0 550 549 0 549 551 0 551 481 0
		 550 552 0 552 551 0 551 553 0 553 478 0 552 554 0 554 553 0 491 555 0 555 90 0 556 92 0
		 555 556 0 557 128 0 556 557 0 558 559 0 559 554 0 552 558 0 550 560 0 560 558 0 548 561 0
		 561 560 0 562 561 0 546 562 0 544 563 0 563 562 0 117 563 0 557 564 0 564 141 0 565 559 0
		 558 566 0 566 565 0 560 567 0 567 566 0 561 568 0 568 567 0 562 569 0 569 568 0 563 570 0
		 570 569 0 129 570 0 564 541 0 566 534 0 536 565 0 567 532 0 568 530 0 569 528 0 570 526 0
		 51 571 0 571 63 0 514 571 0 572 573 0 573 574 0 574 575 0 575 576 0 576 577 0 577 578 0
		 578 53 0 62 579 0 579 580 0 580 581 0 581 582 0 582 583 0 583 584 0 584 585 0 585 572 0
		 312 586 0 586 311 0 313 586 0 314 586 0 315 586 0 316 586 0 317 586 0 318 586 0 319 586 0
		 320 586 0 321 586 0 322 586 0 323 586 0 324 586 0 587 588 0 588 589 0 589 590 0 590 587 0
		 591 589 0 588 592 0 592 591 0 592 593 0 593 594 0 594 591 0 595 594 0 593 596 0 596 595 0
		 596 597 0 597 598 0 598 595 0 599 600 0 600 598 0 597 599 0 599 587 0 590 600 0 601 602 0
		 602 603 0 603 601 0 602 604 0 604 603 0 604 605 0 605 603 0 605 606 0 606 603 0 606 607 0
		 607 603 0 607 608 0 608 603 0 608 601 0 589 609 0 609 610 0 610 590 0 591 611 0 611 609 0
		 612 611 0 594 612 0 595 613 0 613 612 0 614 613 0 598 614 0 600 615 0 615 614 0 610 615 0
		 601 610 0 609 602 0 611 604 0 612 605 0 613 606 0 614 607 0 615 608 0 616 617 0 617 618 0
		 618 619 0 619 616 0 620 618 0 617 621 0 621 620 0 621 622 0 622 623 0 623 620 0 624 623 0
		 622 625 0 625 624 0 625 626 0 626 627 0 627 624 0 628 629 0 629 627 0;
	setAttr ".ed[1162:1327]" 626 628 0 628 616 0 619 629 0 630 631 0 631 632 0 632 630 0
		 631 633 0 633 632 0 633 634 0 634 632 0 634 635 0 635 632 0 635 636 0 636 632 0 636 637 0
		 637 632 0 637 630 0 618 638 0 638 639 0 639 619 0 620 640 0 640 638 0 641 640 0 623 641 0
		 624 642 0 642 641 0 643 642 0 627 643 0 629 644 0 644 643 0 639 644 0 630 639 0 638 631 0
		 640 633 0 641 634 0 642 635 0 643 636 0 644 637 0 645 646 0 646 647 0 647 648 0 648 645 0
		 649 647 0 646 650 0 650 649 0 650 651 0 651 652 0 652 649 0 653 652 0 651 654 0 654 653 0
		 654 655 0 655 656 0 656 653 0 657 658 0 658 656 0 655 657 0 657 645 0 648 658 0 659 660 0
		 660 661 0 661 659 0 660 662 0 662 661 0 662 663 0 663 661 0 663 664 0 664 661 0 664 665 0
		 665 661 0 665 666 0 666 661 0 666 659 0 647 667 0 667 668 0 668 648 0 649 669 0 669 667 0
		 670 669 0 652 670 0 653 671 0 671 670 0 672 671 0 656 672 0 658 673 0 673 672 0 668 673 0
		 659 668 0 667 660 0 669 662 0 670 663 0 671 664 0 672 665 0 673 666 0 674 675 0 675 676 0
		 676 677 0 677 674 0 678 676 0 675 679 0 679 678 0 679 680 0 680 681 0 681 678 0 682 681 0
		 680 683 0 683 682 0 683 684 0 684 685 0 685 682 0 686 687 0 687 685 0 684 686 0 686 674 0
		 677 687 0 688 689 0 689 690 0 690 688 0 689 691 0 691 690 0 691 692 0 692 690 0 692 693 0
		 693 690 0 693 694 0 694 690 0 694 695 0 695 690 0 695 688 0 676 696 0 696 697 0 697 677 0
		 678 698 0 698 696 0 699 698 0 681 699 0 682 700 0 700 699 0 701 700 0 685 701 0 687 702 0
		 702 701 0 697 702 0 688 697 0 696 689 0 698 691 0 699 692 0 700 693 0 701 694 0 702 695 0
		 703 704 0 704 705 0 705 706 0 706 703 0 707 705 0 704 708 0 708 707 0 708 709 0 709 710 0
		 710 707 0 711 710 0 709 712 0 712 711 0 712 713 0 713 714 0 714 711 0;
	setAttr ".ed[1328:1423]" 715 716 0 716 714 0 713 715 0 715 703 0 706 716 0 717 718 0
		 718 719 0 719 717 0 718 720 0 720 719 0 720 721 0 721 719 0 721 722 0 722 719 0 722 723 0
		 723 719 0 723 724 0 724 719 0 724 717 0 705 725 0 725 726 0 726 706 0 707 727 0 727 725 0
		 728 727 0 710 728 0 711 729 0 729 728 0 730 729 0 714 730 0 716 731 0 731 730 0 726 731 0
		 717 726 0 725 718 0 727 720 0 728 721 0 729 722 0 730 723 0 731 724 0 732 733 0 733 734 0
		 734 735 0 735 732 0 736 734 0 733 737 0 737 736 0 737 738 0 738 739 0 739 736 0 740 739 0
		 738 741 0 741 740 0 741 742 0 742 743 0 743 740 0 744 745 0 745 743 0 742 744 0 744 732 0
		 735 745 0 746 747 0 747 748 0 748 746 0 747 749 0 749 748 0 749 750 0 750 748 0 750 751 0
		 751 748 0 751 752 0 752 748 0 752 753 0 753 748 0 753 746 0 734 754 0 754 755 0 755 735 0
		 736 756 0 756 754 0 757 756 0 739 757 0 740 758 0 758 757 0 759 758 0 743 759 0 745 760 0
		 760 759 0 755 760 0 746 755 0 754 747 0 756 749 0 757 750 0 758 751 0 759 752 0 760 753 0;
	setAttr -s 2631 ".n";
	setAttr ".n[0:165]" -type "float3"  -0.8506 0.52219999 0.062199999 -0.79220003
		 0.60729998 0.0592 -0.8114 0.58450001 0 -0.86470002 0.50230002 0 -0.79220003 0.60729998
		 0.0592 -0.8506 0.52219999 0.062199999 -0.78619999 0.56950003 0.2397 -0.71740001 0.66030002
		 0.22220001 -0.65530002 0.60500002 0.4522 -0.5855 0.69910002 0.41060001 -0.71740001
		 0.66030002 0.22220001 -0.78619999 0.56950003 0.2397 -0.47850001 0.61159998 0.63010001
		 -0.4242 0.70560002 0.56760001 -0.5855 0.69910002 0.41060001 -0.65530002 0.60500002
		 0.4522 -0.2572 0.58600003 0.76840001 -0.23029999 0.67729998 0.69880003 -0.4242 0.70560002
		 0.56760001 -0.47850001 0.61159998 0.63010001 -0.23029999 0.67729998 0.69880003 -0.2572
		 0.58600003 0.76840001 -0.13420001 0.55860001 0.81849998 -0.1229 0.64789999 0.7518
		 -0.8326 0.53969997 -0.1242 -0.76959997 0.6275 -0.1181 -0.76959997 0.6275 -0.1181
		 -0.8326 0.53969997 -0.1242 -0.65460002 0.68349999 -0.3231 -0.72689998 0.58999997
		 -0.3515 -0.72689998 0.58999997 -0.3515 -0.65460002 0.68349999 -0.3231 -0.57359999
		 0.61070001 -0.54589999 -0.50889999 0.7058 -0.49290001 -0.50889999 0.7058 -0.49290001
		 -0.57359999 0.61070001 -0.54589999 -0.33410001 0.69639999 -0.63520002 -0.33410001
		 0.69639999 -0.63520002 -0.3757 0.60259998 -0.70410001 -0.3757 0.60259998 -0.70410001
		 -0.13420001 0.55860001 -0.81849998 -0.1229 0.64789999 -0.7518 -0.0429 0.62099999
		 -0.7827 -0.064800002 0.53939998 -0.83960003 0.064800002 0.53939998 0.83960003 0.0429
		 0.62099999 0.7827 0 0.6045 0.79659998 0 0.51959997 0.85439998 -0.047800001 0.95060003
		 -0.30680001 -0.0451 0.94999999 -0.3089 -0.0451 0.94999999 -0.3089 -0.047800001 0.95060003
		 -0.30680001 -0.1235 0.9612 -0.2465 -0.1235 0.9612 -0.2465 -0.1235 0.9612 -0.2465
		 -0.1235 0.9612 -0.2465 -0.18790001 0.96340001 -0.191 -0.18790001 0.96340001 -0.191
		 -0.18790001 0.96340001 -0.191 -0.18790001 0.96340001 -0.191 -0.2509 0.95920002 -0.13
		 -0.2509 0.95920002 -0.13 -0.2509 0.95920002 -0.13 -0.2509 0.95920002 -0.13 -0.3204
		 0.94590002 -0.051600002 -0.3204 0.94590002 -0.051600002 -0.3204 0.94590002 -0.051600002
		 -0.3204 0.94590002 -0.051600002 -0.36000001 0.93300003 0 -0.36000001 0.93300003 0
		 -0.36000001 0.93300003 0 -0.36000001 0.93300003 0 -0.3204 0.94590002 0.051600002
		 -0.3204 0.94590002 0.051600002 -0.3204 0.94590002 0.051600002 -0.3204 0.94590002
		 0.051600002 -0.2509 0.95920002 0.13 -0.2509 0.95920002 0.13 -0.2509 0.95920002 0.13
		 -0.2509 0.95920002 0.13 -0.18790001 0.96340001 0.191 -0.18790001 0.96340001 0.191
		 -0.18790001 0.96340001 0.191 -0.18790001 0.96340001 0.191 -0.1235 0.9612 0.2465 -0.1235
		 0.9612 0.2465 -0.1235 0.9612 0.2465 -0.1235 0.9612 0.2465 -0.047800001 0.95060003
		 0.30680001 -0.047800001 0.95060003 0.30680001 -0.047800001 0.95060003 0.30680001
		 -0.047800001 0.95060003 0.30680001 0 0.93959999 0.34220001 0 0.93959999 0.34220001
		 -0.000099999997 0.93959999 0.34220001 -0.000099999997 0.93959999 0.34220001 0.033799998
		 0.9684 0.24699999 0.0361 0.96880001 0.24510001 0.0361 0.96880001 0.24510001 0.033799998
		 0.9684 0.24699999 0.093199998 0.97600001 0.19679999 0.093199998 0.97600001 0.19679999
		 0.093199998 0.97600001 0.19679999 0.093199998 0.97600001 0.19679999 0.14210001 0.97799999
		 0.15279999 0.14210001 0.97799999 0.15279999 0.14210001 0.97799999 0.15279999 0.14210001
		 0.97799999 0.15279999 0.19069999 0.97610003 0.1045 0.19069999 0.97610003 0.1045 0.19069999
		 0.97610003 0.1045 0.19069999 0.97610003 0.1045 0.2458 0.9684 0.041900001 0.2458 0.9684
		 0.041900001 0.2458 0.9684 0.041900001 0.2458 0.9684 0.041900001 0.2782 0.9605 0 0.2782
		 0.9605 0 0.2782 0.9605 0 0.2782 0.9605 0 0.2458 0.9684 -0.041900001 0.2458 0.9684
		 -0.041900001 0.2458 0.9684 -0.041900001 0.2458 0.9684 -0.041900001 0.19069999 0.97610003
		 -0.1045 0.19069999 0.97610003 -0.1045 0.19069999 0.97610003 -0.1045 0.19069999 0.97610003
		 -0.1045 0.14210001 0.97799999 -0.15279999 0.14210001 0.97799999 -0.15279999 0.14210001
		 0.97799999 -0.15279999 0.14210001 0.97799999 -0.15279999 0.093199998 0.97600001 -0.19679999
		 0.093199998 0.97600001 -0.19679999 0.093199998 0.97600001 -0.19679999 0.093199998
		 0.97600001 -0.19679999 0.0361 0.96880001 -0.24510001 0.0361 0.96880001 -0.24510001
		 0.0361 0.96880001 -0.24510001 0.0361 0.96880001 -0.24510001 0 0.96170002 -0.27399999
		 0.000099999997 0.96170002 -0.27419999 0.000099999997 0.96170002 -0.27419999 0 0.96170002
		 -0.27399999 0.1288 0 0.99169999 0.1288 0 0.99169999 0.13950001 0 0.99019998 0.13950001
		 0 0.99019998 0.4129 0 0.91079998 0.4129 0 0.91079998 0.4129 0 0.91079998 0.4129 0
		 0.91079998 0.66469997 0 0.7471 0.66469997 0 0.7471 0.66469997 0 0.7471 0.66469997
		 0 0.7471 0.8678 0 0.49700001 0.8678 0 0.49700001 0.8678 0 0.49700001 0.8678 0 0.49700001
		 0.98449999 0 0.1753 0.98449999 0 0.1753 0.98449999 0 0.1753 0.98449999 0 0.1753 1
		 0 0 1 0 0;
	setAttr ".n[166:331]" -type "float3"  1 0 0 1 0 0 0.98449999 0 -0.1753 0.98449999
		 0 -0.1753 0.98449999 0 -0.1753 0.98449999 0 -0.1753 0.8678 0 -0.49700001 0.8678 0
		 -0.49700001 0.8678 0 -0.49700001 0.8678 0 -0.49700001 0.66469997 0 -0.7471 0.66469997
		 0 -0.7471 0.66469997 0 -0.7471 0.66469997 0 -0.7471 0.4129 0 -0.91079998 0.4129 0
		 -0.91079998 0.4129 0 -0.91079998 0.4129 0 -0.91079998 0.13959999 0 -0.99019998 0.13950001
		 0 -0.99019998 0.13950001 0 -0.99019998 0.13950001 0 -0.99019998 -0.075800002 -0.0603
		 -0.99529999 -0.3136 -0.053599998 -0.94800001 -0.27450001 -0.479 -0.83380002 -0.055300001
		 -0.43509999 -0.8987 -0.3136 -0.053599998 -0.94800001 -0.59429997 -0.0392 -0.80330002
		 -0.51450002 -0.505 -0.69300002 -0.27450001 -0.479 -0.83380002 -0.59429997 -0.0392
		 -0.80330002 -0.81389999 -0.0207 -0.58060002 -0.70310003 -0.50700003 -0.49860001 -0.51450002
		 -0.505 -0.69300002 -0.95270002 -0.0014 -0.3039 -0.83050001 -0.4914 -0.26230001 -0.70310003
		 -0.50700003 -0.49860001 -0.81389999 -0.0207 -0.58060002 -0.83050001 -0.4914 -0.26230001
		 -0.95270002 -0.0014 -0.3039 -0.99699998 0.012 -0.076899998 -0.88169998 -0.46709999
		 -0.067299999 -0.99699998 0.012 0.076899998 -0.88169998 -0.46709999 0.067299999 -0.88169998
		 -0.46709999 -0.067299999 -0.99699998 0.012 -0.076899998 -0.99699998 0.012 0.076899998
		 -0.95270002 -0.0014 0.3039 -0.83050001 -0.4914 0.26230001 -0.88169998 -0.46709999
		 0.067299999 -0.95270002 -0.0014 0.3039 -0.81389999 -0.0207 0.58060002 -0.70310003
		 -0.50700003 0.49860001 -0.83050001 -0.4914 0.26230001 -0.51450002 -0.505 0.69300002
		 -0.70310003 -0.50700003 0.49860001 -0.81389999 -0.0207 0.58060002 -0.59429997 -0.0392
		 0.80330002 -0.27450001 -0.479 0.83380002 -0.51450002 -0.505 0.69300002 -0.59429997
		 -0.0392 0.80330002 -0.3136 -0.053599998 0.94800001 -0.3136 -0.053599998 0.94800001
		 -0.079700001 -0.060199998 0.995 -0.071400002 -0.43669999 0.89679998 -0.27450001 -0.479
		 0.83380002 0.055300001 -0.43529999 0.89859998 -0.071400002 -0.43669999 0.89679998
		 -0.079700001 -0.060199998 0.995 0.075800002 -0.0603 0.99529999 -0.080799997 0.24590001
		 -0.9659 -0.15719999 0.2538 -0.9544 -0.13420001 0.55860001 -0.81849998 -0.064800002
		 0.53939998 -0.83960003 -0.081600003 -0.079000004 -0.99349999 -0.32229999 -0.094700001
		 -0.94190001 -0.15719999 0.2538 -0.9544 -0.080799997 0.24590001 -0.9659 -0.45770001
		 0.2703 -0.847 -0.3757 0.60259998 -0.70410001 -0.3757 0.60259998 -0.70410001 -0.45770001
		 0.2703 -0.847 -0.32229999 -0.094700001 -0.94190001 -0.60610002 -0.1047 -0.78850001
		 -0.45770001 0.2703 -0.847 -0.45770001 0.2703 -0.847 -0.70179999 0.273 -0.65789998
		 -0.70179999 0.273 -0.65789998 -0.57359999 0.61070001 -0.54589999 -0.57359999 0.61070001
		 -0.54589999 -0.60610002 -0.1047 -0.78850001 -0.82080001 -0.1007 -0.56230003 -0.70179999
		 0.273 -0.65789998 -0.70179999 0.273 -0.65789998 -0.72689998 0.58999997 -0.3515 -0.8707
		 0.2658 -0.4138 -0.8707 0.2658 -0.4138 -0.72689998 0.58999997 -0.3515 -0.82080001
		 -0.1007 -0.56230003 -0.95289999 -0.0854 -0.29089999 -0.8707 0.2658 -0.4138 -0.8707
		 0.2658 -0.4138 -0.8326 0.53969997 -0.1242 -0.95889997 0.24690001 -0.13959999 -0.95889997
		 0.24690001 -0.13959999 -0.8326 0.53969997 -0.1242 -0.95889997 0.24690001 -0.13959999
		 -0.95289999 -0.0854 -0.29089999 -0.99489999 -0.069200002 -0.072999999 -0.95889997
		 0.24690001 -0.13959999 -0.86470002 0.50230002 0 -0.9727 0.23190001 0 -0.9727 0.23190001
		 0 -0.8506 0.52219999 0.062199999 -0.99489999 -0.069200002 -0.072999999 -0.99489999
		 -0.069200002 0.072999999 -0.9727 0.23190001 0 -0.9727 0.23190001 0 -0.95889997 0.24690001
		 0.13959999 -0.78619999 0.56950003 0.2397 -0.8506 0.52219999 0.062199999 -0.95889997
		 0.24690001 0.13959999 -0.99489999 -0.069200002 0.072999999 -0.95289999 -0.0854 0.29089999
		 -0.95889997 0.24690001 0.13959999 -0.95889997 0.24690001 0.13959999 -0.78619999 0.56950003
		 0.2397 -0.8707 0.2658 0.4138 -0.8707 0.2658 0.4138 -0.65530002 0.60500002 0.4522
		 -0.8707 0.2658 0.4138 -0.95289999 -0.0854 0.29089999 -0.82080001 -0.1007 0.56230003
		 -0.8707 0.2658 0.4138 -0.65530002 0.60500002 0.4522 -0.70179999 0.273 0.65789998
		 -0.70179999 0.273 0.65789998 -0.47850001 0.61159998 0.63010001 -0.82080001 -0.1007
		 0.56230003 -0.60610002 -0.1047 0.78850001 -0.70179999 0.273 0.65789998 -0.70179999
		 0.273 0.65789998 -0.47850001 0.61159998 0.63010001 -0.45770001 0.2703 0.847 -0.45770001
		 0.2703 0.847 -0.2572 0.58600003 0.76840001 -0.45770001 0.2703 0.847 -0.60610002 -0.1047
		 0.78850001 -0.32229999 -0.094700001 0.94190001 -0.45770001 0.2703 0.847 -0.15719999
		 0.2538 0.9544 -0.15719999 0.2538 0.9544 -0.13420001 0.55860001 0.81849998 -0.2572
		 0.58600003 0.76840001 -0.15719999 0.2538 0.9544 -0.32229999 -0.094700001 0.94190001
		 -0.081900001 -0.079099998 0.99349999 -0.15719999 0.2538 0.9544 0.080799997 0.24590001
		 0.9659 0.064800002 0.53939998 0.83960003 0 0.51959997 0.85439998 0 0.2375 0.97140002
		 -0.081900001 -0.079099998 0.99349999 0.0823 -0.0788 0.99349999 0.080799997 0.24590001
		 0.9659 0 0.2375 0.97140002;
	setAttr ".n[332:497]" -type "float3"  -0.080700003 -0.19159999 0.9781 0.079400003
		 -0.1912 0.97829998 0.0823 -0.0788 0.99349999 -0.081900001 -0.079099998 0.99349999
		 -0.3145 -0.2167 0.9242 -0.080700003 -0.19159999 0.9781 -0.081900001 -0.079099998
		 0.99349999 -0.32229999 -0.094700001 0.94190001 -0.32229999 -0.094700001 0.94190001
		 -0.60610002 -0.1047 0.78850001 -0.58969998 -0.2314 0.77380002 -0.3145 -0.2167 0.9242
		 -0.82080001 -0.1007 0.56230003 -0.80110002 -0.2256 0.55440003 -0.58969998 -0.2314
		 0.77380002 -0.60610002 -0.1047 0.78850001 -0.93550003 -0.20280001 0.28920001 -0.80110002
		 -0.2256 0.55440003 -0.82080001 -0.1007 0.56230003 -0.95289999 -0.0854 0.29089999
		 -0.95289999 -0.0854 0.29089999 -0.99489999 -0.069200002 0.072999999 -0.98159999 -0.1763
		 0.073399998 -0.93550003 -0.20280001 0.28920001 -0.98159999 -0.1763 -0.073399998 -0.98159999
		 -0.1763 0.073399998 -0.99489999 -0.069200002 0.072999999 -0.99489999 -0.069200002
		 -0.072999999 -0.98159999 -0.1763 -0.073399998 -0.99489999 -0.069200002 -0.072999999
		 -0.95289999 -0.0854 -0.29089999 -0.93550003 -0.20280001 -0.28920001 -0.82080001 -0.1007
		 -0.56230003 -0.80110002 -0.2256 -0.55440003 -0.93550003 -0.20280001 -0.28920001 -0.95289999
		 -0.0854 -0.29089999 -0.58969998 -0.2314 -0.77380002 -0.80110002 -0.2256 -0.55440003
		 -0.82080001 -0.1007 -0.56230003 -0.60610002 -0.1047 -0.78850001 -0.58969998 -0.2314
		 -0.77380002 -0.60610002 -0.1047 -0.78850001 -0.32229999 -0.094700001 -0.94190001
		 -0.3145 -0.2167 -0.9242 -0.3145 -0.2167 -0.9242 -0.32229999 -0.094700001 -0.94190001
		 -0.081600003 -0.079000004 -0.99349999 -0.076399997 -0.191 -0.97860003 0.077399999
		 -0.49559999 0.86510003 0.079400003 -0.1912 0.97829998 -0.080700003 -0.19159999 0.9781
		 -0.069899999 -0.49529999 0.86589998 -0.069899999 -0.49529999 0.86589998 -0.080700003
		 -0.19159999 0.9781 -0.3145 -0.2167 0.9242 -0.2647 -0.54930001 0.79259998 -0.48800001
		 -0.58579999 0.64709997 -0.2647 -0.54930001 0.79259998 -0.3145 -0.2167 0.9242 -0.58969998
		 -0.2314 0.77380002 -0.80110002 -0.2256 0.55440003 -0.66060001 -0.5927 0.46079999
		 -0.48800001 -0.58579999 0.64709997 -0.58969998 -0.2314 0.77380002 -0.93550003 -0.20280001
		 0.28920001 -0.78039998 -0.5765 0.2423 -0.66060001 -0.5927 0.46079999 -0.80110002
		 -0.2256 0.55440003 -0.93550003 -0.20280001 0.28920001 -0.98159999 -0.1763 0.073399998
		 -0.83389997 -0.54839998 0.0625 -0.78039998 -0.5765 0.2423 -0.83389997 -0.54839998
		 0.0625 -0.98159999 -0.1763 0.073399998 -0.98159999 -0.1763 -0.073399998 -0.83389997
		 -0.54839998 -0.0625 -0.83389997 -0.54839998 -0.0625 -0.98159999 -0.1763 -0.073399998
		 -0.93550003 -0.20280001 -0.28920001 -0.78039998 -0.5765 -0.2423 -0.78039998 -0.5765
		 -0.2423 -0.93550003 -0.20280001 -0.28920001 -0.80110002 -0.2256 -0.55440003 -0.66060001
		 -0.5927 -0.46079999 -0.66060001 -0.5927 -0.46079999 -0.80110002 -0.2256 -0.55440003
		 -0.58969998 -0.2314 -0.77380002 -0.48800001 -0.58579999 -0.64709997 -0.48800001 -0.58579999
		 -0.64709997 -0.58969998 -0.2314 -0.77380002 -0.3145 -0.2167 -0.9242 -0.2647 -0.54930001
		 -0.79259998 -0.2647 -0.54930001 -0.79259998 -0.3145 -0.2167 -0.9242 -0.076399997
		 -0.191 -0.97860003 -0.074600004 -0.4946 -0.86589998 -0.069899999 -0.49529999 0.86589998
		 -0.071400002 -0.43669999 0.89679998 0.055300001 -0.43529999 0.89859998 0.077399999
		 -0.49559999 0.86510003 -0.27450001 -0.479 0.83380002 -0.071400002 -0.43669999 0.89679998
		 -0.069899999 -0.49529999 0.86589998 -0.2647 -0.54930001 0.79259998 -0.51450002 -0.505
		 0.69300002 -0.27450001 -0.479 0.83380002 -0.2647 -0.54930001 0.79259998 -0.48800001
		 -0.58579999 0.64709997 -0.70310003 -0.50700003 0.49860001 -0.51450002 -0.505 0.69300002
		 -0.48800001 -0.58579999 0.64709997 -0.66060001 -0.5927 0.46079999 -0.83050001 -0.4914
		 0.26230001 -0.70310003 -0.50700003 0.49860001 -0.66060001 -0.5927 0.46079999 -0.78039998
		 -0.5765 0.2423 -0.88169998 -0.46709999 0.067299999 -0.83050001 -0.4914 0.26230001
		 -0.78039998 -0.5765 0.2423 -0.83389997 -0.54839998 0.0625 -0.83389997 -0.54839998
		 -0.0625 -0.88169998 -0.46709999 -0.067299999 -0.88169998 -0.46709999 0.067299999
		 -0.83389997 -0.54839998 0.0625 -0.78039998 -0.5765 -0.2423 -0.83050001 -0.4914 -0.26230001
		 -0.88169998 -0.46709999 -0.067299999 -0.83389997 -0.54839998 -0.0625 -0.66060001
		 -0.5927 -0.46079999 -0.70310003 -0.50700003 -0.49860001 -0.83050001 -0.4914 -0.26230001
		 -0.78039998 -0.5765 -0.2423 -0.70310003 -0.50700003 -0.49860001 -0.66060001 -0.5927
		 -0.46079999 -0.48800001 -0.58579999 -0.64709997 -0.51450002 -0.505 -0.69300002 -0.51450002
		 -0.505 -0.69300002 -0.48800001 -0.58579999 -0.64709997 -0.2647 -0.54930001 -0.79259998
		 -0.27450001 -0.479 -0.83380002 -0.27450001 -0.479 -0.83380002 -0.2647 -0.54930001
		 -0.79259998 -0.074600004 -0.4946 -0.86589998 -0.055300001 -0.43509999 -0.8987 0.87410003
		 -0.24259999 -0.42089999 0.90100002 0 -0.4339 0.62349999 0 -0.78179997 0.6049 -0.24259999
		 -0.75849998 0.62349999 0 -0.78179997 0.2159 -0.24259999 -0.94580001 -0.2159 -0.24259999
		 -0.94580001 0.6049 -0.24259999 -0.75849998 0.6049 -0.24259999 0.75849998 0.62349999
		 0 0.78179997 0.90100002 0 0.4339 0.87410003 -0.24259999 0.42089999 0.97009999 -0.24259999
		 0 0.87410003 -0.24259999 0.42089999 0.90100002 0 0.4339 1 0 0 0.97009999 -0.24259999
		 0 1 0 0 -0.46180001 -0.67180002 0.57910001 -0.6674 -0.67180002 0.32139999 -0.46180001
		 -0.67180002 0.57910001 0 -1 0;
	setAttr ".n[498:663]" -type "float3"  -0.1648 -0.67180002 0.72219998 -0.6674
		 -0.67180002 0.32139999 -0.1648 -0.67180002 0.72219998 0 -1 0 0.1648 -0.67180002 0.72219998
		 0.46180001 -0.67180002 0.57910001 0.46180001 -0.67180002 0.57910001 0.1648 -0.67180002
		 0.72219998 0.90100002 0 -0.4339 0.87410003 -0.24259999 -0.42089999 0.6674 -0.67180002
		 0.32139999 0.74070001 -0.67180002 0 0.6674 -0.67180002 -0.32139999 0.46180001 -0.67180002
		 -0.57910001 0.6674 -0.67180002 0.32139999 0.6674 -0.67180002 -0.32139999 0.1648 -0.67180002
		 -0.72219998 0.46180001 -0.67180002 -0.57910001 0.6674 -0.67180002 -0.32139999 -0.1648
		 -0.67180002 -0.72219998 0.1648 -0.67180002 -0.72219998 0.6674 -0.67180002 -0.32139999
		 -0.46180001 -0.67180002 -0.57910001 -0.1648 -0.67180002 -0.72219998 0.6674 -0.67180002
		 -0.32139999 -0.6674 -0.67180002 -0.32139999 -0.46180001 -0.67180002 -0.57910001 0.6674
		 -0.67180002 -0.32139999 -0.74070001 -0.67180002 0 -0.6674 -0.67180002 -0.32139999
		 0.6674 -0.67180002 -0.32139999 0.22239999 0.033799998 0.97439998 -0.74070001 -0.67180002
		 0 0.6674 -0.67180002 -0.32139999 0.62309998 0.033799998 0.78140002 0.22239999 0.033799998
		 0.97439998 0.6674 -0.67180002 -0.32139999 0.56410003 0.42609999 0.70730001 0.62309998
		 0.033799998 0.78140002 0.6674 -0.67180002 -0.32139999 0.2013 0.42609999 0.88200003
		 0.56410003 0.42609999 0.70730001 0.6674 -0.67180002 -0.32139999 -0.22239999 0.033799998
		 0.97439998 0.2013 0.42609999 0.88200003 0.6674 -0.67180002 -0.32139999 -0.2013 0.42609999
		 0.88200003 -0.22239999 0.033799998 0.97439998 0.6674 -0.67180002 -0.32139999 0.74070001
		 -0.67180002 0 -0.2013 0.42609999 0.88200003 0.6674 -0.67180002 -0.32139999 -0.81510001
		 0.42609999 0.39250001 -0.62309998 0.033799998 0.78140002 -0.56410003 0.42609999 0.70730001
		 -0.9005 0.033799998 0.43360001 -0.81510001 0.42609999 0.39250001 -0.90469998 0.42609999
		 0 -0.99940002 0.033799998 0 -0.62309998 0.033799998 0.78140002 -0.81510001 0.42609999
		 -0.39250001 -0.9005 0.033799998 -0.43360001 -0.99940002 0.033799998 0 -0.90469998
		 0.42609999 0 -0.62309998 0.033799998 -0.78140002 -0.56410003 0.42609999 -0.70730001
		 -0.9005 0.033799998 -0.43360001 -0.81510001 0.42609999 -0.39250001 -0.62309998 0.033799998
		 -0.78140002 -0.2013 0.42609999 -0.88200003 -0.22239999 0.033799998 -0.97439998 -0.56410003
		 0.42609999 -0.70730001 -0.2013 0.42609999 -0.88200003 0.2013 0.42609999 -0.88200003
		 0.22239999 0.033799998 -0.97439998 -0.22239999 0.033799998 -0.97439998 0.22239999
		 0.033799998 -0.97439998 0.2013 0.42609999 -0.88200003 0.62309998 0.033799998 -0.78140002
		 0.56410003 0.42609999 -0.70730001 0.81510001 0.42609999 -0.39250001 0.9005 0.033799998
		 -0.43360001 0.56410003 0.42609999 -0.70730001 0.62309998 0.033799998 -0.78140002
		 0.81510001 0.42609999 -0.39250001 0.90469998 0.42609999 0 0.99940002 0.033799998
		 0 0.9005 0.033799998 -0.43360001 0.9005 0.033799998 0.43360001 0.99940002 0.033799998
		 0 0.90469998 0.42609999 0 0.81510001 0.42609999 0.39250001 0.81510001 0.42609999
		 0.39250001 0.56650001 -0.41780001 0.71030003 0.2022 -0.41780001 0.8858 0.9005 0.033799998
		 0.43360001 -0.56650001 -0.41780001 0.71030003 -0.2022 -0.41780001 0.8858 0.2022 -0.41780001
		 0.8858 0.56650001 -0.41780001 0.71030003 -0.56650001 -0.41780001 0.71030003 -0.90859997
		 -0.41780001 0 -0.8186 -0.41780001 0.3942 -0.2022 -0.41780001 0.8858 -0.8186 -0.41780001
		 0.3942 -0.90859997 -0.41780001 0 -0.9005 0.033799998 0.43360001 -0.56410003 0.42609999
		 0.70730001 -0.56650001 -0.41780001 -0.71030003 -0.56410003 0.42609999 0.70730001
		 -0.62309998 0.033799998 0.78140002 -0.8186 -0.41780001 -0.3942 -0.99940002 0.033799998
		 0 -0.2022 -0.41780001 -0.8858 -0.8186 -0.41780001 -0.3942 -0.62309998 0.033799998
		 0.78140002 -0.9005 0.033799998 -0.43360001 0.2022 -0.41780001 -0.8858 -0.2022 -0.41780001
		 -0.8858 -0.99940002 0.033799998 0 -0.56410003 0.42609999 -0.70730001 0.56650001 -0.41780001
		 -0.71030003 0.2022 -0.41780001 -0.8858 -0.9005 0.033799998 -0.43360001 0.8186 -0.41780001
		 -0.3942 0.56650001 -0.41780001 -0.71030003 -0.56410003 0.42609999 -0.70730001 -0.22239999
		 0.033799998 -0.97439998 0.22239999 0.033799998 -0.97439998 0.90859997 -0.41780001
		 0 0.8186 -0.41780001 -0.3942 -0.22239999 0.033799998 -0.97439998 0.56410003 0.42609999
		 -0.70730001 0.8186 -0.41780001 0.3942 0.90859997 -0.41780001 0 0.22239999 0.033799998
		 -0.97439998 0.56410003 0.42609999 -0.70730001 0.9005 0.033799998 -0.43360001 0.0065000001
		 1 -0.0052 0.8186 -0.41780001 0.3942 0.0065000001 1 -0.0052 0.9005 0.033799998 -0.43360001
		 0.99940002 0.033799998 0 0.0065000001 1 -0.0052 0.9005 0.033799998 0.43360001 0.0065000001
		 1 -0.0052 0.0065000001 1 -0.0052 0.99940002 0.033799998 0 0.9005 0.033799998 0.43360001
		 0.2022 -0.41780001 0.8858 0.0065000001 1 -0.0052 0.0065000001 1 -0.0052 -0.2022 -0.41780001
		 0.8858 0.0035999999 1 -0.0074999998 0.0065000001 1 -0.0052 0.2022 -0.41780001 0.8858
		 -0.8186 -0.41780001 0.3942 0.0035999999 1 -0.0074999998 0.0035999999 1 -0.0074999998
		 -0.2022 -0.41780001 0.8858 0.0035999999 1 -0.0074999998 -0.8186 -0.41780001 0.3942
		 -0.56410003 0.42609999 0.70730001 -0.56650001 -0.41780001 -0.71030003 -0.56650001
		 -0.41780001 -0.71030003 -0.8186 -0.41780001 -0.3942;
	setAttr ".n[664:829]" -type "float3"  0.97009999 -0.24259999 0 -0.6674 -0.67180002
		 0.32139999 -0.2022 -0.41780001 -0.8858 0.87410003 -0.24259999 0.42089999 0.97009999
		 -0.24259999 0 -0.8186 -0.41780001 -0.3942 -0.2022 -0.41780001 -0.8858 0.2022 -0.41780001
		 -0.8858 0.6049 -0.24259999 0.75849998 0.87410003 -0.24259999 0.42089999 0.56650001
		 -0.41780001 -0.71030003 0.2159 -0.24259999 0.94580001 0.6049 -0.24259999 0.75849998
		 0.2022 -0.41780001 -0.8858 -0.2159 -0.24259999 0.94580001 0.2159 -0.24259999 0.94580001
		 0.56650001 -0.41780001 -0.71030003 0.8186 -0.41780001 -0.3942 0.90859997 -0.41780001
		 0 -0.6049 -0.24259999 0.75849998 -0.2159 -0.24259999 0.94580001 0.8186 -0.41780001
		 -0.3942 0.8186 -0.41780001 0.3942 -0.87410003 -0.24259999 0.42089999 -0.6049 -0.24259999
		 0.75849998 0.90859997 -0.41780001 0 0.0065000001 1 -0.0052 -0.87410003 -0.24259999
		 -0.42089999 -0.87410003 -0.24259999 0.42089999 0.8186 -0.41780001 0.3942 -0.2159
		 -0.24259999 -0.94580001 -0.87410003 -0.24259999 -0.42089999 0.0065000001 1 -0.0052
		 0.0065000001 1 -0.0052 0.0065000001 1 -0.0052 0.6049 -0.24259999 -0.75849998 -0.2159
		 -0.24259999 -0.94580001 0.0065000001 1 -0.0052 0.0065000001 1 -0.0052 0.87410003
		 -0.24259999 -0.42089999 0.6049 -0.24259999 -0.75849998 0.0065000001 1 -0.0052 0.0035999999
		 1 -0.0074999998 0.46180001 -0.67180002 0.57910001 0.87410003 -0.24259999 -0.42089999
		 0.0065000001 1 -0.0052 -0.1648 -0.67180002 0.72219998 0.46180001 -0.67180002 0.57910001
		 0.0035999999 1 -0.0074999998 0.0035999999 1 -0.0074999998 0.0035999999 1 -0.0074999998
		 -0.56650001 -0.41780001 -0.71030003 -0.6674 -0.67180002 0.32139999 -0.1648 -0.67180002
		 0.72219998 0 1 -0.0083999997 0 1 -0.0083999997 0.0035999999 1 -0.0074999998 0.0035999999
		 1 -0.0074999998 0 1 -0.0083999997 -0.0035999999 1 -0.0074999998 -0.0035999999 1 -0.0074999998
		 0 1 -0.0083999997 -0.0065000001 1 -0.0052 -0.0035999999 1 -0.0074999998 -0.0035999999
		 1 -0.0074999998 -0.0065000001 1 -0.0052 -0.0065000001 1 -0.0052 -0.0082 1 -0.0019
		 -0.0082 1 -0.0019 -0.0065000001 1 -0.0052 -0.0082 1 0.0019 -0.0082 1 -0.0019 -0.0082
		 1 -0.0019 -0.0082 1 0.0019 -0.0082 1 0.0019 -0.0065000001 1 0.0052 -0.0065000001
		 1 0.0052 -0.0082 1 0.0019 -0.0035999999 1 0.0074999998 -0.0065000001 1 0.0052 -0.0065000001
		 1 0.0052 -0.0035999999 1 0.0074999998 0 1 0.0083999997 -0.0035999999 1 0.0074999998
		 -0.0035999999 1 0.0074999998 0 1 0.0083999997 0.0035999999 1 0.0074999998 0 1 0.0083999997
		 0 1 0.0083999997 0.0035999999 1 0.0074999998 0.0035999999 1 0.0074999998 0.0065000001
		 1 0.0052 0.0065000001 1 0.0052 0.0035999999 1 0.0074999998 0.0082 1 0.0019 0.0065000001
		 1 0.0052 0.0065000001 1 0.0052 0.0082 1 0.0019 0.0082 1 -0.0019 0.0082 1 -0.0019
		 0.0082 1 0.0019 0.0082 1 0.0019 0.0082 1 -0.0019 -0.78179997 0 0.62349999 -0.78179997
		 0 0.62349999 0.0082 1 -0.0019 -0.78179997 0 0.62349999 -0.78179997 0 0.62349999 -0.4339
		 0 0.90100002 -0.4339 0 0.90100002 -0.4339 0 0.90100002 -0.4339 0 0.90100002 0 0 1
		 0 0 1 0 0 1 0.4339 0 0.90100002 0.4339 0 0.90100002 0 0 1 0.4339 0 0.90100002 0.4339
		 0 0.90100002 0.78179997 0 0.62349999 0.78179997 0 0.62349999 0.78179997 0 0.62349999
		 0.78179997 0 0.62349999 0.97490001 0 0.2225 0.97490001 0 0.2225 0.97490001 0 0.2225
		 0.97490001 0 -0.2225 0.97490001 0 -0.2225 0.97490001 0 0.2225 0.97490001 0 -0.2225
		 0.97490001 0 -0.2225 0.78179997 0 -0.62349999 0.78179997 0 -0.62349999 0.78179997
		 0 -0.62349999 0.78179997 0 -0.62349999 0.4339 0 -0.90100002 0.4339 0 -0.90100002
		 0.4339 0 -0.90100002 0 0 -1 0 0 -1 0.4339 0 -0.90100002 0 0 -1 0 0 -1 -0.4339 0 -0.90100002
		 -0.4339 0 -0.90100002 -0.4339 0 -0.90100002 -0.78179997 0 -0.62349999 -0.78179997
		 0 -0.62349999 -0.4339 0 -0.90100002 -0.78179997 0 -0.62349999 -0.97490001 0 -0.2225
		 -0.97490001 0 -0.2225 -0.78179997 0 -0.62349999 -0.97490001 0 -0.2225 -0.97490001
		 0 -0.2225 -0.97490001 0 0.2225 -0.97490001 0 0.2225 -0.97490001 0 0.2225 0 1 0 0
		 1 0 -0.97490001 0 0.2225 0 1 0 0 1 0 0 1 0 0 1 0;
	setAttr ".n[830:995]" -type "float3"  0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0.78179997 0 -0.62349999 0.78179997 0 -0.62349999 0.78179997 0 -0.62349999
		 0.78179997 0 -0.62349999 0.4339 0 -0.90100002 0.4339 0 -0.90100002 0.4339 0 -0.90100002
		 0 0 -1 0 0 -1 0.4339 0 -0.90100002 0 0 -1 0 0 -1 -0.4339 0 -0.90100002 -0.4339 0
		 -0.90100002 -0.78179997 0 -0.62349999 -0.78179997 0 -0.62349999 -0.4339 0 -0.90100002
		 -0.4339 0 -0.90100002 -0.78179997 0 -0.62349999 -0.97490001 0 -0.2225 -0.97490001
		 0 -0.2225 -0.78179997 0 -0.62349999 -0.97490001 0 -0.2225 -0.97490001 0 -0.2225 -0.97490001
		 0 0.2225 -0.97490001 0 0.2225 -0.97490001 0 0.2225 -0.78179997 0 0.62349999 -0.78179997
		 0 0.62349999 -0.97490001 0 0.2225 -0.78179997 0 0.62349999 -0.4339 0 0.90100002 -0.4339
		 0 0.90100002 -0.78179997 0 0.62349999 -0.4339 0 0.90100002 -0.4339 0 0.90100002 0
		 0 1 0 0 1 0 0 1 0.4339 0 0.90100002 0.4339 0 0.90100002 0 0 1 0.4339 0 0.90100002
		 0.78179997 0 0.62349999 0.78179997 0 0.62349999 0.4339 0 0.90100002 0.78179997 0
		 0.62349999 0.78179997 0 0.62349999 0.97490001 0 0.2225 0.97490001 0 0.2225 0.97490001
		 0 0.2225 0.97490001 0 0.2225 0.97490001 0 -0.2225 0.97490001 0 -0.2225 0.97490001
		 0 -0.2225 0.32449999 0.90979999 -0.2588 0.32449999 0.90979999 -0.2588 0.97490001
		 0 -0.2225 0.18009999 0.90979999 -0.37400001 0.18009999 0.90979999 -0.37400001 0.32449999
		 0.90979999 -0.2588 0.32449999 0.90979999 -0.2588 0.18009999 0.90979999 -0.37400001
		 0.18009999 0.90979999 -0.37400001 0 0.90979999 -0.41510001 0 0.90979999 -0.41510001
		 0 0.90979999 -0.41510001 -0.18009999 0.90979999 -0.37400001 -0.18009999 0.90979999
		 -0.37400001 0 0.90979999 -0.41510001 -0.18009999 0.90979999 -0.37400001 -0.18009999
		 0.90979999 -0.37400001 -0.32449999 0.90979999 -0.2588 -0.32449999 0.90979999 -0.2588
		 -0.32449999 0.90979999 -0.2588 -0.40470001 0.90979999 -0.092399999 -0.40470001 0.90979999
		 -0.092399999 -0.32449999 0.90979999 -0.2588 -0.40470001 0.90979999 0.092399999 -0.40470001
		 0.90979999 -0.092399999 -0.40470001 0.90979999 -0.092399999 -0.40470001 0.90979999
		 0.092399999 -0.40470001 0.90979999 0.092399999 -0.40470001 0.90979999 0.092399999
		 -0.32449999 0.90979999 0.2588 -0.32449999 0.90979999 0.2588 -0.32449999 0.90979999
		 0.2588 -0.32449999 0.90979999 0.2588 -0.18009999 0.90979999 0.37400001 -0.18009999
		 0.90979999 0.37400001 -0.18009999 0.90979999 0.37400001 0 0.90979999 0.41510001 0
		 0.90979999 0.41510001 -0.18009999 0.90979999 0.37400001 0 0.90979999 0.41510001 0
		 0.90979999 0.41510001 0.18009999 0.90979999 0.37400001 0.18009999 0.90979999 0.37400001
		 0.18009999 0.90979999 0.37400001 0.18009999 0.90979999 0.37400001 0.32449999 0.90979999
		 0.2588 0.32449999 0.90979999 0.2588 0.32449999 0.90979999 0.2588 0.40470001 0.90979999
		 0.092399999 0.40470001 0.90979999 0.092399999 0.32449999 0.90979999 0.2588 0.40470001
		 0.90979999 -0.092399999 0.40470001 0.90979999 -0.092399999 0.40470001 0.90979999
		 0.092399999 0.40470001 0.90979999 0.092399999 -0.43149999 0.83389997 0.3441 -0.43149999
		 0.83389997 0.3441 0.40470001 0.90979999 -0.092399999 0.40470001 0.90979999 -0.092399999
		 -0.43149999 0.83389997 0.3441 -0.43149999 0.83389997 0.3441;
	setAttr ".n[996:1161]" -type "float3"  -0.2394 0.83389997 0.49720001 -0.2394
		 0.83389997 0.49720001 -0.2394 0.83389997 0.49720001 -0.2394 0.83389997 0.49720001
		 0 0.83389997 0.55190003 0 0.83389997 0.55190003 0.2394 0.83389997 0.49720001 0 0.83389997
		 0.55190003 0 0.83389997 0.55190003 0.2394 0.83389997 0.49720001 0.43149999 0.83389997
		 0.3441 0.2394 0.83389997 0.49720001 0.2394 0.83389997 0.49720001 0.43149999 0.83389997
		 0.3441 0.53799999 0.83389997 0.1228 0.43149999 0.83389997 0.3441 0.43149999 0.83389997
		 0.3441 0.53799999 0.83389997 0.1228 0.53799999 0.83389997 -0.1228 0.53799999 0.83389997
		 0.1228 0.53799999 0.83389997 0.1228 0.53799999 0.83389997 -0.1228 0.43149999 0.83389997
		 -0.3441 0.53799999 0.83389997 -0.1228 0.53799999 0.83389997 -0.1228 0.43149999 0.83389997
		 -0.3441 0.2394 0.83389997 -0.49720001 0.43149999 0.83389997 -0.3441 0.43149999 0.83389997
		 -0.3441 0.2394 0.83389997 -0.49720001 0 0.83389997 -0.55190003 0.2394 0.83389997
		 -0.49720001 0.2394 0.83389997 -0.49720001 0 0.83389997 -0.55190003 -0.2394 0.83389997
		 -0.49720001 0 0.83389997 -0.55190003 0 0.83389997 -0.55190003 -0.2394 0.83389997
		 -0.49720001 -0.43149999 0.83389997 -0.3441 -0.2394 0.83389997 -0.49720001 -0.2394
		 0.83389997 -0.49720001 -0.43149999 0.83389997 -0.3441 -0.53799999 0.83389997 -0.1228
		 -0.43149999 0.83389997 -0.3441 -0.43149999 0.83389997 -0.3441 -0.53799999 0.83389997
		 -0.1228 -0.53799999 0.83389997 0.1228 -0.53799999 0.83389997 -0.1228 -0.53799999
		 0.83389997 -0.1228 -0.53799999 0.83389997 0.1228 -0.78179997 0 0.62349999 -0.53799999
		 0.83389997 0.1228 -0.53799999 0.83389997 0.1228 -0.78179997 0 0.62349999 -0.78179997
		 0 0.62349999 -0.78179997 0 0.62349999 -0.4339 0 0.90100002 -0.4339 0 0.90100002 0
		 0 1 -0.4339 0 0.90100002 -0.4339 0 0.90100002 0 0 1 0.4339 0 0.90100002 0 0 1 0 0
		 1 0.4339 0 0.90100002 0.78179997 0 0.62349999 0.4339 0 0.90100002 0.4339 0 0.90100002
		 0.78179997 0 0.62349999 0.97490001 0 0.2225 0.78179997 0 0.62349999 0.78179997 0
		 0.62349999 0.97490001 0 0.2225 0.97490001 0 -0.2225 0.97490001 0 -0.2225 0.97490001
		 0 0.2225 0.97490001 0 0.2225 0.78179997 0 -0.62349999 0.78179997 0 -0.62349999 0.97490001
		 0 -0.2225 0.97490001 0 -0.2225 0.4339 0 -0.90100002 0.4339 0 -0.90100002 0.78179997
		 0 -0.62349999 0.78179997 0 -0.62349999 0 0 -1 0 0 -1 0.4339 0 -0.90100002 0.4339
		 0 -0.90100002 -0.4339 0 -0.90100002 -0.4339 0 -0.90100002 0 0 -1 0 0 -1 -0.78179997
		 0 -0.62349999 -0.78179997 0 -0.62349999 -0.4339 0 -0.90100002 -0.4339 0 -0.90100002
		 -0.97490001 0 -0.2225 -0.97490001 0 -0.2225 -0.78179997 0 -0.62349999 -0.78179997
		 0 -0.62349999 -0.97490001 0 0.2225 -0.97490001 0 0.2225 -0.97490001 0 -0.2225 -0.97490001
		 0 -0.2225 0.7737 -0.14380001 -0.61699998 0.7737 -0.14380001 -0.61699998 -0.97490001
		 0 0.2225 -0.97490001 0 0.2225 0.7737 -0.14380001 -0.61699998 0.7737 -0.14380001 -0.61699998
		 0.4294 -0.14380001 -0.89160001 0.4294 -0.14380001 -0.89160001 -0.62349999 0 -0.78179997
		 -0.62349999 0 -0.78179997 -1 0 0 -1 0 0 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997
		 -1 0 0 -1 0 0 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997 0.2225 0 0.97490001
		 0.2225 0 0.97490001 0.90100002 0 0.4339 0.90100002 0 0.4339 0.2225 0 0.97490001 0.2225
		 0 0.97490001 0.90100002 0 0.4339 0.90100002 0 0.4339 0.90100002 0 -0.4339 0.90100002
		 0 -0.4339 0.90100002 0 -0.4339 0 1 0 0 1 0 0.90100002 0 -0.4339 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0;
	setAttr ".n[1162:1327]" -type "float3"  0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 -0.2225 0 0.97490001
		 0 1 0 0 1 0 -0.2225 0 0.97490001 0.62349999 0 0.78179997 0.62349999 0 0.78179997
		 -0.2225 0 0.97490001 -0.2225 0 0.97490001 1 0 0 1 0 0 0.62349999 0 0.78179997 0.62349999
		 0 0.78179997 1 0 0 1 0 0 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997 -0.2225
		 0 -0.97490001 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997 -0.2225 0 -0.97490001
		 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.2225 0 -0.97490001 -0.2225 0 -0.97490001
		 -0.90100002 0 0.4339 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 0.4339
		 -0.0766 -0.61940002 0.78130001 -0.90100002 0 0.4339 -0.90100002 0 0.4339 -0.0766
		 -0.61940002 0.78130001 -0.071000002 0.95209998 -0.29730001 0.0766 -0.61940002 0.78130001
		 0.0766 -0.61940002 0.78130001 -0.071000002 0.95209998 -0.29730001 0.95670003 0.1228
		 0.26390001 0.071000002 0.95209998 -0.29730001 0.071000002 0.95209998 -0.29730001
		 0.95670003 0.1228 0.26390001 0.89060003 0.33989999 0.3021 0.89060003 0.33989999 0.3021
		 -0.89060003 0.33989999 0.3021 -0.89060003 0.33989999 0.3021 -0.95670003 0.1228 0.264
		 -0.95670003 0.1228 0.264 -0.9188 -0.061500002 0.38999999 -0.9188 -0.061500002 0.38999999
		 -0.77780002 -0.25619999 0.57389998 -0.77780002 -0.25619999 0.57389998 -0.56580001
		 -0.4258 0.70609999 -0.56580001 -0.4258 0.70609999 -0.56580001 -0.4258 0.70609999
		 -0.2992 -0.5557 0.77560002 -0.2992 -0.5557 0.77560002 -0.56580001 -0.4258 0.70609999
		 -0.2992 -0.5557 0.77560002 0.2992 -0.5557 0.77560002 0.2992 -0.5557 0.77560002 -0.2992
		 -0.5557 0.77560002 0.2992 -0.5557 0.77560002 0.56580001 -0.4258 0.70609999 0.56580001
		 -0.4258 0.70609999 0.2992 -0.5557 0.77560002 0.56580001 -0.4258 0.70609999 0.77780002
		 -0.25619999 0.57389998 0.77780002 -0.25619999 0.57389998 0.56580001 -0.4258 0.70609999
		 0.77780002 -0.25619999 0.57389998 0.071000002 0.95209998 -0.29730001 0.071000002
		 0.95209998 -0.29730001 0.77780002 -0.25619999 0.57389998 0.95670003 0.1228 0.26390001
		 0.9188 -0.061500002 0.38999999 0.9188 -0.061500002 0.38999999 0.95670003 0.1228 0.26390001
		 -0.76859999 0.56999999 0.29049999 0.9188 -0.061500002 0.38999999 0.9188 -0.061500002
		 0.38999999 -0.76859999 0.56999999 0.29049999 -0.76859999 0.56999999 0.29049999 -0.64810002
		 0.74620003 0.1522 -0.64810002 0.74620003 0.1522 -0.76859999 0.56999999 0.29049999
		 -0.64810002 0.74620003 0.1522 -0.48210001 0.8761 0.00060000003 -0.48210001 0.8761
		 0.00060000003 -0.64810002 0.74620003 0.1522 -0.48210001 0.8761 0.00060000003 -0.95670003
		 0.1228 0.264 -0.95670003 0.1228 0.264 -0.48210001 0.8761 0.00060000003 -0.77780002
		 -0.25619999 0.57389998 -0.26550001 0.94950002 -0.1674 -0.26550001 0.94950002 -0.1674
		 -0.77780002 -0.25619999 0.57389998 -0.26550001 0.94950002 -0.1674 0.26550001 0.94950002
		 -0.1674 0.26550001 0.94950002 -0.1674 -0.26550001 0.94950002 -0.1674 0.48210001 0.8761
		 0.00060000003 0.48210001 0.8761 0.00060000003 0.26550001 0.94950002 -0.1674 0.26550001
		 0.94950002 -0.1674 0.64810002 0.74620003 0.1522 0.64810002 0.74620003 0.1522 0.48210001
		 0.8761 0.00060000003 0.48210001 0.8761 0.00060000003 0.89060003 0.33989999 0.3021
		 0.89060003 0.33989999 0.3021 0.64810002 0.74620003 0.1522 0.64810002 0.74620003 0.1522
		 -0.89060003 0.33989999 0.3021 0.76859999 0.56999999 0.29049999 0.76859999 0.56999999
		 0.29049999 -0.89060003 0.33989999 0.3021 0.76859999 0.56999999 0.29049999 -0.71079999
		 0.48370001 0.51059997 -0.71079999 0.48370001 0.51059997 0.76859999 0.56999999 0.29049999
		 -0.71079999 0.48370001 0.51059997 -0.71079999 0.48370001 0.51059997 -0.71079999 0.48370001
		 0.51059997 -0.71079999 0.48370001 0.51059997 -0.71079999 0.48370001 0.51059997 0
		 -0.052099999 0.99860001 0 -0.052099999 0.99860001 -0.71079999 0.48370001 0.51059997
		 0 -0.052099999 0.99860001 -0.9188 -0.061500002 0.38999999 -0.9188 -0.061500002 0.38999999
		 0 -0.052099999 0.99860001 0.71079999 0.48370001 0.51059997 0.71079999 0.48370001
		 0.51059997 0 -0.052099999 0.99860001 0 -0.052099999 0.99860001 0 1 0.0019 0.71079999
		 0.48370001 0.51059997 0.71079999 0.48370001 0.51059997 0 1 0.0019 -0.66039997 0.43529999
		 0.61189997 -0.66039997 0.43529999 0.61189997 0 1 0.0019 0 1 0.0019 -0.54759997 0.33939999
		 0.76480001 -0.66039997 0.43529999 0.61189997 -0.66039997 0.43529999 0.61189997 -0.54759997
		 0.33939999 0.76480001 -0.42300001 0.2431 0.87290001;
	setAttr ".n[1328:1493]" -type "float3"  -0.54759997 0.33939999 0.76480001 -0.54759997
		 0.33939999 0.76480001 -0.42300001 0.2431 0.87290001 -0.42300001 0.2431 0.87290001
		 -0.28060001 0.1397 0.94959998 -0.28060001 0.1397 0.94959998 -0.42300001 0.2431 0.87290001
		 -0.28060001 0.1397 0.94959998 -0.28060001 0.1397 0.94959998 -0.106 0.0187 0.99419999
		 -0.106 0.0187 0.99419999 0.106 0.0187 0.99419999 0.106 0.0187 0.99419999 -0.106 0.0187
		 0.99419999 -0.106 0.0187 0.99419999 0.106 0.0187 0.99419999 0.106 0.0187 0.99419999
		 0.28060001 0.1397 0.94959998 0.28060001 0.1397 0.94959998 0.28060001 0.1397 0.94959998
		 0.42300001 0.2431 0.87290001 0.42300001 0.2431 0.87290001 0.28060001 0.1397 0.94959998
		 0.42300001 0.2431 0.87290001 0.42300001 0.2431 0.87290001 0.54759997 0.33950001 0.76480001
		 0.54759997 0.33950001 0.76480001 0.66039997 0.43529999 0.61189997 0.54759997 0.33950001
		 0.76480001 0.54759997 0.33950001 0.76480001 0.66039997 0.43529999 0.61189997 -0.66039997
		 0.58749998 0.46779999 0.66039997 0.43529999 0.61189997 0.66039997 0.43529999 0.61189997
		 -0.66039997 0.58749998 0.46779999 -0.66039997 0.58749998 0.46779999 -0.54759997 0.74529999
		 0.38029999 -0.54759997 0.74529999 0.38029999 -0.66039997 0.58749998 0.46779999 -0.54759997
		 0.74529999 0.38029999 -0.42300001 0.8585 0.28999999 -0.42300001 0.8585 0.28999999
		 -0.54759997 0.74529999 0.38029999 -0.28060001 0.94069999 0.1909 -0.42300001 0.8585
		 0.28999999 -0.42300001 0.8585 0.28999999 -0.28060001 0.94069999 0.1909 -0.106 0.99169999
		 0.072400004 -0.28060001 0.94069999 0.1909 -0.28060001 0.94069999 0.1909 -0.106 0.99169999
		 0.072400004 -0.106 0.99169999 0.072400004 -0.106 0.99169999 0.072400004 0.106 0.99169999
		 0.072400004 0.106 0.99169999 0.072400004 0.106 0.99169999 0.072400004 0.28060001
		 0.94069999 0.1909 0.28060001 0.94069999 0.1909 0.106 0.99169999 0.072400004 0.42300001
		 0.8585 0.28999999 0.42300001 0.8585 0.28999999 0.28060001 0.94069999 0.1909 0.28060001
		 0.94069999 0.1909 0.54759997 0.74529999 0.38029999 0.42300001 0.8585 0.28999999 0.42300001
		 0.8585 0.28999999 0.54759997 0.74529999 0.38029999 0.66039997 0.58749998 0.46779999
		 0.54759997 0.74529999 0.38029999 0.54759997 0.74529999 0.38029999 0.66039997 0.58749998
		 0.46779999 0.66039997 0.58749998 0.46779999 0.35519999 0.64289999 0.67860001 0.35519999
		 0.64289999 0.67860001 0.66039997 0.58749998 0.46779999 0.35519999 0.64289999 0.67860001
		 0.35519999 0.64289999 0.67860001 0 0.89050001 0.4549 0 0.89050001 0.4549 0 0.89050001
		 0.4549 0 0.89050001 0.4549 -0.35519999 0.64289999 0.67860001 -0.35519999 0.64289999
		 0.67860001 0 0.40619999 0.9138 0 0.40619999 0.9138 -0.35519999 0.64289999 0.67860001
		 -0.35519999 0.64289999 0.67860001 0 0.40619999 0.9138 0.3114 0.6893 0.65420002 0.3114
		 0.6893 0.65420002 0 0.40619999 0.9138 0.3114 0.6893 0.65420002 0.3114 0.6893 0.65420002
		 0.2404 0.75300002 0.61250001 0.2404 0.75300002 0.61250001 0.2404 0.75300002 0.61250001
		 0.2404 0.75300002 0.61250001 0.1795 0.79809999 0.57520002 0.1795 0.79809999 0.57520002
		 0.1184 0.83569998 0.5363 0.1184 0.83569998 0.5363 0.1795 0.79809999 0.57520002 0.1795
		 0.79809999 0.57520002 0.1184 0.83569998 0.5363 0.046100002 0.87190002 0.48750001
		 0.046100002 0.87190002 0.48750001 0.1184 0.83569998 0.5363 -0.046100002 0.87190002
		 0.48750001 -0.046100002 0.87190002 0.48750001 0.046100002 0.87190002 0.48750001 0.046100002
		 0.87190002 0.48750001 -0.1184 0.83569998 0.5363 -0.1184 0.83569998 0.5363 -0.046100002
		 0.87190002 0.48750001 -0.046100002 0.87190002 0.48750001 -0.1184 0.83569998 0.5363
		 -0.1795 0.79809999 0.57520002 -0.1795 0.79809999 0.57520002 -0.1184 0.83569998 0.5363
		 -0.1795 0.79809999 0.57520002 -0.1795 0.79809999 0.57520002 -0.2404 0.75300002 0.61250001
		 -0.2404 0.75300002 0.61250001 -0.3114 0.6893 0.65420002 -0.3114 0.6893 0.65420002
		 -0.2404 0.75300002 0.61250001 -0.2404 0.75300002 0.61250001 0.3114 0.61589998 0.72359997
		 -0.3114 0.6893 0.65420002 -0.3114 0.6893 0.65420002 0.3114 0.61589998 0.72359997
		 0.2404 0.57090002 0.78500003 0.2404 0.57090002 0.78500003 0.3114 0.61589998 0.72359997
		 0.3114 0.61589998 0.72359997 0.1795 0.53119999 0.82800001 0.1795 0.53119999 0.82800001
		 0.2404 0.57090002 0.78500003 0.2404 0.57090002 0.78500003 0.1184 0.4903 0.8635 0.1795
		 0.53119999 0.82800001 0.1795 0.53119999 0.82800001 0.1184 0.4903 0.8635 0.046100002
		 0.43959999 0.89700001 0.1184 0.4903 0.8635 0.1184 0.4903 0.8635 0.046100002 0.43959999
		 0.89700001 -0.046100002 0.43959999 0.89700001 0.046100002 0.43959999 0.89700001 0.046100002
		 0.43959999 0.89700001 -0.046100002 0.43959999 0.89700001 -0.046100002 0.43959999
		 0.89700001 -0.046100002 0.43959999 0.89700001 -0.1184 0.4903 0.8635 -0.1184 0.4903
		 0.8635 -0.1795 0.53119999 0.82800001 -0.1795 0.53119999 0.82800001 -0.1184 0.4903
		 0.8635 -0.1184 0.4903 0.8635 -0.2404 0.57090002 0.78500003 -0.1795 0.53119999 0.82800001
		 -0.1795 0.53119999 0.82800001 -0.2404 0.57090002 0.78500003 -0.3114 0.61589998 0.72359997
		 -0.2404 0.57090002 0.78500003 -0.2404 0.57090002 0.78500003;
	setAttr ".n[1494:1659]" -type "float3"  -0.3114 0.61589998 0.72359997 1 0 0 -0.3114
		 0.61589998 0.72359997 -0.3114 0.61589998 0.72359997 1 0 0 1 0 0 1 0 0 0 0.72600001
		 -0.68769997 0 0.72600001 -0.68769997 -1 0 0 0 0.72600001 -0.68769997 0 0.72600001
		 -0.68769997 -1 0 0 0 -0.72600001 0.68769997 -1 0 0 -1 0 0 0 -0.72600001 0.68769997
		 0.98650002 0.1187 -0.1124 0 -0.72600001 0.68769997 0 -0.72600001 0.68769997 0.98650002
		 0.1187 -0.1124 0.88239998 0.34150001 -0.32350001 0.98650002 0.1187 -0.1124 0.98650002
		 0.1187 -0.1124 0.88239998 0.34150001 -0.32350001 0.69099998 0.5248 -0.49720001 0.88239998
		 0.34150001 -0.32350001 0.88239998 0.34150001 -0.32350001 0.69099998 0.5248 -0.49720001
		 0.43779999 0.65270001 -0.61830002 0.69099998 0.5248 -0.49720001 0.69099998 0.5248
		 -0.49720001 0.43779999 0.65270001 -0.61830002 0.1497 0.71780002 -0.68000001 0.1497
		 0.71780002 -0.68000001 0.43779999 0.65270001 -0.61830002 0.43779999 0.65270001 -0.61830002
		 -0.1497 0.71780002 -0.68000001 -0.1497 0.71780002 -0.68000001 0.1497 0.71780002 -0.68000001
		 0.1497 0.71780002 -0.68000001 -0.43779999 0.65270001 -0.61830002 -0.1497 0.71780002
		 -0.68000001 -0.1497 0.71780002 -0.68000001 -0.43779999 0.65270001 -0.61830002 -0.69099998
		 0.5248 -0.49720001 -0.69099998 0.5248 -0.49720001 -0.43779999 0.65270001 -0.61830002
		 -0.43779999 0.65270001 -0.61830002 -0.69099998 0.5248 -0.49720001 -0.88239998 0.34150001
		 -0.32350001 -0.88239998 0.34150001 -0.32350001 -0.69099998 0.5248 -0.49720001 -0.98650002
		 0.1187 -0.1124 -0.88239998 0.34150001 -0.32350001 -0.88239998 0.34150001 -0.32350001
		 -0.98650002 0.1187 -0.1124 0.98650002 -0.1187 0.1124 0.98650002 -0.1187 0.1124 -0.98650002
		 0.1187 -0.1124 -0.98650002 0.1187 -0.1124 0.88239998 -0.34150001 0.32350001 0.98650002
		 -0.1187 0.1124 0.98650002 -0.1187 0.1124 0.88239998 -0.34150001 0.32350001 0.88239998
		 -0.34150001 0.32350001 0.88239998 -0.34150001 0.32350001 0.69099998 -0.5248 0.49720001
		 0.69099998 -0.5248 0.49720001 0.43779999 -0.65270001 0.61830002 0.69099998 -0.5248
		 0.49720001 0.69099998 -0.5248 0.49720001 0.43779999 -0.65270001 0.61830002 0.1497
		 -0.71780002 0.68000001 0.43779999 -0.65270001 0.61830002 0.43779999 -0.65270001 0.61830002
		 0.1497 -0.71780002 0.68000001 -0.1497 -0.71780002 0.68000001 0.1497 -0.71780002 0.68000001
		 0.1497 -0.71780002 0.68000001 -0.1497 -0.71780002 0.68000001 -0.43779999 -0.65270001
		 0.61830002 -0.43779999 -0.65270001 0.61830002 -0.1497 -0.71780002 0.68000001 -0.1497
		 -0.71780002 0.68000001 -0.69099998 -0.5248 0.49720001 -0.43779999 -0.65270001 0.61830002
		 -0.43779999 -0.65270001 0.61830002 -0.69099998 -0.5248 0.49720001 -0.88239998 -0.34150001
		 0.32350001 -0.88239998 -0.34150001 0.32350001 -0.69099998 -0.5248 0.49720001 -0.69099998
		 -0.5248 0.49720001 -0.98650002 -0.1187 0.1124 -0.98650002 -0.1187 0.1124 -0.88239998
		 -0.34150001 0.32350001 -0.88239998 -0.34150001 0.32350001 0 0.68769997 0.72600001
		 0 0.68769997 0.72600001 -0.98650002 -0.1187 0.1124 -0.98650002 -0.1187 0.1124 0 1
		 0 0 1 0 0 0.68769997 0.72600001 0 0.68769997 0.72600001 0 1 0 0 1 0 0 1 0 0 1 0 0.87739998
		 0.47979999 0 0.8114 0.58459997 0 0.7974 0.60180002 0.044199999 0.85030001 0.52240002
		 0.0638 0.85030001 0.52240002 0.0638 0.7974 0.60180002 0.044199999 0.72719997 0.65530002
		 0.2043 0.78820002 0.56580001 0.2421 0.58999997 0.6983 0.4052 0.65890002 0.59899998
		 0.45500001 0.78820002 0.56580001 0.2421 0.72719997 0.65530002 0.2043 0.65890002 0.59899998
		 0.45500001 0.58999997 0.6983 0.4052 0.41949999 0.70529997 0.57139999 0.48210001 0.6049
		 0.63380003 0.41949999 0.70529997 0.57139999 0.20829999 0.67199999 0.71060002 0.25639999
		 0.57999998 0.77319998 0.48210001 0.6049 0.63380003 0.25639999 0.57999998 0.77319998
		 0.20829999 0.67199999 0.71060002 0.0429 0.62099999 0.7827 0.064800002 0.53939998
		 0.83960003 -0.064800002 0.53939998 -0.83960003 -0.0429 0.62099999 -0.7827 0.00019999999
		 0.6045 -0.79659998 0.00019999999 0.4955 -0.86860001 0.0451 0.94999999 0.3089 0.0451
		 0.94999999 0.3089 0.0451 0.94999999 0.3089 0.0451 0.94999999 0.3089 0.1235 0.9612
		 0.2465 0.1235 0.9612 0.2465 0.1235 0.9612 0.2465 0.1235 0.9612 0.2465 0.18790001
		 0.96340001 0.191 0.18790001 0.96340001 0.191 0.18790001 0.96340001 0.191 0.18790001
		 0.96340001 0.191 0.2509 0.95920002 0.13 0.2509 0.95920002 0.13 0.2509 0.95920002
		 0.13 0.2509 0.95920002 0.13 0.3204 0.94590002 0.051600002 0.3204 0.94590002 0.051600002
		 0.3204 0.94590002 0.051600002 0.3204 0.94590002 0.051600002 0.36000001 0.93300003
		 0 0.36000001 0.93300003 0 0.36000001 0.93300003 0 0.36000001 0.93300003 0 0.000099999997
		 0.93959999 -0.34220001 0.000099999997 0.93959999 -0.34220001 0.000099999997 0.93959999
		 -0.34220001 0.000099999997 0.93959999 -0.34220001 -0.034299999 0.96850002 -0.24680001;
	setAttr ".n[1660:1825]" -type "float3"  -0.034299999 0.96850002 -0.24680001 -0.034299999
		 0.96850002 -0.24680001 -0.034299999 0.96850002 -0.24680001 -0.093199998 0.97600001
		 -0.19679999 -0.093199998 0.97600001 -0.19679999 -0.093199998 0.97600001 -0.19679999
		 -0.093199998 0.97600001 -0.19679999 -0.14210001 0.97799999 -0.15279999 -0.14210001
		 0.97799999 -0.15279999 -0.14210001 0.97799999 -0.15279999 -0.14210001 0.97799999
		 -0.15279999 -0.19069999 0.97610003 -0.1045 -0.19069999 0.97610003 -0.1045 -0.19069999
		 0.97610003 -0.1045 -0.19069999 0.97610003 -0.1045 -0.2458 0.9684 -0.041900001 -0.2458
		 0.9684 -0.041900001 -0.2458 0.9684 -0.041900001 -0.2458 0.9684 -0.041900001 -0.2782
		 0.9605 0 -0.2782 0.9605 0 -0.2782 0.9605 0 -0.2782 0.9605 0 -0.2458 0.9684 0.041900001
		 -0.2458 0.9684 0.041900001 -0.2458 0.9684 0.041900001 -0.2458 0.9684 0.041900001
		 -0.19069999 0.97610003 0.1045 -0.19069999 0.97610003 0.1045 -0.19069999 0.97610003
		 0.1045 -0.19069999 0.97610003 0.1045 -0.14210001 0.97799999 0.15279999 -0.14210001
		 0.97799999 0.15279999 -0.14210001 0.97799999 0.15279999 -0.14210001 0.97799999 0.15279999
		 -0.093199998 0.97600001 0.19679999 -0.093199998 0.97600001 0.19679999 -0.093199998
		 0.97600001 0.19679999 -0.093199998 0.97600001 0.19679999 -0.0361 0.96880001 0.24510001
		 -0.0361 0.96880001 0.24510001 -0.0361 0.96880001 0.24510001 -0.0361 0.96880001 0.24510001
		 -0.000099999997 0.96170002 0.27399999 -0.000099999997 0.96170002 0.27399999 -0.000099999997
		 0.96170002 0.27399999 -0.000099999997 0.96170002 0.27399999 -0.4129 0 -0.91079998
		 -0.4129 0 -0.91079998 -0.4129 0 -0.91079998 -0.4129 0 -0.91079998 -0.66469997 0 -0.7471
		 -0.66469997 0 -0.7471 -0.66469997 0 -0.7471 -0.66469997 0 -0.7471 -0.8678 0 -0.49700001
		 -0.8678 0 -0.49700001 -0.8678 0 -0.49700001 -0.8678 0 -0.49700001 -0.98449999 0 -0.1752
		 -0.98449999 0 -0.1752 -0.98449999 0 -0.1752 -0.98449999 0 -0.1752 -1 0 0 -1 0 0 -1
		 0 0 -1 0 0 -0.98449999 0 0.1752 -0.98449999 0 0.1752 -0.98449999 0 0.1752 -0.98449999
		 0 0.1752 -0.8678 0 0.49700001 -0.8678 0 0.49700001 -0.8678 0 0.49700001 -0.8678 0
		 0.49700001 -0.66469997 0 0.7471 -0.66469997 0 0.7471 -0.66469997 0 0.7471 -0.66469997
		 0 0.7471 -0.4129 0 0.91079998 -0.4129 0 0.91079998 -0.4129 0 0.91079998 -0.4129 0
		 0.91079998 -0.13959999 0 0.99019998 -0.13959999 0 0.99019998 -0.13959999 0 0.99019998
		 -0.13959999 0 0.99019998 -0.00030000001 0 1 -0.00030000001 0 1 -0.00030000001 0 1
		 -0.00030000001 0 1 0.075800002 -0.0603 0.99529999 0.31220001 -0.053599998 0.94849998
		 0.252 -0.4903 0.83429998 0.055300001 -0.43529999 0.89859998 0.31220001 -0.053599998
		 0.94849998 0.59799999 -0.038899999 0.80049998 0.49990001 -0.52329999 0.69010001 0.252
		 -0.4903 0.83429998 0.59799999 -0.038899999 0.80049998 0.81709999 -0.020300001 0.57620001
		 0.69120002 -0.52710003 0.49430001 0.49990001 -0.52329999 0.69010001 0.9544 -0.0011
		 0.2987 0.82130003 -0.50980002 0.2561 0.69120002 -0.52710003 0.49430001 0.81709999
		 -0.020300001 0.57620001 0.82130003 -0.50980002 0.2561 0.9544 -0.0011 0.2987 0.9971
		 0.0122 0.074500002 0.87800002 -0.4745 0.062700003 0.9971 0.0122 -0.074500002 0.93400002
		 -0.35299999 -0.054499999 0.87800002 -0.4745 0.062700003 0.9971 0.0122 0.074500002
		 0.9971 0.0122 -0.074500002 0.98809999 0.0078999996 -0.1534 0.98809999 0.0078999996
		 -0.1534 0.93400002 -0.35299999 -0.054499999 0.15899999 -0.058600001 -0.98549998 0.080700003
		 -0.060199998 -0.99489999 0.048900001 -0.36210001 -0.93089998 0.15899999 -0.058600001
		 -0.98549998 -0.055300001 -0.43509999 -0.8987 0.048900001 -0.36210001 -0.93089998
		 0.080700003 -0.060199998 -0.99489999 -0.075800002 -0.0603 -0.99529999 0.080799997
		 0.24590001 0.9659 0.31639999 0.25929999 0.91250002 0.25639999 0.57999998 0.77319998
		 0.064800002 0.53939998 0.83960003 0.0823 -0.0788 0.99349999 0.3242 -0.093500003 0.94139999
		 0.31639999 0.25929999 0.91250002 0.080799997 0.24590001 0.9659 0.58969998 0.2676
		 0.76200002 0.48210001 0.6049 0.63380003 0.25639999 0.57999998 0.77319998 0.31639999
		 0.25929999 0.91250002 0.3242 -0.093500003 0.94139999 0.60710001 -0.1033 0.78789997
		 0.58969998 0.2676 0.76200002 0.31639999 0.25929999 0.91250002 0.58969998 0.2676 0.76200002
		 0.79449999 0.26589999 0.546 0.65890002 0.59899998 0.45500001 0.48210001 0.6049 0.63380003
		 0.60710001 -0.1033 0.78789997 0.8197 -0.0995 0.56419998 0.79449999 0.26589999 0.546
		 0.58969998 0.2676 0.76200002 0.65890002 0.59899998 0.45500001 0.79449999 0.26589999
		 0.546 0.92299998 0.255 0.28819999 0.78820002 0.56580001 0.2421 0.8197 -0.0995 0.56419998
		 0.95139998 -0.084899999 0.29589999 0.92299998 0.255 0.28819999 0.79449999 0.26589999
		 0.546 0.78820002 0.56580001 0.2421 0.92299998 0.255 0.28819999 0.96780002 0.23999999
		 0.0757 0.85030001 0.52240002 0.0638 0.92299998 0.255 0.28819999 0.95139998 -0.084899999
		 0.29589999 0.9946 -0.069399998 0.076700002;
	setAttr ".n[1826:1991]" -type "float3"  0.96780002 0.23999999 0.0757 0.85030001
		 0.52240002 0.0638 0.96780002 0.23999999 0.0757 0.97829998 0.20720001 0 0.87739998
		 0.47979999 0 0.9946 -0.069399998 0.076700002 0.9982 -0.059500001 0 0.97829998 0.20720001
		 0 0.96780002 0.23999999 0.0757 -0.080799997 0.24590001 -0.9659 -0.064800002 0.53939998
		 -0.83960003 0.00019999999 0.4955 -0.86860001 0.00019999999 0.2103 -0.97759998 0.00019999999
		 -0.068599999 -0.99760002 -0.081600003 -0.079000004 -0.99349999 -0.080799997 0.24590001
		 -0.9659 0.00019999999 0.2103 -0.97759998 0.00019999999 -0.1807 -0.9835 -0.076399997
		 -0.191 -0.97860003 -0.081600003 -0.079000004 -0.99349999 0.00019999999 -0.068599999
		 -0.99760002 0.98159999 -0.1763 0.073399998 0.98610002 -0.16599999 0 0.9982 -0.059500001
		 0 0.9946 -0.069399998 0.076700002 0.98159999 -0.1763 0.073399998 0.9946 -0.069399998
		 0.076700002 0.95139998 -0.084899999 0.29589999 0.93550003 -0.20280001 0.28920001
		 0.8197 -0.0995 0.56419998 0.80110002 -0.2256 0.55440003 0.93550003 -0.20280001 0.28920001
		 0.95139998 -0.084899999 0.29589999 0.58969998 -0.2314 0.77380002 0.80110002 -0.2256
		 0.55440003 0.8197 -0.0995 0.56419998 0.60710001 -0.1033 0.78789997 0.58969998 -0.2314
		 0.77380002 0.60710001 -0.1033 0.78789997 0.3242 -0.093500003 0.94139999 0.31299999
		 -0.2163 0.92479998 0.31299999 -0.2163 0.92479998 0.3242 -0.093500003 0.94139999 0.0823
		 -0.0788 0.99349999 0.079400003 -0.1912 0.97829998 -0.074600004 -0.4946 -0.86589998
		 -0.076399997 -0.191 -0.97860003 0.00019999999 -0.1807 -0.9835 0.00019999999 -0.37360001
		 -0.92760003 0.88709998 -0.46169999 0 0.98610002 -0.16599999 0 0.98159999 -0.1763
		 0.073399998 0.83840001 -0.54110003 0.065099999 0.83840001 -0.54110003 0.065099999
		 0.98159999 -0.1763 0.073399998 0.93550003 -0.20280001 0.28920001 0.79210001 -0.55830002
		 0.24680001 0.79210001 -0.55830002 0.24680001 0.93550003 -0.20280001 0.28920001 0.80110002
		 -0.2256 0.55440003 0.67369998 -0.5733 0.4664 0.67369998 -0.5733 0.4664 0.80110002
		 -0.2256 0.55440003 0.58969998 -0.2314 0.77380002 0.50080001 -0.56819999 0.653 0.50080001
		 -0.56819999 0.653 0.58969998 -0.2314 0.77380002 0.31299999 -0.2163 0.92479998 0.2775
		 -0.53839999 0.79570001 0.2775 -0.53839999 0.79570001 0.31299999 -0.2163 0.92479998
		 0.079400003 -0.1912 0.97829998 0.077399999 -0.49559999 0.86510003 0.00019999999 -0.37360001
		 -0.92760003 0.048900001 -0.36210001 -0.93089998 -0.055300001 -0.43509999 -0.8987
		 -0.074600004 -0.4946 -0.86589998 0.83840001 -0.54110003 0.065099999 0.87800002 -0.4745
		 0.062700003 0.93400002 -0.35299999 -0.054499999 0.88709998 -0.46169999 0 0.79210001
		 -0.55830002 0.24680001 0.82130003 -0.50980002 0.2561 0.87800002 -0.4745 0.062700003
		 0.83840001 -0.54110003 0.065099999 0.67369998 -0.5733 0.4664 0.69120002 -0.52710003
		 0.49430001 0.82130003 -0.50980002 0.2561 0.79210001 -0.55830002 0.24680001 0.69120002
		 -0.52710003 0.49430001 0.67369998 -0.5733 0.4664 0.50080001 -0.56819999 0.653 0.49990001
		 -0.52329999 0.69010001 0.49990001 -0.52329999 0.69010001 0.50080001 -0.56819999 0.653
		 0.2775 -0.53839999 0.79570001 0.252 -0.4903 0.83429998 0.252 -0.4903 0.83429998 0.2775
		 -0.53839999 0.79570001 0.077399999 -0.49559999 0.86510003 0.055300001 -0.43529999
		 0.89859998 0.00030000001 0 -1 0.00030000001 0 -1 0.00030000001 0 -1 0.00030000001
		 0 -1 -0.1288 0 -0.99169999 -0.1288 0 -0.99169999 -0.1288 0 -0.99169999 -0.1288 0
		 -0.99169999 -0.099799998 0.99180001 0.079599999 -0.099799998 0.99180001 0.079599999
		 -0.055399999 0.99180001 0.115 -0.055399999 0.99180001 0.115 -0.055399999 0.99180001
		 0.115 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 -0.099799998 0.99180001 0.079599999 0 0.99180001
		 0.1277 0 0.99180001 0.1277 0 0.99180001 0.1277 0.055399999 0.99180001 0.115 0.055399999
		 0.99180001 0.115 0.055399999 0.99180001 0.115 0.099799998 0.99180001 0.079599999
		 0.099799998 0.99180001 0.079599999 0.099799998 0.99180001 0.079599999 0.1245 0.99180001
		 0.0284 0.1245 0.99180001 0.0284 0.1245 0.99180001 0.0284 0.1245 0.99180001 -0.0284
		 0.1245 0.99180001 -0.0284 0.1245 0.99180001 -0.0284 0.099799998 0.99180001 -0.079599999
		 0.099799998 0.99180001 -0.079599999 0.099799998 0.99180001 -0.079599999 0.055399999
		 0.99180001 -0.115 0.055399999 0.99180001 -0.115 0.055399999 0.99180001 -0.115 0 0.99180001
		 -0.1277 0 0.99180001 -0.1277 0 0.99180001 -0.1277 -0.055399999 0.99180001 -0.115
		 -0.055399999 0.99180001 -0.115 -0.055399999 0.99180001 -0.115 -0.099799998 0.99180001
		 -0.079599999 -0.099799998 0.99180001 -0.079599999 -0.099799998 0.99180001 -0.079599999
		 -0.1245 0.99180001 -0.0284 -0.1245 0.99180001 -0.0284 -0.1245 0.99180001 -0.0284;
	setAttr ".n[1992:2157]" -type "float3"  -0.1245 0.99180001 0.0284 -0.1245 0.99180001
		 0.0284 -0.1245 0.99180001 0.0284 -0.1245 0.99180001 -0.0284 -0.1245 0.99180001 -0.0284
		 -0.1245 0.99180001 -0.0284 -0.1245 0.99180001 0.0284 -0.1245 0.99180001 0.0284 -0.1245
		 0.99180001 0.0284 0.2225 0 -0.97490001 0.2225 0 -0.97490001 0.2225 0 -0.97490001
		 0.2225 0 -0.97490001 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997 -0.62349999
		 0 -0.78179997 -0.62349999 0 -0.78179997 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -0.62349999 0
		 0.78179997 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997
		 0.2225 0 0.97490001 0.2225 0 0.97490001 0.2225 0 0.97490001 0.2225 0 0.97490001 0.90100002
		 0 0.4339 0.90100002 0 0.4339 0.90100002 0 0.4339 0.90100002 0 0.4339 0.90100002 0
		 -0.4339 0.90100002 0 -0.4339 0.90100002 0 -0.4339 0.90100002 0 -0.4339 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 -0.2225 0 0.97490001 -0.2225 0 0.97490001 -0.2225
		 0 0.97490001 -0.2225 0 0.97490001 0.62349999 0 0.78179997 0.62349999 0 0.78179997
		 0.62349999 0 0.78179997 0.62349999 0 0.78179997 1 0 0 1 0 0 1 0 0 1 0 0 0.62349999
		 0 -0.78179997 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997
		 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001
		 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339
		 -0.90100002 0 0.4339 -0.90100002 0 0.4339 -0.90100002 0 0.4339 -0.90100002 0 0.4339
		 0.2225 0 -0.97490001 0.2225 0 -0.97490001 0.2225 0 -0.97490001 0.2225 0 -0.97490001
		 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997 -0.62349999
		 0 -0.78179997 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -0.62349999 0 0.78179997 -0.62349999 0
		 0.78179997 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997 0.2225 0 0.97490001
		 0.2225 0 0.97490001 0.2225 0 0.97490001 0.2225 0 0.97490001 0.90100002 0 0.4339 0.90100002
		 0 0.4339 0.90100002 0 0.4339 0.90100002 0 0.4339 0.90100002 0 -0.4339 0.90100002
		 0 -0.4339 0.90100002 0 -0.4339 0.90100002 0 -0.4339 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0;
	setAttr ".n[2158:2323]" -type "float3"  0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 -0.2225 0 0.97490001 -0.2225 0 0.97490001 -0.2225 0
		 0.97490001 -0.2225 0 0.97490001 0.62349999 0 0.78179997 0.62349999 0 0.78179997 0.62349999
		 0 0.78179997 0.62349999 0 0.78179997 1 0 0 1 0 0 1 0 0 1 0 0 0.62349999 0 -0.78179997
		 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997 -0.2226
		 0 -0.97490001 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.90100002
		 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002
		 0 0.4339 -0.90100002 0 0.4339 -0.90100002 0 0.4339 -0.90100002 0 0.4339 0.2225 0
		 -0.97490001 0.2225 0 -0.97490001 0.2225 0 -0.97490001 0.2225 0 -0.97490001 -0.62349999
		 0 -0.78179997 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997
		 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997 -0.62349999
		 0 0.78179997 -0.62349999 0 0.78179997 0.2225 0 0.97490001 0.2225 0 0.97490001 0.2225
		 0 0.97490001 0.2225 0 0.97490001 0.90100002 0 0.4339 0.90100002 0 0.4339 0.90100002
		 0 0.4339 0.90100002 0 0.4339 0.90100002 0 -0.4339 0.90100002 0 -0.4339 0.90100002
		 0 -0.4339 0.90100002 0 -0.4339 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 -0.2225
		 0 0.97490001 -0.2225 0 0.97490001 -0.2225 0 0.97490001 -0.2225 0 0.97490001 0.62349999
		 0 0.78179997 0.62349999 0 0.78179997 0.62349999 0 0.78179997 0.62349999 0 0.78179997
		 1 0 0 1 0 0 1 0 0 1 0 0 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997 0.62349999
		 0 -0.78179997 0.62349999 0 -0.78179997 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001
		 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339
		 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 0.4339 -0.90100002 0 0.4339
		 -0.90100002 0 0.4339 -0.90100002 0 0.4339 0.2225 0 -0.97490001 0.2225 0 -0.97490001
		 0.2225 0 -0.97490001 0.2225 0 -0.97490001 -0.62349999 0 -0.78179997 -0.62349999 0
		 -0.78179997 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997;
	setAttr ".n[2324:2489]" -type "float3"  -1 0 0 -1 0 0 -1 0 0 -1 0 0 -0.62349999
		 0 0.78179997 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997
		 0.2225 0 0.97490001 0.2225 0 0.97490001 0.2225 0 0.97490001 0.2225 0 0.97490001 0.90100002
		 0 0.4339 0.90100002 0 0.4339 0.90100002 0 0.4339 0.90100002 0 0.4339 0.90100002 0
		 -0.4339 0.90100002 0 -0.4339 0.90100002 0 -0.4339 0.90100002 0 -0.4339 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 -0.2225 0 0.97490001 -0.2225 0 0.97490001 -0.2225
		 0 0.97490001 -0.2225 0 0.97490001 0.62349999 0 0.78179997 0.62349999 0 0.78179997
		 0.62349999 0 0.78179997 0.62349999 0 0.78179997 1 0 0 1 0 0 1 0 0 1 0 0 0.62349999
		 0 -0.78179997 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997
		 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001
		 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339
		 -0.90100002 0 0.4339 -0.90100002 0 0.4339 -0.90100002 0 0.4339 -0.90100002 0 0.4339
		 0.2225 0 -0.97490001 0.2225 0 -0.97490001 0.2225 0 -0.97490001 0.2225 0 -0.97490001
		 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997 -0.62349999
		 0 -0.78179997 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -0.62349999 0 0.78179997 -0.62349999 0
		 0.78179997 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997 0.2225 0 0.97490001
		 0.2225 0 0.97490001 0.2225 0 0.97490001 0.2225 0 0.97490001 0.90100002 0 0.4339 0.90100002
		 0 0.4339 0.90100002 0 0.4339 0.90100002 0 0.4339 0.90100002 0 -0.4339 0.90100002
		 0 -0.4339 0.90100002 0 -0.4339 0.90100002 0 -0.4339 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0;
	setAttr ".n[2490:2630]" -type "float3"  0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 -0.2225 0 0.97490001 -0.2225 0 0.97490001 -0.2225 0 0.97490001 -0.2225
		 0 0.97490001 0.62349999 0 0.78179997 0.62349999 0 0.78179997 0.62349999 0 0.78179997
		 0.62349999 0 0.78179997 1 0 0 1 0 0 1 0 0 1 0 0 0.62349999 0 -0.78179997 0.62349999
		 0 -0.78179997 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997 -0.2226 0 -0.97490001
		 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.90100002 0 -0.4339
		 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 0.4339
		 -0.90100002 0 0.4339 -0.90100002 0 0.4339 -0.90100002 0 0.4339 0.2225 0 -0.97490001
		 0.2225 0 -0.97490001 0.2225 0 -0.97490001 0.2225 0 -0.97490001 -0.62349999 0 -0.78179997
		 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997 -0.62349999 0 -0.78179997 -1
		 0 0 -1 0 0 -1 0 0 -1 0 0 -0.62349999 0 0.78179997 -0.62349999 0 0.78179997 -0.62349999
		 0 0.78179997 -0.62349999 0 0.78179997 0.2225 0 0.97490001 0.2225 0 0.97490001 0.2225
		 0 0.97490001 0.2225 0 0.97490001 0.90100002 0 0.4339 0.90100002 0 0.4339 0.90100002
		 0 0.4339 0.90100002 0 0.4339 0.90100002 0 -0.4339 0.90100002 0 -0.4339 0.90100002
		 0 -0.4339 0.90100002 0 -0.4339 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 -0.2225
		 0 0.97490001 -0.2225 0 0.97490001 -0.2225 0 0.97490001 -0.2225 0 0.97490001 0.62349999
		 0 0.78179997 0.62349999 0 0.78179997 0.62349999 0 0.78179997 0.62349999 0 0.78179997
		 1 0 0 1 0 0 1 0 0 1 0 0 0.62349999 0 -0.78179997 0.62349999 0 -0.78179997 0.62349999
		 0 -0.78179997 0.62349999 0 -0.78179997 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001
		 -0.2226 0 -0.97490001 -0.2226 0 -0.97490001 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339
		 -0.90100002 0 -0.4339 -0.90100002 0 -0.4339 -0.90100002 0 0.4339 -0.90100002 0 0.4339
		 -0.90100002 0 0.4339 -0.90100002 0 0.4339;
	setAttr -s 672 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 2 3
		f 4 -1 4 5 6
		mu 0 4 4 5 6 7
		f 4 7 8 -6 9
		mu 0 4 8 9 7 6
		f 4 10 11 -8 12
		mu 0 4 10 11 9 8
		f 4 13 14 -11 15
		mu 0 4 12 13 11 10
		f 4 -14 16 17 18
		mu 0 4 13 12 14 15
		f 4 -3 19 20 21
		mu 0 4 3 2 16 17
		f 4 22 23 -21 24
		mu 0 4 18 19 17 16
		f 4 -23 25 26 27
		mu 0 4 19 18 20 21
		f 4 28 29 30 -27
		mu 0 4 20 22 23 21
		f 4 -30 31 32 33
		mu 0 4 23 22 24 25
		f 4 34 35 -18 36
		mu 0 4 26 27 15 14
		f 4 37 38 -32 39
		mu 0 4 28 29 30 22
		f 4 -40 -29 40 41
		mu 0 4 28 22 20 31
		f 4 -26 42 43 -41
		mu 0 4 20 18 32 31
		f 4 -43 -25 44 45
		mu 0 4 32 18 16 33
		f 4 -20 46 47 -45
		mu 0 4 16 2 34 33
		f 4 -47 -2 48 49
		mu 0 4 34 2 1 35
		f 4 -49 -7 50 51
		mu 0 4 36 4 7 37
		f 4 -51 -9 52 53
		mu 0 4 37 7 9 38
		f 4 54 -53 -12 55
		mu 0 4 39 38 9 11
		f 4 -56 -15 56 57
		mu 0 4 39 11 13 40
		f 4 58 59 -57 -19
		mu 0 4 15 41 40 13
		f 4 -59 -36 60 61
		mu 0 4 41 15 27 42
		f 4 -38 62 63 64
		mu 0 4 29 28 43 44
		f 4 65 -63 -42 66
		mu 0 4 45 43 28 31
		f 4 -44 67 68 -67
		mu 0 4 31 32 46 45
		f 4 69 70 -68 -46
		mu 0 4 33 47 46 32
		f 4 71 72 -70 -48
		mu 0 4 34 48 47 33
		f 4 -50 73 74 -72
		mu 0 4 34 35 49 48
		f 4 75 -74 -52 76
		mu 0 4 50 51 36 37
		f 4 77 -77 -54 78
		mu 0 4 52 50 37 38
		f 4 79 80 -79 -55
		mu 0 4 39 53 52 38
		f 4 81 -80 -58 82
		mu 0 4 54 53 39 40
		f 4 83 84 -83 -60
		mu 0 4 41 55 54 40
		f 4 -62 85 86 -84
		mu 0 4 41 42 56 57
		f 4 87 -64 88 89
		mu 0 4 58 59 60 61
		f 4 -89 -66 90 91
		mu 0 4 61 60 62 63
		f 4 -91 -69 92 93
		mu 0 4 63 62 64 65
		f 4 -93 -71 94 95
		mu 0 4 65 64 66 67
		f 4 96 -95 -73 97
		mu 0 4 68 67 66 69
		f 4 -98 -75 98 99
		mu 0 4 68 69 70 71
		f 4 -99 -76 100 101
		mu 0 4 71 70 72 73
		f 4 -101 -78 102 103
		mu 0 4 73 72 74 75
		f 4 104 -103 -81 105
		mu 0 4 76 75 74 77
		f 4 106 -106 -82 107
		mu 0 4 78 76 77 79
		f 4 108 -108 -85 109
		mu 0 4 80 78 79 81
		f 4 110 111 112 113
		mu 0 4 82 83 84 85
		f 4 114 115 116 -112
		mu 0 4 83 86 87 84
		f 4 117 118 119 -116
		mu 0 4 86 88 89 87
		f 4 120 121 -119 122
		mu 0 4 90 91 89 88
		f 4 -121 123 124 125
		mu 0 4 91 90 92 93
		f 4 126 127 -125 128
		mu 0 4 94 95 93 92
		f 4 129 130 131 -127
		mu 0 4 96 97 98 99
		f 4 132 133 134 -131
		mu 0 4 97 100 101 98
		f 4 135 -134 136 137
		mu 0 4 102 101 100 103
		f 4 138 -138 139 140
		mu 0 4 104 102 103 105
		f 4 141 142 143 -141
		mu 0 4 105 106 107 104
		f 4 144 -143 145 146
		mu 0 4 108 107 106 109
		f 4 147 148 -34 149
		mu 0 4 110 111 23 25
		f 4 150 151 -148 152
		mu 0 4 112 113 114 115
		f 4 153 -31 -149 154
		mu 0 4 116 21 23 111
		f 4 155 156 -155 -152
		mu 0 4 113 117 118 114
		f 4 157 158 -28 -154
		mu 0 4 116 119 19 21
		f 4 159 160 -158 -157
		mu 0 4 117 120 119 118
		f 4 -159 161 162 -24
		mu 0 4 19 119 121 17
		f 4 163 164 -162 -161
		mu 0 4 120 122 121 119
		f 4 -163 165 166 -22
		mu 0 4 17 121 123 3
		f 4 -165 167 168 -166
		mu 0 4 121 122 124 123
		f 4 -167 169 170 -4
		mu 0 4 3 123 125 0
		f 4 171 172 -170 -169
		mu 0 4 124 126 125 123
		f 4 173 -5 -171 174
		mu 0 4 127 6 5 128
		f 4 175 176 -175 -173
		mu 0 4 129 130 131 132
		f 4 -174 177 178 -10
		mu 0 4 6 127 133 8
		f 4 -177 179 180 -178
		mu 0 4 131 130 134 135
		f 4 -179 181 182 -13
		mu 0 4 8 133 136 10
		f 4 183 184 -182 -181
		mu 0 4 134 137 136 135
		f 4 -183 185 186 -16
		mu 0 4 10 136 138 12
		f 4 -185 187 188 -186
		mu 0 4 136 137 139 138
		f 4 189 190 -17 -187
		mu 0 4 138 140 14 12
		f 4 -189 191 192 -190
		mu 0 4 138 139 141 140
		f 4 193 -37 -191 194
		mu 0 4 142 26 14 140
		f 4 195 196 -195 -193
		mu 0 4 141 143 142 140
		f 4 197 198 -196 199
		mu 0 4 144 145 143 141
		f 4 200 -200 -192 201
		mu 0 4 146 144 141 139
		f 4 -188 202 203 -202
		mu 0 4 139 137 147 146
		f 4 204 205 -203 -184
		mu 0 4 134 148 147 137
		f 4 206 -205 -180 207
		mu 0 4 149 148 134 130
		f 4 -176 208 209 -208
		mu 0 4 130 129 150 149
		f 4 210 -209 -172 211
		mu 0 4 151 152 126 124
		f 4 -212 -168 212 213
		mu 0 4 151 124 122 153
		f 4 214 215 -213 -164
		mu 0 4 120 154 153 122
		f 4 216 -215 -160 217
		mu 0 4 155 154 120 117
		f 4 -218 -156 218 219
		mu 0 4 155 117 113 156
		f 4 -219 -151 220 221
		mu 0 4 156 113 112 157
		f 4 222 -198 223 224
		mu 0 4 158 145 144 159
		f 4 -224 -201 225 226
		mu 0 4 159 144 146 160
		f 4 227 -226 -204 228
		mu 0 4 161 160 146 147
		f 4 229 230 -229 -206
		mu 0 4 148 162 161 147
		f 4 231 232 -230 -207
		mu 0 4 149 163 162 148
		f 4 -210 233 234 -232
		mu 0 4 149 150 164 163
		f 4 -234 -211 235 236
		mu 0 4 165 152 151 166
		f 4 -236 -214 237 238
		mu 0 4 166 151 153 167
		f 4 -238 -216 239 240
		mu 0 4 167 153 154 168
		f 4 -240 -217 241 242
		mu 0 4 168 154 155 169
		f 4 -242 -220 243 244
		mu 0 4 169 155 156 170
		f 4 -244 -222 245 246
		mu 0 4 170 156 157 171
		f 4 247 -145 248 -225
		mu 0 4 159 107 108 158
		f 4 -144 -248 -227 249
		mu 0 4 172 173 174 175
		f 4 -139 -250 -228 250
		mu 0 4 176 172 175 177
		f 4 -136 -251 -231 251
		mu 0 4 178 176 177 179
		f 4 -135 -252 -233 252
		mu 0 4 180 178 179 181
		f 4 -132 -253 -235 253
		mu 0 4 182 180 181 183
		f 4 254 -128 -254 -237
		mu 0 4 166 93 95 165
		f 4 255 -126 -255 -239
		mu 0 4 184 185 186 187
		f 4 256 -122 -256 -241
		mu 0 4 188 189 185 184
		f 4 -257 -243 257 -120
		mu 0 4 189 188 190 191
		f 4 -258 -245 258 -117
		mu 0 4 191 190 192 193
		f 4 -259 -247 259 -113
		mu 0 4 193 192 194 195
		f 4 260 261 262 263
		mu 0 4 196 197 198 199
		f 4 264 265 266 -263
		mu 0 4 198 200 201 199
		f 4 267 268 269 270
		mu 0 4 202 203 204 205
		f 4 271 -270 272 273
		mu 0 4 206 205 204 207
		f 4 -274 274 275 276
		mu 0 4 206 207 208 209
		f 4 277 278 279 -276
		mu 0 4 208 210 211 209
		f 4 -279 280 281 282
		mu 0 4 211 210 212 213
		f 4 -282 283 -261 284
		mu 0 4 213 212 197 196
		f 3 -262 285 286
		mu 0 3 214 215 216
		f 3 -265 -287 287
		mu 0 3 217 214 216
		f 3 288 -288 289
		mu 0 3 218 217 216
		f 3 290 -290 291
		mu 0 3 219 218 216
		f 3 292 -292 293
		mu 0 3 220 219 216
		f 3 294 -294 295
		mu 0 3 221 220 216
		f 3 296 -296 297
		mu 0 3 222 221 216
		f 3 298 -298 299
		mu 0 3 223 222 216
		f 3 -269 -300 300
		mu 0 3 224 223 216
		f 3 -273 -301 301
		mu 0 3 225 224 216
		f 3 -275 -302 302
		mu 0 3 226 225 216
		f 3 -278 -303 303
		mu 0 3 227 226 216
		f 3 -281 -304 304
		mu 0 3 228 227 216
		f 3 -284 -305 -286
		mu 0 3 215 229 216
		f 4 305 306 307 308
		mu 0 4 230 231 232 233
		f 4 309 310 311 -306
		mu 0 4 230 1129 1130 231
		f 4 312 313 -311 314
		mu 0 4 234 235 1131 1132
		f 4 315 316 -313 317
		mu 0 4 236 237 235 234
		f 4 318 319 320 -316
		mu 0 4 236 238 239 237
		f 4 321 322 323 -320
		mu 0 4 238 1133 240 239
		f 4 -323 324 325 326
		mu 0 4 240 1134 241 1135
		f 4 327 328 -326 329
		mu 0 4 242 243 1136 241
		f 4 330 331 332 -328
		mu 0 4 242 1137 1138 243
		f 4 333 -332 334 335
		mu 0 4 1139 1140 1141 1142
		f 4 336 337 338 -336
		mu 0 4 1143 1144 244 1145
		f 4 339 340 -338 341
		mu 0 4 1146 1147 244 1148
		f 4 342 343 344 -340
		mu 0 4 1149 1150 1151 1152
		f 4 -344 345 -308 346
		mu 0 4 1153 1154 233 232
		f 4 347 -307 348 349
		mu 0 4 245 246 247 248
		f 4 350 351 -349 -312
		mu 0 4 249 250 248 247
		f 4 352 353 -351 -314
		mu 0 4 251 252 250 249
		f 4 354 355 -353 -317
		mu 0 4 253 254 252 251
		f 4 356 -355 -321 357
		mu 0 4 255 254 253 256
		f 4 358 359 -358 -324
		mu 0 4 257 258 255 256
		f 4 360 361 -359 -327
		mu 0 4 259 260 261 262
		f 4 -329 362 363 -361
		mu 0 4 259 263 264 260
		f 4 -363 -333 364 365
		mu 0 4 264 263 265 266
		f 4 366 367 -365 -334
		mu 0 4 267 268 266 265
		f 4 -339 368 369 -367
		mu 0 4 267 269 270 268
		f 4 370 371 -369 -341
		mu 0 4 271 272 270 269
		f 4 372 373 -371 -345
		mu 0 4 273 274 272 271
		f 4 -373 -347 -348 374
		mu 0 4 274 273 246 245
		f 4 -350 375 -277 376
		mu 0 4 245 248 275 276
		f 4 377 -272 -376 -352
		mu 0 4 250 277 275 248
		f 4 -354 378 -271 -378
		mu 0 4 250 252 278 277
		f 4 379 380 -379 -356
		mu 0 4 254 279 278 252
		f 4 381 -380 -357 382
		mu 0 4 280 279 254 255
		f 4 383 384 -383 -360
		mu 0 4 258 281 280 255
		f 4 385 386 -384 -362
		mu 0 4 260 282 283 261
		f 4 387 388 -386 -364
		mu 0 4 264 284 282 260
		f 4 389 -388 -366 390
		mu 0 4 285 284 264 266
		f 4 391 -267 -391 -368
		mu 0 4 268 286 285 266
		f 4 392 -264 -392 -370
		mu 0 4 270 287 286 268
		f 4 393 -285 -393 -372
		mu 0 4 272 288 287 270
		f 4 -283 -394 -374 394
		mu 0 4 289 288 272 274
		f 4 -375 -377 -280 -395
		mu 0 4 274 245 276 289
		f 4 395 396 -337 397
		mu 0 4 290 291 292 293
		f 4 398 399 -398 -335
		mu 0 4 294 295 290 293
		f 4 -399 -331 400 401
		mu 0 4 295 294 296 297
		f 4 402 403 -401 -330
		mu 0 4 298 299 297 296
		f 4 -403 -325 404 405
		mu 0 4 299 298 300 301
		f 4 406 407 -405 -322
		mu 0 4 302 303 301 300
		f 4 -407 -319 408 409
		mu 0 4 303 302 304 305
		f 4 -409 -318 410 411
		mu 0 4 305 304 306 307
		f 4 -411 -315 412 413
		mu 0 4 307 306 308 309
		f 4 414 415 -413 -310
		mu 0 4 310 311 309 308
		f 4 -415 -309 416 417
		mu 0 4 311 310 312 313
		f 4 418 -417 -346 419
		mu 0 4 314 313 312 315
		f 4 420 421 -420 -343
		mu 0 4 316 317 314 315
		f 4 -342 -397 422 -421
		mu 0 4 316 292 291 317
		f 4 -396 423 424 425
		mu 0 4 318 319 320 321
		f 4 426 427 -424 -400
		mu 0 4 322 323 324 325
		f 4 -402 428 429 -427
		mu 0 4 322 326 327 323
		f 4 -404 430 431 -429
		mu 0 4 326 328 329 327
		f 4 432 433 -431 -406
		mu 0 4 330 331 329 328
		f 4 -408 434 435 -433
		mu 0 4 330 332 333 331
		f 4 -410 436 437 -435
		mu 0 4 332 334 335 333
		f 4 438 439 -437 -412
		mu 0 4 336 337 335 334
		f 4 -414 440 441 -439
		mu 0 4 336 338 339 337
		f 4 442 443 -441 -416
		mu 0 4 340 341 339 338
		f 4 444 445 -443 -418
		mu 0 4 342 343 341 340
		f 4 -419 446 447 -445
		mu 0 4 342 344 345 343
		f 4 448 449 -447 -422
		mu 0 4 346 347 345 344
		f 4 450 -449 -423 -426
		mu 0 4 321 347 346 318
		f 4 451 452 453 -425
		mu 0 4 348 349 350 351
		f 4 -428 454 455 -452
		mu 0 4 348 352 353 349
		f 4 456 457 -455 -430
		mu 0 4 354 355 353 352
		f 4 -432 458 459 -457
		mu 0 4 354 356 357 355
		f 4 -434 460 461 -459
		mu 0 4 356 358 359 357
		f 4 462 463 -461 -436
		mu 0 4 360 361 359 358
		f 4 -438 464 465 -463
		mu 0 4 360 362 363 361
		f 4 466 467 -465 -440
		mu 0 4 364 365 363 362
		f 4 468 -467 -442 469
		mu 0 4 366 365 364 367
		f 4 -444 470 471 -470
		mu 0 4 367 368 369 366
		f 4 472 473 -471 -446
		mu 0 4 370 371 369 368
		f 4 474 475 -473 -448
		mu 0 4 372 373 371 370
		f 4 -450 476 477 -475
		mu 0 4 372 374 375 373
		f 4 -451 -454 478 -477
		mu 0 4 374 351 350 375
		f 4 479 480 481 -453
		mu 0 4 376 377 378 379
		f 4 -456 482 483 -480
		mu 0 4 376 380 381 377
		f 4 484 -483 -458 485
		mu 0 4 382 381 380 383
		f 4 486 487 -486 -460
		mu 0 4 384 385 382 383
		f 4 -462 488 489 -487
		mu 0 4 384 386 387 385
		f 4 490 491 -489 -464
		mu 0 4 388 389 387 386
		f 4 492 493 -491 -466
		mu 0 4 390 391 389 388
		f 4 -468 494 495 -493
		mu 0 4 390 392 393 391
		f 4 496 497 -495 -469
		mu 0 4 394 395 393 392
		f 4 498 499 -497 -472
		mu 0 4 396 397 395 394
		f 4 -474 500 501 -499
		mu 0 4 396 398 399 397
		f 4 -476 502 503 -501
		mu 0 4 398 400 401 399
		f 4 504 505 -503 -478
		mu 0 4 402 403 401 400
		f 4 506 -505 -479 -482
		mu 0 4 404 403 402 405
		f 4 -481 507 508 509
		mu 0 4 406 407 408 409
		f 4 510 511 -508 -484
		mu 0 4 410 411 408 407
		f 4 -485 512 513 -511
		mu 0 4 410 412 413 411
		f 4 514 515 -513 -488
		mu 0 4 414 415 413 412
		f 4 -515 -490 516 517
		mu 0 4 415 414 416 417
		f 4 -492 518 519 -517
		mu 0 4 416 418 419 417
		f 4 -494 520 521 -519
		mu 0 4 418 420 421 419
		f 4 522 523 -521 -496
		mu 0 4 422 423 421 420
		f 4 -498 524 525 -523
		mu 0 4 422 424 425 423
		f 4 -500 526 527 -525
		mu 0 4 424 426 427 425
		f 4 528 529 -527 -502
		mu 0 4 428 429 427 426
		f 4 530 -529 -504 531
		mu 0 4 430 429 428 431
		f 4 532 -532 -506 533
		mu 0 4 432 430 431 433
		f 4 -507 -510 534 -534
		mu 0 4 433 434 435 432
		f 4 -509 535 536 537
		mu 0 4 436 437 438 439
		f 4 -536 -512 538 539
		mu 0 4 438 437 440 441
		f 4 -539 -514 540 541
		mu 0 4 441 440 442 443
		f 4 -541 -516 542 543
		mu 0 4 443 442 444 445
		f 4 -543 -518 544 545
		mu 0 4 445 444 446 447
		f 4 -545 -520 546 547
		mu 0 4 447 446 448 449
		f 4 -547 -522 548 549
		mu 0 4 449 448 450 451
		f 4 -549 -524 550 551
		mu 0 4 451 450 452 453
		f 4 -551 -526 552 553
		mu 0 4 453 452 454 455
		f 4 -553 -528 554 555
		mu 0 4 455 454 456 457
		f 4 -555 -530 556 557
		mu 0 4 457 456 458 459
		f 4 -557 -531 558 559
		mu 0 4 459 458 460 461
		f 4 -559 -533 560 561
		mu 0 4 461 460 462 463
		f 4 -535 -538 562 -561
		mu 0 4 462 464 465 463
		f 4 563 -537 564 565
		mu 0 4 466 467 468 469
		f 4 -565 -540 566 567
		mu 0 4 469 468 470 471
		f 4 -567 -542 568 569
		mu 0 4 471 470 472 473
		f 4 -569 -544 570 571
		mu 0 4 473 472 474 475
		f 4 572 -571 -546 573
		mu 0 4 476 477 478 479
		f 4 574 -574 -548 575
		mu 0 4 480 476 479 481
		f 4 576 -576 -550 577
		mu 0 4 482 480 481 483
		f 4 578 -578 -552 579
		mu 0 4 484 482 483 485
		f 4 580 -580 -554 581
		mu 0 4 486 484 485 487
		f 4 582 -582 -556 583
		mu 0 4 488 486 487 489
		f 4 584 -584 -558 585
		mu 0 4 490 488 489 491
		f 4 586 -586 -560 587
		mu 0 4 492 490 491 493
		f 4 588 -588 -562 589
		mu 0 4 494 492 493 495
		f 4 -563 -564 590 -590
		mu 0 4 495 467 466 494
		f 4 605 606 607 608
		mu 0 4 496 497 498 499
		f 4 609 -607 610 611
		mu 0 4 500 498 497 501
		f 4 612 613 614 -612
		mu 0 4 501 502 503 500
		f 4 615 -614 616 617
		mu 0 4 504 503 502 505
		f 4 618 619 620 -618
		mu 0 4 505 506 507 504
		f 4 621 622 -620 623
		mu 0 4 508 509 510 511
		f 4 624 -609 625 -622
		mu 0 4 508 496 499 509
		f 3 626 627 628
		mu 0 3 512 513 514
		f 3 629 630 -628
		mu 0 3 513 515 514
		f 3 631 632 -631
		mu 0 3 515 516 514
		f 3 633 634 -633
		mu 0 3 516 517 514
		f 3 635 636 -635
		mu 0 3 517 518 514
		f 3 637 638 -637
		mu 0 3 518 519 514
		f 3 639 -629 -639
		mu 0 3 519 512 514
		f 4 640 641 642 -608
		mu 0 4 520 521 522 523
		f 4 -610 643 644 -641
		mu 0 4 520 524 525 521
		f 4 645 -644 -615 646
		mu 0 4 526 525 524 527
		f 4 -616 647 648 -647
		mu 0 4 527 528 529 526
		f 4 649 -648 -621 650
		mu 0 4 530 529 528 531
		f 4 -651 -623 651 652
		mu 0 4 530 531 532 533
		f 4 653 -652 -626 -643
		mu 0 4 522 533 532 523
		f 4 -627 654 -642 655
		mu 0 4 534 535 536 537
		f 4 -645 656 -630 -656
		mu 0 4 537 538 539 534
		f 4 -657 -646 657 -632
		mu 0 4 539 538 540 541
		f 4 -634 -658 -649 658
		mu 0 4 542 541 540 543
		f 4 -659 -650 659 -636
		mu 0 4 544 545 546 547
		f 4 -660 -653 660 -638
		mu 0 4 547 546 548 549
		f 4 -661 -654 -655 -640
		mu 0 4 549 548 536 535
		f 4 661 662 663 664
		mu 0 4 550 551 552 553
		f 4 665 666 667 668
		mu 0 4 554 555 556 557
		f 4 669 670 671 672
		mu 0 4 558 559 560 561
		f 4 673 674 675 676
		mu 0 4 562 563 564 565
		f 4 677 678 679 -676
		mu 0 4 566 567 568 569
		f 4 680 681 682 -679
		mu 0 4 567 570 571 568
		f 4 683 684 685 -682
		mu 0 4 570 572 573 571
		f 4 686 687 688 -685
		mu 0 4 572 574 575 573
		f 4 689 -663 690 -688
		mu 0 4 574 552 551 575
		f 4 691 692 693 -665
		mu 0 4 553 576 577 550
		f 4 694 -693 695 696
		mu 0 4 578 577 576 579
		f 4 697 698 699 -697
		mu 0 4 579 580 581 578
		f 4 700 701 702 -699
		mu 0 4 580 582 583 581
		f 4 703 -670 704 -702
		mu 0 4 582 584 585 583
		f 4 705 706 707 -674
		mu 0 4 586 587 588 589
		f 4 708 709 710 -707
		mu 0 4 587 590 591 588
		f 4 711 712 -710 713
		mu 0 4 592 593 591 590
		f 4 714 715 -712 716
		mu 0 4 594 595 593 592
		f 4 -666 717 -715 718
		mu 0 4 555 554 595 594
		f 4 719 720 721 -668
		mu 0 4 556 596 597 557
		f 4 722 723 724 -721
		mu 0 4 596 598 599 597
		f 4 725 726 727 -724
		mu 0 4 598 600 601 599
		f 4 728 729 730 -727
		mu 0 4 600 602 603 601
		f 4 731 -672 732 -730
		mu 0 4 602 604 605 603
		f 4 733 734 -677 735
		mu 0 4 606 607 608 609
		f 4 736 -662 737 738
		mu 0 4 610 611 612 613
		f 4 739 740 -673 741
		mu 0 4 614 615 616 617
		f 4 742 -667 743 744
		mu 0 4 618 619 620 621
		f 4 -736 -680 745 746
		mu 0 4 606 609 622 623
		f 4 747 748 -746 -683
		mu 0 4 624 625 623 622
		f 4 -686 749 750 -748
		mu 0 4 624 626 627 625
		f 4 751 -750 -689 752
		mu 0 4 628 627 626 629
		f 4 -691 -737 753 -753
		mu 0 4 629 611 610 628
		f 4 754 755 -738 -694
		mu 0 4 630 631 613 612
		f 4 -695 756 757 -755
		mu 0 4 630 632 633 631
		f 4 -757 -700 758 759
		mu 0 4 633 632 634 635
		f 4 -759 -703 760 761
		mu 0 4 635 634 636 637
		f 4 -741 762 -761 -705
		mu 0 4 616 615 637 636
		f 4 -735 763 764 -706
		mu 0 4 608 607 638 639
		f 4 765 -709 -765 766
		mu 0 4 640 641 639 638
		f 4 767 -714 -766 768
		mu 0 4 642 643 641 640
		f 4 -717 -768 769 770
		mu 0 4 644 643 642 645
		f 4 -771 771 -744 -719
		mu 0 4 644 645 621 620
		f 4 772 773 -720 -743
		mu 0 4 618 646 647 619
		f 4 774 -723 -774 775
		mu 0 4 648 649 647 646
		f 4 776 -726 -775 777
		mu 0 4 650 651 649 648
		f 4 -777 778 779 -729
		mu 0 4 651 650 652 653
		f 4 -732 -780 780 -742
		mu 0 4 617 653 652 614
		f 4 -734 781 782 783
		mu 0 4 607 606 654 655
		f 4 784 785 -739 786
		mu 0 4 656 657 610 613
		f 4 787 788 789 -740
		mu 0 4 614 658 659 615
		f 4 -745 790 791 792
		mu 0 4 618 621 660 661
		f 4 -747 793 794 -782
		mu 0 4 606 623 662 654
		f 4 795 -794 -749 796
		mu 0 4 663 662 623 625
		f 4 797 798 -797 -751
		mu 0 4 627 664 663 625
		f 4 799 -798 -752 800
		mu 0 4 665 664 627 628
		f 4 801 -801 -754 -786
		mu 0 4 657 665 628 610
		f 4 802 803 -787 -756
		mu 0 4 631 666 656 613
		f 4 -758 804 805 -803
		mu 0 4 631 633 667 666
		f 4 806 -805 -760 807
		mu 0 4 668 667 633 635
		f 4 -808 -762 808 809
		mu 0 4 668 635 637 669
		f 4 810 -809 -763 -790
		mu 0 4 659 669 637 615
		f 4 811 812 -764 -784
		mu 0 4 655 670 638 607
		f 4 813 -767 -813 814
		mu 0 4 671 640 638 670
		f 4 815 -769 -814 816
		mu 0 4 672 642 640 671
		f 4 817 -770 -816 818
		mu 0 4 673 645 642 672
		f 4 -772 -818 819 -791
		mu 0 4 621 645 673 660
		f 4 820 821 -773 -793
		mu 0 4 661 674 646 618
		f 4 822 -776 -822 823
		mu 0 4 675 648 646 674
		f 4 824 -778 -823 825
		mu 0 4 676 650 648 675
		f 4 826 -779 -825 827
		mu 0 4 677 652 650 676
		f 4 -781 -827 828 -788
		mu 0 4 614 652 677 658
		f 4 829 -783 830 831
		mu 0 4 678 679 680 681
		f 4 832 -785 833 834
		mu 0 4 682 683 684 685
		f 4 835 -789 836 837
		mu 0 4 686 687 688 689
		f 4 838 -792 839 840
		mu 0 4 690 691 692 693
		f 4 -831 -795 841 842
		mu 0 4 694 695 696 697
		f 4 -842 -796 843 844
		mu 0 4 697 696 698 699
		f 4 845 -844 -799 846
		mu 0 4 700 699 698 701
		f 4 847 -847 -800 848
		mu 0 4 702 700 701 703
		f 4 -849 -802 -833 849
		mu 0 4 702 703 683 682
		f 4 850 -834 -804 851
		mu 0 4 704 705 706 707
		f 4 852 853 -852 -806
		mu 0 4 708 709 704 707
		f 4 -853 -807 854 855
		mu 0 4 709 708 710 711
		f 4 856 -855 -810 857
		mu 0 4 712 711 710 713
		f 4 -858 -811 -836 858
		mu 0 4 712 713 687 686
		f 4 -812 -830 859 860
		mu 0 4 714 679 678 715
		f 4 861 -815 -861 862
		mu 0 4 716 717 714 715
		f 4 863 -817 -862 864
		mu 0 4 718 719 717 716
		f 4 865 -819 -864 866
		mu 0 4 720 721 719 718
		f 4 867 -840 -820 -866
		mu 0 4 720 722 723 721
		f 4 868 -821 -839 869
		mu 0 4 724 725 691 690
		f 4 870 871 -824 -869
		mu 0 4 724 726 727 725
		f 4 872 873 -826 -872
		mu 0 4 726 728 729 727
		f 4 874 875 -828 -874
		mu 0 4 728 730 731 729
		f 4 876 -837 -829 -876
		mu 0 4 732 689 688 733
		f 4 877 878 879 880
		mu 0 4 734 735 736 737
		f 4 881 882 883 884
		mu 0 4 1155 1156 1157 1158
		f 4 -884 885 886 887
		mu 0 4 1159 1160 1161 1162
		f 4 888 889 -887 890
		mu 0 4 1163 1164 1165 1166
		f 4 -889 891 892 893
		mu 0 4 1167 1168 1169 1170
		f 4 894 895 896 -893
		mu 0 4 1171 1172 1173 1174
		f 4 -896 897 -35 898
		mu 0 4 1175 1176 1177 1178
		f 4 -33 899 900 901
		mu 0 4 1179 1180 1181 1182
		f 4 902 -61 -898 903
		mu 0 4 1183 1184 1185 1186
		f 4 -904 -895 904 905
		mu 0 4 1187 1188 1189 1190
		f 4 -892 906 907 -905
		mu 0 4 1191 1192 1193 1194
		f 4 -907 -891 908 909
		mu 0 4 1195 1196 1197 1198
		f 4 -886 910 911 -909
		mu 0 4 1199 1200 1201 1202
		f 4 -911 -883 912 913
		mu 0 4 1203 1204 1205 1206
		f 4 914 -900 -39 915
		mu 0 4 1207 1208 1209 1210
		f 4 -903 916 917 -86
		mu 0 4 1211 1212 1213 1214
		f 4 918 -917 -906 919
		mu 0 4 1215 1216 1217 1218
		f 4 -908 920 921 -920
		mu 0 4 1219 1220 1221 1222
		f 4 922 923 -921 -910
		mu 0 4 1223 1224 1225 1226
		f 4 924 925 -923 -912
		mu 0 4 1227 1228 1229 1230
		f 4 -914 926 927 -925
		mu 0 4 1231 1232 1233 1234
		f 4 928 -927 929 930
		mu 0 4 1235 1236 1237 1238
		f 4 931 -931 932 933
		mu 0 4 1239 1240 1241 1242
		f 4 934 935 -934 936
		mu 0 4 1243 1244 1245 1246
		f 4 937 -935 938 939
		mu 0 4 1247 1248 1249 1250
		f 4 940 941 -940 942
		mu 0 4 1251 1252 1253 1254
		f 4 -916 -65 943 -941
		mu 0 4 1255 1256 1257 1258
		f 4 944 -919 945 946
		mu 0 4 738 739 740 741
		f 4 -946 -922 947 948
		mu 0 4 741 740 742 743
		f 4 -948 -924 949 950
		mu 0 4 743 742 744 745
		f 4 951 -950 -926 952
		mu 0 4 746 745 744 747
		f 4 -953 -928 953 954
		mu 0 4 746 747 748 749
		f 4 -954 -929 955 956
		mu 0 4 749 748 750 751
		f 4 -956 -932 957 958
		mu 0 4 752 753 754 755
		f 4 959 -958 -936 960
		mu 0 4 756 755 754 757
		f 4 961 -961 -938 962
		mu 0 4 758 756 757 759
		f 4 963 -963 -942 964
		mu 0 4 760 758 759 761
		f 4 -88 965 -965 -944
		mu 0 4 59 58 760 761
		f 4 966 967 968 -147
		mu 0 4 1259 1260 1261 1262
		f 4 969 970 971 -968
		mu 0 4 1263 1264 1265 1266
		f 4 972 973 974 -971
		mu 0 4 1267 1268 1269 1270
		f 4 975 976 -974 977
		mu 0 4 1271 1272 1273 1274
		f 4 -976 978 979 980
		mu 0 4 1275 1276 1277 1278
		f 4 981 982 -980 983
		mu 0 4 1279 1280 1281 1282
		f 4 984 985 986 -982
		mu 0 4 1283 1284 1285 1286
		f 4 987 988 989 990
		mu 0 4 762 1287 1288 763
		f 4 991 -989 992 -114
		mu 0 4 1289 1290 1291 1292
		f 4 993 994 -899 -194
		mu 0 4 1293 1294 1295 1296
		f 4 995 996 -994 -197
		mu 0 4 1297 1298 1299 1300
		f 4 997 -897 -995 998
		mu 0 4 1301 1302 1303 1304
		f 4 999 1000 -999 -997
		mu 0 4 1305 1306 1307 1308
		f 4 1001 1002 -894 -998
		mu 0 4 1309 1310 1311 1312
		f 4 1003 1004 -1002 -1001
		mu 0 4 1313 1314 1315 1316
		f 4 -1003 1005 1006 -890
		mu 0 4 1317 1318 1319 1320
		f 4 1007 1008 -1006 -1005
		mu 0 4 1321 1322 1323 1324
		f 4 -1007 1009 1010 -888
		mu 0 4 1325 1326 1327 1328
		f 4 -1009 1011 1012 -1010
		mu 0 4 1329 1330 1331 1332
		f 4 -1011 1013 1014 -885
		mu 0 4 1333 1334 1335 1336
		f 4 1015 1016 -1014 -1013
		mu 0 4 1337 1338 1339 1340
		f 4 -150 -902 1017 1018
		mu 0 4 1341 1342 1343 1344
		f 4 1019 -153 -1019 1020
		mu 0 4 1345 1346 1347 1348
		f 4 1021 -221 -1020 1022
		mu 0 4 1349 1350 1351 1352
		f 4 1023 1024 -1016 1025
		mu 0 4 1353 1354 1355 1356
		f 4 -1026 -1012 1026 1027
		mu 0 4 1357 1358 1359 1360
		f 4 1028 1029 -1027 -1008
		mu 0 4 1361 1362 1363 1364
		f 4 1030 -1029 -1004 1031
		mu 0 4 1365 1366 1367 1368
		f 4 -1032 -1000 1032 1033
		mu 0 4 1369 1370 1371 1372
		f 4 -1033 -996 -199 1034
		mu 0 4 1373 1374 1375 1376
		f 4 -246 -1022 1035 1036
		mu 0 4 1377 1378 1379 1380
		f 4 1037 -1024 1038 1039
		mu 0 4 1381 1382 1383 1384
		f 4 -1039 -1028 1040 1041
		mu 0 4 1385 1386 1387 1388
		f 4 -1041 -1030 1042 1043
		mu 0 4 1389 1390 1391 1392
		f 4 -1043 -1031 1044 1045
		mu 0 4 1393 1394 1395 1396
		f 4 -1045 -1034 1046 1047
		mu 0 4 1397 1398 1399 1400
		f 4 -1047 -1035 -223 1048
		mu 0 4 1401 1402 1403 1404
		f 4 1049 -992 -260 -1037
		mu 0 4 1405 1406 1407 1408
		f 4 1050 -983 1051 -1040
		mu 0 4 1409 1410 1411 1412
		f 4 1052 -981 -1051 -1042
		mu 0 4 1413 1414 1415 1416
		f 4 1053 -977 -1053 -1044
		mu 0 4 1417 1418 1419 1420
		f 4 -1054 -1046 1054 -975
		mu 0 4 1421 1422 1423 1424
		f 4 -1055 -1048 1055 -972
		mu 0 4 1425 1426 1427 1428
		f 4 -1056 -1049 -249 -969
		mu 0 4 1429 1430 1431 1432
		f 4 -87 1056 1057 -110
		mu 0 4 81 764 765 80
		f 4 -918 -945 1058 -1057
		mu 0 4 764 739 738 765
		f 24 1059 1060 1061 1062 1063 1064 1065 -92 -94 -96 -97 -100 -102 -104 -105 -107 1066
		 1067 1068 1069 1070 1071 1072 1073
		mu 0 24 766 767 768 769 770 771 772 773 774 775 776 777 778 779 780 781 782 783 784 785
		 786 787 788 789
		f 3 591 1074 1075
		mu 0 3 790 791 792
		f 3 592 1076 -1075
		mu 0 3 791 793 792
		f 3 593 1077 -1077
		mu 0 3 793 794 792
		f 3 594 1078 -1078
		mu 0 3 794 795 792
		f 3 595 1079 -1079
		mu 0 3 795 796 792
		f 3 596 1080 -1080
		mu 0 3 796 797 792
		f 3 597 1081 -1081
		mu 0 3 797 798 792
		f 3 598 1082 -1082
		mu 0 3 798 799 792
		f 3 599 1083 -1083
		mu 0 3 799 800 792
		f 3 600 1084 -1084
		mu 0 3 800 801 792;
	setAttr ".fc[500:671]"
		f 3 601 1085 -1085
		mu 0 3 801 802 792
		f 3 602 1086 -1086
		mu 0 3 802 803 792
		f 3 603 1087 -1087
		mu 0 3 803 804 792
		f 3 604 -1076 -1088
		mu 0 3 804 790 792
		f 4 1088 1089 1090 1091
		mu 0 4 805 806 807 808
		f 4 1092 -1090 1093 1094
		mu 0 4 809 807 806 810
		f 4 1095 1096 1097 -1095
		mu 0 4 810 811 812 809
		f 4 1098 -1097 1099 1100
		mu 0 4 813 812 811 814
		f 4 1101 1102 1103 -1101
		mu 0 4 814 815 816 813
		f 4 1104 1105 -1103 1106
		mu 0 4 817 818 819 820
		f 4 1107 -1092 1108 -1105
		mu 0 4 817 805 808 818
		f 3 1109 1110 1111
		mu 0 3 821 822 823
		f 3 1112 1113 -1111
		mu 0 3 822 824 823
		f 3 1114 1115 -1114
		mu 0 3 824 825 823
		f 3 1116 1117 -1116
		mu 0 3 825 826 823
		f 3 1118 1119 -1118
		mu 0 3 826 827 823
		f 3 1120 1121 -1120
		mu 0 3 827 828 823
		f 3 1122 -1112 -1122
		mu 0 3 828 821 823
		f 4 1123 1124 1125 -1091
		mu 0 4 829 830 831 832
		f 4 -1093 1126 1127 -1124
		mu 0 4 829 833 834 830
		f 4 1128 -1127 -1098 1129
		mu 0 4 835 834 833 836
		f 4 -1099 1130 1131 -1130
		mu 0 4 836 837 838 835
		f 4 1132 -1131 -1104 1133
		mu 0 4 839 838 837 840
		f 4 -1134 -1106 1134 1135
		mu 0 4 839 840 841 842
		f 4 1136 -1135 -1109 -1126
		mu 0 4 831 842 841 832
		f 4 -1110 1137 -1125 1138
		mu 0 4 843 844 845 846
		f 4 -1128 1139 -1113 -1139
		mu 0 4 846 847 848 843
		f 4 -1140 -1129 1140 -1115
		mu 0 4 848 847 849 850
		f 4 -1117 -1141 -1132 1141
		mu 0 4 851 850 849 852
		f 4 -1142 -1133 1142 -1119
		mu 0 4 853 854 855 856
		f 4 -1143 -1136 1143 -1121
		mu 0 4 856 855 857 858
		f 4 -1144 -1137 -1138 -1123
		mu 0 4 858 857 845 844
		f 4 1144 1145 1146 1147
		mu 0 4 859 860 861 862
		f 4 1148 -1146 1149 1150
		mu 0 4 863 861 860 864
		f 4 1151 1152 1153 -1151
		mu 0 4 864 865 866 863
		f 4 1154 -1153 1155 1156
		mu 0 4 867 866 865 868
		f 4 1157 1158 1159 -1157
		mu 0 4 868 869 870 867
		f 4 1160 1161 -1159 1162
		mu 0 4 871 872 873 874
		f 4 1163 -1148 1164 -1161
		mu 0 4 871 859 862 872
		f 3 1165 1166 1167
		mu 0 3 875 876 877
		f 3 1168 1169 -1167
		mu 0 3 876 878 877
		f 3 1170 1171 -1170
		mu 0 3 878 879 877
		f 3 1172 1173 -1172
		mu 0 3 879 880 877
		f 3 1174 1175 -1174
		mu 0 3 880 881 877
		f 3 1176 1177 -1176
		mu 0 3 881 882 877
		f 3 1178 -1168 -1178
		mu 0 3 882 875 877
		f 4 1179 1180 1181 -1147
		mu 0 4 883 884 885 886
		f 4 -1149 1182 1183 -1180
		mu 0 4 883 887 888 884
		f 4 1184 -1183 -1154 1185
		mu 0 4 889 888 887 890
		f 4 -1155 1186 1187 -1186
		mu 0 4 890 891 892 889
		f 4 1188 -1187 -1160 1189
		mu 0 4 893 892 891 894
		f 4 -1190 -1162 1190 1191
		mu 0 4 893 894 895 896
		f 4 1192 -1191 -1165 -1182
		mu 0 4 885 896 895 886
		f 4 -1166 1193 -1181 1194
		mu 0 4 897 898 899 900
		f 4 -1184 1195 -1169 -1195
		mu 0 4 900 901 902 897
		f 4 -1196 -1185 1196 -1171
		mu 0 4 902 901 903 904
		f 4 -1173 -1197 -1188 1197
		mu 0 4 905 904 903 906
		f 4 -1198 -1189 1198 -1175
		mu 0 4 907 908 909 910
		f 4 -1199 -1192 1199 -1177
		mu 0 4 910 909 911 912
		f 4 -1200 -1193 -1194 -1179
		mu 0 4 912 911 899 898
		f 4 1200 1201 1202 1203
		mu 0 4 913 914 915 916
		f 4 1204 -1202 1205 1206
		mu 0 4 917 915 914 918
		f 4 1207 1208 1209 -1207
		mu 0 4 918 919 920 917
		f 4 1210 -1209 1211 1212
		mu 0 4 921 920 919 922
		f 4 1213 1214 1215 -1213
		mu 0 4 922 923 924 921
		f 4 1216 1217 -1215 1218
		mu 0 4 925 926 927 928
		f 4 1219 -1204 1220 -1217
		mu 0 4 925 913 916 926
		f 3 1221 1222 1223
		mu 0 3 929 930 931
		f 3 1224 1225 -1223
		mu 0 3 930 932 931
		f 3 1226 1227 -1226
		mu 0 3 932 933 931
		f 3 1228 1229 -1228
		mu 0 3 933 934 931
		f 3 1230 1231 -1230
		mu 0 3 934 935 931
		f 3 1232 1233 -1232
		mu 0 3 935 936 931
		f 3 1234 -1224 -1234
		mu 0 3 936 929 931
		f 4 1235 1236 1237 -1203
		mu 0 4 937 938 939 940
		f 4 -1205 1238 1239 -1236
		mu 0 4 937 941 942 938
		f 4 1240 -1239 -1210 1241
		mu 0 4 943 942 941 944
		f 4 -1211 1242 1243 -1242
		mu 0 4 944 945 946 943
		f 4 1244 -1243 -1216 1245
		mu 0 4 947 946 945 948
		f 4 -1246 -1218 1246 1247
		mu 0 4 947 948 949 950
		f 4 1248 -1247 -1221 -1238
		mu 0 4 939 950 949 940
		f 4 -1222 1249 -1237 1250
		mu 0 4 951 952 953 954
		f 4 -1240 1251 -1225 -1251
		mu 0 4 954 955 956 951
		f 4 -1252 -1241 1252 -1227
		mu 0 4 956 955 957 958
		f 4 -1229 -1253 -1244 1253
		mu 0 4 959 958 957 960
		f 4 -1254 -1245 1254 -1231
		mu 0 4 961 962 963 964
		f 4 -1255 -1248 1255 -1233
		mu 0 4 964 963 965 966
		f 4 -1256 -1249 -1250 -1235
		mu 0 4 966 965 953 952
		f 4 1256 1257 1258 1259
		mu 0 4 967 968 969 970
		f 4 1260 -1258 1261 1262
		mu 0 4 971 969 968 972
		f 4 1263 1264 1265 -1263
		mu 0 4 972 973 974 971
		f 4 1266 -1265 1267 1268
		mu 0 4 975 974 973 976
		f 4 1269 1270 1271 -1269
		mu 0 4 976 977 978 975
		f 4 1272 1273 -1271 1274
		mu 0 4 979 980 981 982
		f 4 1275 -1260 1276 -1273
		mu 0 4 979 967 970 980
		f 3 1277 1278 1279
		mu 0 3 983 984 985
		f 3 1280 1281 -1279
		mu 0 3 984 986 985
		f 3 1282 1283 -1282
		mu 0 3 986 987 985
		f 3 1284 1285 -1284
		mu 0 3 987 988 985
		f 3 1286 1287 -1286
		mu 0 3 988 989 985
		f 3 1288 1289 -1288
		mu 0 3 989 990 985
		f 3 1290 -1280 -1290
		mu 0 3 990 983 985
		f 4 1291 1292 1293 -1259
		mu 0 4 991 992 993 994
		f 4 -1261 1294 1295 -1292
		mu 0 4 991 995 996 992
		f 4 1296 -1295 -1266 1297
		mu 0 4 997 996 995 998
		f 4 -1267 1298 1299 -1298
		mu 0 4 998 999 1000 997
		f 4 1300 -1299 -1272 1301
		mu 0 4 1001 1000 999 1002
		f 4 -1302 -1274 1302 1303
		mu 0 4 1001 1002 1003 1004
		f 4 1304 -1303 -1277 -1294
		mu 0 4 993 1004 1003 994
		f 4 -1278 1305 -1293 1306
		mu 0 4 1005 1006 1007 1008
		f 4 -1296 1307 -1281 -1307
		mu 0 4 1008 1009 1010 1005
		f 4 -1308 -1297 1308 -1283
		mu 0 4 1010 1009 1011 1012
		f 4 -1285 -1309 -1300 1309
		mu 0 4 1013 1012 1011 1014
		f 4 -1310 -1301 1310 -1287
		mu 0 4 1015 1016 1017 1018
		f 4 -1311 -1304 1311 -1289
		mu 0 4 1018 1017 1019 1020
		f 4 -1312 -1305 -1306 -1291
		mu 0 4 1020 1019 1007 1006
		f 4 1312 1313 1314 1315
		mu 0 4 1021 1022 1023 1024
		f 4 1316 -1314 1317 1318
		mu 0 4 1025 1023 1022 1026
		f 4 1319 1320 1321 -1319
		mu 0 4 1026 1027 1028 1025
		f 4 1322 -1321 1323 1324
		mu 0 4 1029 1028 1027 1030
		f 4 1325 1326 1327 -1325
		mu 0 4 1030 1031 1032 1029
		f 4 1328 1329 -1327 1330
		mu 0 4 1033 1034 1035 1036
		f 4 1331 -1316 1332 -1329
		mu 0 4 1033 1021 1024 1034
		f 3 1333 1334 1335
		mu 0 3 1037 1038 1039
		f 3 1336 1337 -1335
		mu 0 3 1038 1040 1039
		f 3 1338 1339 -1338
		mu 0 3 1040 1041 1039
		f 3 1340 1341 -1340
		mu 0 3 1041 1042 1039
		f 3 1342 1343 -1342
		mu 0 3 1042 1043 1039
		f 3 1344 1345 -1344
		mu 0 3 1043 1044 1039
		f 3 1346 -1336 -1346
		mu 0 3 1044 1037 1039
		f 4 1347 1348 1349 -1315
		mu 0 4 1045 1046 1047 1048
		f 4 -1317 1350 1351 -1348
		mu 0 4 1045 1049 1050 1046
		f 4 1352 -1351 -1322 1353
		mu 0 4 1051 1050 1049 1052
		f 4 -1323 1354 1355 -1354
		mu 0 4 1052 1053 1054 1051
		f 4 1356 -1355 -1328 1357
		mu 0 4 1055 1054 1053 1056
		f 4 -1358 -1330 1358 1359
		mu 0 4 1055 1056 1057 1058
		f 4 1360 -1359 -1333 -1350
		mu 0 4 1047 1058 1057 1048
		f 4 -1334 1361 -1349 1362
		mu 0 4 1059 1060 1061 1062
		f 4 -1352 1363 -1337 -1363
		mu 0 4 1062 1063 1064 1059
		f 4 -1364 -1353 1364 -1339
		mu 0 4 1064 1063 1065 1066
		f 4 -1341 -1365 -1356 1365
		mu 0 4 1067 1066 1065 1068
		f 4 -1366 -1357 1366 -1343
		mu 0 4 1069 1070 1071 1072
		f 4 -1367 -1360 1367 -1345
		mu 0 4 1072 1071 1073 1074
		f 4 -1368 -1361 -1362 -1347
		mu 0 4 1074 1073 1061 1060
		f 4 1368 1369 1370 1371
		mu 0 4 1075 1076 1077 1078
		f 4 1372 -1370 1373 1374
		mu 0 4 1079 1077 1076 1080
		f 4 1375 1376 1377 -1375
		mu 0 4 1080 1081 1082 1079
		f 4 1378 -1377 1379 1380
		mu 0 4 1083 1082 1081 1084
		f 4 1381 1382 1383 -1381
		mu 0 4 1084 1085 1086 1083
		f 4 1384 1385 -1383 1386
		mu 0 4 1087 1088 1089 1090
		f 4 1387 -1372 1388 -1385
		mu 0 4 1087 1075 1078 1088
		f 3 1389 1390 1391
		mu 0 3 1091 1092 1093
		f 3 1392 1393 -1391
		mu 0 3 1092 1094 1093
		f 3 1394 1395 -1394
		mu 0 3 1094 1095 1093
		f 3 1396 1397 -1396
		mu 0 3 1095 1096 1093
		f 3 1398 1399 -1398
		mu 0 3 1096 1097 1093
		f 3 1400 1401 -1400
		mu 0 3 1097 1098 1093
		f 3 1402 -1392 -1402
		mu 0 3 1098 1091 1093
		f 4 1403 1404 1405 -1371
		mu 0 4 1099 1100 1101 1102
		f 4 -1373 1406 1407 -1404
		mu 0 4 1099 1103 1104 1100
		f 4 1408 -1407 -1378 1409
		mu 0 4 1105 1104 1103 1106
		f 4 -1379 1410 1411 -1410
		mu 0 4 1106 1107 1108 1105
		f 4 1412 -1411 -1384 1413
		mu 0 4 1109 1108 1107 1110
		f 4 -1414 -1386 1414 1415
		mu 0 4 1109 1110 1111 1112
		f 4 1416 -1415 -1389 -1406
		mu 0 4 1101 1112 1111 1102
		f 4 -1390 1417 -1405 1418
		mu 0 4 1113 1114 1115 1116
		f 4 -1408 1419 -1393 -1419
		mu 0 4 1116 1117 1118 1113
		f 4 -1420 -1409 1420 -1395
		mu 0 4 1118 1117 1119 1120
		f 4 -1397 -1421 -1412 1421
		mu 0 4 1121 1120 1119 1122
		f 4 -1422 -1413 1422 -1399
		mu 0 4 1123 1124 1125 1126
		f 4 -1423 -1416 1423 -1401
		mu 0 4 1126 1125 1127 1128
		f 4 -1424 -1417 -1418 -1403
		mu 0 4 1128 1127 1115 1114;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "holoTable_shine1";
	setAttr ".t" -type "double3" 0 0.18406642188704217 0 ;
	setAttr ".s" -type "double3" 0.99120087358053954 1 0.98064459118671043 ;
createNode mesh -n "holoTable_shine1Shape" -p "holoTable_shine1";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:23]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 50 ".uvst[0].uvsp[0:49]" -type "float2" -0.18795896 0 1.18802261
		 0 -0.18795896 1 -0.17989832 0 -0.17989832 1 -0.1701901 0 -0.1701901 1 -0.15961266
		 0 -0.15961266 1 -0.14891046 0 -0.14891046 1 -0.13880378 0 -0.13880378 1 0.13886747
		 0 0.13886747 1 0.14897412 0 0.14897412 1 0.15967631 0 0.15967631 1 0.17025375 0 0.17025375
		 1 0.17996201 0 0.17996201 1 0.18802258 0 0.18802258 1 0.81204104 0 0.81204104 1 0.82010162
		 0 0.82010168 1 0.8298099 0 0.8298099 1 0.84038734 0 0.84038734 1 0.85108954 0 0.85108954
		 1 0.86119622 0 0.86119616 1 1.13886738 0 1.13886738 1 1.14897418 0 1.14897418 1 1.15967631
		 0 1.15967631 1 1.17025375 0 1.17025375 1 1.17996192 0 1.17996192 1 1.81204104 0 1.18802261
		 1 1.81204104 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 48 ".vt[0:47]"  0.46405166 0.23685271 -0.39165959 -0.7043646 0.23685271 -0.39165959
		 -0.73156911 0.23685271 -0.38782614 -0.75611073 0.23685271 -0.376701 -0.77558696 0.23685271 -0.35937324
		 -0.78809154 0.23685271 -0.33753893 -0.79240024 0.23685271 -0.31333548 -0.79240024 0.23685271 0.31333548
		 -0.78809154 0.23685271 0.33753893 -0.77558696 0.23685271 0.35937324 -0.75611073 0.23685271 0.376701
		 -0.73156911 0.23685271 0.38782614 -0.7043646 0.23685271 0.39165959 0.46405166 0.23685271 0.39165959
		 0.49125618 0.23685271 0.38782614 0.51579779 0.23685271 0.376701 0.53527403 0.23685271 0.35937324
		 0.54777861 0.23685271 0.33753893 0.55208731 0.23685271 0.31333548 0.55208731 0.23685271 -0.31333548
		 0.54777861 0.23685271 -0.33753893 0.53527403 0.23685271 -0.35937324 0.51579779 0.23685271 -0.376701
		 0.49125618 0.23685271 -0.38782614 -0.71575892 0.35167313 -0.39929846 0.47544599 0.35167313 -0.39929846
		 -0.74349403 0.35167313 -0.39539024 -0.76851428 0.35167313 -0.38404813 -0.78837037 0.35167313 -0.36638242
		 -0.80111885 0.35167313 -0.34412223 -0.80551159 0.35167313 -0.31944674 -0.80551159 0.35167313 0.31944674
		 -0.80111885 0.35167313 0.34412223 -0.78837037 0.35167313 0.36638242 -0.76851428 0.35167313 0.38404813
		 -0.74349403 0.35167313 0.39539024 -0.71575892 0.35167313 0.39929846 0.47544599 0.35167313 0.39929846
		 0.5031811 0.35167313 0.39539024 0.52820134 0.35167313 0.38404813 0.54805744 0.35167313 0.36638242
		 0.56080592 0.35167313 0.34412223 0.56519866 0.35167313 0.31944674 0.56519866 0.35167313 -0.31944674
		 0.56080592 0.35167313 -0.34412223 0.54805744 0.35167313 -0.36638242 0.52820134 0.35167313 -0.38404813
		 0.5031811 0.35167313 -0.39539024;
	setAttr -s 72 ".ed[0:71]"  1 0 0 2 1 0 3 2 0 4 3 0 5 4 0 6 5 0 7 6 0
		 8 7 0 9 8 0 10 9 0 11 10 0 12 11 0 12 13 0 14 13 0 15 14 0 16 15 0 17 16 0 18 17 0
		 18 19 0 20 19 0 21 20 0 22 21 0 23 22 0 0 23 0 1 24 0 0 25 0 24 25 0 2 26 0 26 24 0
		 3 27 0 27 26 0 4 28 0 28 27 0 5 29 0 29 28 0 6 30 0 30 29 0 7 31 0 31 30 0 8 32 0
		 32 31 0 9 33 0 33 32 0 10 34 0 34 33 0 11 35 0 35 34 0 12 36 0 36 35 0 13 37 0 36 37 0
		 14 38 0 38 37 0 15 39 0 39 38 0 16 40 0 40 39 0 17 41 0 41 40 0 18 42 0 42 41 0 19 43 0
		 42 43 0 20 44 0 44 43 0 21 45 0 45 44 0 22 46 0 46 45 0 23 47 0 47 46 0 25 47 0;
	setAttr -s 24 ".fc[0:23]" -type "polyFaces" 
		f 4 24 26 -26 -1
		mu 0 4 47 49 48 1
		f 4 27 28 -25 -2
		mu 0 4 3 4 2 0
		f 4 29 30 -28 -3
		mu 0 4 5 6 4 3
		f 4 31 32 -30 -4
		mu 0 4 7 8 6 5
		f 4 33 34 -32 -5
		mu 0 4 9 10 8 7
		f 4 35 36 -34 -6
		mu 0 4 11 12 10 9
		f 4 37 38 -36 -7
		mu 0 4 13 14 12 11
		f 4 39 40 -38 -8
		mu 0 4 15 16 14 13
		f 4 41 42 -40 -9
		mu 0 4 17 18 16 15
		f 4 43 44 -42 -10
		mu 0 4 19 20 18 17
		f 4 45 46 -44 -11
		mu 0 4 21 22 20 19
		f 4 47 48 -46 -12
		mu 0 4 23 24 22 21
		f 4 49 -51 -48 12
		mu 0 4 25 26 24 23
		f 4 51 52 -50 -14
		mu 0 4 27 28 26 25
		f 4 53 54 -52 -15
		mu 0 4 29 30 28 27
		f 4 55 56 -54 -16
		mu 0 4 31 32 30 29
		f 4 57 58 -56 -17
		mu 0 4 33 34 32 31
		f 4 59 60 -58 -18
		mu 0 4 35 36 34 33
		f 4 61 -63 -60 18
		mu 0 4 37 38 36 35
		f 4 63 64 -62 -20
		mu 0 4 39 40 38 37
		f 4 65 66 -64 -21
		mu 0 4 41 42 40 39
		f 4 67 68 -66 -22
		mu 0 4 43 44 42 41
		f 4 69 70 -68 -23
		mu 0 4 45 46 44 43
		f 4 25 71 -70 -24
		mu 0 4 1 48 46 45;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "parts:polySurfaceShape2" -p "holoTable_shine1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 24 ".uvst[0].uvsp[0:23]" -type "float2" 0.61111248 0.5 0.38888752
		 0.5 0.38459599 0.49877653 0.38072461 0.49522591 0.37765229 0.4896957 0.37567967 0.48272714
		 0.375 0.4750025 0.375 0.27499747 0.3756797 0.26727289 0.37765229 0.26030433 0.38072464
		 0.25477409 0.38459602 0.25122347 0.38888752 0.25 0.61111253 0.25 0.61540401 0.25122347
		 0.61927533 0.25477409 0.62234777 0.26030433 0.62432033 0.26727286 0.625 0.2749975
		 0.625 0.4750025 0.62432027 0.48272714 0.62234771 0.48969564 0.61927533 0.49522588
		 0.61540401 0.49877653;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  0.46405166 0.23685271 -0.39165959 -0.7043646 0.23685271 -0.39165959
		 -0.73156911 0.23685271 -0.38782614 -0.75611073 0.23685271 -0.376701 -0.77558696 0.23685271 -0.35937324
		 -0.78809154 0.23685271 -0.33753893 -0.79240024 0.23685271 -0.31333548 -0.79240024 0.23685271 0.31333548
		 -0.78809154 0.23685271 0.33753893 -0.77558696 0.23685271 0.35937324 -0.75611073 0.23685271 0.376701
		 -0.73156911 0.23685271 0.38782614 -0.7043646 0.23685271 0.39165959 0.46405166 0.23685271 0.39165959
		 0.49125618 0.23685271 0.38782614 0.51579779 0.23685271 0.376701 0.53527403 0.23685271 0.35937324
		 0.54777861 0.23685271 0.33753893 0.55208731 0.23685271 0.31333548 0.55208731 0.23685271 -0.31333548
		 0.54777861 0.23685271 -0.33753893 0.53527403 0.23685271 -0.35937324 0.51579779 0.23685271 -0.376701
		 0.49125618 0.23685271 -0.38782614;
	setAttr -s 24 ".ed[0:23]"  1 0 0 2 1 0 3 2 0 4 3 0 5 4 0 6 5 0 7 6 0
		 8 7 0 9 8 0 10 9 0 11 10 0 12 11 0 12 13 0 14 13 0 15 14 0 16 15 0 17 16 0 18 17 0
		 18 19 0 20 19 0 21 20 0 22 21 0 23 22 0 0 23 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 24 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 -11 -12 12 -14 -15 -16 -17 -18 18 -20 -21 -22 -23
		 -24
		mu 0 24 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "HoloPod_shine1";
	setAttr ".t" -type "double3" 0.75964084187305358 0.35690995597386233 -0.59249023786801425 ;
createNode mesh -n "HoloPod_shine1Shape" -p "HoloPod_shine1";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:13]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 30 ".uvst[0].uvsp[0:29]" -type "float2" 1.14288855 0 1.28574586
		 0 1.28574586 1 1.14288855 1 1.42860305 1 -0.42853987 0 -0.42853987 1 -0.28568274
		 0 -0.28568274 1 -0.14282531 0 -0.14282531 1 3.182888e-005 0 3.182888e-005 1 0.14288884
		 0 0.14288884 1 0.28574613 0 0.28574616 1 0.42860317 0 0.42860323 1 0.5714606 0 0.5714606
		 1 0.71431762 0 0.71431756 1 0.85717463 0 0.85717463 1 1.000031709671 0 1.000031709671
		 1 1.42860305 0 1.57146013 0 1.57146013 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 28 ".vt[0:27]"  0.14135087 0.19946113 -0.068070889 0.097817659 0.19946113 -0.12265956
		 0.034910679 0.19946113 -0.1529541 -0.034910798 0.19946113 -0.1529541 -0.097817779 0.19946113 -0.12265968
		 -0.14135087 0.19946113 -0.068070948 -0.15688765 0.19946113 -5.9604645e-008 -0.1413511 0.19946113 0.068070889
		 -0.097817957 0.19946113 0.12265956 -0.034910977 0.19946113 0.15295398 0.034910679 0.19946113 0.15295398
		 0.097817659 0.19946113 0.12265956 0.14135057 0.19946113 0.068070889 0.15688729 0.19946113 0
		 0.16791052 0.39731231 -0.08086133 0.11619747 0.39731231 -0.14570707 0.041470408 0.39731231 -0.18169397
		 -0.041470468 0.39731231 -0.18169397 -0.11619759 0.39731231 -0.14570725 -0.16791046 0.39731231 -0.08086139
		 -0.18636662 0.39731231 -5.9604645e-008 -0.16791075 0.39731231 0.08086133 -0.11619776 0.39731231 0.14570713
		 -0.041470647 0.39731231 0.18169385 0.041470408 0.39731231 0.18169385 0.11619747 0.39731231 0.14570713
		 0.16791016 0.39731231 0.08086133 0.18636626 0.39731231 0;
	setAttr -s 42 ".ed[0:41]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 0 0 0 14 0 1 15 0 14 15 0 2 16 0 15 16 0
		 3 17 0 16 17 0 4 18 0 17 18 0 5 19 0 18 19 0 6 20 0 19 20 0 7 21 0 20 21 0 8 22 0
		 21 22 0 9 23 0 22 23 0 10 24 0 23 24 0 11 25 0 24 25 0 12 26 0 25 26 0 13 27 0 26 27 0
		 27 14 0;
	setAttr -s 14 ".fc[0:13]" -type "polyFaces" 
		f 4 0 15 -17 -15
		mu 0 4 0 1 2 3
		f 4 1 17 -19 -16
		mu 0 4 1 27 4 2
		f 4 2 19 -21 -18
		mu 0 4 27 28 29 4
		f 4 3 21 -23 -20
		mu 0 4 5 7 8 6
		f 4 4 23 -25 -22
		mu 0 4 7 9 10 8
		f 4 5 25 -27 -24
		mu 0 4 9 11 12 10
		f 4 6 27 -29 -26
		mu 0 4 11 13 14 12
		f 4 7 29 -31 -28
		mu 0 4 13 15 16 14
		f 4 8 31 -33 -30
		mu 0 4 15 17 18 16
		f 4 9 33 -35 -32
		mu 0 4 17 19 20 18
		f 4 10 35 -37 -34
		mu 0 4 19 21 22 20
		f 4 11 37 -39 -36
		mu 0 4 21 23 24 22
		f 4 12 39 -41 -38
		mu 0 4 23 25 26 24
		f 4 13 14 -42 -40
		mu 0 4 25 0 3 26;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "parts:polySurfaceShape1" -p "HoloPod_shine1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 482 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.375 0.3125 0.39285713 0.3125
		 0.39285713 0.48121852 0.375 0.48121852 0.41071427 0.3125 0.41071427 0.48121852 0.4285714
		 0.3125 0.4285714 0.48121852 0.44642854 0.3125 0.44642854 0.48121852 0.46428567 0.3125
		 0.46428567 0.48121852 0.48214281 0.3125 0.48214281 0.48121852 0.49999994 0.3125 0.49999994
		 0.48121852 0.51785707 0.3125 0.51785707 0.48121852 0.53571421 0.3125 0.53571421 0.48121852
		 0.55357134 0.3125 0.55357134 0.48121852 0.57142848 0.3125 0.57142848 0.48121852 0.58928561
		 0.3125 0.58928561 0.48121852 0.60714275 0.3125 0.60714275 0.48121852 0.62499988 0.3125
		 0.62499988 0.48121852 0.59742028 0.034088865 0.64077634 0.088455684 0.5 0.15000001
		 0.53476888 0.0039175451 0.46523112 0.0039175451 0.40257972 0.034088865 0.35922363
		 0.088455684 0.34375 0.15625 0.35922363 0.22404432 0.40257972 0.27841115 0.46523112
		 0.30858248 0.53476888 0.30858248 0.59742028 0.27841115 0.6407764 0.22404432 0.65625
		 0.15625 0.55357134 0.64419359 0.57142848 0.64419359 0.57142848 0.68843985 0.55357134
		 0.68843985 0.53571421 0.64419359 0.53571421 0.68843985 0.51785707 0.64419359 0.51785707
		 0.68843985 0.49999994 0.64419359 0.49999994 0.68843985 0.48214281 0.64419359 0.48214281
		 0.68843985 0.46428567 0.64419359 0.46428567 0.68843985 0.44642854 0.68843985 0.44642854
		 0.64419359 0.4285714 0.64419359 0.4285714 0.68843985 0.41071427 0.64419359 0.41071427
		 0.68843985 0.39285713 0.64419359 0.39285713 0.68843985 0.375 0.64419359 0.375 0.68843985
		 0.60714275 0.64419359 0.62499988 0.64419359 0.62499988 0.68843985 0.60714275 0.68843985
		 0.58928561 0.64419359 0.58928561 0.68843985 0.55357134 0.5909574 0.57142848 0.5909574
		 0.53571421 0.5909574 0.51785707 0.5909574 0.49999994 0.5909574 0.48214281 0.5909574
		 0.46428567 0.5909574 0.44642854 0.5909574 0.4285714 0.5909574 0.41071427 0.5909574
		 0.39285713 0.5909574 0.375 0.5909574 0.60714275 0.5909574 0.62499988 0.5909574 0.58928561
		 0.5909574 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0
		 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1
		 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1
		 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0
		 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1
		 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0
		 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".uvst[0].uvsp[250:481]" 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1
		 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1
		 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0
		 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1
		 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0
		 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1
		 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0
		 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1
		 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1
		 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0
		 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 169 ".vt";
	setAttr ".vt[0:165]"  0.18867552 -0.42050946 -0.090861261 0.13056749 -0.42050946 -0.16372639
		 0.04659903 -0.42050946 -0.20416349 -0.046598971 -0.42050946 -0.20416349 -0.13056749 -0.42050946 -0.16372639
		 -0.1886754 -0.42050946 -0.09086138 -0.20941401 -0.42050946 -5.9604645e-008 -0.18867552 -0.42050946 0.090861261
		 -0.13056761 -0.42050946 0.16372636 -0.04659909 -0.42050946 0.2041634 0.046598911 -0.42050946 0.2041634
		 0.13056749 -0.42050946 0.16372642 0.1886754 -0.42050946 0.09086132 0.20941389 -0.42050946 0
		 0.25194573 0.18960723 -0.12133056 0.17435181 0.18960723 -0.21863019 0.062225521 0.18960723 -0.27262753
		 -0.062225401 0.18960723 -0.27262753 -0.17435181 0.18960723 -0.21863025 -0.25194561 0.18960723 -0.12133068
		 -0.27963868 0.18960723 -5.9604645e-008 -0.25194573 0.18960723 0.12133062 -0.17435193 0.18960723 0.21863025
		 -0.062225521 0.18960723 0.27262744 0.062225401 0.18960723 0.27262744 0.17435181 0.18960723 0.21863028
		 0.25194561 0.18960723 0.12133065 0.27963865 0.18960723 0 -1.1920929e-007 -0.18960722 0
		 0.18745792 0.14497545 0.23506483 0.066902936 0.14497545 0.29312098 -0.066903055 0.14497545 0.29312098
		 -0.18745804 0.14497545 0.23506477 -0.27088463 0.14497545 0.13045108 -0.30065924 0.14497545 -5.9604645e-008
		 -0.27088448 0.14497545 -0.13045114 -0.18745792 0.14497545 -0.2350648 -0.066902936 0.14497545 -0.29312104
		 0.066902995 0.14497545 -0.29312104 0.18745792 0.14497545 -0.23506474 0.27088463 0.14497545 -0.13045102
		 0.30065918 0.14497545 0 0.27088451 0.14497545 0.13045114 0.17435181 0.091275603 0.21863028
		 0.062225401 0.091275603 0.27262744 -0.062225521 0.091275603 0.27262744 -0.17435193 0.091275603 0.21863025
		 -0.25194573 0.091275603 0.12133062 -0.27963868 0.091275603 -5.9604645e-008 -0.25194561 0.091275603 -0.12133068
		 -0.17435181 0.091275603 -0.21863025 -0.062225401 0.091275603 -0.27262753 0.062225521 0.091275603 -0.27262753
		 0.17435181 0.091275603 -0.21863019 0.25194573 0.091275603 -0.12133056 0.27963865 0.091275603 0
		 0.25194561 0.091275603 0.12133065 0.13056749 -0.040788502 0.16372642 0.046598911 -0.040788502 0.2041634
		 -0.04659909 -0.040788502 0.2041634 -0.13056761 -0.040788502 0.16372636 -0.18867552 -0.040788502 0.090861261
		 -0.20941401 -0.040788502 -5.9604645e-008 -0.1886754 -0.040788502 -0.09086138 -0.13056749 -0.040788502 -0.16372639
		 -0.046598971 -0.040788502 -0.20416349 0.04659903 -0.040788502 -0.20416349 0.13056749 -0.040788502 -0.16372639
		 0.18867552 -0.040788502 -0.090861261 0.20941389 -0.040788502 0 0.1886754 -0.040788502 0.09086132
		 0.19494665 0.19012353 -0.093881249 0.13490725 0.19012353 -0.16916829 0.048147857 0.19012353 -0.21094942
		 -0.048147798 0.19012353 -0.21094942 -0.13490719 0.19012353 -0.16916829 -0.19494653 0.19012353 -0.093881369
		 -0.2163744 0.19012353 -5.9604645e-008 -0.19494677 0.19012353 0.093881279 -0.13490725 0.19012353 0.16916832
		 -0.048147917 0.19012353 0.21094936 0.048147678 0.19012353 0.21094936 0.13490725 0.19012353 0.16916832
		 0.19494647 0.19012353 0.093881339 0.2163744 0.19012353 0 0.19494665 0.18275264 -0.093881249
		 0.13490725 0.18275264 -0.16916829 0.048147857 0.18275264 -0.21094942 -0.048147798 0.18275264 -0.21094942
		 -0.13490719 0.18275264 -0.16916829 -0.19494653 0.18275264 -0.093881369 -0.2163744 0.18275264 -5.9604645e-008
		 -0.19494677 0.18275264 0.093881279 -0.13490725 0.18275264 0.16916832 -0.048147917 0.18275264 0.21094936
		 0.048147678 0.18275264 0.21094936 0.13490725 0.18275264 0.16916832 0.19494647 0.18275264 0.093881339
		 0.2163744 0.18275264 0 0.18674171 0.18275264 -0.089929998 0.12922931 0.18275264 -0.16204834
		 0.046121299 0.18275264 -0.20207101 -0.046121418 0.18275264 -0.20207101 -0.12922925 0.18275264 -0.1620484
		 -0.18674165 0.18275264 -0.089930117 -0.20726764 0.18275264 -5.9604645e-008 -0.18674189 0.18275264 0.089929998
		 -0.12922937 0.18275264 0.16204837 -0.046121597 0.18275264 0.20207095 0.04612124 0.18275264 0.20207095
		 0.12922931 0.18275264 0.16204837 0.18674153 0.18275264 0.089929998 0.20726758 0.18275264 0
		 0.18674171 0.19349089 -0.089929998 0.12922931 0.19349089 -0.16204834 0.046121299 0.19349089 -0.20207101
		 -0.046121418 0.19349089 -0.20207101 -0.12922925 0.19349089 -0.1620484 -0.18674165 0.19349089 -0.089930117
		 -0.20726764 0.19349089 -5.9604645e-008 -0.18674189 0.19349089 0.089929998 -0.12922937 0.19349089 0.16204837
		 -0.046121597 0.19349089 0.20207095 0.04612124 0.19349089 0.20207095 0.12922931 0.19349089 0.16204837
		 0.18674153 0.19349089 0.089929998 0.20726758 0.19349089 0 0.14810181 0.21256736 -0.071322024
		 0.10248965 0.21256736 -0.12851793 0.036578 0.21256736 -0.16025937 -0.036578178 0.21256736 -0.16025937
		 -0.10248971 0.21256736 -0.12851799 -0.14810181 0.21256736 -0.071322143 -0.16438067 0.21256736 -5.9604645e-008
		 -0.14810205 0.21256736 0.071322024 -0.10248971 0.21256736 0.12851793 -0.036578298 0.21256736 0.16025925
		 0.036578 0.21256736 0.16025925 0.10248965 0.21256736 0.12851793 0.14810169 0.21256736 0.071322024
		 0.16438055 0.21256736 0 0.14135087 0.20773312 -0.068070889 0.097817659 0.20773312 -0.12265956
		 0.034910679 0.20773312 -0.1529541 -0.034910798 0.20773312 -0.1529541 -0.097817779 0.20773312 -0.12265968
		 -0.14135087 0.20773312 -0.068070948 -0.15688765 0.20773312 -5.9604645e-008 -0.1413511 0.20773312 0.068070889
		 -0.097817957 0.20773312 0.12265956 -0.034910977 0.20773312 0.15295398 0.034910679 0.20773312 0.15295398
		 0.097817659 0.20773312 0.12265956 0.14135057 0.20773312 0.068070889 0.15688729 0.20773312 0
		 0.14135087 0.19946113 -0.068070889 0.097817659 0.19946113 -0.12265956 0.034910679 0.19946113 -0.1529541
		 -0.034910798 0.19946113 -0.1529541 -0.097817779 0.19946113 -0.12265968 -0.14135087 0.19946113 -0.068070948
		 -0.15688765 0.19946113 -5.9604645e-008 -0.1413511 0.19946113 0.068070889 -0.097817957 0.19946113 0.12265956
		 -0.034910977 0.19946113 0.15295398 0.034910679 0.19946113 0.15295398;
	setAttr ".vt[166:168]" 0.097817659 0.19946113 0.12265956 0.14135057 0.19946113 0.068070889
		 0.15688729 0.19946113 0;
	setAttr -s 336 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 4 0 5 6 0 6 7 0 7 8 0 8 9 0 9 10 0
		 10 11 0 11 12 0 12 13 0 13 0 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 20 0 20 21 0
		 21 22 0 22 23 0 23 24 0 24 25 0 25 26 0 26 27 0 27 14 0 0 68 1 1 67 1 2 66 1 3 65 1
		 4 64 1 5 63 1 6 62 1 7 61 1 8 60 1 9 59 1 10 58 1 11 57 1 12 70 1 13 69 1 28 0 1
		 28 1 1 28 2 1 28 3 1 28 4 1 28 5 1 28 6 1 28 7 1 28 8 1 28 9 1 28 10 1 28 11 1 28 12 1
		 28 13 1 29 25 1 30 24 1 29 30 1 31 23 1 30 31 1 32 22 1 31 32 1 33 21 1 32 33 1 34 20 1
		 33 34 1 35 19 1 34 35 1 36 18 1 37 17 1 36 37 1 38 16 1 37 38 1 39 15 1 38 39 1 40 14 1
		 39 40 1 41 27 1 40 41 1 42 26 1 41 42 1 42 29 1 43 29 1 44 30 1 43 44 1 45 31 1 44 45 1
		 46 32 1 45 46 1 47 33 1 46 47 1 48 34 1 47 48 1 49 35 1 48 49 1 50 36 1 51 37 1 50 51 1
		 52 38 1 51 52 1 53 39 1 52 53 1 54 40 1 53 54 1 55 41 1 54 55 1 56 42 1 55 56 1 56 43 1
		 57 43 1 58 44 1 57 58 1 59 45 1 58 59 1 60 46 1 59 60 1 61 47 1 60 61 1 62 48 1 61 62 1
		 63 49 1 62 63 1 64 50 1 65 51 1 64 65 1 66 52 1 65 66 1 67 53 1 66 67 1 68 54 1 67 68 1
		 69 55 1 68 69 1 70 56 1 69 70 1 70 57 1 35 36 1 49 50 1 63 64 1 4 5 0 14 71 0 15 72 0
		 71 72 0 16 73 0 72 73 0 17 74 0 73 74 0 18 75 0 74 75 0 19 76 0 75 76 0 20 77 0 76 77 0
		 21 78 0 77 78 0 22 79 0 78 79 0 23 80 0 79 80 0 24 81 0 80 81 0 25 82 0 81 82 0 26 83 0
		 82 83 0 27 84 0;
	setAttr ".ed[166:331]" 83 84 0 84 71 0 71 85 0 72 86 0 85 86 0 73 87 0 86 87 0
		 74 88 0 87 88 0 75 89 0 88 89 0 76 90 0 89 90 0 77 91 0 90 91 0 78 92 0 91 92 0 79 93 0
		 92 93 0 80 94 0 93 94 0 81 95 0 94 95 0 82 96 0 95 96 0 83 97 0 96 97 0 84 98 0 97 98 0
		 98 85 0 85 99 0 86 100 0 99 100 0 87 101 0 100 101 0 88 102 0 101 102 0 89 103 0
		 102 103 0 90 104 0 103 104 0 91 105 0 104 105 0 92 106 0 105 106 0 93 107 0 106 107 0
		 94 108 0 107 108 0 95 109 0 108 109 0 96 110 0 109 110 0 97 111 0 110 111 0 98 112 0
		 111 112 0 112 99 0 99 113 0 100 114 0 113 114 0 101 115 0 114 115 0 102 116 0 115 116 0
		 103 117 0 116 117 0 104 118 0 117 118 0 105 119 0 118 119 0 106 120 0 119 120 0 107 121 0
		 120 121 0 108 122 0 121 122 0 109 123 0 122 123 0 110 124 0 123 124 0 111 125 0 124 125 0
		 112 126 0 125 126 0 126 113 0 113 127 0 114 128 0 127 128 0 115 129 0 128 129 0 116 130 0
		 129 130 0 117 131 0 130 131 0 118 132 0 131 132 0 119 133 0 132 133 0 120 134 0 133 134 0
		 121 135 0 134 135 0 122 136 0 135 136 0 123 137 0 136 137 0 124 138 0 137 138 0 125 139 0
		 138 139 0 126 140 0 139 140 0 140 127 0 127 141 0 128 142 0 141 142 0 129 143 0 142 143 0
		 130 144 0 143 144 0 131 145 0 144 145 0 132 146 0 145 146 0 133 147 0 146 147 0 134 148 0
		 147 148 0 135 149 0 148 149 0 136 150 0 149 150 0 137 151 0 150 151 0 138 152 0 151 152 0
		 139 153 0 152 153 0 140 154 0 153 154 0 154 141 0 141 155 0 142 156 0 155 156 0 143 157 0
		 156 157 0 144 158 0 157 158 0 145 159 0 158 159 0 146 160 0 159 160 0 147 161 0 160 161 0
		 148 162 0 161 162 0 149 163 0 162 163 0 150 164 0 163 164 0 151 165 0 164 165 0 152 166 0
		 165 166 0 153 167 0;
	setAttr ".ed[332:335]" 166 167 0 154 168 0 167 168 0 168 155 0;
	setAttr -s 168 ".fc[0:167]" -type "polyFaces" 
		f 4 0 28 130 -28
		mu 0 4 0 1 2 3
		f 4 1 29 128 -29
		mu 0 4 1 4 5 2
		f 4 2 30 126 -30
		mu 0 4 4 6 7 5
		f 4 3 31 124 -31
		mu 0 4 6 8 9 7
		f 4 139 32 138 -32
		mu 0 4 8 10 11 9
		f 4 4 33 121 -33
		mu 0 4 10 12 13 11
		f 4 5 34 119 -34
		mu 0 4 12 14 15 13
		f 4 6 35 117 -35
		mu 0 4 14 16 17 15
		f 4 7 36 115 -36
		mu 0 4 16 18 19 17
		f 4 8 37 113 -37
		mu 0 4 18 20 21 19
		f 4 9 38 111 -38
		mu 0 4 20 22 23 21
		f 4 10 39 135 -39
		mu 0 4 22 24 25 23
		f 4 11 40 134 -40
		mu 0 4 24 26 27 25
		f 4 12 27 132 -41
		mu 0 4 26 28 29 27
		f 3 -1 -42 42
		mu 0 3 30 31 32
		f 3 -2 -43 43
		mu 0 3 33 30 32
		f 3 -3 -44 44
		mu 0 3 34 33 32
		f 3 -4 -45 45
		mu 0 3 35 34 32
		f 3 -140 -46 46
		mu 0 3 36 35 32
		f 3 -5 -47 47
		mu 0 3 37 36 32
		f 3 -6 -48 48
		mu 0 3 38 37 32
		f 3 -7 -49 49
		mu 0 3 39 38 32
		f 3 -8 -50 50
		mu 0 3 40 39 32
		f 3 -9 -51 51
		mu 0 3 41 40 32
		f 3 -10 -52 52
		mu 0 3 42 41 32
		f 3 -11 -53 53
		mu 0 3 43 42 32
		f 3 -12 -54 54
		mu 0 3 44 43 32
		f 3 -13 -55 41
		mu 0 3 31 44 32
		f 4 -58 55 -24 -57
		mu 0 4 45 46 47 48
		f 4 -60 56 -23 -59
		mu 0 4 49 45 48 50
		f 4 -62 58 -22 -61
		mu 0 4 51 49 50 52
		f 4 -64 60 -21 -63
		mu 0 4 53 51 52 54
		f 4 -66 62 -20 -65
		mu 0 4 55 53 54 56
		f 4 -68 64 -19 -67
		mu 0 4 57 55 56 58
		f 4 66 -18 -69 -137
		mu 0 4 57 58 59 60
		f 4 -71 68 -17 -70
		mu 0 4 61 60 59 62
		f 4 -73 69 -16 -72
		mu 0 4 63 61 62 64
		f 4 -75 71 -15 -74
		mu 0 4 65 63 64 66
		f 4 -77 73 -14 -76
		mu 0 4 67 65 66 68
		f 4 -79 75 -27 -78
		mu 0 4 69 70 71 72
		f 4 -81 77 -26 -80
		mu 0 4 73 69 72 74
		f 4 -82 79 -25 -56
		mu 0 4 46 73 74 47
		f 4 -85 82 57 -84
		mu 0 4 75 76 46 45
		f 4 -87 83 59 -86
		mu 0 4 77 75 45 49
		f 4 -89 85 61 -88
		mu 0 4 78 77 49 51
		f 4 -91 87 63 -90
		mu 0 4 79 78 51 53
		f 4 -93 89 65 -92
		mu 0 4 80 79 53 55
		f 4 -95 91 67 -94
		mu 0 4 81 80 55 57
		f 4 93 136 -96 -138
		mu 0 4 81 57 60 82
		f 4 -98 95 70 -97
		mu 0 4 83 82 60 61
		f 4 -100 96 72 -99
		mu 0 4 84 83 61 63
		f 4 -102 98 74 -101
		mu 0 4 85 84 63 65
		f 4 -104 100 76 -103
		mu 0 4 86 85 65 67
		f 4 -106 102 78 -105
		mu 0 4 87 88 70 69
		f 4 -108 104 80 -107
		mu 0 4 89 87 69 73
		f 4 -109 106 81 -83
		mu 0 4 76 89 73 46
		f 4 -112 109 84 -111
		mu 0 4 21 23 76 75
		f 4 -114 110 86 -113
		mu 0 4 19 21 75 77
		f 4 -116 112 88 -115
		mu 0 4 17 19 77 78
		f 4 -118 114 90 -117
		mu 0 4 15 17 78 79
		f 4 -120 116 92 -119
		mu 0 4 13 15 79 80
		f 4 -122 118 94 -121
		mu 0 4 11 13 80 81
		f 4 120 137 -123 -139
		mu 0 4 11 81 82 9
		f 4 -125 122 97 -124
		mu 0 4 7 9 82 83
		f 4 -127 123 99 -126
		mu 0 4 5 7 83 84
		f 4 -129 125 101 -128
		mu 0 4 2 5 84 85
		f 4 -131 127 103 -130
		mu 0 4 3 2 85 86
		f 4 -133 129 105 -132
		mu 0 4 27 29 88 87
		f 4 -135 131 107 -134
		mu 0 4 25 27 87 89
		f 4 -136 133 108 -110
		mu 0 4 23 25 89 76
		f 4 13 141 -143 -141
		mu 0 4 90 91 92 93
		f 4 14 143 -145 -142
		mu 0 4 94 95 96 97
		f 4 15 145 -147 -144
		mu 0 4 98 99 100 101
		f 4 16 147 -149 -146
		mu 0 4 102 103 104 105
		f 4 17 149 -151 -148
		mu 0 4 106 107 108 109
		f 4 18 151 -153 -150
		mu 0 4 110 111 112 113
		f 4 19 153 -155 -152
		mu 0 4 114 115 116 117
		f 4 20 155 -157 -154
		mu 0 4 118 119 120 121
		f 4 21 157 -159 -156
		mu 0 4 122 123 124 125
		f 4 22 159 -161 -158
		mu 0 4 126 127 128 129
		f 4 23 161 -163 -160
		mu 0 4 130 131 132 133
		f 4 24 163 -165 -162
		mu 0 4 134 135 136 137
		f 4 25 165 -167 -164
		mu 0 4 138 139 140 141
		f 4 26 140 -168 -166
		mu 0 4 142 143 144 145
		f 4 142 169 -171 -169
		mu 0 4 146 147 148 149
		f 4 144 171 -173 -170
		mu 0 4 150 151 152 153
		f 4 146 173 -175 -172
		mu 0 4 154 155 156 157
		f 4 148 175 -177 -174
		mu 0 4 158 159 160 161
		f 4 150 177 -179 -176
		mu 0 4 162 163 164 165
		f 4 152 179 -181 -178
		mu 0 4 166 167 168 169
		f 4 154 181 -183 -180
		mu 0 4 170 171 172 173
		f 4 156 183 -185 -182
		mu 0 4 174 175 176 177
		f 4 158 185 -187 -184
		mu 0 4 178 179 180 181
		f 4 160 187 -189 -186
		mu 0 4 182 183 184 185
		f 4 162 189 -191 -188
		mu 0 4 186 187 188 189
		f 4 164 191 -193 -190
		mu 0 4 190 191 192 193
		f 4 166 193 -195 -192
		mu 0 4 194 195 196 197
		f 4 167 168 -196 -194
		mu 0 4 198 199 200 201
		f 4 170 197 -199 -197
		mu 0 4 202 203 204 205
		f 4 172 199 -201 -198
		mu 0 4 206 207 208 209
		f 4 174 201 -203 -200
		mu 0 4 210 211 212 213
		f 4 176 203 -205 -202
		mu 0 4 214 215 216 217
		f 4 178 205 -207 -204
		mu 0 4 218 219 220 221
		f 4 180 207 -209 -206
		mu 0 4 222 223 224 225
		f 4 182 209 -211 -208
		mu 0 4 226 227 228 229
		f 4 184 211 -213 -210
		mu 0 4 230 231 232 233
		f 4 186 213 -215 -212
		mu 0 4 234 235 236 237
		f 4 188 215 -217 -214
		mu 0 4 238 239 240 241
		f 4 190 217 -219 -216
		mu 0 4 242 243 244 245
		f 4 192 219 -221 -218
		mu 0 4 246 247 248 249
		f 4 194 221 -223 -220
		mu 0 4 250 251 252 253
		f 4 195 196 -224 -222
		mu 0 4 254 255 256 257
		f 4 198 225 -227 -225
		mu 0 4 258 259 260 261
		f 4 200 227 -229 -226
		mu 0 4 262 263 264 265
		f 4 202 229 -231 -228
		mu 0 4 266 267 268 269
		f 4 204 231 -233 -230
		mu 0 4 270 271 272 273
		f 4 206 233 -235 -232
		mu 0 4 274 275 276 277
		f 4 208 235 -237 -234
		mu 0 4 278 279 280 281
		f 4 210 237 -239 -236
		mu 0 4 282 283 284 285
		f 4 212 239 -241 -238
		mu 0 4 286 287 288 289
		f 4 214 241 -243 -240
		mu 0 4 290 291 292 293
		f 4 216 243 -245 -242
		mu 0 4 294 295 296 297
		f 4 218 245 -247 -244
		mu 0 4 298 299 300 301
		f 4 220 247 -249 -246
		mu 0 4 302 303 304 305
		f 4 222 249 -251 -248
		mu 0 4 306 307 308 309
		f 4 223 224 -252 -250
		mu 0 4 310 311 312 313
		f 4 226 253 -255 -253
		mu 0 4 314 315 316 317
		f 4 228 255 -257 -254
		mu 0 4 318 319 320 321
		f 4 230 257 -259 -256
		mu 0 4 322 323 324 325
		f 4 232 259 -261 -258
		mu 0 4 326 327 328 329
		f 4 234 261 -263 -260
		mu 0 4 330 331 332 333
		f 4 236 263 -265 -262
		mu 0 4 334 335 336 337
		f 4 238 265 -267 -264
		mu 0 4 338 339 340 341
		f 4 240 267 -269 -266
		mu 0 4 342 343 344 345
		f 4 242 269 -271 -268
		mu 0 4 346 347 348 349
		f 4 244 271 -273 -270
		mu 0 4 350 351 352 353
		f 4 246 273 -275 -272
		mu 0 4 354 355 356 357
		f 4 248 275 -277 -274
		mu 0 4 358 359 360 361
		f 4 250 277 -279 -276
		mu 0 4 362 363 364 365
		f 4 251 252 -280 -278
		mu 0 4 366 367 368 369
		f 4 254 281 -283 -281
		mu 0 4 370 371 372 373
		f 4 256 283 -285 -282
		mu 0 4 374 375 376 377
		f 4 258 285 -287 -284
		mu 0 4 378 379 380 381
		f 4 260 287 -289 -286
		mu 0 4 382 383 384 385
		f 4 262 289 -291 -288
		mu 0 4 386 387 388 389
		f 4 264 291 -293 -290
		mu 0 4 390 391 392 393
		f 4 266 293 -295 -292
		mu 0 4 394 395 396 397
		f 4 268 295 -297 -294
		mu 0 4 398 399 400 401
		f 4 270 297 -299 -296
		mu 0 4 402 403 404 405
		f 4 272 299 -301 -298
		mu 0 4 406 407 408 409
		f 4 274 301 -303 -300
		mu 0 4 410 411 412 413
		f 4 276 303 -305 -302
		mu 0 4 414 415 416 417
		f 4 278 305 -307 -304
		mu 0 4 418 419 420 421
		f 4 279 280 -308 -306
		mu 0 4 422 423 424 425
		f 4 282 309 -311 -309
		mu 0 4 426 427 428 429
		f 4 284 311 -313 -310
		mu 0 4 430 431 432 433
		f 4 286 313 -315 -312
		mu 0 4 434 435 436 437
		f 4 288 315 -317 -314
		mu 0 4 438 439 440 441
		f 4 290 317 -319 -316
		mu 0 4 442 443 444 445
		f 4 292 319 -321 -318
		mu 0 4 446 447 448 449
		f 4 294 321 -323 -320
		mu 0 4 450 451 452 453
		f 4 296 323 -325 -322
		mu 0 4 454 455 456 457
		f 4 298 325 -327 -324
		mu 0 4 458 459 460 461
		f 4 300 327 -329 -326
		mu 0 4 462 463 464 465
		f 4 302 329 -331 -328
		mu 0 4 466 467 468 469
		f 4 304 331 -333 -330
		mu 0 4 470 471 472 473
		f 4 306 333 -335 -332
		mu 0 4 474 475 476 477
		f 4 307 308 -336 -334
		mu 0 4 478 479 480 481;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Camera_Pos";
createNode locator -n "Camera_PosShape" -p "Camera_Pos";
	setAttr -k off ".v";
createNode transform -n "Camera_TiltBase_root" -p "Camera_Pos";
	setAttr ".t" -type "double3" 4.163336342344337e-017 -1.1102230246251565e-016 -2.0194182378101733 ;
createNode locator -n "Camera_TiltBase_rootShape" -p "Camera_TiltBase_root";
	setAttr -k off ".v";
createNode transform -n "Camera_TiltBase" -p "Camera_TiltBase_root";
	setAttr ".t" -type "double3" -5.5511151231257827e-017 5.5511151231257827e-017 8.3266726846886741e-017 ;
createNode locator -n "Camera_TiltBaseShape" -p "Camera_TiltBase";
	setAttr -k off ".v";
createNode transform -n "Camera_FinalPos" -p "Camera_TiltBase";
	setAttr ".t" -type "double3" 1.1102230246251565e-016 3.8857805861880484e-016 2.0194182378101733 ;
	setAttr ".r" -type "double3" 2.4848083448933752e-017 3.081162347667781e-015 1.1927080055488186e-015 ;
createNode locator -n "Camera_FinalPosShape" -p "Camera_FinalPos";
	setAttr -k off ".v";
createNode transform -n "menuCam" -p "Camera_FinalPos";
	setAttr ".t" -type "double3" 0.033445489090827514 -0.0038223417555708818 -1.3322676295501878e-015 ;
	setAttr ".r" -type "double3" 3.180554681463516e-015 3.1805546814635168e-015 7.9513867036587919e-016 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".rp" -type "double3" 1.3877787807814457e-017 -2.7369110631344083e-048 6.6613381477509392e-016 ;
	setAttr ".sp" -type "double3" 4.163336342344337e-017 -5.5511151231257827e-017 -4.4408920985006262e-016 ;
	setAttr ".spt" -type "double3" 0 -1.2325951644078312e-032 0 ;
createNode camera -n "menuCamShape" -p "menuCam";
	setAttr -k off ".v";
	setAttr ".ovr" 1.3;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 9.3555827098765167;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".dr" yes;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 6;
	setAttr -s 14 ".dli[1:13]"  1 2 3 4 5 6 7 8 
		9 10 11 12 13;
	setAttr -s 2 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
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
		+ "modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"menuCam\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 1\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n"
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"menuCam\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 1\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n"
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
		+ "\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"left3\\\" -ps 1 50 50 -ps 2 50 100 -ps 3 50 50 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Front View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Front View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -camera \\\"menuCam\\\" \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Front View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -camera \\\"menuCam\\\" \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 1 -size 10 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 175 -ast 1 -aet 175 ";
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
createNode animCurveTL -n "persp_translateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -5.6841431845999431 1.25 -0.089790133354342896
		 6.25 -2.7064453496146248 25 1.1965299401338754 26.25 0.78189517242610684 27.5 0.28222410920961638
		 40 1.496165517363313 100 0.2810156813253778;
createNode animCurveTL -n "persp_translateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 2.6408867345346878 1.25 1.7535610099971586
		 6.25 6.7550103981705067 25 0.74648258396278466 26.25 0.73352837804976467 27.5 0.52141519626916355
		 40 1.6116870639513947 100 0.50471795037712053;
createNode animCurveTL -n "persp_translateZ";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 5.2315339578301447 1.25 3.3898322859909062
		 6.25 6.4215679636954341 25 -0.76168059242256014 26.25 1.4280732879407814 27.5 0.66179742006381959
		 40 2.4437507128756337 100 0.65762705605495464;
createNode animCurveTU -n "persp_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1.25 0 26.25 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "persp_rotateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -16.538352729876699 1.25 -20.138352729890233
		 6.25 -34.909225839374891 25 -5.3999999999914383 26.25 0.6000000000000002 27.5 -43.451
		 40 -26.837206896560382 100 -41.051000000006148;
createNode animCurveTA -n "persp_rotateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -49.799999999991776 1.25 -4.1999999999999451
		 6.25 -31.610526315796108 25 86.599999999968034 26.25 23.800000000000086 27.5 0 40 26.331034482761449
		 100 -0.3999999999999822;
createNode animCurveTA -n "persp_rotateZ";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1.25 0 26.25 0;
createNode animCurveTU -n "persp_scaleX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1.25 1 26.25 1;
createNode animCurveTU -n "persp_scaleY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1.25 1 26.25 1;
createNode animCurveTU -n "persp_scaleZ";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1.25 1 26.25 1;
createNode animCurveTL -n "botScreenRotator_translateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 0.75990605891412932 2.5 0.75990605891412932
		 3.75 0.75990605891412932 5 0.75990605891412932 6.25 0.75990605891412932 7.5 0.75990605891412932
		 8.75 0.75990605891412932 10 0.75990605891412932 11.25 0.75990605891412932 12.5 0.75990605891412932
		 13.75 0.75990605891412932 15 0.75990605891412932 16.25 0.75990605891412932 17.5 0.75990605891412932
		 18.75 0.75990605891412932 20 0.75990605891412932 21.25 0.75990605891412932 22.5 0.75990605891412932
		 23.75 0.75990605891412932 25 0.75990605891412932 26.25 0.75990605891412932 27.5 0.75990605891412932
		 28.75 0.75990605891412932 30 0.75990605891412932 31.25 0.75990605891412932 32.5 0.75990605891412932
		 33.75 0.75990605891412932 35 0.75990605891412932 36.25 0.75990605891412932 37.5 0.75990605891412932
		 38.75 0.75990605891412932 40 0.75990605891412932 41.25 0.75990605891412932 42.5 0.75990605891412932
		 43.75 0.75990605891412932 45 0.75990605891412932 46.25 0.75990605891412932 47.5 0.75990605891412932
		 48.75 0.75990605891412932 50 0.75990605891412932 51.25 0.75990605891412932 52.5 0.75990605891412932
		 53.75 0.75990605891412932 55 0.75990605891412932 56.25 0.75990605891412932 57.5 0.75990605891412932
		 58.75 0.75990605891412932 60 0.75990605891412932 61.25 0.75990605891412932 62.5 0.75990605891412932
		 63.75 0.75990605891412932 65 0.75990605891412932 66.25 0.75990605891412932 67.5 0.75990605891412932
		 68.75 0.75990605891412932 70 0.75990605891412932 71.25 0.75990605891412932 72.5 0.75990605891412932
		 73.75 0.75990605891412932 75 0.75990605891412932 76.25 0.75990605891412932 77.5 0.75990605891412932
		 78.75 0.75990605891412932 80 0.75990605891412932 81.25 0.75990605891412932 82.5 0.75990605891412932
		 83.75 0.75990605891412932 85 0.75990605891412932 86.25 0.75990605891412932 87.5 0.75990605891412932
		 88.75 0.75990605891412932 90 0.75990605891412932 91.25 0.75990605891412932 92.5 0.75990605891412932
		 93.75 0.75990605891412932 95 0.75990605891412932 96.25 0.75990605891412932 97.5 0.75990605891412932
		 98.75 0.75990605891412932 100 0.75990605891412932 101.25 0.75990605891412932 102.5 0.75990605891412932
		 103.75 0.75990605891412932 105 0.75990605891412932 106.25 0.75990605891412932 107.5 0.75990605891412932
		 108.75 0.75990605891412932 110 0.75990605891412932 111.25 0.75990605891412932 112.5 0.75990605891412932
		 113.75 0.75990605891412932 115 0.75990605891412932 116.25 0.75990605891412932 117.5 0.75990605891412932
		 118.75 0.75990605891412932 120 0.75990605891412932 121.25 0.75990605891412932 122.5 0.75990605891412932
		 123.75 0.75990605891412932 125 0.75990605891412932 126.25 0.75990605891412932 127.5 0.75990605891412932
		 128.75 0.75990605891412932 130 0.75990605891412932 131.25 0.75990605891412932 132.5 0.75990605891412932
		 133.75 0.75990605891412932 135 0.75990605891412932 136.25 0.75990605891412932 137.5 0.75990605891412932
		 138.75 0.75990605891412932 140 0.75990605891412932 141.25 0.75990605891412932 142.5 0.75990605891412932
		 143.75 0.75990605891412932 145 0.75990605891412932 146.25 0.75990605891412932 147.5 0.75990605891412932
		 148.75 0.75990605891412932 150 0.75990605891412932 151.25 0.75990605891412932 152.5 0.75990605891412932
		 153.75 0.75990605891412932 155 0.75990605891412932 156.25 0.75990605891412932 157.5 0.75990605891412932
		 158.75 0.75990605891412932 160 0.75990605891412932 161.25 0.75990605891412932 162.5 0.75990605891412932
		 163.75 0.75990605891412932 165 0.75990605891412932 166.25 0.75990605891412932 167.5 0.75990605891412932
		 168.75 0.75990605891412932 170 0.75990605891412932 171.25 0.75990605891412932 172.5 0.75990605891412932
		 173.75 0.75990605891412932 175 0.75990605891412932;
createNode animCurveTL -n "botScreenRotator_translateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 0.54353570232825033 2.5 0.54353570232825033
		 3.75 0.54353570232825033 5 0.54353570232825033 6.25 0.54353570232825033 7.5 0.54353570232825033
		 8.75 0.54353570232825033 10 0.54353570232825033 11.25 0.54353570232825033 12.5 0.54353570232825033
		 13.75 0.54353570232825033 15 0.54353570232825033 16.25 0.54353570232825033 17.5 0.54353570232825033
		 18.75 0.54353570232825033 20 0.54353570232825033 21.25 0.54353570232825033 22.5 0.54353570232825033
		 23.75 0.54353570232825033 25 0.54353570232825033 26.25 0.54353570232825033 27.5 0.54353570232825033
		 28.75 0.54353570232825033 30 0.54353570232825033 31.25 0.54353570232825033 32.5 0.54353570232825033
		 33.75 0.54353570232825033 35 0.54353570232825033 36.25 0.54353570232825033 37.5 0.54353570232825033
		 38.75 0.54353570232825033 40 0.54353570232825033 41.25 0.54353570232825033 42.5 0.54353570232825033
		 43.75 0.54353570232825033 45 0.54353570232825033 46.25 0.54353570232825033 47.5 0.54353570232825033
		 48.75 0.54353570232825033 50 0.54353570232825033 51.25 0.54353570232825033 52.5 0.54353570232825033
		 53.75 0.54353570232825033 55 0.54353570232825033 56.25 0.54353570232825033 57.5 0.54353570232825033
		 58.75 0.54353570232825033 60 0.54353570232825033 61.25 0.54353570232825033 62.5 0.54353570232825033
		 63.75 0.54353570232825033 65 0.54353570232825033 66.25 0.54353570232825033 67.5 0.54353570232825033
		 68.75 0.54353570232825033 70 0.54353570232825033 71.25 0.54353570232825033 72.5 0.54353570232825033
		 73.75 0.54353570232825033 75 0.54353570232825033 76.25 0.54353570232825033 77.5 0.54353570232825033
		 78.75 0.54353570232825033 80 0.54353570232825033 81.25 0.54353570232825033 82.5 0.54353570232825033
		 83.75 0.54353570232825033 85 0.54353570232825033 86.25 0.54353570232825033 87.5 0.54353570232825033
		 88.75 0.54353570232825033 90 0.54353570232825033 91.25 0.54353570232825033 92.5 0.54353570232825033
		 93.75 0.54353570232825033 95 0.54353570232825033 96.25 0.54353570232825033 97.5 0.54353570232825033
		 98.75 0.54353570232825033 100 0.54353570232825033 101.25 0.54353570232825033 102.5 0.54353570232825033
		 103.75 0.54353570232825033 105 0.54353570232825033 106.25 0.54353570232825033 107.5 0.54353570232825033
		 108.75 0.54353570232825033 110 0.54353570232825033 111.25 0.54353570232825033 112.5 0.54353570232825033
		 113.75 0.54353570232825033 115 0.54353570232825033 116.25 0.54353570232825033 117.5 0.54353570232825033
		 118.75 0.54353570232825033 120 0.54353570232825033 121.25 0.54353570232825033 122.5 0.54353570232825033
		 123.75 0.54353570232825033 125 0.54353570232825033 126.25 0.54353570232825033 127.5 0.54353570232825033
		 128.75 0.54353570232825033 130 0.54353570232825033 131.25 0.54353570232825033 132.5 0.54353570232825033
		 133.75 0.54353570232825033 135 0.54353570232825033 136.25 0.54353570232825033 137.5 0.54353570232825033
		 138.75 0.54353570232825033 140 0.54353570232825033 141.25 0.54353570232825033 142.5 0.54353570232825033
		 143.75 0.54353570232825033 145 0.54353570232825033 146.25 0.54353570232825033 147.5 0.54353570232825033
		 148.75 0.54353570232825033 150 0.54353570232825033 151.25 0.54353570232825033 152.5 0.54353570232825033
		 153.75 0.54353570232825033 155 0.54353570232825033 156.25 0.54353570232825033 157.5 0.54353570232825033
		 158.75 0.54353570232825033 160 0.54353570232825033 161.25 0.54353570232825033 162.5 0.54353570232825033
		 163.75 0.54353570232825033 165 0.54353570232825033 166.25 0.54353570232825033 167.5 0.54353570232825033
		 168.75 0.54353570232825033 170 0.54353570232825033 171.25 0.54353570232825033 172.5 0.54353570232825033
		 173.75 0.54353570232825033 175 0.54353570232825033;
createNode animCurveTL -n "botScreenRotator_translateZ";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 -0.5924541839143882 2.5 -0.5924541839143882
		 3.75 -0.5924541839143882 5 -0.5924541839143882 6.25 -0.5924541839143882 7.5 -0.5924541839143882
		 8.75 -0.5924541839143882 10 -0.5924541839143882 11.25 -0.5924541839143882 12.5 -0.5924541839143882
		 13.75 -0.5924541839143882 15 -0.5924541839143882 16.25 -0.5924541839143882 17.5 -0.5924541839143882
		 18.75 -0.5924541839143882 20 -0.5924541839143882 21.25 -0.5924541839143882 22.5 -0.5924541839143882
		 23.75 -0.5924541839143882 25 -0.5924541839143882 26.25 -0.5924541839143882 27.5 -0.5924541839143882
		 28.75 -0.5924541839143882 30 -0.5924541839143882 31.25 -0.5924541839143882 32.5 -0.5924541839143882
		 33.75 -0.5924541839143882 35 -0.5924541839143882 36.25 -0.5924541839143882 37.5 -0.5924541839143882
		 38.75 -0.5924541839143882 40 -0.5924541839143882 41.25 -0.5924541839143882 42.5 -0.5924541839143882
		 43.75 -0.5924541839143882 45 -0.5924541839143882 46.25 -0.5924541839143882 47.5 -0.5924541839143882
		 48.75 -0.5924541839143882 50 -0.5924541839143882 51.25 -0.5924541839143882 52.5 -0.5924541839143882
		 53.75 -0.5924541839143882 55 -0.5924541839143882 56.25 -0.5924541839143882 57.5 -0.5924541839143882
		 58.75 -0.5924541839143882 60 -0.5924541839143882 61.25 -0.5924541839143882 62.5 -0.5924541839143882
		 63.75 -0.5924541839143882 65 -0.5924541839143882 66.25 -0.5924541839143882 67.5 -0.5924541839143882
		 68.75 -0.5924541839143882 70 -0.5924541839143882 71.25 -0.5924541839143882 72.5 -0.5924541839143882
		 73.75 -0.5924541839143882 75 -0.5924541839143882 76.25 -0.5924541839143882 77.5 -0.5924541839143882
		 78.75 -0.5924541839143882 80 -0.5924541839143882 81.25 -0.5924541839143882 82.5 -0.5924541839143882
		 83.75 -0.5924541839143882 85 -0.5924541839143882 86.25 -0.5924541839143882 87.5 -0.5924541839143882
		 88.75 -0.5924541839143882 90 -0.5924541839143882 91.25 -0.5924541839143882 92.5 -0.5924541839143882
		 93.75 -0.5924541839143882 95 -0.5924541839143882 96.25 -0.5924541839143882 97.5 -0.5924541839143882
		 98.75 -0.5924541839143882 100 -0.5924541839143882 101.25 -0.5924541839143882 102.5 -0.5924541839143882
		 103.75 -0.5924541839143882 105 -0.5924541839143882 106.25 -0.5924541839143882 107.5 -0.5924541839143882
		 108.75 -0.5924541839143882 110 -0.5924541839143882 111.25 -0.5924541839143882 112.5 -0.5924541839143882
		 113.75 -0.5924541839143882 115 -0.5924541839143882 116.25 -0.5924541839143882 117.5 -0.5924541839143882
		 118.75 -0.5924541839143882 120 -0.5924541839143882 121.25 -0.5924541839143882 122.5 -0.5924541839143882
		 123.75 -0.5924541839143882 125 -0.5924541839143882 126.25 -0.5924541839143882 127.5 -0.5924541839143882
		 128.75 -0.5924541839143882 130 -0.5924541839143882 131.25 -0.5924541839143882 132.5 -0.5924541839143882
		 133.75 -0.5924541839143882 135 -0.5924541839143882 136.25 -0.5924541839143882 137.5 -0.5924541839143882
		 138.75 -0.5924541839143882 140 -0.5924541839143882 141.25 -0.5924541839143882 142.5 -0.5924541839143882
		 143.75 -0.5924541839143882 145 -0.5924541839143882 146.25 -0.5924541839143882 147.5 -0.5924541839143882
		 148.75 -0.5924541839143882 150 -0.5924541839143882 151.25 -0.5924541839143882 152.5 -0.5924541839143882
		 153.75 -0.5924541839143882 155 -0.5924541839143882 156.25 -0.5924541839143882 157.5 -0.5924541839143882
		 158.75 -0.5924541839143882 160 -0.5924541839143882 161.25 -0.5924541839143882 162.5 -0.5924541839143882
		 163.75 -0.5924541839143882 165 -0.5924541839143882 166.25 -0.5924541839143882 167.5 -0.5924541839143882
		 168.75 -0.5924541839143882 170 -0.5924541839143882 171.25 -0.5924541839143882 172.5 -0.5924541839143882
		 173.75 -0.5924541839143882 175 -0.5924541839143882;
createNode animCurveTA -n "botScreenRotator_rotateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 0 2.5 0 3.75 0 5 0 6.25 0 7.5 0 8.75 0
		 10 0 11.25 0 12.5 0 13.75 0 15 0 16.25 0 17.5 0 18.75 0 20 0 21.25 0 22.5 0 23.75 0
		 25 0 26.25 0 27.5 0 28.75 0 30 0 31.25 0 32.5 0 33.75 0 35 0 36.25 0 37.5 0 38.75 0
		 40 0 41.25 0 42.5 0 43.75 0 45 0 46.25 0 47.5 0 48.75 0 50 0 51.25 0 52.5 0 53.75 0
		 55 0 56.25 0 57.5 0 58.75 0 60 0 61.25 0 62.5 0 63.75 0 65 0 66.25 0 67.5 0 68.75 0
		 70 0 71.25 0 72.5 0 73.75 0 75 0 76.25 0 77.5 0 78.75 0 80 0 81.25 0 82.5 0 83.75 0
		 85 0 86.25 0 87.5 0 88.75 0 90 0 91.25 0 92.5 0 93.75 0 95 0 96.25 0 97.5 0 98.75 0
		 100 0 101.25 0 102.5 0 103.75 0 105 0 106.25 0 107.5 0 108.75 0 110 0 111.25 0 112.5 0
		 113.75 0 115 0 116.25 0 117.5 0 118.75 0 120 0 121.25 0 122.5 0 123.75 0 125 0 126.25 0
		 127.5 0 128.75 0 130 0 131.25 0 132.5 0 133.75 0 135 0 136.25 0 137.5 0 138.75 0
		 140 0 141.25 0 142.5 0 143.75 0 145 0 146.25 0 147.5 0 148.75 0 150 0 151.25 0 152.5 0
		 153.75 0 155 0 156.25 0 157.5 0 158.75 0 160 0 161.25 0 162.5 0 163.75 0 165 0 166.25 0
		 167.5 0 168.75 0 170 0 171.25 0 172.5 0 173.75 0 175 0;
createNode animCurveTA -n "botScreenRotator_rotateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 -146.20489991307386 2.5 -145.03253216459024
		 3.75 -141.68595553585888 5 -136.42095820245402 6.25 -129.49333273086444 7.5 -121.15886350035278
		 8.75 -111.67334568451332 10 -101.29255799101102 11.25 -90.272304558223766 12.5 -78.868367387002237
		 13.75 -67.336527380468766 15 -55.932590323593963 16.25 -44.912329435400039 17.5 -34.531556904274005
		 18.75 -25.046032410585592 20 -16.711561007486534 21.25 -9.783941161755493 22.5 -4.5189424333207171
		 23.75 -1.1723654844192573 25 0 26.25 -1.0599865674946454 27.5 -4.0937411504602155
		 28.75 -8.8819480697143938 30 -15.205313606597503 31.25 -22.844512670277037 32.5 -31.580272875167019
		 33.75 -41.193236973960254 35 -51.464121757673823 36.25 -62.173651546642041 37.5 -73.102457799579128
		 38.75 -84.03126389565567 40 -94.740793214040451 41.25 -105.01167721345034 42.5 -114.6246402142188
		 43.75 -123.36039900735844 45 -130.9995963455701 46.25 -137.32295184335948 47.5 -142.11117005659227
		 48.75 -145.14491632593467 50 -146.20489991307386 51.25 -146.20489991307386 52.5 -146.20489991307386
		 53.75 -146.20489991307386 55 -146.20489991307386 56.25 -146.20489991307386 57.5 -146.20489991307386
		 58.75 -146.20489991307386 60 -146.20489991307386 61.25 -146.20489991307386 62.5 -146.20489991307386
		 63.75 -146.20489991307386 65 -146.20489991307386 66.25 -146.20489991307386 67.5 -146.20489991307386
		 68.75 -146.20489991307386 70 -146.20489991307386 71.25 -146.20489991307386 72.5 -146.20489991307386
		 73.75 -146.20489991307386 75 -146.20489991307386 76.25 -146.20489991307386 77.5 -146.20489991307386
		 78.75 -146.20489991307386 80 -146.20489991307386 81.25 -146.20489991307386 82.5 -146.20489991307386
		 83.75 -146.20489991307386 85 -146.20489991307386 86.25 -146.20489991307386 87.5 -146.20489991307386
		 88.75 -146.20489991307386 90 -146.20489991307386 91.25 -146.20489991307386 92.5 -146.20489991307386
		 93.75 -146.20489991307386 95 -146.20489991307386 96.25 -146.20489991307386 97.5 -146.20489991307386
		 98.75 -146.20489991307386 100 -146.20489991307386 101.25 -146.20489991307386 102.5 -146.20489991307386
		 103.75 -146.20489991307386 105 -146.20489991307386 106.25 -146.20489991307386 107.5 -146.20489991307386
		 108.75 -146.20489991307386 110 -146.20489991307386 111.25 -146.20489991307386 112.5 -146.20489991307386
		 113.75 -146.20489991307386 115 -146.20489991307386 116.25 -146.20489991307386 117.5 -146.20489991307386
		 118.75 -146.20489991307386 120 -146.20489991307386 121.25 -146.20489991307386 122.5 -146.20489991307386
		 123.75 -146.20489991307386 125 -146.20489991307386 126.25 -146.20489991307386 127.5 -146.20489991307386
		 128.75 -146.20489991307386 130 -146.20489991307386 131.25 -146.20489991307386 132.5 -146.20489991307386
		 133.75 -146.20489991307386 135 -146.20489991307386 136.25 -146.20489991307386 137.5 -146.20489991307386
		 138.75 -146.20489991307386 140 -146.20489991307386 141.25 -146.20489991307386 142.5 -146.20489991307386
		 143.75 -146.20489991307386 145 -146.20489991307386 146.25 -146.20489991307386 147.5 -146.20489991307386
		 148.75 -146.20489991307386 150 -146.20489991307386 151.25 -145.14492273368336 152.5 -142.11114916272345
		 153.75 -137.3229554433149 155 -130.99962244719433 156.25 -123.36036077253003 157.5 -114.62465207289578
		 158.75 -105.01172075015803 160 -94.740751049850232 161.25 -84.031284860103128 162.5 -73.102512700861041
		 163.75 -62.17361505297071 165 -51.464148863223592 166.25 -41.193293357590015 167.5 -31.580247840178053
		 168.75 -22.844539140543787 170 -15.205357778631599 171.25 -8.8819444697589027 172.5 -4.0937507503503729
		 173.75 -1.060001022272421 175 0;
createNode animCurveTA -n "botScreenRotator_rotateZ";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 0 2.5 0 3.75 0 5 0 6.25 0 7.5 0 8.75 0
		 10 0 11.25 0 12.5 0 13.75 0 15 0 16.25 0 17.5 0 18.75 0 20 0 21.25 0 22.5 0 23.75 0
		 25 0 26.25 0 27.5 0 28.75 0 30 0 31.25 0 32.5 0 33.75 0 35 0 36.25 0 37.5 0 38.75 0
		 40 0 41.25 0 42.5 0 43.75 0 45 0 46.25 0 47.5 0 48.75 0 50 0 51.25 0 52.5 0 53.75 0
		 55 0 56.25 0 57.5 0 58.75 0 60 0 61.25 0 62.5 0 63.75 0 65 0 66.25 0 67.5 0 68.75 0
		 70 0 71.25 0 72.5 0 73.75 0 75 0 76.25 0 77.5 0 78.75 0 80 0 81.25 0 82.5 0 83.75 0
		 85 0 86.25 0 87.5 0 88.75 0 90 0 91.25 0 92.5 0 93.75 0 95 0 96.25 0 97.5 0 98.75 0
		 100 0 101.25 0 102.5 0 103.75 0 105 0 106.25 0 107.5 0 108.75 0 110 0 111.25 0 112.5 0
		 113.75 0 115 0 116.25 0 117.5 0 118.75 0 120 0 121.25 0 122.5 0 123.75 0 125 0 126.25 0
		 127.5 0 128.75 0 130 0 131.25 0 132.5 0 133.75 0 135 0 136.25 0 137.5 0 138.75 0
		 140 0 141.25 0 142.5 0 143.75 0 145 0 146.25 0 147.5 0 148.75 0 150 0 151.25 0 152.5 0
		 153.75 0 155 0 156.25 0 157.5 0 158.75 0 160 0 161.25 0 162.5 0 163.75 0 165 0 166.25 0
		 167.5 0 168.75 0 170 0 171.25 0 172.5 0 173.75 0 175 0;
createNode displayLayer -n "layer1";
	setAttr ".dt" 1;
	setAttr ".do" 1;
createNode multiplyDivide -n "multiplyDivide1";
	setAttr ".i2" -type "float3" 0.1 1 0.1 ;
createNode animCurveTU -n "botScreenRotator_visibility";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 1 2.5 1 3.75 1 5 1 6.25 1 7.5 1 8.75 1
		 10 1 11.25 1 12.5 1 13.75 1 15 1 16.25 1 17.5 1 18.75 1 20 1 21.25 1 22.5 1 23.75 1
		 25 1 26.25 1 27.5 1 28.75 1 30 1 31.25 1 32.5 1 33.75 1 35 1 36.25 1 37.5 1 38.75 1
		 40 1 41.25 1 42.5 1 43.75 1 45 1 46.25 1 47.5 1 48.75 1 50 1 51.25 1 52.5 1 53.75 1
		 55 1 56.25 1 57.5 1 58.75 1 60 1 61.25 1 62.5 1 63.75 1 65 1 66.25 1 67.5 1 68.75 1
		 70 1 71.25 1 72.5 1 73.75 1 75 1 76.25 1 77.5 1 78.75 1 80 1 81.25 1 82.5 1 83.75 1
		 85 1 86.25 1 87.5 1 88.75 1 90 1 91.25 1 92.5 1 93.75 1 95 1 96.25 1 97.5 1 98.75 1
		 100 1 101.25 1 102.5 1 103.75 1 105 1 106.25 1 107.5 1 108.75 1 110 1 111.25 1 112.5 1
		 113.75 1 115 1 116.25 1 117.5 1 118.75 1 120 1 121.25 1 122.5 1 123.75 1 125 1 126.25 1
		 127.5 1 128.75 1 130 1 131.25 1 132.5 1 133.75 1 135 1 136.25 1 137.5 1 138.75 1
		 140 1 141.25 1 142.5 1 143.75 1 145 1 146.25 1 147.5 1 148.75 1 150 1 151.25 1 152.5 1
		 153.75 1 155 1 156.25 1 157.5 1 158.75 1 160 1 161.25 1 162.5 1 163.75 1 165 1 166.25 1
		 167.5 1 168.75 1 170 1 171.25 1 172.5 1 173.75 1 175 1;
createNode animCurveTU -n "botScreenRotator_scaleX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 1 2.5 1 3.75 1 5 1 6.25 1 7.5 1 8.75 1
		 10 1 11.25 1 12.5 1 13.75 1 15 1 16.25 1 17.5 1 18.75 1 20 1 21.25 1 22.5 1 23.75 1
		 25 1 26.25 1 27.5 1 28.75 1 30 1 31.25 1 32.5 1 33.75 1 35 1 36.25 1 37.5 1 38.75 1
		 40 1 41.25 1 42.5 1 43.75 1 45 1 46.25 1 47.5 1 48.75 1 50 1 51.25 1 52.5 1 53.75 1
		 55 1 56.25 1 57.5 1 58.75 1 60 1 61.25 1 62.5 1 63.75 1 65 1 66.25 1 67.5 1 68.75 1
		 70 1 71.25 1 72.5 1 73.75 1 75 1 76.25 1 77.5 1 78.75 1 80 1 81.25 1 82.5 1 83.75 1
		 85 1 86.25 1 87.5 1 88.75 1 90 1 91.25 1 92.5 1 93.75 1 95 1 96.25 1 97.5 1 98.75 1
		 100 1 101.25 1 102.5 1 103.75 1 105 1 106.25 1 107.5 1 108.75 1 110 1 111.25 1 112.5 1
		 113.75 1 115 1 116.25 1 117.5 1 118.75 1 120 1 121.25 1 122.5 1 123.75 1 125 1 126.25 1
		 127.5 1 128.75 1 130 1 131.25 1 132.5 1 133.75 1 135 1 136.25 1 137.5 1 138.75 1
		 140 1 141.25 1 142.5 1 143.75 1 145 1 146.25 1 147.5 1 148.75 1 150 1 151.25 1 152.5 1
		 153.75 1 155 1 156.25 1 157.5 1 158.75 1 160 1 161.25 1 162.5 1 163.75 1 165 1 166.25 1
		 167.5 1 168.75 1 170 1 171.25 1 172.5 1 173.75 1 175 1;
createNode animCurveTU -n "botScreenRotator_scaleY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 1 2.5 1 3.75 1 5 1 6.25 1 7.5 1 8.75 1
		 10 1 11.25 1 12.5 1 13.75 1 15 1 16.25 1 17.5 1 18.75 1 20 1 21.25 1 22.5 1 23.75 1
		 25 1 26.25 1 27.5 1 28.75 1 30 1 31.25 1 32.5 1 33.75 1 35 1 36.25 1 37.5 1 38.75 1
		 40 1 41.25 1 42.5 1 43.75 1 45 1 46.25 1 47.5 1 48.75 1 50 1 51.25 1 52.5 1 53.75 1
		 55 1 56.25 1 57.5 1 58.75 1 60 1 61.25 1 62.5 1 63.75 1 65 1 66.25 1 67.5 1 68.75 1
		 70 1 71.25 1 72.5 1 73.75 1 75 1 76.25 1 77.5 1 78.75 1 80 1 81.25 1 82.5 1 83.75 1
		 85 1 86.25 1 87.5 1 88.75 1 90 1 91.25 1 92.5 1 93.75 1 95 1 96.25 1 97.5 1 98.75 1
		 100 1 101.25 1 102.5 1 103.75 1 105 1 106.25 1 107.5 1 108.75 1 110 1 111.25 1 112.5 1
		 113.75 1 115 1 116.25 1 117.5 1 118.75 1 120 1 121.25 1 122.5 1 123.75 1 125 1 126.25 1
		 127.5 1 128.75 1 130 1 131.25 1 132.5 1 133.75 1 135 1 136.25 1 137.5 1 138.75 1
		 140 1 141.25 1 142.5 1 143.75 1 145 1 146.25 1 147.5 1 148.75 1 150 1 151.25 1 152.5 1
		 153.75 1 155 1 156.25 1 157.5 1 158.75 1 160 1 161.25 1 162.5 1 163.75 1 165 1 166.25 1
		 167.5 1 168.75 1 170 1 171.25 1 172.5 1 173.75 1 175 1;
createNode animCurveTU -n "botScreenRotator_scaleZ";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 140 ".ktv[0:139]"  1.25 1 2.5 1 3.75 1 5 1 6.25 1 7.5 1 8.75 1
		 10 1 11.25 1 12.5 1 13.75 1 15 1 16.25 1 17.5 1 18.75 1 20 1 21.25 1 22.5 1 23.75 1
		 25 1 26.25 1 27.5 1 28.75 1 30 1 31.25 1 32.5 1 33.75 1 35 1 36.25 1 37.5 1 38.75 1
		 40 1 41.25 1 42.5 1 43.75 1 45 1 46.25 1 47.5 1 48.75 1 50 1 51.25 1 52.5 1 53.75 1
		 55 1 56.25 1 57.5 1 58.75 1 60 1 61.25 1 62.5 1 63.75 1 65 1 66.25 1 67.5 1 68.75 1
		 70 1 71.25 1 72.5 1 73.75 1 75 1 76.25 1 77.5 1 78.75 1 80 1 81.25 1 82.5 1 83.75 1
		 85 1 86.25 1 87.5 1 88.75 1 90 1 91.25 1 92.5 1 93.75 1 95 1 96.25 1 97.5 1 98.75 1
		 100 1 101.25 1 102.5 1 103.75 1 105 1 106.25 1 107.5 1 108.75 1 110 1 111.25 1 112.5 1
		 113.75 1 115 1 116.25 1 117.5 1 118.75 1 120 1 121.25 1 122.5 1 123.75 1 125 1 126.25 1
		 127.5 1 128.75 1 130 1 131.25 1 132.5 1 133.75 1 135 1 136.25 1 137.5 1 138.75 1
		 140 1 141.25 1 142.5 1 143.75 1 145 1 146.25 1 147.5 1 148.75 1 150 1 151.25 1 152.5 1
		 153.75 1 155 1 156.25 1 157.5 1 158.75 1 160 1 161.25 1 162.5 1 163.75 1 165 1 166.25 1
		 167.5 1 168.75 1 170 1 171.25 1 172.5 1 173.75 1 175 1;
createNode shadingEngine -n "___Default";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode phong -n "___Default1";
createNode groupId -n "groupId8";
	setAttr ".ihi" 0;
createNode groupId -n "parts:groupId16";
	setAttr ".ihi" 0;
createNode groupId -n "parts:groupId18";
	setAttr ".ihi" 0;
createNode animCurveTL -n "camOnly_Camera_Pos_translateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 46 ".ktv[0:45]"  1 -0.15851213997784591 20 1.4403540356957611
		 40 0.78189517242610673 60 -0.15851213997784591 80 0.28222410920961627 100 -0.45941343681045144
		 101 -0.45403648598729646 102 -0.43864751677416813 103 -0.4143589721218196 104 -0.38228288758805073
		 105 -0.34353245089120116 106 -0.2992197803405231 107 -0.25045673962470982 108 -0.19835689839330364
		 109 -0.14403216489346091 110 -0.088594345524172446 111 -0.033157162707374399 112 0.021167570792468501
		 113 0.073267991286662726 114 0.12203045273968804 115 0.16634312329036591 116 0.20509396738089691
		 117 0.23716964452098444 118 0.26145818917333297 119 0.276847279331631 120 0.28222410920961627
		 121 0.31789341349669342 122 0.40784732369031318 123 0.52650066926311523 124 0.64827135014899051
		 125 0.74757740898306901 126 0.82542556218874996 127 0.89887245321944054 128 0.96640510185546746
		 129 1.0265082345296763 130 1.0776689473758461 131 1.1252344313923293 132 1.1745052954006339
		 133 1.223900977287852 134 1.2718409206548222 135 1.3167429225133866 136 1.3570264521773781
		 137 1.3911107675423398 138 1.4174139827478514 139 1.4343554356853039 140 1.4403540356957611;
	setAttr -s 46 ".kit[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
	setAttr -s 46 ".kot[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
createNode animCurveTL -n "camOnly_Camera_Pos_translateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 46 ".ktv[0:45]"  1 0.72491766872218821 20 0.66 40 0.73352837804976434
		 60 0.72491766872218821 80 0.52141519626916322 100 1.070909510899495 101 1.066925618871339
		 102 1.0555236191532633 103 1.0375277433123853 104 1.0137619210701132 105 0.98505093580698955
		 106 0.95221877855665293 107 0.91608925169920108 108 0.87748742159575865 109 0.83723712364069292
		 110 0.79616211776699741 111 0.75508758352796579 112 0.71483728557289983 113 0.67623502628189736
		 114 0.64010592861200533 115 0.60727377136166882 116 0.57856248425229573 117 0.55479696385627286
		 118 0.53680108801539506 119 0.52539899868658757 120 0.52141519626916322 121 0.52249167352444215
		 122 0.52557267216318893 123 0.53043540103417908 124 0.53685716584216558 125 0.54461534365937958
		 126 0.55348703628327744 127 0.56324960676751767 128 0.57368045894718278 129 0.58455663344753472
		 130 0.5956555277315746 131 0.60675454945767482 132 0.61763072395802665 133 0.62806146016541253
		 134 0.63782414662193199 135 0.64669583924582985 136 0.65445393550010766 137 0.66087578187103035
		 138 0.66573851074202051 139 0.66881948516673639 140 0.66989598663604621;
	setAttr -s 46 ".kit[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
	setAttr -s 46 ".kot[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
createNode animCurveTL -n "camOnly_Camera_Pos_translateZ";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 46 ".ktv[0:45]"  1 1.8045967411094903 20 -0.68 40 1.4280732879407814
		 60 1.8045967411094903 80 0.6617974200638197 100 1.9286243814302768 101 1.9194397516751245
		 102 1.8931531090807081 103 1.8516646712540781 104 1.7968739599146761 105 1.7306824648430863
		 106 1.6549898491105091 107 1.571695340858454 108 1.4827010822626638 109 1.3899063775771134
		 110 1.2952103570840006 111 1.2005154239169835 112 1.1077207192314327 113 1.0187254711688585
		 114 0.93543195238358756 115 0.85973933665101032 116 0.79354714569057039 117 0.73875713024001877
		 118 0.69726869241338851 119 0.6709818432266782 120 0.6617974200638197 121 0.66072164487227103
		 122 0.65534794855332912 123 0.64245701483623607 124 0.61882940439641065 125 0.58124518641993472
		 126 0.52656080172690201 127 0.45692215533444486 128 0.37704484030514851 129 0.29164727761995068
		 130 0.20544515051450687 131 0.11137676347612478 132 0.0030355734794996667 133 -0.11388516902858925
		 134 -0.23369260634473074 135 -0.35068971844218266 136 -0.45918364718054427 137 -0.55348114517197244
		 138 -0.62788577626144526 139 -0.67670448812127371 140 -0.69424305718551604;
	setAttr -s 46 ".kit[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
	setAttr -s 46 ".kot[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
createNode animCurveTA -n "camOnly_Camera_Pos_rotateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 46 ".ktv[0:45]"  1 0.59997883373901695 20 -1.1999999999995183
		 40 0.6000000000000002 60 0.59997883373901695 80 -43.451 100 -16.53835272987677 101 -16.73347227535951
		 102 -17.291909348167177 103 -18.173295462504495 104 -19.337276916108816 105 -20.743458196954229
		 106 -22.351482599881795 107 -24.121002659439064 108 -26.011609004027118 109 -27.982952551249785
		 110 -29.994687914591399 111 -32.006400178626983 112 -33.977743725849663 113 -35.868371090806988
		 114 -37.637870129994987 115 -39.245894532922534 116 -40.652090597326989 117 -41.816057267372265
		 118 -42.697443381709597 119 -43.255884843392543 120 -43.451 121 -43.144682661572517
		 122 -42.267968083450739 123 -40.88425267473999 124 -39.056905283661195 125 -36.849274450439147
		 126 -34.324787046202388 127 -31.546795600235267 128 -28.578641037250581 129 -25.483767635250818
		 130 -22.325518132158386 131 -19.16723236474871 132 -16.072358962748936 133 -13.104237400294224
		 134 -10.326212953797141 135 -7.8017255495603877 136 -5.5941179255063274 137 -3.7667473252595078
		 138 -2.3830319165487932 139 -1.5063242286584493 140 -1.1999999999995183;
	setAttr -s 46 ".kit[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
	setAttr -s 46 ".kot[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
createNode animCurveTA -n "camOnly_Camera_Pos_rotateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 46 ".ktv[0:45]"  1 -1.2000000000000099 20 102.19999999996914
		 40 23.80000000000009 60 -1.2000000000000099 80 0 100 -11.400000000000203 101 -11.317348791585911
		 102 -11.080798943252155 103 -10.707450249509932 104 -10.214396242674262 105 -9.6187481653692029
		 106 -8.9376008219146303 107 -8.1880451027584691 108 -7.3871981213382902 109 -6.5521514530275393
		 110 -5.6999951076517918 111 -4.8478485469726627 112 -4.0128018786619126 113 -3.2119459931674701
		 114 -2.4623991780855703 115 -1.7812518346309971 116 -1.1855974951187618 117 -0.69254975049026735
		 118 -0.319201056748048 119 -0.082649349318912074 120 0 121 0.74094416670087593 122 2.8616094736526283
		 123 6.2086477631651578 124 10.628777543956026 125 15.968766447300856 126 22.075192631602206
		 127 28.794814079088656 128 35.974416842027743 129 43.460536973723499 130 51.099956140511125
		 131 58.739463026245659 132 66.225583157941415 133 73.405106096635805 134 80.124807368366959
		 135 86.231233552668314 136 91.571166315875075 137 95.991352236804005 138 99.33839052631653
		 139 101.45903916664126 140 102.19999999996914;
	setAttr -s 46 ".kit[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
	setAttr -s 46 ".kot[0:45]"  3 3 3 18 3 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
		2 2 2 2;
createNode animCurveTL -n "camOnly_menuCam_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0.033445489090827514 20 0.053512777401379746
		 40 0.053512777401379746 60 0.033445489090827514 80 0;
	setAttr -s 5 ".kit[0:4]"  18 10 10 10 10;
	setAttr -s 5 ".kot[0:4]"  18 10 10 10 10;
createNode animCurveTL -n "camOnly_menuCam_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -0.0038223417555708818 20 -0.0076446824859099788
		 40 -0.0076446824859099788 60 -0.0038223417555708818 80 0;
	setAttr -s 5 ".kit[0:4]"  18 10 10 10 10;
	setAttr -s 5 ".kot[0:4]"  18 10 10 10 10;
createNode imagePlane -n "camOnly_imagePlane1";
	setAttr ".fc" 12;
	setAttr ".imn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/RRDrop/Dropbox/RobotRace/UI/menuScene/UI_Redesign/New/Screen_Tracks_1.jpg";
	setAttr ".cov" -type "short2" 960 640 ;
	setAttr ".c" -type "double3" -5.8951592525652057 0.51268849719180143 0.89175105401701504 ;
	setAttr ".w" 10;
	setAttr ".h" 10;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 26 ".dsm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
	setAttr -s 2 ".gn";
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
	setAttr -s 3 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultRenderGlobals;
	setAttr ".mcfr" 30;
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
	setAttr ".hwfr" 30;
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
connectAttr "persp_translateX.o" ":persp.tx";
connectAttr "persp_translateY.o" ":persp.ty";
connectAttr "persp_translateZ.o" ":persp.tz";
connectAttr "persp_rotateX.o" ":persp.rx";
connectAttr "persp_rotateY.o" ":persp.ry";
connectAttr "persp_rotateZ.o" ":persp.rz";
connectAttr "persp_visibility.o" ":persp.v";
connectAttr "persp_scaleX.o" ":persp.sx";
connectAttr "persp_scaleY.o" ":persp.sy";
connectAttr "persp_scaleZ.o" ":persp.sz";
connectAttr "botScreenRotator_translateX.o" "botScreenRotator.tx";
connectAttr "botScreenRotator_translateY.o" "botScreenRotator.ty";
connectAttr "botScreenRotator_translateZ.o" "botScreenRotator.tz";
connectAttr "botScreenRotator_rotateX.o" "botScreenRotator.rx";
connectAttr "botScreenRotator_rotateY.o" "botScreenRotator.ry";
connectAttr "botScreenRotator_rotateZ.o" "botScreenRotator.rz";
connectAttr "botScreenRotator_visibility.o" "botScreenRotator.v";
connectAttr "botScreenRotator_scaleX.o" "botScreenRotator.sx";
connectAttr "botScreenRotator_scaleY.o" "botScreenRotator.sy";
connectAttr "botScreenRotator_scaleZ.o" "botScreenRotator.sz";
connectAttr "layer1.di" "setting.do";
connectAttr "groupId8.id" "holoTableShape.iog.og[0].gid";
connectAttr "___Default.mwc" "holoTableShape.iog.og[0].gco";
connectAttr "parts:groupId16.id" "holoTable_shine1Shape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "holoTable_shine1Shape.iog.og[0].gco";
connectAttr "parts:groupId18.id" "HoloPod_shine1Shape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "HoloPod_shine1Shape.iog.og[0].gco";
connectAttr "camOnly_Camera_Pos_translateX.o" "Camera_Pos.tx";
connectAttr "camOnly_Camera_Pos_translateY.o" "Camera_Pos.ty";
connectAttr "camOnly_Camera_Pos_translateZ.o" "Camera_Pos.tz";
connectAttr "camOnly_Camera_Pos_rotateX.o" "Camera_Pos.rx";
connectAttr "camOnly_Camera_Pos_rotateY.o" "Camera_Pos.ry";
connectAttr "camOnly_menuCam_translateX.o" "menuCam.tx";
connectAttr "camOnly_menuCam_translateY.o" "menuCam.ty";
connectAttr "camOnly_imagePlane1.msg" "menuCamShape.ip" -na;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "___Default.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "___Default.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "layerManager.dli[13]" "layer1.id";
connectAttr "___Default1.oc" "___Default.ss";
connectAttr "groupId8.msg" "___Default.gn" -na;
connectAttr "holoTableShape.iog.og[0]" "___Default.dsm" -na;
connectAttr "___Default.msg" "materialInfo1.sg";
connectAttr "___Default1.msg" "materialInfo1.m";
connectAttr "___Default.pa" ":renderPartition.st" -na;
connectAttr "MenuRoomShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "help_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "botScreenShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "mapscreenShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "multi_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "single_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "playGame_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "accept_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "next_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "options_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "select_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "prev_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "mapBack_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "QuickRace_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "Storyline_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "Tournament_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "Difficulty_LabelShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "Easy_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "Hard_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "Normal_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pPlaneShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "charBack_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "diffBack_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "typeBack_btnShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "holoTable_shine1Shape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "HoloPod_shine1Shape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "parts:groupId16.msg" ":initialShadingGroup.gn" -na;
connectAttr "parts:groupId18.msg" ":initialShadingGroup.gn" -na;
connectAttr "___Default1.msg" ":defaultShaderList1.s" -na;
connectAttr "multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of menuBase.ma
