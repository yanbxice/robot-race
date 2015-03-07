//Maya ASCII 2012 scene
//Name: wallMine.ma
//Last modified: Wed, May 23, 2012 07:31:09 PM
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
	setAttr ".t" -type "double3" -0.43764735459314402 0.60297894910607108 2.6867213855823833 ;
	setAttr ".r" -type "double3" -11.197257587643866 -6.6000000000000956 1.0005542454716082e-016 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 2.79983301635502;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
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
createNode transform -n "wall_mine";
createNode transform -n "locator_wall_top_left" -p "wall_mine";
createNode locator -n "locator_wall_top_leftShape" -p "locator_wall_top_left";
	setAttr -k off ".v";
createNode transform -n "track_all_game_wall_01a" -p "locator_wall_top_left";
	setAttr ".t" -type "double3" 0.875 -5 0 ;
	setAttr ".rp" -type "double3" -0.875 5 0 ;
	setAttr ".sp" -type "double3" -0.875 5 0 ;
createNode mesh -n "track_all_game_wall_01aShape" -p "track_all_game_wall_01a";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.30446825921535492 0.082764578983187675 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.16938806 0.005533278
		 0.19069931 0.0055333227 0.19069497 0.044305876 0.19069341 0.063692078 0.14992142
		 0.063692003 0.14992142 0.024998322 0.14992142 0.024998322 0.16938806 0.005533278
		 0.19069341 0.063692078 0.14992142 0.063692003 0.23010898 0.061583843 0.19069496 0.044305876
		 0.23015247 0.04430598 0.23015247 0.0055333227 0.23015247 0.04430598 0.19069931 0.0055333227
		 0.23015247 0.0055333227 0.23010898 0.061583843 0.4199475 0.042261943 0.41994753 0.0059938282
		 0.4590151 0.0059937984 0.43948138 0.042261973 0.39209804 0.042261943 0.39209804 0.0059937388
		 0.4199475 0.042261943 0.41994753 0.0059935302 0.4590151 0.0059937984 0.43948138 0.042261973;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  -24.202278 0.40264118 0 -24.202278 
		0.40264118 0 -24.202278 0.40264118 0 -24.202278 0.40264118 0 -24.202278 0.40264118 
		0 -24.202278 0.40264118 0 -24.202278 0.40264118 0 -24.202278 0.40264118 0 -24.202278 
		0.40264118 0 -24.202278 0.40264118 0 -24.202278 0.40264118 0 -24.202278 0.40264118 
		0;
	setAttr -s 12 ".vt[0:11]"  23.27727699 4.74735928 0.092833996 23.37727928 4.54735851 0.092833996
		 23.27727699 4.74735928 -0.092833996 23.37725639 4.54735851 -0.092833996 23.37727928 4.74735928 -0.092833996
		 23.47727776 4.54735851 0.092833996 23.47727776 4.74735928 0.092833996 23.37724876 4.44735861 -0.092833996
		 23.17727852 4.44735861 -0.092833996 23.17727852 4.54735851 0.092833996 23.17727852 4.64735889 -0.092833996
		 23.17727852 4.64735889 0.092833996;
	setAttr -s 23 ".ed[0:22]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 10 0
		 0 11 0 4 3 0 3 5 0 6 4 0 8 9 0 1 7 0 10 8 0 11 9 0 10 11 0 3 7 0 3 10 1 9 1 0 11 1 1
		 0 1 1 5 6 0 7 8 0;
	setAttr -s 13 ".fc[0:12]" -type "polyFaces" 
		f 3 -3 9 -4
		mu 0 3 10 11 12
		f 3 -2 4 8
		mu 0 3 11 0 1
		f 4 -1 5 10 -5
		mu 0 4 18 19 20 21
		f 4 3 21 -6 20
		mu 0 4 2 3 4 5
		f 3 1 17 -7
		mu 0 3 0 11 6
		f 3 -21 7 19
		mu 0 3 2 5 7
		f 4 0 6 15 -8
		mu 0 4 19 18 22 23
		f 4 -10 -9 -11 -22
		mu 0 4 12 11 1 13
		f 4 -13 -19 -12 -23
		mu 0 4 14 2 15 16
		f 4 -16 13 11 -15
		mu 0 4 24 25 26 27
		f 3 -20 14 18
		mu 0 3 2 7 15
		f 3 2 12 -17
		mu 0 3 17 2 14
		f 4 -18 16 22 -14
		mu 0 4 6 11 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode mesh -n "polySurfaceShape11297" -p "track_all_game_wall_01a";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0.45833334 0.16666667
		 0.625 0 0.45833334 0.58333331 0.625 0.75 0.375 1 0.625 1 0.875 0 0.875 0.25 0.625
		 0 0.875 0 0.875 0.25 0.625 0.25 0.375 0.75 0.625 0.75 0.625 1 0.375 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  0.20959243 0.95404065 -0.28183237 
		-0.32039094 1.484024 -0.28183237 0.20959243 0.95404065 0.28183237 -0.32039094 1.484024 
		0.28183237 -1.64219 1.484024 0.28183237 -1.64219 1.484024 -0.28183237 -0.59921944 
		0.95404065 0.28183237 -0.59921944 0.95404065 -0.28183237 0.20959243 1.7628524 0.28183237 
		-0.32039094 3.378777 0.28183237 -0.32039094 3.378777 -0.28183237 0.20959243 1.7628524 
		-0.28183237;
	setAttr -s 12 ".vt[0:11]"  -0.5 0.5 0.5 0.5 -0.50000012 0.5 -0.5 0.5 -0.5
		 0.5 -0.50000012 -0.5 2.29181576 -0.50000012 -0.5 2.29181576 -0.50000012 0.5 1.71886182 0.5 -0.5
		 1.71886182 0.5 0.5 -0.5 -1.71886182 -0.5 0.5 -2.8647697 -0.5 0.5 -2.8647697 0.5 -0.5 -1.71886182 0.5;
	setAttr -s 20 ".ed[0:19]"  0 1 1 0 2 0 2 3 1 3 1 0 3 4 0 1 5 0 4 5 0
		 2 6 0 6 4 0 0 7 0 7 6 0 5 7 0 2 8 0 3 9 0 8 9 0 1 10 0 9 10 0 0 11 0 11 10 0 8 11 0;
	setAttr -s 10 ".fc[0:9]" -type "polyFaces" 
		f 4 14 16 -19 -20
		mu 0 4 12 13 14 15
		f 4 -7 -9 -11 -12
		mu 0 4 8 9 10 11
		f 4 -4 4 6 -6
		mu 0 4 1 6 9 8
		f 4 -3 7 8 -5
		mu 0 4 6 7 10 9
		f 4 -2 9 10 -8
		mu 0 4 7 0 11 10
		f 4 0 5 11 -10
		mu 0 4 0 1 8 11
		f 4 2 13 -15 -13
		mu 0 4 2 3 13 12
		f 4 3 15 -17 -14
		mu 0 4 3 5 14 13
		f 4 -1 17 18 -16
		mu 0 4 5 4 15 14
		f 4 1 12 19 -18
		mu 0 4 4 2 12 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape11307" -p "track_all_game_wall_01a";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0.45833334 0.16666667
		 0.625 0 0.45833334 0.58333331 0.625 0.75 0.375 1 0.625 1 0.875 0 0.875 0.25 0.875
		 0.25 0.625 0 0.54166669 0.20833334 0.625 0.75 0.41666669 0.66666663 0.375 1 0.625
		 1 0 2.3620927e-016 1 0 1 0.9283399 0 0.9283399 0 0 0.99999994 0 0.99999994 0.92834002
		 0 0.92834002 0.44876441 0.60247123 0.375 1 0.625 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt";
	setAttr ".pt[0]" -type "float3" 0.10000038 0 0 ;
	setAttr ".pt[2:3]" -type "float3" 0.10000038 0 0  0 0 0 ;
	setAttr ".pt[11:12]" -type "float3" -3.5527137e-015 -0.054069147 0  -3.5527137e-015 
		-0.054069147 0 ;
	setAttr ".pt[14:16]" -type "float3" 0 0 0  0 0 0  0 0 0 ;
	setAttr -s 14 ".vt[0:13]"  29.077219009 0.84762728 0.092833996 29.27721977 0.64762676 0.092833996
		 29.077219009 0.84762728 -0.092833996 29.27719879 0.64762676 -0.092833996 29.27721977 0.84762728 -0.092833996
		 29.37721825 0.64762676 0.092833996 29.37721825 0.84762728 0.092833996 29.27718925 0.54762679 -0.092833996
		 29.077219009 0.54762679 -0.092833996 29.077219009 0.6476267 0.092833996 29.27721977 0.6476267 0.092833996
		 29.077219009 0.80169618 -0.092833996 29.077219009 0.80169618 0.092833996 29.27721977 0.64762676 0.092833996;
	setAttr -s 26 ".ed[0:25]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 11 0
		 1 13 0 0 12 0 4 3 1 3 5 1 6 4 1 8 9 1 10 7 1 11 8 0 12 9 0 11 12 1 13 10 0 3 7 0
		 13 3 1 3 11 1 9 10 1 12 13 1 0 1 1 5 6 1 7 8 1;
	setAttr -s 14 ".fc[0:13]" -type "polyFaces" 
		f 3 -3 10 -4
		mu 0 3 1 6 9
		f 3 -2 4 9
		mu 0 3 6 7 8
		f 4 -1 5 11 -5
		mu 0 4 7 0 10 8
		f 4 3 24 -6 23
		mu 0 4 1 9 10 0
		f 3 1 20 -7
		mu 0 3 2 3 23
		f 3 2 7 19
		mu 0 3 3 5 25
		f 4 -8 -24 8 22
		mu 0 4 25 5 4 24
		f 4 0 6 16 -9
		mu 0 4 4 2 23 24
		f 4 -11 -10 -12 -25
		mu 0 4 16 17 18 15
		f 4 -14 -22 -13 -26
		mu 0 4 20 21 22 19
		f 4 -17 14 12 -16
		mu 0 4 24 23 12 13
		f 4 -18 -23 15 21
		mu 0 4 14 25 24 13
		f 4 -20 17 13 -19
		mu 0 4 3 25 14 11
		f 4 -21 18 25 -15
		mu 0 4 23 3 11 12;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape11343" -p "track_all_game_wall_01a";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.29362831264734268 -0.027869574725627899 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 38 ".uvst[0].uvsp[0:37]" -type "float2" 0.625 0.75 0.625
		 1 0.625 1 0.26134139 -0.10515581 0.28090096 -0.069562897 0.26133734 -0.069562897
		 0.26134139 -0.10515581 0.26134276 -0.12295209 0.29877108 -0.12295209 0.29877108 -0.087431595
		 0.29877108 -0.087431595 0.26134139 -0.10515581 0.28090096 -0.069562897 0.26134139
		 -0.10515581 0.26133734 -0.069562897 0.26134276 -0.12295209 0.29877108 -0.12295209
		 0.23422776 -0.11855964 0.26134139 -0.10515581 0.22682075 -0.10515581 0.26133734 -0.069562897
		 0.22682075 -0.069562897 0.22682075 -0.10515581 0.26134139 -0.10515581 0.26133734
		 -0.069562897 0.22682075 -0.069562897 0.23422776 -0.11855964 0.26134139 -0.10515581
		 0.30635089 -0.16227029 0.27305704 -0.16227029 0.27305704 -0.19813393 0.30635089 -0.18020223
		 0.30635089 -0.13670473 0.27305704 -0.13670473 0.30635089 -0.16227029 0.27305681 -0.16227029
		 0.27305704 -0.19813393 0.30635089 -0.18020223;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0.050001144 -0.05000031 0 
		0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 
		-0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 
		0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 
		-0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0;
	setAttr -s 14 ".vt[0:13]"  23.22727585 4.79735947 0.092833996 23.32727814 4.5973587 0.092833996
		 23.22727585 4.79735947 -0.092833996 23.32725525 4.5973587 -0.092833996 23.32727814 4.79735947 -0.092833996
		 23.42727661 4.5973587 0.092833996 23.42727661 4.79735947 0.092833996 23.32724762 4.4973588 -0.092833996
		 23.12727737 4.4973588 -0.092833996 23.12727737 4.5973587 0.092833996 23.32727814 4.5973587 0.092833996
		 23.12727737 4.69735909 -0.092833996 23.12727737 4.69735909 0.092833996 23.32727814 4.5973587 0.092833996;
	setAttr -s 26 ".ed[0:25]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 11 0
		 1 13 0 0 12 0 4 3 0 3 5 0 6 4 0 8 9 0 10 7 0 11 8 0 12 9 0 11 12 0 13 10 0 3 7 0
		 13 3 0 3 11 1 9 10 0 12 13 1 0 1 1 5 6 0 7 8 0;
	setAttr -s 14 ".fc[0:13]" -type "polyFaces" 
		f 3 -3 10 -4
		mu 0 3 17 18 19
		f 3 -2 4 9
		mu 0 3 3 4 5
		f 4 -1 5 11 -5
		mu 0 4 28 29 30 31
		f 4 3 24 -6 23
		mu 0 4 6 7 8 9
		f 3 1 20 -7
		mu 0 3 4 3 10
		f 3 2 7 19
		mu 0 3 0 1 2
		f 4 -8 -24 8 22
		mu 0 4 11 6 9 12
		f 4 0 6 16 -9
		mu 0 4 29 28 32 33
		f 4 -11 -10 -12 -25
		mu 0 4 19 18 20 21
		f 4 -14 -22 -13 -26
		mu 0 4 22 23 24 25
		f 4 -17 14 12 -16
		mu 0 4 34 35 36 37
		f 4 -18 -23 15 21
		mu 0 4 13 11 12 14
		f 4 -20 17 13 -19
		mu 0 4 26 27 23 22
		f 4 -21 18 25 -15
		mu 0 4 10 3 15 16;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode transform -n "locator_wall_top_right" -p "wall_mine";
createNode locator -n "locator_wall_top_rightShape" -p "locator_wall_top_right";
	setAttr -k off ".v";
createNode transform -n "track_all_game_wall_01b" -p "locator_wall_top_right";
	setAttr ".t" -type "double3" -30.045985221862793 -5.2081084251403809 0 ;
	setAttr ".rp" -type "double3" 30.045985221862793 5.2081084251403809 0 ;
	setAttr ".sp" -type "double3" 30.045985221862793 5.2081084251403809 0 ;
createNode mesh -n "track_all_game_wall_01bShape" -p "track_all_game_wall_01b";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.30446825921535492 0.082764578983187675 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.16938806 0.005533278
		 0.19069931 0.0055333227 0.19069497 0.044305876 0.19069341 0.063692078 0.14992142
		 0.063692003 0.14992142 0.024998322 0.14992142 0.024998322 0.16938806 0.005533278
		 0.19069341 0.063692078 0.14992142 0.063692003 0.23010898 0.061583843 0.19069496 0.044305876
		 0.23015247 0.04430598 0.23015247 0.0055333227 0.23015247 0.04430598 0.19069931 0.0055333227
		 0.23015247 0.0055333227 0.23010898 0.061583843 0.4199475 0.042261943 0.41994753 0.0059938282
		 0.4590151 0.0059937984 0.43948138 0.042261973 0.39209804 0.042261943 0.39209804 0.0059937388
		 0.4199475 0.042261943 0.41994753 0.0059935302 0.4590151 0.0059937984 0.43948138 0.042261973;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  6.9187088 0.51075017 0 6.6187057 
		0.61074865 0 6.9187088 0.51075017 0 6.6187286 0.61077154 0 6.8187065 0.41074792 0 
		6.5187073 0.51075017 0 6.718708 0.31074944 0 6.5187364 0.71077907 0 6.7187066 0.91074932 
		0 6.8187065 0.81074941 0 6.9187069 0.71074903 0 6.9187069 0.71074903 0;
	setAttr -s 12 ".vt[0:11]"  23.27727699 4.74735928 0.092833996 23.37727928 4.54735851 0.092833996
		 23.27727699 4.74735928 -0.092833996 23.37725639 4.54735851 -0.092833996 23.37727928 4.74735928 -0.092833996
		 23.47727776 4.54735851 0.092833996 23.47727776 4.74735928 0.092833996 23.37724876 4.44735861 -0.092833996
		 23.17727852 4.44735861 -0.092833996 23.17727852 4.54735851 0.092833996 23.17727852 4.64735889 -0.092833996
		 23.17727852 4.64735889 0.092833996;
	setAttr -s 23 ".ed[0:22]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 10 0
		 0 11 0 4 3 0 3 5 0 6 4 0 8 9 0 1 7 0 10 8 0 11 9 0 10 11 0 3 7 0 3 10 1 9 1 0 11 1 1
		 0 1 1 5 6 0 7 8 0;
	setAttr -s 13 ".fc[0:12]" -type "polyFaces" 
		f 3 -3 9 -4
		mu 0 3 10 11 12
		f 3 -2 4 8
		mu 0 3 11 0 1
		f 4 -1 5 10 -5
		mu 0 4 18 19 20 21
		f 4 3 21 -6 20
		mu 0 4 2 3 4 5
		f 3 1 17 -7
		mu 0 3 0 11 6
		f 3 -21 7 19
		mu 0 3 2 5 7
		f 4 0 6 15 -8
		mu 0 4 19 18 22 23
		f 4 -10 -9 -11 -22
		mu 0 4 12 11 1 13
		f 4 -13 -19 -12 -23
		mu 0 4 14 2 15 16
		f 4 -16 13 11 -15
		mu 0 4 24 25 26 27
		f 3 -20 14 18
		mu 0 3 2 7 15
		f 3 2 12 -17
		mu 0 3 17 2 14
		f 4 -18 16 22 -14
		mu 0 4 6 11 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode mesh -n "polySurfaceShape11297" -p "track_all_game_wall_01b";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0.45833334 0.16666667
		 0.625 0 0.45833334 0.58333331 0.625 0.75 0.375 1 0.625 1 0.875 0 0.875 0.25 0.625
		 0 0.875 0 0.875 0.25 0.625 0.25 0.375 0.75 0.625 0.75 0.625 1 0.375 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  0.20959243 0.95404065 -0.28183237 
		-0.32039094 1.484024 -0.28183237 0.20959243 0.95404065 0.28183237 -0.32039094 1.484024 
		0.28183237 -1.64219 1.484024 0.28183237 -1.64219 1.484024 -0.28183237 -0.59921944 
		0.95404065 0.28183237 -0.59921944 0.95404065 -0.28183237 0.20959243 1.7628524 0.28183237 
		-0.32039094 3.378777 0.28183237 -0.32039094 3.378777 -0.28183237 0.20959243 1.7628524 
		-0.28183237;
	setAttr -s 12 ".vt[0:11]"  -0.5 0.5 0.5 0.5 -0.50000012 0.5 -0.5 0.5 -0.5
		 0.5 -0.50000012 -0.5 2.29181576 -0.50000012 -0.5 2.29181576 -0.50000012 0.5 1.71886182 0.5 -0.5
		 1.71886182 0.5 0.5 -0.5 -1.71886182 -0.5 0.5 -2.8647697 -0.5 0.5 -2.8647697 0.5 -0.5 -1.71886182 0.5;
	setAttr -s 20 ".ed[0:19]"  0 1 1 0 2 0 2 3 1 3 1 0 3 4 0 1 5 0 4 5 0
		 2 6 0 6 4 0 0 7 0 7 6 0 5 7 0 2 8 0 3 9 0 8 9 0 1 10 0 9 10 0 0 11 0 11 10 0 8 11 0;
	setAttr -s 10 ".fc[0:9]" -type "polyFaces" 
		f 4 14 16 -19 -20
		mu 0 4 12 13 14 15
		f 4 -7 -9 -11 -12
		mu 0 4 8 9 10 11
		f 4 -4 4 6 -6
		mu 0 4 1 6 9 8
		f 4 -3 7 8 -5
		mu 0 4 6 7 10 9
		f 4 -2 9 10 -8
		mu 0 4 7 0 11 10
		f 4 0 5 11 -10
		mu 0 4 0 1 8 11
		f 4 2 13 -15 -13
		mu 0 4 2 3 13 12
		f 4 3 15 -17 -14
		mu 0 4 3 5 14 13
		f 4 -1 17 18 -16
		mu 0 4 5 4 15 14
		f 4 1 12 19 -18
		mu 0 4 4 2 12 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape11307" -p "track_all_game_wall_01b";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0.45833334 0.16666667
		 0.625 0 0.45833334 0.58333331 0.625 0.75 0.375 1 0.625 1 0.875 0 0.875 0.25 0.875
		 0.25 0.625 0 0.54166669 0.20833334 0.625 0.75 0.41666669 0.66666663 0.375 1 0.625
		 1 0 2.3620927e-016 1 0 1 0.9283399 0 0.9283399 0 0 0.99999994 0 0.99999994 0.92834002
		 0 0.92834002 0.44876441 0.60247123 0.375 1 0.625 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt";
	setAttr ".pt[0]" -type "float3" 0.10000038 0 0 ;
	setAttr ".pt[2:3]" -type "float3" 0.10000038 0 0  0 0 0 ;
	setAttr ".pt[11:12]" -type "float3" -3.5527137e-015 -0.054069147 0  -3.5527137e-015 
		-0.054069147 0 ;
	setAttr ".pt[14:16]" -type "float3" 0 0 0  0 0 0  0 0 0 ;
	setAttr -s 14 ".vt[0:13]"  29.077219009 0.84762728 0.092833996 29.27721977 0.64762676 0.092833996
		 29.077219009 0.84762728 -0.092833996 29.27719879 0.64762676 -0.092833996 29.27721977 0.84762728 -0.092833996
		 29.37721825 0.64762676 0.092833996 29.37721825 0.84762728 0.092833996 29.27718925 0.54762679 -0.092833996
		 29.077219009 0.54762679 -0.092833996 29.077219009 0.6476267 0.092833996 29.27721977 0.6476267 0.092833996
		 29.077219009 0.80169618 -0.092833996 29.077219009 0.80169618 0.092833996 29.27721977 0.64762676 0.092833996;
	setAttr -s 26 ".ed[0:25]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 11 0
		 1 13 0 0 12 0 4 3 1 3 5 1 6 4 1 8 9 1 10 7 1 11 8 0 12 9 0 11 12 1 13 10 0 3 7 0
		 13 3 1 3 11 1 9 10 1 12 13 1 0 1 1 5 6 1 7 8 1;
	setAttr -s 14 ".fc[0:13]" -type "polyFaces" 
		f 3 -3 10 -4
		mu 0 3 1 6 9
		f 3 -2 4 9
		mu 0 3 6 7 8
		f 4 -1 5 11 -5
		mu 0 4 7 0 10 8
		f 4 3 24 -6 23
		mu 0 4 1 9 10 0
		f 3 1 20 -7
		mu 0 3 2 3 23
		f 3 2 7 19
		mu 0 3 3 5 25
		f 4 -8 -24 8 22
		mu 0 4 25 5 4 24
		f 4 0 6 16 -9
		mu 0 4 4 2 23 24
		f 4 -11 -10 -12 -25
		mu 0 4 16 17 18 15
		f 4 -14 -22 -13 -26
		mu 0 4 20 21 22 19
		f 4 -17 14 12 -16
		mu 0 4 24 23 12 13
		f 4 -18 -23 15 21
		mu 0 4 14 25 24 13
		f 4 -20 17 13 -19
		mu 0 4 3 25 14 11
		f 4 -21 18 25 -15
		mu 0 4 23 3 11 12;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape11343" -p "track_all_game_wall_01b";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.29362831264734268 -0.027869574725627899 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 38 ".uvst[0].uvsp[0:37]" -type "float2" 0.625 0.75 0.625
		 1 0.625 1 0.26134139 -0.10515581 0.28090096 -0.069562897 0.26133734 -0.069562897
		 0.26134139 -0.10515581 0.26134276 -0.12295209 0.29877108 -0.12295209 0.29877108 -0.087431595
		 0.29877108 -0.087431595 0.26134139 -0.10515581 0.28090096 -0.069562897 0.26134139
		 -0.10515581 0.26133734 -0.069562897 0.26134276 -0.12295209 0.29877108 -0.12295209
		 0.23422776 -0.11855964 0.26134139 -0.10515581 0.22682075 -0.10515581 0.26133734 -0.069562897
		 0.22682075 -0.069562897 0.22682075 -0.10515581 0.26134139 -0.10515581 0.26133734
		 -0.069562897 0.22682075 -0.069562897 0.23422776 -0.11855964 0.26134139 -0.10515581
		 0.30635089 -0.16227029 0.27305704 -0.16227029 0.27305704 -0.19813393 0.30635089 -0.18020223
		 0.30635089 -0.13670473 0.27305704 -0.13670473 0.30635089 -0.16227029 0.27305681 -0.16227029
		 0.27305704 -0.19813393 0.30635089 -0.18020223;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0.050001144 -0.05000031 0 
		0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 
		-0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 
		0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 
		-0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0;
	setAttr -s 14 ".vt[0:13]"  23.22727585 4.79735947 0.092833996 23.32727814 4.5973587 0.092833996
		 23.22727585 4.79735947 -0.092833996 23.32725525 4.5973587 -0.092833996 23.32727814 4.79735947 -0.092833996
		 23.42727661 4.5973587 0.092833996 23.42727661 4.79735947 0.092833996 23.32724762 4.4973588 -0.092833996
		 23.12727737 4.4973588 -0.092833996 23.12727737 4.5973587 0.092833996 23.32727814 4.5973587 0.092833996
		 23.12727737 4.69735909 -0.092833996 23.12727737 4.69735909 0.092833996 23.32727814 4.5973587 0.092833996;
	setAttr -s 26 ".ed[0:25]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 11 0
		 1 13 0 0 12 0 4 3 0 3 5 0 6 4 0 8 9 0 10 7 0 11 8 0 12 9 0 11 12 0 13 10 0 3 7 0
		 13 3 0 3 11 1 9 10 0 12 13 1 0 1 1 5 6 0 7 8 0;
	setAttr -s 14 ".fc[0:13]" -type "polyFaces" 
		f 3 -3 10 -4
		mu 0 3 17 18 19
		f 3 -2 4 9
		mu 0 3 3 4 5
		f 4 -1 5 11 -5
		mu 0 4 28 29 30 31
		f 4 3 24 -6 23
		mu 0 4 6 7 8 9
		f 3 1 20 -7
		mu 0 3 4 3 10
		f 3 2 7 19
		mu 0 3 0 1 2
		f 4 -8 -24 8 22
		mu 0 4 11 6 9 12
		f 4 0 6 16 -9
		mu 0 4 29 28 32 33
		f 4 -11 -10 -12 -25
		mu 0 4 19 18 20 21
		f 4 -14 -22 -13 -26
		mu 0 4 22 23 24 25
		f 4 -17 14 12 -16
		mu 0 4 34 35 36 37
		f 4 -18 -23 15 21
		mu 0 4 13 11 12 14
		f 4 -20 17 13 -19
		mu 0 4 26 27 23 22
		f 4 -21 18 25 -15
		mu 0 4 10 3 15 16;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode transform -n "locator_wall_center" -p "wall_mine";
	setAttr ".s" -type "double3" 0.23 0.07 0.2 ;
createNode locator -n "locator_wall_centerShape" -p "locator_wall_center";
	setAttr -k off ".v";
createNode transform -n "track_all_game_wall_01e" -p "locator_wall_center";
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-016 0 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-016 0 ;
createNode mesh -n "track_all_game_wall_01eShape" -p "track_all_game_wall_01e";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.56562372651609671 0.020649412181228399 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0.44776863 0.026281439
		 0.46382475 0.026281439 0.44776863 0.042337544 0.46382475 0.042337544;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -0.40888071 -2.527848 -0.5 
		0.40888071 -2.527848 -0.5 -0.40888071 2.527848 0.5 0.40888071 2.527848 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "locator_wall_bottom_right" -p "wall_mine";
createNode locator -n "locator_wall_bottom_rightShape" -p "locator_wall_bottom_right";
	setAttr -k off ".v";
createNode transform -n "track_all_game_wall_01d" -p "locator_wall_bottom_right";
	setAttr ".t" -type "double3" -30.327278137207031 -0.49677443504333496 0 ;
	setAttr ".rp" -type "double3" 30.327278137207031 0.49677443504333496 0 ;
	setAttr ".sp" -type "double3" 30.327278137207031 0.49677443504333496 0 ;
createNode mesh -n "track_all_game_wall_01dShape" -p "track_all_game_wall_01d";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.30446825921535492 0.082764578983187675 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.16938806 0.005533278
		 0.19069931 0.0055333227 0.19069497 0.044305876 0.19069341 0.063692078 0.14992142
		 0.063692003 0.14992142 0.024998322 0.14992142 0.024998322 0.16938806 0.005533278
		 0.19069341 0.063692078 0.14992142 0.063692003 0.23010898 0.061583843 0.19069496 0.044305876
		 0.23015247 0.04430598 0.23015247 0.0055333227 0.23015247 0.04430598 0.19069931 0.0055333227
		 0.23015247 0.0055333227 0.23010898 0.061583843 0.4199475 0.042261943 0.41994753 0.0059938282
		 0.4590151 0.0059937984 0.43948138 0.042261973 0.39209804 0.042261943 0.39209804 0.0059937388
		 0.4199475 0.042261943 0.41994753 0.0059935302 0.4590151 0.0059937984 0.43948138 0.042261973;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  7.1000023 -4.4005852 0 6.8999977 
		-4.0005836 0 7.1000023 -4.4005852 0 6.9000435 -4.0005836 0 6.8999977 -4.4005852 0 
		6.7000008 -4.0005836 0 6.7000008 -4.4005852 0 6.9000587 -3.8005838 0 7.2999992 -3.8005838 
		0 7.2999992 -4.0005836 0 7.2999992 -4.2005844 0 7.2999992 -4.2005844 0;
	setAttr -s 12 ".vt[0:11]"  23.27727699 4.74735928 0.092833996 23.37727928 4.54735851 0.092833996
		 23.27727699 4.74735928 -0.092833996 23.37725639 4.54735851 -0.092833996 23.37727928 4.74735928 -0.092833996
		 23.47727776 4.54735851 0.092833996 23.47727776 4.74735928 0.092833996 23.37724876 4.44735861 -0.092833996
		 23.17727852 4.44735861 -0.092833996 23.17727852 4.54735851 0.092833996 23.17727852 4.64735889 -0.092833996
		 23.17727852 4.64735889 0.092833996;
	setAttr -s 23 ".ed[0:22]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 10 0
		 0 11 0 4 3 0 3 5 0 6 4 0 8 9 0 1 7 0 10 8 0 11 9 0 10 11 0 3 7 0 3 10 1 9 1 0 11 1 1
		 0 1 1 5 6 0 7 8 0;
	setAttr -s 13 ".fc[0:12]" -type "polyFaces" 
		f 3 -3 9 -4
		mu 0 3 10 11 12
		f 3 -2 4 8
		mu 0 3 11 0 1
		f 4 -1 5 10 -5
		mu 0 4 18 19 20 21
		f 4 3 21 -6 20
		mu 0 4 2 3 4 5
		f 3 1 17 -7
		mu 0 3 0 11 6
		f 3 -21 7 19
		mu 0 3 2 5 7
		f 4 0 6 15 -8
		mu 0 4 19 18 22 23
		f 4 -10 -9 -11 -22
		mu 0 4 12 11 1 13
		f 4 -13 -19 -12 -23
		mu 0 4 14 2 15 16
		f 4 -16 13 11 -15
		mu 0 4 24 25 26 27
		f 3 -20 14 18
		mu 0 3 2 7 15
		f 3 2 12 -17
		mu 0 3 17 2 14
		f 4 -18 16 22 -14
		mu 0 4 6 11 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode mesh -n "polySurfaceShape11297" -p "track_all_game_wall_01d";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0.45833334 0.16666667
		 0.625 0 0.45833334 0.58333331 0.625 0.75 0.375 1 0.625 1 0.875 0 0.875 0.25 0.625
		 0 0.875 0 0.875 0.25 0.625 0.25 0.375 0.75 0.625 0.75 0.625 1 0.375 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  0.20959243 0.95404065 -0.28183237 
		-0.32039094 1.484024 -0.28183237 0.20959243 0.95404065 0.28183237 -0.32039094 1.484024 
		0.28183237 -1.64219 1.484024 0.28183237 -1.64219 1.484024 -0.28183237 -0.59921944 
		0.95404065 0.28183237 -0.59921944 0.95404065 -0.28183237 0.20959243 1.7628524 0.28183237 
		-0.32039094 3.378777 0.28183237 -0.32039094 3.378777 -0.28183237 0.20959243 1.7628524 
		-0.28183237;
	setAttr -s 12 ".vt[0:11]"  -0.5 0.5 0.5 0.5 -0.50000012 0.5 -0.5 0.5 -0.5
		 0.5 -0.50000012 -0.5 2.29181576 -0.50000012 -0.5 2.29181576 -0.50000012 0.5 1.71886182 0.5 -0.5
		 1.71886182 0.5 0.5 -0.5 -1.71886182 -0.5 0.5 -2.8647697 -0.5 0.5 -2.8647697 0.5 -0.5 -1.71886182 0.5;
	setAttr -s 20 ".ed[0:19]"  0 1 1 0 2 0 2 3 1 3 1 0 3 4 0 1 5 0 4 5 0
		 2 6 0 6 4 0 0 7 0 7 6 0 5 7 0 2 8 0 3 9 0 8 9 0 1 10 0 9 10 0 0 11 0 11 10 0 8 11 0;
	setAttr -s 10 ".fc[0:9]" -type "polyFaces" 
		f 4 14 16 -19 -20
		mu 0 4 12 13 14 15
		f 4 -7 -9 -11 -12
		mu 0 4 8 9 10 11
		f 4 -4 4 6 -6
		mu 0 4 1 6 9 8
		f 4 -3 7 8 -5
		mu 0 4 6 7 10 9
		f 4 -2 9 10 -8
		mu 0 4 7 0 11 10
		f 4 0 5 11 -10
		mu 0 4 0 1 8 11
		f 4 2 13 -15 -13
		mu 0 4 2 3 13 12
		f 4 3 15 -17 -14
		mu 0 4 3 5 14 13
		f 4 -1 17 18 -16
		mu 0 4 5 4 15 14
		f 4 1 12 19 -18
		mu 0 4 4 2 12 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape11307" -p "track_all_game_wall_01d";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0.45833334 0.16666667
		 0.625 0 0.45833334 0.58333331 0.625 0.75 0.375 1 0.625 1 0.875 0 0.875 0.25 0.875
		 0.25 0.625 0 0.54166669 0.20833334 0.625 0.75 0.41666669 0.66666663 0.375 1 0.625
		 1 0 2.3620927e-016 1 0 1 0.9283399 0 0.9283399 0 0 0.99999994 0 0.99999994 0.92834002
		 0 0.92834002 0.44876441 0.60247123 0.375 1 0.625 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt";
	setAttr ".pt[0]" -type "float3" 0.10000038 0 0 ;
	setAttr ".pt[2:3]" -type "float3" 0.10000038 0 0  0 0 0 ;
	setAttr ".pt[11:12]" -type "float3" -3.5527137e-015 -0.054069147 0  -3.5527137e-015 
		-0.054069147 0 ;
	setAttr ".pt[14:16]" -type "float3" 0 0 0  0 0 0  0 0 0 ;
	setAttr -s 14 ".vt[0:13]"  29.077219009 0.84762728 0.092833996 29.27721977 0.64762676 0.092833996
		 29.077219009 0.84762728 -0.092833996 29.27719879 0.64762676 -0.092833996 29.27721977 0.84762728 -0.092833996
		 29.37721825 0.64762676 0.092833996 29.37721825 0.84762728 0.092833996 29.27718925 0.54762679 -0.092833996
		 29.077219009 0.54762679 -0.092833996 29.077219009 0.6476267 0.092833996 29.27721977 0.6476267 0.092833996
		 29.077219009 0.80169618 -0.092833996 29.077219009 0.80169618 0.092833996 29.27721977 0.64762676 0.092833996;
	setAttr -s 26 ".ed[0:25]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 11 0
		 1 13 0 0 12 0 4 3 1 3 5 1 6 4 1 8 9 1 10 7 1 11 8 0 12 9 0 11 12 1 13 10 0 3 7 0
		 13 3 1 3 11 1 9 10 1 12 13 1 0 1 1 5 6 1 7 8 1;
	setAttr -s 14 ".fc[0:13]" -type "polyFaces" 
		f 3 -3 10 -4
		mu 0 3 1 6 9
		f 3 -2 4 9
		mu 0 3 6 7 8
		f 4 -1 5 11 -5
		mu 0 4 7 0 10 8
		f 4 3 24 -6 23
		mu 0 4 1 9 10 0
		f 3 1 20 -7
		mu 0 3 2 3 23
		f 3 2 7 19
		mu 0 3 3 5 25
		f 4 -8 -24 8 22
		mu 0 4 25 5 4 24
		f 4 0 6 16 -9
		mu 0 4 4 2 23 24
		f 4 -11 -10 -12 -25
		mu 0 4 16 17 18 15
		f 4 -14 -22 -13 -26
		mu 0 4 20 21 22 19
		f 4 -17 14 12 -16
		mu 0 4 24 23 12 13
		f 4 -18 -23 15 21
		mu 0 4 14 25 24 13
		f 4 -20 17 13 -19
		mu 0 4 3 25 14 11
		f 4 -21 18 25 -15
		mu 0 4 23 3 11 12;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape11343" -p "track_all_game_wall_01d";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.29362831264734268 -0.027869574725627899 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 38 ".uvst[0].uvsp[0:37]" -type "float2" 0.625 0.75 0.625
		 1 0.625 1 0.26134139 -0.10515581 0.28090096 -0.069562897 0.26133734 -0.069562897
		 0.26134139 -0.10515581 0.26134276 -0.12295209 0.29877108 -0.12295209 0.29877108 -0.087431595
		 0.29877108 -0.087431595 0.26134139 -0.10515581 0.28090096 -0.069562897 0.26134139
		 -0.10515581 0.26133734 -0.069562897 0.26134276 -0.12295209 0.29877108 -0.12295209
		 0.23422776 -0.11855964 0.26134139 -0.10515581 0.22682075 -0.10515581 0.26133734 -0.069562897
		 0.22682075 -0.069562897 0.22682075 -0.10515581 0.26134139 -0.10515581 0.26133734
		 -0.069562897 0.22682075 -0.069562897 0.23422776 -0.11855964 0.26134139 -0.10515581
		 0.30635089 -0.16227029 0.27305704 -0.16227029 0.27305704 -0.19813393 0.30635089 -0.18020223
		 0.30635089 -0.13670473 0.27305704 -0.13670473 0.30635089 -0.16227029 0.27305681 -0.16227029
		 0.27305704 -0.19813393 0.30635089 -0.18020223;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0.050001144 -0.05000031 0 
		0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 
		-0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 
		0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 
		-0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0;
	setAttr -s 14 ".vt[0:13]"  23.22727585 4.79735947 0.092833996 23.32727814 4.5973587 0.092833996
		 23.22727585 4.79735947 -0.092833996 23.32725525 4.5973587 -0.092833996 23.32727814 4.79735947 -0.092833996
		 23.42727661 4.5973587 0.092833996 23.42727661 4.79735947 0.092833996 23.32724762 4.4973588 -0.092833996
		 23.12727737 4.4973588 -0.092833996 23.12727737 4.5973587 0.092833996 23.32727814 4.5973587 0.092833996
		 23.12727737 4.69735909 -0.092833996 23.12727737 4.69735909 0.092833996 23.32727814 4.5973587 0.092833996;
	setAttr -s 26 ".ed[0:25]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 11 0
		 1 13 0 0 12 0 4 3 0 3 5 0 6 4 0 8 9 0 10 7 0 11 8 0 12 9 0 11 12 0 13 10 0 3 7 0
		 13 3 0 3 11 1 9 10 0 12 13 1 0 1 1 5 6 0 7 8 0;
	setAttr -s 14 ".fc[0:13]" -type "polyFaces" 
		f 3 -3 10 -4
		mu 0 3 17 18 19
		f 3 -2 4 9
		mu 0 3 3 4 5
		f 4 -1 5 11 -5
		mu 0 4 28 29 30 31
		f 4 3 24 -6 23
		mu 0 4 6 7 8 9
		f 3 1 20 -7
		mu 0 3 4 3 10
		f 3 2 7 19
		mu 0 3 0 1 2
		f 4 -8 -24 8 22
		mu 0 4 11 6 9 12
		f 4 0 6 16 -9
		mu 0 4 29 28 32 33
		f 4 -11 -10 -12 -25
		mu 0 4 19 18 20 21
		f 4 -14 -22 -13 -26
		mu 0 4 22 23 24 25
		f 4 -17 14 12 -16
		mu 0 4 34 35 36 37
		f 4 -18 -23 15 21
		mu 0 4 13 11 12 14
		f 4 -20 17 13 -19
		mu 0 4 26 27 23 22
		f 4 -21 18 25 -15
		mu 0 4 10 3 15 16;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode transform -n "locator_wall_bottom_left" -p "wall_mine";
createNode locator -n "locator_wall_bottom_leftShape" -p "locator_wall_bottom_left";
	setAttr -k off ".v";
createNode transform -n "track_all_game_wall_01c" -p "locator_wall_bottom_left";
	setAttr ".t" -type "double3" -28.327277183532715 -0.49677467346191406 0 ;
	setAttr ".rp" -type "double3" 28.327277183532715 0.49677467346191406 0 ;
	setAttr ".sp" -type "double3" 28.327277183532715 0.49677467346191406 0 ;
createNode mesh -n "track_all_game_wall_01cShape" -p "track_all_game_wall_01c";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.30446825921535492 0.082764578983187675 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.16938806 0.005533278
		 0.19069931 0.0055333227 0.19069497 0.044305876 0.19069341 0.063692078 0.14992142
		 0.063692003 0.14992142 0.024998322 0.14992142 0.024998322 0.16938806 0.005533278
		 0.19069341 0.063692078 0.14992142 0.063692003 0.23010898 0.061583843 0.19069496 0.044305876
		 0.23015247 0.04430598 0.23015247 0.0055333227 0.23015247 0.04430598 0.19069931 0.0055333227
		 0.23015247 0.0055333227 0.23010898 0.061583843 0.4199475 0.042261943 0.41994753 0.0059938282
		 0.4590151 0.0059937984 0.43948138 0.042261973 0.39209804 0.042261943 0.39209804 0.0059937388
		 0.4199475 0.042261943 0.41994753 0.0059935302 0.4590151 0.0059937984 0.43948138 0.042261973;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  4.9000006 -4.3005857 0 4.999999 
		-4.0005827 0 4.9000006 -4.3005857 0 5.0000219 -4.0006056 0 4.7999983 -4.2005835 0 
		4.9000006 -3.9005845 0 4.6999998 -4.100585 0 5.1000295 -3.9006135 0 5.2999997 -4.1005836 
		0 5.1999998 -4.2005835 0 5.0999994 -4.3005838 0 5.0999994 -4.3005838 0;
	setAttr -s 12 ".vt[0:11]"  23.27727699 4.74735928 0.092833996 23.37727928 4.54735851 0.092833996
		 23.27727699 4.74735928 -0.092833996 23.37725639 4.54735851 -0.092833996 23.37727928 4.74735928 -0.092833996
		 23.47727776 4.54735851 0.092833996 23.47727776 4.74735928 0.092833996 23.37724876 4.44735861 -0.092833996
		 23.17727852 4.44735861 -0.092833996 23.17727852 4.54735851 0.092833996 23.17727852 4.64735889 -0.092833996
		 23.17727852 4.64735889 0.092833996;
	setAttr -s 23 ".ed[0:22]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 10 0
		 0 11 0 4 3 0 3 5 0 6 4 0 8 9 0 1 7 0 10 8 0 11 9 0 10 11 0 3 7 0 3 10 1 9 1 0 11 1 1
		 0 1 1 5 6 0 7 8 0;
	setAttr -s 13 ".fc[0:12]" -type "polyFaces" 
		f 3 -3 9 -4
		mu 0 3 10 11 12
		f 3 -2 4 8
		mu 0 3 11 0 1
		f 4 -1 5 10 -5
		mu 0 4 18 19 20 21
		f 4 3 21 -6 20
		mu 0 4 2 3 4 5
		f 3 1 17 -7
		mu 0 3 0 11 6
		f 3 -21 7 19
		mu 0 3 2 5 7
		f 4 0 6 15 -8
		mu 0 4 19 18 22 23
		f 4 -10 -9 -11 -22
		mu 0 4 12 11 1 13
		f 4 -13 -19 -12 -23
		mu 0 4 14 2 15 16
		f 4 -16 13 11 -15
		mu 0 4 24 25 26 27
		f 3 -20 14 18
		mu 0 3 2 7 15
		f 3 2 12 -17
		mu 0 3 17 2 14
		f 4 -18 16 22 -14
		mu 0 4 6 11 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode mesh -n "polySurfaceShape11297" -p "track_all_game_wall_01c";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0.45833334 0.16666667
		 0.625 0 0.45833334 0.58333331 0.625 0.75 0.375 1 0.625 1 0.875 0 0.875 0.25 0.625
		 0 0.875 0 0.875 0.25 0.625 0.25 0.375 0.75 0.625 0.75 0.625 1 0.375 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  0.20959243 0.95404065 -0.28183237 
		-0.32039094 1.484024 -0.28183237 0.20959243 0.95404065 0.28183237 -0.32039094 1.484024 
		0.28183237 -1.64219 1.484024 0.28183237 -1.64219 1.484024 -0.28183237 -0.59921944 
		0.95404065 0.28183237 -0.59921944 0.95404065 -0.28183237 0.20959243 1.7628524 0.28183237 
		-0.32039094 3.378777 0.28183237 -0.32039094 3.378777 -0.28183237 0.20959243 1.7628524 
		-0.28183237;
	setAttr -s 12 ".vt[0:11]"  -0.5 0.5 0.5 0.5 -0.50000012 0.5 -0.5 0.5 -0.5
		 0.5 -0.50000012 -0.5 2.29181576 -0.50000012 -0.5 2.29181576 -0.50000012 0.5 1.71886182 0.5 -0.5
		 1.71886182 0.5 0.5 -0.5 -1.71886182 -0.5 0.5 -2.8647697 -0.5 0.5 -2.8647697 0.5 -0.5 -1.71886182 0.5;
	setAttr -s 20 ".ed[0:19]"  0 1 1 0 2 0 2 3 1 3 1 0 3 4 0 1 5 0 4 5 0
		 2 6 0 6 4 0 0 7 0 7 6 0 5 7 0 2 8 0 3 9 0 8 9 0 1 10 0 9 10 0 0 11 0 11 10 0 8 11 0;
	setAttr -s 10 ".fc[0:9]" -type "polyFaces" 
		f 4 14 16 -19 -20
		mu 0 4 12 13 14 15
		f 4 -7 -9 -11 -12
		mu 0 4 8 9 10 11
		f 4 -4 4 6 -6
		mu 0 4 1 6 9 8
		f 4 -3 7 8 -5
		mu 0 4 6 7 10 9
		f 4 -2 9 10 -8
		mu 0 4 7 0 11 10
		f 4 0 5 11 -10
		mu 0 4 0 1 8 11
		f 4 2 13 -15 -13
		mu 0 4 2 3 13 12
		f 4 3 15 -17 -14
		mu 0 4 3 5 14 13
		f 4 -1 17 18 -16
		mu 0 4 5 4 15 14
		f 4 1 12 19 -18
		mu 0 4 4 2 12 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape11307" -p "track_all_game_wall_01c";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0.45833334 0.16666667
		 0.625 0 0.45833334 0.58333331 0.625 0.75 0.375 1 0.625 1 0.875 0 0.875 0.25 0.875
		 0.25 0.625 0 0.54166669 0.20833334 0.625 0.75 0.41666669 0.66666663 0.375 1 0.625
		 1 0 2.3620927e-016 1 0 1 0.9283399 0 0.9283399 0 0 0.99999994 0 0.99999994 0.92834002
		 0 0.92834002 0.44876441 0.60247123 0.375 1 0.625 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt";
	setAttr ".pt[0]" -type "float3" 0.10000038 0 0 ;
	setAttr ".pt[2:3]" -type "float3" 0.10000038 0 0  0 0 0 ;
	setAttr ".pt[11:12]" -type "float3" -3.5527137e-015 -0.054069147 0  -3.5527137e-015 
		-0.054069147 0 ;
	setAttr ".pt[14:16]" -type "float3" 0 0 0  0 0 0  0 0 0 ;
	setAttr -s 14 ".vt[0:13]"  29.077219009 0.84762728 0.092833996 29.27721977 0.64762676 0.092833996
		 29.077219009 0.84762728 -0.092833996 29.27719879 0.64762676 -0.092833996 29.27721977 0.84762728 -0.092833996
		 29.37721825 0.64762676 0.092833996 29.37721825 0.84762728 0.092833996 29.27718925 0.54762679 -0.092833996
		 29.077219009 0.54762679 -0.092833996 29.077219009 0.6476267 0.092833996 29.27721977 0.6476267 0.092833996
		 29.077219009 0.80169618 -0.092833996 29.077219009 0.80169618 0.092833996 29.27721977 0.64762676 0.092833996;
	setAttr -s 26 ".ed[0:25]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 11 0
		 1 13 0 0 12 0 4 3 1 3 5 1 6 4 1 8 9 1 10 7 1 11 8 0 12 9 0 11 12 1 13 10 0 3 7 0
		 13 3 1 3 11 1 9 10 1 12 13 1 0 1 1 5 6 1 7 8 1;
	setAttr -s 14 ".fc[0:13]" -type "polyFaces" 
		f 3 -3 10 -4
		mu 0 3 1 6 9
		f 3 -2 4 9
		mu 0 3 6 7 8
		f 4 -1 5 11 -5
		mu 0 4 7 0 10 8
		f 4 3 24 -6 23
		mu 0 4 1 9 10 0
		f 3 1 20 -7
		mu 0 3 2 3 23
		f 3 2 7 19
		mu 0 3 3 5 25
		f 4 -8 -24 8 22
		mu 0 4 25 5 4 24
		f 4 0 6 16 -9
		mu 0 4 4 2 23 24
		f 4 -11 -10 -12 -25
		mu 0 4 16 17 18 15
		f 4 -14 -22 -13 -26
		mu 0 4 20 21 22 19
		f 4 -17 14 12 -16
		mu 0 4 24 23 12 13
		f 4 -18 -23 15 21
		mu 0 4 14 25 24 13
		f 4 -20 17 13 -19
		mu 0 4 3 25 14 11
		f 4 -21 18 25 -15
		mu 0 4 23 3 11 12;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape11343" -p "track_all_game_wall_01c";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.29362831264734268 -0.027869574725627899 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 38 ".uvst[0].uvsp[0:37]" -type "float2" 0.625 0.75 0.625
		 1 0.625 1 0.26134139 -0.10515581 0.28090096 -0.069562897 0.26133734 -0.069562897
		 0.26134139 -0.10515581 0.26134276 -0.12295209 0.29877108 -0.12295209 0.29877108 -0.087431595
		 0.29877108 -0.087431595 0.26134139 -0.10515581 0.28090096 -0.069562897 0.26134139
		 -0.10515581 0.26133734 -0.069562897 0.26134276 -0.12295209 0.29877108 -0.12295209
		 0.23422776 -0.11855964 0.26134139 -0.10515581 0.22682075 -0.10515581 0.26133734 -0.069562897
		 0.22682075 -0.069562897 0.22682075 -0.10515581 0.26134139 -0.10515581 0.26133734
		 -0.069562897 0.22682075 -0.069562897 0.23422776 -0.11855964 0.26134139 -0.10515581
		 0.30635089 -0.16227029 0.27305704 -0.16227029 0.27305704 -0.19813393 0.30635089 -0.18020223
		 0.30635089 -0.13670473 0.27305704 -0.13670473 0.30635089 -0.16227029 0.27305681 -0.16227029
		 0.27305704 -0.19813393 0.30635089 -0.18020223;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0.050001144 -0.05000031 0 
		0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 
		-0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 
		0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0 0.050001144 
		-0.05000031 0 0.050001144 -0.05000031 0 0.050001144 -0.05000031 0;
	setAttr -s 14 ".vt[0:13]"  23.22727585 4.79735947 0.092833996 23.32727814 4.5973587 0.092833996
		 23.22727585 4.79735947 -0.092833996 23.32725525 4.5973587 -0.092833996 23.32727814 4.79735947 -0.092833996
		 23.42727661 4.5973587 0.092833996 23.42727661 4.79735947 0.092833996 23.32724762 4.4973588 -0.092833996
		 23.12727737 4.4973588 -0.092833996 23.12727737 4.5973587 0.092833996 23.32727814 4.5973587 0.092833996
		 23.12727737 4.69735909 -0.092833996 23.12727737 4.69735909 0.092833996 23.32727814 4.5973587 0.092833996;
	setAttr -s 26 ".ed[0:25]"  0 2 0 2 3 1 3 1 0 1 5 0 2 4 0 0 6 0 2 11 0
		 1 13 0 0 12 0 4 3 0 3 5 0 6 4 0 8 9 0 10 7 0 11 8 0 12 9 0 11 12 0 13 10 0 3 7 0
		 13 3 0 3 11 1 9 10 0 12 13 1 0 1 1 5 6 0 7 8 0;
	setAttr -s 14 ".fc[0:13]" -type "polyFaces" 
		f 3 -3 10 -4
		mu 0 3 17 18 19
		f 3 -2 4 9
		mu 0 3 3 4 5
		f 4 -1 5 11 -5
		mu 0 4 28 29 30 31
		f 4 3 24 -6 23
		mu 0 4 6 7 8 9
		f 3 1 20 -7
		mu 0 3 4 3 10
		f 3 2 7 19
		mu 0 3 0 1 2
		f 4 -8 -24 8 22
		mu 0 4 11 6 9 12
		f 4 0 6 16 -9
		mu 0 4 29 28 32 33
		f 4 -11 -10 -12 -25
		mu 0 4 19 18 20 21
		f 4 -14 -22 -13 -26
		mu 0 4 22 23 24 25
		f 4 -17 14 12 -16
		mu 0 4 34 35 36 37
		f 4 -18 -23 15 21
		mu 0 4 13 11 12 14
		f 4 -20 17 13 -19
		mu 0 4 26 27 23 22
		f 4 -21 18 25 -15
		mu 0 4 10 3 15 16;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode animCurveTL -n "locator_wall_top_left_translateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1.25 -0.10636832085314446 10 -0.875 30 -0.875;
createNode animCurveTL -n "locator_wall_top_left_translateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1.25 0.20037743272826575 10 0.20037743272826575
		 30 5;
createNode materialInfo -n "materialInfo9";
createNode shadingEngine -n "lambert9SG";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "track_all_tex_objects_01";
createNode file -n "file5";
	setAttr ".ftn" -type "string" "D:/Dropbox/3D Graphics/Projects/Robot Race/Textures/All/track_all_tex_objects_01.tga";
createNode place2dTexture -n "place2dTexture6";
createNode animCurveTL -n "locator_wall_top_right_translateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1.25 0.09411105388737942 10 0.875 30 0.875;
createNode animCurveTL -n "locator_wall_top_right_translateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1.25 0.20090200350255838 10 0.20090200350255838
		 30 5;
createNode animCurveTL -n "locator_wall_center_translateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1.25 0.098316259578678483 10 0.098316259578678483
		 30 2.5;
createNode animCurveTU -n "locator_wall_center_scaleX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1.25 0.23 10 1 30 1;
createNode animCurveTU -n "locator_wall_center_scaleY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1.25 0.07 10 0.07 30 1;
createNode materialInfo -n "materialInfo25";
createNode shadingEngine -n "lambert19SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "track_all_tex_transparent_01";
createNode file -n "file17";
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/Project/Assets/Assets/Maya/Tracks/All/Textures/track_all_tex_transparent_01.tga";
createNode place2dTexture -n "place2dTexture19";
createNode animCurveTL -n "locator_wall_bottom_right_translateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1.25 0.094107487660990197 10 0.875;
createNode animCurveTL -n "locator_wall_bottom_right_translateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1.25 0 10 0;
createNode animCurveTL -n "locator_wall_bottom_left_translateX";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1.25 -0.10607814882718036 10 -0.875;
createNode animCurveTL -n "locator_wall_bottom_left_translateY";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1.25 0 10 0;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 4 ".lnk";
	setAttr -s 4 ".slnk";
createNode displayLayerManager -n "layerManager";
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
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 3.28084 -size 3.28084 -divisions 10 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1.25 -max 30 -ast 1.25 -aet 60 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 1.25;
	setAttr ".unw" 1.25;
select -ne :renderPartition;
	setAttr -s 4 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 4 ".s";
select -ne :defaultTextureList1;
	setAttr -s 2 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 2 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :defaultRenderGlobals;
	setAttr ".mcfr" 30;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr ".hwfr" 30;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "locator_wall_top_left_translateX.o" "locator_wall_top_left.tx";
connectAttr "locator_wall_top_left_translateY.o" "locator_wall_top_left.ty";
connectAttr "locator_wall_top_right_translateX.o" "locator_wall_top_right.tx";
connectAttr "locator_wall_top_right_translateY.o" "locator_wall_top_right.ty";
connectAttr "locator_wall_center_translateY.o" "locator_wall_center.ty";
connectAttr "locator_wall_center_scaleX.o" "locator_wall_center.sx";
connectAttr "locator_wall_center_scaleY.o" "locator_wall_center.sy";
connectAttr "locator_wall_bottom_right_translateX.o" "locator_wall_bottom_right.tx"
		;
connectAttr "locator_wall_bottom_right_translateY.o" "locator_wall_bottom_right.ty"
		;
connectAttr "locator_wall_bottom_left_translateX.o" "locator_wall_bottom_left.tx"
		;
connectAttr "locator_wall_bottom_left_translateY.o" "locator_wall_bottom_left.ty"
		;
connectAttr "lambert9SG.msg" "materialInfo9.sg";
connectAttr "track_all_tex_objects_01.msg" "materialInfo9.m";
connectAttr "file5.msg" "materialInfo9.t" -na;
connectAttr "track_all_tex_objects_01.oc" "lambert9SG.ss";
connectAttr "track_all_game_wall_01aShape.iog" "lambert9SG.dsm" -na;
connectAttr "track_all_game_wall_01bShape.iog" "lambert9SG.dsm" -na;
connectAttr "track_all_game_wall_01cShape.iog" "lambert9SG.dsm" -na;
connectAttr "track_all_game_wall_01dShape.iog" "lambert9SG.dsm" -na;
connectAttr "file5.oc" "track_all_tex_objects_01.c";
connectAttr "place2dTexture6.c" "file5.c";
connectAttr "place2dTexture6.tf" "file5.tf";
connectAttr "place2dTexture6.rf" "file5.rf";
connectAttr "place2dTexture6.mu" "file5.mu";
connectAttr "place2dTexture6.mv" "file5.mv";
connectAttr "place2dTexture6.s" "file5.s";
connectAttr "place2dTexture6.wu" "file5.wu";
connectAttr "place2dTexture6.wv" "file5.wv";
connectAttr "place2dTexture6.re" "file5.re";
connectAttr "place2dTexture6.of" "file5.of";
connectAttr "place2dTexture6.r" "file5.ro";
connectAttr "place2dTexture6.n" "file5.n";
connectAttr "place2dTexture6.vt1" "file5.vt1";
connectAttr "place2dTexture6.vt2" "file5.vt2";
connectAttr "place2dTexture6.vt3" "file5.vt3";
connectAttr "place2dTexture6.vc1" "file5.vc1";
connectAttr "place2dTexture6.o" "file5.uv";
connectAttr "place2dTexture6.ofs" "file5.fs";
connectAttr "lambert19SG.msg" "materialInfo25.sg";
connectAttr "track_all_tex_transparent_01.msg" "materialInfo25.m";
connectAttr "file17.msg" "materialInfo25.t" -na;
connectAttr "track_all_tex_transparent_01.oc" "lambert19SG.ss";
connectAttr "track_all_game_wall_01eShape.iog" "lambert19SG.dsm" -na;
connectAttr "file17.oc" "track_all_tex_transparent_01.c";
connectAttr "file17.ot" "track_all_tex_transparent_01.it";
connectAttr "place2dTexture19.c" "file17.c";
connectAttr "place2dTexture19.tf" "file17.tf";
connectAttr "place2dTexture19.rf" "file17.rf";
connectAttr "place2dTexture19.mu" "file17.mu";
connectAttr "place2dTexture19.mv" "file17.mv";
connectAttr "place2dTexture19.s" "file17.s";
connectAttr "place2dTexture19.wu" "file17.wu";
connectAttr "place2dTexture19.wv" "file17.wv";
connectAttr "place2dTexture19.re" "file17.re";
connectAttr "place2dTexture19.of" "file17.of";
connectAttr "place2dTexture19.r" "file17.ro";
connectAttr "place2dTexture19.n" "file17.n";
connectAttr "place2dTexture19.vt1" "file17.vt1";
connectAttr "place2dTexture19.vt2" "file17.vt2";
connectAttr "place2dTexture19.vt3" "file17.vt3";
connectAttr "place2dTexture19.vc1" "file17.vc1";
connectAttr "place2dTexture19.o" "file17.uv";
connectAttr "place2dTexture19.ofs" "file17.fs";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert9SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert19SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert9SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert19SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "lambert9SG.pa" ":renderPartition.st" -na;
connectAttr "lambert19SG.pa" ":renderPartition.st" -na;
connectAttr "track_all_tex_objects_01.msg" ":defaultShaderList1.s" -na;
connectAttr "track_all_tex_transparent_01.msg" ":defaultShaderList1.s" -na;
connectAttr "file5.msg" ":defaultTextureList1.tx" -na;
connectAttr "file17.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of wallMine.ma
