//Maya ASCII 2012 scene
//Name: barrier_object.ma
//Last modified: Fri, Mar 30, 2012 04:59:51 PM
//Codeset: 1252
requires maya "2012";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 Hotfix 4 x64";
fileInfo "cutIdentifier" "001200000000-806479";
fileInfo "osv" "Microsoft Windows 7 Ultimate Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.21409272464074508 1.0195639165651118 2.2159675781493222 ;
	setAttr ".r" -type "double3" -14.138352729763465 346.59999999911145 359.99999999963279 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 3.4960225991162299;
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
	setAttr ".t" -type "double3" 0.32954123229262999 -0.34399556449563462 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 2.9368411502024818;
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
createNode transform -n "energyBarrier_center";
createNode locator -n "energyBarrier_centerShape" -p "energyBarrier_center";
	setAttr -k off ".v";
createNode transform -n "energyBarrier_TR" -p "energyBarrier_center";
	setAttr ".t" -type "double3" 0.5 0.5 0 ;
createNode locator -n "energyBarrier_TRShape" -p "energyBarrier_TR";
	setAttr -k off ".v";
createNode transform -n "BarrierEmitter_TR_geo" -p "energyBarrier_TR";
	setAttr ".rp" -type "double3" -0.11220326423645011 -0.11445858573913581 0 ;
	setAttr ".sp" -type "double3" -0.11220326423645011 -0.11445858573913581 0 ;
createNode mesh -n "BarrierEmitter_TR_geoShape" -p "BarrierEmitter_TR_geo";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:24]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 52 ".uvst[0].uvsp[0:51]" -type "float2" 0.26414245 0.019264732
		 0.29441315 0.034398489 0.27927673 0.0041294508 0.23261437 0.16139965 0.23261438 0.13951887
		 0.26067984 0.13951892 0.26067984 0.16139971 0.26414245 0.019264732 0.27927673 0.0041294508
		 0.2944116 0.034400173 0.26067978 0.059193686 0.23261434 0.05919366 0.23261438 0.0055888128
		 0.26067987 0.0055887639 0.34002241 0.034396771 0.39834282 0.049596898 0.39834461
		 0.078728475 0.35106146 0.07872843 0.35106146 0.049596891 0.34002241 0.034400173 0.35970464
		 0.046862066 0.35970458 0.0041296184 0.39015967 0.046860412 0.33065811 0.049596898
		 0.33065805 0.07872843 0.29908636 0.078728445 0.29908642 0.049597003 0.35970458 0.0041296184
		 0.35970452 0.046858817 0.39015961 0.046857111 0.2606796 0.059193656 0.23261434 0.059193697
		 0.23261429 0.0055888053 0.26067969 0.0055887415 0.29440999 0.080009341 0.39834276
		 0.049596854 0.39834443 0.078728504 0.35106152 0.07872837 0.35106152 0.049596928 0.29441321
		 0.080009416 0.30687511 0.099691443 0.26414251 0.099691443 0.30687335 0.13014662 0.33065799
		 0.049596898 0.33065799 0.07872843 0.29908648 0.078728445 0.29908648 0.049596913 0.26414251
		 0.099691443 0.30687183 0.099691451 0.30687007 0.13014653 0.26067978 0.13951889 0.2326144
		 0.13951883;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt[0:21]" -type "float3"  -2.8994343 -2.451 0 -2.8994343 
		-2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 
		0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 
		-2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 
		-2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 
		0 -2.8994343 -2.451 0 -2.8994343 -2.451 0 -2.8994343 -2.451 0;
	setAttr -s 22 ".vt[0:21]"  3.05454874 2.68836474 0.078454971 2.97003984 2.51934075 0.078454971
		 3.05454874 2.68836474 -0.078454971 2.97003031 2.51935029 -0.078454971 3.13905478 2.60385299 -0.078454971
		 3.13905478 2.60385299 0.078454971 2.60546064 2.68836427 -0.078454971 2.60546064 2.68836427 0.078454971
		 2.43540716 2.44978452 -0.078454971 2.43540716 2.44976592 0.078454971 2.60546064 2.44975638 0.078454971
		 2.60546064 2.44977498 -0.078454971 2.71536016 2.51934075 0.078454971 2.71536016 2.51935983 -0.078454971
		 3.13905382 2.15477157 0.078454971 3.13905382 2.15477157 -0.078454971 2.90047407 1.98471808 0.078454971
		 2.90045595 1.98471808 -0.078454971 2.90044641 2.15477157 -0.078454971 2.90046453 2.15477157 0.078454971
		 2.97003031 2.26467109 -0.078454971 2.97004938 2.26467109 0.078454971;
	setAttr -s 45 ".ed[0:44]"  4 3 0 3 2 0 2 4 0 2 0 0 0 5 0 5 4 0 0 1 0
		 1 5 0 7 6 0 6 8 0 8 9 0 9 7 0 3 13 0 13 2 0 3 1 0 1 12 0 12 13 0 0 12 0 10 7 0 9 10 0
		 11 10 0 8 11 0 6 11 0 12 10 0 11 13 0 6 2 0 7 0 0 15 14 0 14 16 0 16 17 0 17 15 0
		 1 21 0 21 5 0 3 20 0 20 21 0 4 20 0 18 15 0 17 18 0 19 18 0 16 19 0 14 19 0 20 18 0
		 19 21 0 14 5 0 15 4 0;
	setAttr -s 90 ".n[0:89]" -type "float3"  -4.346786e-008 0 -1 -2.173393e-008
		 0 -1 -1.302104e-009 0 -1 0.70713019 0.7070834 0 0.70713019 0.7070834 0 0.70713019
		 0.7070834 0 0.70713019 0.7070834 0 0 0 1 0 0 1 0 0 1 -0.81432581 0.58040804 3.4357632e-005
		 -0.81432581 0.58040804 3.4357632e-005 -0.81432581 0.58040804 3.4357632e-005 -0.81432581
		 0.58040804 3.4357632e-005 -1.302104e-009 0 -1 -2.173393e-008 0 -1 1.9780774e-008
		 0 -1 -1.872336e-005 -1 -9.2477276e-005 -1.872336e-005 -1 -9.2477276e-005 0.27848443
		 -0.9604407 -0.00010135432 0.27848443 -0.9604407 -0.00010135432 0 0 1 0 0 1 0 0 1
		 -1.4255649e-008 0 1 -1.4255649e-008 0 1 -2.8511298e-008 0 1 0.27846649 -0.960446
		 -0.00011484571 0.27846649 -0.960446 -0.00011484571 -5.6080826e-005 -1 -0.00011839131
		 -5.6080826e-005 -1 -0.00011839131 1.9780774e-008 0 -1 1.9780774e-008 0 -1 0 0 -1
		 0.27848443 -0.9604407 -0.00010135432 0.27848443 -0.9604407 -0.00010135432 0.27846649
		 -0.960446 -0.00011484571 0.27846649 -0.960446 -0.00011484571 -1.302104e-009 0 -1
		 1.9780774e-008 0 -1 1.9780774e-008 0 -1 1.9780774e-008 0 -1 -1.06179e-006 1 0 -1.06179e-006
		 1 0 -1.06179e-006 1 0 -1.06179e-006 1 0 0 0 1 0 0 1 -1.4255649e-008 0 1 -1.4255649e-008
		 0 1 0.58040822 -0.81432575 -3.306114e-005 0.58040822 -0.81432575 -3.306114e-005 0.58040822
		 -0.81432575 -3.306114e-005 0.58040822 -0.81432575 -3.306114e-005 -4.3273257e-008
		 0 1 -8.6546521e-008 0 1 -4.3273257e-008 0 1 -1 -1.8644652e-005 9.1167072e-005 -1
		 -1.8644652e-005 9.1167072e-005 -0.96044111 0.27848327 9.991206e-005 -0.96044111 0.27848327
		 9.991206e-005 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 -0.96044618 0.27846539 0.00011256937
		 -0.96044618 0.27846539 0.00011256937 -1 -5.5844976e-005 0.00011547899 -1 -5.5844976e-005
		 0.00011547899 0 0 1 0 0 1 0 0 1 -0.96044111 0.27848327 9.991206e-005 -0.96044111
		 0.27848327 9.991206e-005 -0.96044618 0.27846539 0.00011256937 -0.96044618 0.27846539
		 0.00011256937 -4.3273257e-008 0 1 -4.3273257e-008 0 1 0 0 1 0 0 1 1 -2.1146795e-006
		 0 1 -2.1146795e-006 0 1 -2.1146795e-006 0 1 -2.1146795e-006 0 0 0 -1 0 0 -1 0 0 -1
		 0 0 -1;
	setAttr -s 25 ".fc[0:24]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 1 2
		f 4 -3 3 4 5
		mu 0 4 3 4 5 6
		f 3 -5 6 7
		mu 0 3 7 8 9
		f 4 8 9 10 11
		mu 0 4 10 11 12 13
		f 3 -2 12 13
		mu 0 3 2 1 14
		f 4 14 15 16 -13
		mu 0 4 15 16 17 18
		f 3 -7 17 -16
		mu 0 3 9 8 19
		f 3 18 -12 19
		mu 0 3 20 21 22
		f 4 20 -20 -11 21
		mu 0 4 23 24 25 26
		f 3 22 -22 -10
		mu 0 3 27 28 29
		f 4 -17 23 -21 24
		mu 0 4 18 17 24 23
		f 4 -14 -25 -23 25
		mu 0 4 2 14 28 27
		f 4 -4 -26 -9 26
		mu 0 4 5 4 11 10
		f 4 -18 -27 -19 -24
		mu 0 4 19 8 21 20
		f 4 27 28 29 30
		mu 0 4 30 31 32 33
		f 3 -8 31 32
		mu 0 3 7 9 34
		f 4 -15 33 34 -32
		mu 0 4 35 36 37 38
		f 3 -1 35 -34
		mu 0 3 1 0 39
		f 3 36 -31 37
		mu 0 3 40 41 42
		f 4 38 -38 -30 39
		mu 0 4 43 44 45 46
		f 3 40 -40 -29
		mu 0 3 47 48 49
		f 4 -35 41 -39 42
		mu 0 4 38 37 44 43
		f 4 -33 -43 -41 43
		mu 0 4 7 34 48 47
		f 4 -6 -44 -28 44
		mu 0 4 50 51 31 30
		f 4 -36 -45 -37 -42
		mu 0 4 39 0 41 40;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "energyBarrier_TL" -p "energyBarrier_center";
	setAttr ".t" -type "double3" -0.5 0.5 0 ;
createNode locator -n "energyBarrier_TLShape" -p "energyBarrier_TL";
	setAttr -k off ".v";
createNode transform -n "BarrierEmitter_TL_geo" -p "energyBarrier_TL";
	setAttr ".rp" -type "double3" 0.11262657121720565 -0.11443431092101441 0 ;
	setAttr ".sp" -type "double3" 0.11262657121720565 -0.11443431092101441 0 ;
createNode mesh -n "BarrierEmitter_TL_geoShape" -p "BarrierEmitter_TL_geo";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:24]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 52 ".uvst[0].uvsp[0:51]" -type "float2" 0.26414245 0.019264732
		 0.29441315 0.034398489 0.27927673 0.0041294508 0.23261437 0.16139965 0.23261438 0.13951887
		 0.26067984 0.13951892 0.26067984 0.16139971 0.26414245 0.019264732 0.27927673 0.0041294508
		 0.2944116 0.034400173 0.26067978 0.059193686 0.23261434 0.05919366 0.23261438 0.0055888128
		 0.26067987 0.0055887639 0.34002241 0.034396771 0.39834282 0.049596898 0.39834461
		 0.078728475 0.35106146 0.07872843 0.35106146 0.049596891 0.34002241 0.034400173 0.35970464
		 0.046862066 0.35970458 0.0041296184 0.39015967 0.046860412 0.33065811 0.049596898
		 0.33065805 0.07872843 0.29908636 0.078728445 0.29908642 0.049597003 0.35970458 0.0041296184
		 0.35970452 0.046858817 0.39015961 0.046857111 0.2606796 0.059193656 0.23261434 0.059193697
		 0.23261429 0.0055888053 0.26067969 0.0055887415 0.29440999 0.080009341 0.39834276
		 0.049596854 0.39834443 0.078728504 0.35106152 0.07872837 0.35106152 0.049596928 0.29441321
		 0.080009416 0.30687511 0.099691443 0.26414251 0.099691443 0.30687335 0.13014662 0.33065799
		 0.049596898 0.33065799 0.07872843 0.29908648 0.078728445 0.29908648 0.049596913 0.26414251
		 0.099691443 0.30687183 0.099691451 0.30687007 0.13014653 0.26067978 0.13951889 0.2326144
		 0.13951883;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt[0:21]" -type "float3"  2.1509895 -2.4509764 0 2.1509895 
		-2.4509764 0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 
		2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 
		0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 2.1509895 
		-2.4509764 0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 
		2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 
		0 2.1509895 -2.4509764 0 2.1509895 -2.4509764 0;
	setAttr -s 22 ".vt[0:21]"  -2.39018631 2.6038599 0.078454971 -2.2211628 2.51935101 0.078454971
		 -2.39018631 2.6038599 -0.078454971 -2.22117233 2.51934147 -0.078454971 -2.30567455 2.68836594 -0.078454971
		 -2.30567455 2.68836594 0.078454971 -2.39018631 2.1547718 -0.078454971 -2.39018631 2.1547718 0.078454971
		 -2.15160656 1.98471832 -0.078454971 -2.15158749 1.98471832 0.078454971 -2.15157795 2.1547718 0.078454971
		 -2.15159702 2.1547718 -0.078454971 -2.2211628 2.26467133 0.078454971 -2.22118187 2.26467133 -0.078454971
		 -1.85659313 2.68836498 0.078454971 -1.85659313 2.68836498 -0.078454971 -1.68653965 2.44978523 0.078454971
		 -1.68653965 2.44976711 -0.078454971 -1.85659313 2.44975758 -0.078454971 -1.85659313 2.4497757 0.078454971
		 -1.96649265 2.51934147 -0.078454971 -1.96649265 2.51936054 0.078454971;
	setAttr -s 45 ".ed[0:44]"  4 3 0 3 2 0 2 4 0 2 0 0 0 5 0 5 4 0 0 1 0
		 1 5 0 7 6 0 6 8 0 8 9 0 9 7 0 3 13 0 13 2 0 3 1 0 1 12 0 12 13 0 0 12 0 10 7 0 9 10 0
		 11 10 0 8 11 0 6 11 0 12 10 0 11 13 0 6 2 0 7 0 0 15 14 0 14 16 0 16 17 0 17 15 0
		 1 21 0 21 5 0 3 20 0 20 21 0 4 20 0 18 15 0 17 18 0 19 18 0 16 19 0 14 19 0 20 18 0
		 19 21 0 14 5 0 15 4 0;
	setAttr -s 90 ".n[0:89]" -type "float3"  0 0 -1 0 0 -1 0 0 -1 -0.70708323
		 0.70713037 0 -0.70708323 0.70713037 0 -0.70708323 0.70713037 0 -0.70708323 0.70713037
		 0 0 0 1 -1.2158731e-008 0 1 0 0 1 -0.58040762 -0.81432623 3.500588e-005 -0.58040762
		 -0.81432623 3.500588e-005 -0.58040762 -0.81432623 3.500588e-005 -0.58040762 -0.81432623
		 3.500588e-005 0 0 -1 0 0 -1 0 0 -1 1 -1.864462e-005 -9.1167087e-005 1 -1.864462e-005
		 -9.1167087e-005 0.96044064 0.27848506 -0.00010105223 0.96044064 0.27848506 -0.00010105223
		 0 0 1 -1.2158731e-008 0 1 -1.8238095e-008 0 1 -1.8238095e-008 0 1 -1.8238095e-008
		 0 1 0 0 1 0.96044576 0.27846718 -0.00011687371 0.96044576 0.27846718 -0.00011687371
		 1 -5.5844976e-005 -0.0001215569 1 -5.5844976e-005 -0.0001215569 0 0 -1 0 0 -1 0 0
		 -1 0.96044064 0.27848506 -0.00010105223 0.96044064 0.27848506 -0.00010105223 0.96044576
		 0.27846718 -0.00011687371 0.96044576 0.27846718 -0.00011687371 0 0 -1 0 0 -1 0 0
		 -1 0 0 -1 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1.8238095e-008 0 1 -1.2158731e-008 0 1 -1.8238095e-008
		 0 1 -1.8238095e-008 0 1 0.81432587 0.58040804 -3.3709413e-005 0.81432587 0.58040804
		 -3.3709413e-005 0.81432587 0.58040804 -3.3709413e-005 0.81432587 0.58040804 -3.3709413e-005
		 3.147953e-010 0 1 4.32732e-008 0 1 3.147953e-010 0 1 1.872336e-005 -1 9.0985704e-005
		 1.872336e-005 -1 9.0985704e-005 -0.2784833 -0.96044099 9.9057441e-005 -0.2784833
		 -0.96044099 9.9057441e-005 0 0 -1 0 0 -1 0 0 -1 1.4255691e-008 0 -1 1.4255691e-008
		 0 -1 2.8511382e-008 0 -1 -0.27846539 -0.9604463 0.00011158103 -0.27846539 -0.9604463
		 0.00011158103 5.6080891e-005 -1 0.00011504074 5.6080891e-005 -1 0.00011504074 -2.1321805e-008
		 0 1 -2.1321805e-008 0 1 0 0 1 -0.2784833 -0.96044099 9.9057441e-005 -0.2784833 -0.96044099
		 9.9057441e-005 -0.27846539 -0.9604463 0.00011158103 -0.27846539 -0.9604463 0.00011158103
		 3.147953e-010 0 1 3.147953e-010 0 1 -2.1321805e-008 0 1 -2.1321805e-008 0 1 2.1236108e-006
		 1 0 2.1236108e-006 1 0 2.1236108e-006 1 0 2.1236108e-006 1 0 0 0 -1 0 0 -1 1.4255691e-008
		 0 -1 1.4255691e-008 0 -1;
	setAttr -s 25 ".fc[0:24]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 1 2
		f 4 -3 3 4 5
		mu 0 4 3 4 5 6
		f 3 -5 6 7
		mu 0 3 7 8 9
		f 4 8 9 10 11
		mu 0 4 10 11 12 13
		f 3 -2 12 13
		mu 0 3 2 1 14
		f 4 14 15 16 -13
		mu 0 4 15 16 17 18
		f 3 -7 17 -16
		mu 0 3 9 8 19
		f 3 18 -12 19
		mu 0 3 20 21 22
		f 4 20 -20 -11 21
		mu 0 4 23 24 25 26
		f 3 22 -22 -10
		mu 0 3 27 28 29
		f 4 -17 23 -21 24
		mu 0 4 18 17 24 23
		f 4 -14 -25 -23 25
		mu 0 4 2 14 28 27
		f 4 -4 -26 -9 26
		mu 0 4 5 4 11 10
		f 4 -18 -27 -19 -24
		mu 0 4 19 8 21 20
		f 4 27 28 29 30
		mu 0 4 30 31 32 33
		f 3 -8 31 32
		mu 0 3 7 9 34
		f 4 -15 33 34 -32
		mu 0 4 35 36 37 38
		f 3 -1 35 -34
		mu 0 3 1 0 39
		f 3 36 -31 37
		mu 0 3 40 41 42
		f 4 38 -38 -30 39
		mu 0 4 43 44 45 46
		f 3 40 -40 -29
		mu 0 3 47 48 49
		f 4 -35 41 -39 42
		mu 0 4 38 37 44 43
		f 4 -33 -43 -41 43
		mu 0 4 7 34 48 47
		f 4 -6 -44 -28 44
		mu 0 4 50 51 31 30
		f 4 -36 -45 -37 -42
		mu 0 4 39 0 41 40;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "energyBarrier_BR" -p "energyBarrier_center";
	setAttr ".t" -type "double3" 0.5 -0.5 0 ;
createNode locator -n "energyBarrier_BRShape" -p "energyBarrier_BR";
	setAttr -k off ".v";
createNode transform -n "BarrierEmitter_BR_geo" -p "energyBarrier_BR";
	setAttr ".rp" -type "double3" -0.12798752784728995 0.12171729660034181 0 ;
	setAttr ".sp" -type "double3" -0.12798752784728995 0.12171729660034181 0 ;
createNode mesh -n "BarrierEmitter_BR_geoShape" -p "BarrierEmitter_BR_geo";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:24]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 52 ".uvst[0].uvsp[0:51]" -type "float2" 0.26414245 0.019264732
		 0.29441315 0.034398489 0.27927673 0.0041294508 0.23261437 0.16139965 0.23261438 0.13951887
		 0.26067984 0.13951892 0.26067984 0.16139971 0.26414245 0.019264732 0.27927673 0.0041294508
		 0.2944116 0.034400173 0.26067978 0.059193686 0.23261434 0.05919366 0.23261438 0.0055888128
		 0.26067987 0.0055887639 0.34002241 0.034396771 0.39834282 0.049596898 0.39834461
		 0.078728475 0.35106146 0.07872843 0.35106146 0.049596891 0.34002241 0.034400173 0.35970464
		 0.046862066 0.35970458 0.0041296184 0.39015967 0.046860412 0.33065811 0.049596898
		 0.33065805 0.07872843 0.29908636 0.078728445 0.29908642 0.049597003 0.35970458 0.0041296184
		 0.35970452 0.046858817 0.39015961 0.046857111 0.2606796 0.059193656 0.23261434 0.059193697
		 0.23261429 0.0055888053 0.26067969 0.0055887415 0.29440999 0.080009341 0.39834276
		 0.049596854 0.39834443 0.078728504 0.35106152 0.07872837 0.35106152 0.049596928 0.29441321
		 0.080009416 0.30687511 0.099691443 0.26414251 0.099691443 0.30687335 0.13014662 0.33065799
		 0.049596898 0.33065799 0.07872843 0.29908648 0.078728445 0.29908648 0.049596913 0.26414251
		 0.099691443 0.30687183 0.099691451 0.30687007 0.13014653 0.26067978 0.13951889 0.2326144
		 0.13951883;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt[0:21]" -type "float3"  -2.8994343 -0.23899999 0 
		-2.8994343 -0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 
		-0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 
		0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 
		-0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 
		0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 
		-0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 0 -2.8994343 -0.23899999 
		0;
	setAttr -s 22 ".vt[0:21]"  3.038764477 0.0088939667 -0.078454971 2.95425558 0.17791796 -0.078454971
		 3.038764477 0.0088939667 0.078454971 2.95424604 0.17790842 0.078454971 3.12327051 0.093405724 0.078454971
		 3.12327051 0.093405724 -0.078454971 2.58967638 0.0088944435 0.078454971 2.58967638 0.0088944435 -0.078454971
		 2.4196229 0.24747419 0.078454971 2.4196229 0.24749279 -0.078454971 2.58967638 0.24750233 -0.078454971
		 2.58967638 0.24748373 0.078454971 2.6995759 0.17791796 -0.078454971 2.6995759 0.17789888 0.078454971
		 3.12326956 0.54248714 -0.078454971 3.12326956 0.54248714 0.078454971 2.88468981 0.71254063 -0.078454971
		 2.88467169 0.71254063 0.078454971 2.88466215 0.54248714 0.078454971 2.88468027 0.54248714 -0.078454971
		 2.95424604 0.43258762 0.078454971 2.95426512 0.43258762 -0.078454971;
	setAttr -s 45 ".ed[0:44]"  4 3 0 3 2 0 2 4 0 2 0 0 0 5 0 5 4 0 0 1 0
		 1 5 0 7 6 0 6 8 0 8 9 0 9 7 0 3 13 0 13 2 0 3 1 0 1 12 0 12 13 0 0 12 0 10 7 0 9 10 0
		 11 10 0 8 11 0 6 11 0 12 10 0 11 13 0 6 2 0 7 0 0 15 14 0 14 16 0 16 17 0 17 15 0
		 1 21 0 21 5 0 3 20 0 20 21 0 4 20 0 18 15 0 17 18 0 19 18 0 16 19 0 14 19 0 20 18 0
		 19 21 0 14 5 0 15 4 0;
	setAttr -s 90 ".n[0:89]" -type "float3"  -4.346786e-008 0 1 -2.173393e-008
		 0 1 -1.3021099e-009 0 1 0.70713097 -0.70708257 0 0.70713097 -0.70708257 0 0.70713097
		 -0.70708257 0 0.70713097 -0.70708257 0 0 0 -1 0 0 -1 0 0 -1 -0.81432611 -0.58040762
		 -3.4398163e-005 -0.81432611 -0.58040762 -3.4398163e-005 -0.81432611 -0.58040762 -3.4398163e-005
		 -0.81432611 -0.58040762 -3.4398163e-005 -1.3021099e-009 0 1 -2.173393e-008 0 1 1.9780765e-008
		 0 1 -1.8723375e-005 1 9.1172216e-005 -1.8723375e-005 1 9.1172216e-005 0.27848405
		 0.96044087 0.00010024723 0.27848405 0.96044087 0.00010024723 0 0 -1 0 0 -1 0 0 -1
		 -1.4255648e-008 0 -1 -1.4255648e-008 0 -1 -2.8511296e-008 0 -1 0.27846611 0.960446
		 0.00011449079 0.27846611 0.960446 0.00011449079 -5.6080891e-005 1 0.00011853105 -5.6080891e-005
		 1 0.00011853105 1.9780765e-008 0 1 1.9780765e-008 0 1 0 0 1 0.27848405 0.96044087
		 0.00010024723 0.27848405 0.96044087 0.00010024723 0.27846611 0.960446 0.00011449079
		 0.27846611 0.960446 0.00011449079 -1.3021099e-009 0 1 1.9780765e-008 0 1 1.9780765e-008
		 0 1 1.9780765e-008 0 1 -1.0617897e-006 -1 0 -1.0617897e-006 -1 0 -1.0617897e-006
		 -1 0 -1.0617897e-006 -1 0 0 0 -1 0 0 -1 -1.4255648e-008 0 -1 -1.4255648e-008 0 -1
		 0.58040822 0.81432575 3.3385269e-005 0.58040822 0.81432575 3.3385269e-005 0.58040822
		 0.81432575 3.3385269e-005 0.58040822 0.81432575 3.3385269e-005 -4.3273268e-008 0
		 -1 -8.6546535e-008 0 -1 -4.3273268e-008 0 -1 -1 1.9390438e-005 -9.1167109e-005 -1
		 1.9390438e-005 -9.1167109e-005 -0.96044099 -0.27848351 -9.9626996e-005 -0.96044099
		 -0.27848351 -9.9626996e-005 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 -0.96044612 -0.27846602
		 -0.00011228433 -0.96044612 -0.27846602 -0.00011228433 -1 5.5844976e-005 -0.00011547905
		 -1 5.5844976e-005 -0.00011547905 0 0 -1 0 0 -1 0 0 -1 -0.96044099 -0.27848351 -9.9626996e-005
		 -0.96044099 -0.27848351 -9.9626996e-005 -0.96044612 -0.27846602 -0.00011228433 -0.96044612
		 -0.27846602 -0.00011228433 -4.3273268e-008 0 -1 -4.3273268e-008 0 -1 0 0 -1 0 0 -1
		 1 2.1146795e-006 0 1 2.1146795e-006 0 1 2.1146795e-006 0 1 2.1146795e-006 0 0 0 1
		 0 0 1 0 0 1 0 0 1;
	setAttr -s 25 ".fc[0:24]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 1 2
		f 4 -3 3 4 5
		mu 0 4 3 4 5 6
		f 3 -5 6 7
		mu 0 3 7 8 9
		f 4 8 9 10 11
		mu 0 4 10 11 12 13
		f 3 -2 12 13
		mu 0 3 2 1 14
		f 4 14 15 16 -13
		mu 0 4 15 16 17 18
		f 3 -7 17 -16
		mu 0 3 9 8 19
		f 3 18 -12 19
		mu 0 3 20 21 22
		f 4 20 -20 -11 21
		mu 0 4 23 24 25 26
		f 3 22 -22 -10
		mu 0 3 27 28 29
		f 4 -17 23 -21 24
		mu 0 4 18 17 24 23
		f 4 -14 -25 -23 25
		mu 0 4 2 14 28 27
		f 4 -4 -26 -9 26
		mu 0 4 5 4 11 10
		f 4 -18 -27 -19 -24
		mu 0 4 19 8 21 20
		f 4 27 28 29 30
		mu 0 4 30 31 32 33
		f 3 -8 31 32
		mu 0 3 7 9 34
		f 4 -15 33 34 -32
		mu 0 4 35 36 37 38
		f 3 -1 35 -34
		mu 0 3 1 0 39
		f 3 36 -31 37
		mu 0 3 40 41 42
		f 4 38 -38 -30 39
		mu 0 4 43 44 45 46
		f 3 40 -40 -29
		mu 0 3 47 48 49
		f 4 -35 41 -39 42
		mu 0 4 38 37 44 43
		f 4 -33 -43 -41 43
		mu 0 4 7 34 48 47
		f 4 -6 -44 -28 44
		mu 0 4 50 51 31 30
		f 4 -36 -45 -37 -42
		mu 0 4 39 0 41 40;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "energyBarrier_BL" -p "energyBarrier_center";
	setAttr ".t" -type "double3" -0.5 -0.5 0 ;
createNode locator -n "energyBarrier_BLShape" -p "energyBarrier_BL";
	setAttr -k off ".v";
createNode transform -n "BarrierEmitter_BL_geo" -p "energyBarrier_BL";
	setAttr ".rp" -type "double3" 0.1122027873992919 0.11286618410166838 0 ;
	setAttr ".sp" -type "double3" 0.1122027873992919 0.11286618410166838 0 ;
createNode mesh -n "BarrierEmitter_BL_geoShape" -p "BarrierEmitter_BL_geo";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:24]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 52 ".uvst[0].uvsp[0:51]" -type "float2" 0.26414245 0.019264732
		 0.29441315 0.034398489 0.27927673 0.0041294508 0.23261437 0.16139965 0.23261438 0.13951887
		 0.26067984 0.13951892 0.26067984 0.16139971 0.26414245 0.019264732 0.27927673 0.0041294508
		 0.2944116 0.034400173 0.26067978 0.059193686 0.23261434 0.05919366 0.23261438 0.0055888128
		 0.26067987 0.0055887639 0.34002241 0.034396771 0.39834282 0.049596898 0.39834461
		 0.078728475 0.35106146 0.07872843 0.35106146 0.049596891 0.34002241 0.034400173 0.35970464
		 0.046862066 0.35970458 0.0041296184 0.39015967 0.046860412 0.33065811 0.049596898
		 0.33065805 0.07872843 0.29908636 0.078728445 0.29908642 0.049597003 0.35970458 0.0041296184
		 0.35970452 0.046858817 0.39015961 0.046857111 0.2606796 0.059193656 0.23261434 0.059193697
		 0.23261429 0.0055888053 0.26067969 0.0055887415 0.29440999 0.080009341 0.39834276
		 0.049596854 0.39834443 0.078728504 0.35106152 0.07872837 0.35106152 0.049596928 0.29441321
		 0.080009416 0.30687511 0.099691443 0.26414251 0.099691443 0.30687335 0.13014662 0.33065799
		 0.049596898 0.33065799 0.07872843 0.29908648 0.078728445 0.29908648 0.049596913 0.26414251
		 0.099691443 0.30687183 0.099691451 0.30687007 0.13014653 0.26067978 0.13951889 0.2326144
		 0.13951883;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt[0:21]" -type "float3"  2.1505659 -0.23895667 0 2.1505659 
		-0.23895667 0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 
		0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 0 2.1505659 
		-0.23895667 0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 
		0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 0 2.1505659 
		-0.23895667 0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 
		0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 0 2.1505659 -0.23895667 0;
	setAttr -s 22 ".vt[0:21]"  -2.39018631 0.084505081 -0.078454971 -2.2211628 0.16901398 -0.078454971
		 -2.39018631 0.084505081 0.078454971 -2.22117233 0.16902351 0.078454971 -2.30567455 -9.5367432e-007 0.078454971
		 -2.30567455 -9.5367432e-007 -0.078454971 -2.39018631 0.53359318 0.078454971 -2.39018631 0.53359318 -0.078454971
		 -2.15160656 0.70364666 0.078454971 -2.15158749 0.70364666 -0.078454971 -2.15157795 0.53359318 -0.078454971
		 -2.15159702 0.53359318 0.078454971 -2.2211628 0.42369366 -0.078454971 -2.22118187 0.42369366 0.078454971
		 -1.85659313 0 -0.078454971 -1.85659313 0 0.078454971 -1.68653965 0.23857975 -0.078454971
		 -1.68653965 0.23859787 0.078454971 -1.85659313 0.23860741 0.078454971 -1.85659313 0.23858929 -0.078454971
		 -1.96649265 0.16902351 0.078454971 -1.96649265 0.16900444 -0.078454971;
	setAttr -s 45 ".ed[0:44]"  4 3 0 3 2 0 2 4 0 2 0 0 0 5 0 5 4 0 0 1 0
		 1 5 0 7 6 0 6 8 0 8 9 0 9 7 0 3 13 0 13 2 0 3 1 0 1 12 0 12 13 0 0 12 0 10 7 0 9 10 0
		 11 10 0 8 11 0 6 11 0 12 10 0 11 13 0 6 2 0 7 0 0 15 14 0 14 16 0 16 17 0 17 15 0
		 1 21 0 21 5 0 3 20 0 20 21 0 4 20 0 18 15 0 17 18 0 19 18 0 16 19 0 14 19 0 20 18 0
		 19 21 0 14 5 0 15 4 0;
	setAttr -s 90 ".n[0:89]" -type "float3"  0 0 1 0 0 1 0 0 1 -0.70708323
		 -0.70713037 0 -0.70708323 -0.70713037 0 -0.70708323 -0.70713037 0 -0.70708323 -0.70713037
		 0 0 0 -1 -1.2158727e-008 0 -1 0 0 -1 -0.58040762 0.81432623 -3.5330009e-005 -0.58040762
		 0.81432623 -3.5330009e-005 -0.58040762 0.81432623 -3.5330009e-005 -0.58040762 0.81432623
		 -3.5330009e-005 0 0 1 0 0 1 0 0 1 1 1.864462e-005 9.1167109e-005 1 1.864462e-005
		 9.1167109e-005 0.96044064 -0.27848506 0.00010095722 0.96044064 -0.27848506 0.00010095722
		 0 0 -1 -1.2158727e-008 0 -1 -1.823809e-008 0 -1 -1.823809e-008 0 -1 -1.823809e-008
		 0 -1 0 0 -1 0.96044576 -0.27846718 0.00011677869 0.96044576 -0.27846718 0.00011677869
		 1 5.5844976e-005 0.0001215569 1 5.5844976e-005 0.0001215569 0 0 1 0 0 1 0 0 1 0.96044064
		 -0.27848506 0.00010095722 0.96044064 -0.27848506 0.00010095722 0.96044576 -0.27846718
		 0.00011677869 0.96044576 -0.27846718 0.00011677869 0 0 1 0 0 1 0 0 1 0 0 1 -1 0 0
		 -1 0 0 -1 0 0 -1 0 0 -1.823809e-008 0 -1 -1.2158727e-008 0 -1 -1.823809e-008 0 -1
		 -1.823809e-008 0 -1 0.81432587 -0.58040804 3.3506833e-005 0.81432587 -0.58040804
		 3.3506833e-005 0.81432587 -0.58040804 3.3506833e-005 0.81432587 -0.58040804 3.3506833e-005
		 3.1482017e-010 0 -1 4.3273189e-008 0 -1 3.1482017e-010 0 -1 1.872336e-005 1 -9.1172151e-005
		 1.872336e-005 1 -9.1172151e-005 -0.2784833 0.96044099 -9.9582088e-005 -0.2784833
		 0.96044099 -9.9582088e-005 0 0 1 0 0 1 0 0 1 1.4255677e-008 0 1 1.4255677e-008 0
		 1 2.8511353e-008 0 1 -0.27846539 0.9604463 -0.00011222667 -0.27846539 0.9604463 -0.00011222667
		 5.6080891e-005 1 -0.00011545958 5.6080891e-005 1 -0.00011545958 -2.1321773e-008 0
		 -1 -2.1321773e-008 0 -1 0 0 -1 -0.2784833 0.96044099 -9.9582088e-005 -0.2784833 0.96044099
		 -9.9582088e-005 -0.27846539 0.9604463 -0.00011222667 -0.27846539 0.9604463 -0.00011222667
		 3.1482017e-010 0 -1 3.1482017e-010 0 -1 -2.1321773e-008 0 -1 -2.1321773e-008 0 -1
		 2.1236108e-006 -1 0 2.1236108e-006 -1 0 2.1236108e-006 -1 0 2.1236108e-006 -1 0 0
		 0 1 0 0 1 1.4255677e-008 0 1 1.4255677e-008 0 1;
	setAttr -s 25 ".fc[0:24]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 1 2
		f 4 -3 3 4 5
		mu 0 4 3 4 5 6
		f 3 -5 6 7
		mu 0 3 7 8 9
		f 4 8 9 10 11
		mu 0 4 10 11 12 13
		f 3 -2 12 13
		mu 0 3 2 1 14
		f 4 14 15 16 -13
		mu 0 4 15 16 17 18
		f 3 -7 17 -16
		mu 0 3 9 8 19
		f 3 18 -12 19
		mu 0 3 20 21 22
		f 4 20 -20 -11 21
		mu 0 4 23 24 25 26
		f 3 22 -22 -10
		mu 0 3 27 28 29
		f 4 -17 23 -21 24
		mu 0 4 18 17 24 23
		f 4 -14 -25 -23 25
		mu 0 4 2 14 28 27
		f 4 -4 -26 -9 26
		mu 0 4 5 4 11 10
		f 4 -18 -27 -19 -24
		mu 0 4 19 8 21 20
		f 4 27 28 29 30
		mu 0 4 30 31 32 33
		f 3 -8 31 32
		mu 0 3 7 9 34
		f 4 -15 33 34 -32
		mu 0 4 35 36 37 38
		f 3 -1 35 -34
		mu 0 3 1 0 39
		f 3 36 -31 37
		mu 0 3 40 41 42
		f 4 38 -38 -30 39
		mu 0 4 43 44 45 46
		f 3 40 -40 -29
		mu 0 3 47 48 49
		f 4 -35 41 -39 42
		mu 0 4 38 37 44 43
		f 4 -33 -43 -41 43
		mu 0 4 7 34 48 47
		f 4 -6 -44 -28 44
		mu 0 4 50 51 31 30
		f 4 -36 -45 -37 -42
		mu 0 4 39 0 41 40;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "energyBarrier_coll" -p "energyBarrier_center";
createNode locator -n "energyBarrier_collShape" -p "energyBarrier_coll";
	setAttr -k off ".v";
createNode transform -n "energyBarrier_actual" -p "energyBarrier_center";
createNode locator -n "energyBarrier_actualShape" -p "energyBarrier_actual";
	setAttr -k off ".v";
createNode transform -n "energyBarrier_geo" -p "energyBarrier_actual";
createNode mesh -n "energyBarrier_geoShape" -p "energyBarrier_geo";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0.47869059 0.012621361
		 0.49474671 0.012621361 0.47869059 0.028677464 0.49474671 0.028677464;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 4 ".pt[0:3]" -type "float3"  1.7865597 -0.60752118 0 -2.4964035 
		-0.60752118 0 1.7865597 -2.0875058 0 -2.4964035 -2.0875058 0;
	setAttr -s 4 ".vt[0:3]"  -2.29015636 0.11419295 0 3 0.11419295 0 -2.29015636 2.58083415 0
		 3 2.58083415 0;
	setAttr -s 4 ".ed[0:3]"  0 1 0 1 3 0 3 2 0 2 0 0;
	setAttr -s 4 ".n[0:3]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1;
	setAttr ".fc[0]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 7 ".lnk";
	setAttr -s 7 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr -s 25 ".dli[1:24]"  1 2 3 4 5 6 7 8 
		9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24;
	setAttr -s 25 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode file -n "file1";
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/Project/Assets/Assets/Textures/Weapons/WeaponAtlas.png";
createNode place2dTexture -n "place2dTexture1";
createNode shadingEngine -n "track_military_jump_01SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode displayLayer -n "layer_collider";
	setAttr ".v" no;
	setAttr ".do" 1;
createNode displayLayer -n "layer_placeholders";
	setAttr ".v" no;
	setAttr ".do" 2;
createNode displayLayer -n "layer_road";
	setAttr ".do" 3;
createNode displayLayer -n "layer_reference";
	setAttr ".v" no;
	setAttr ".do" 4;
createNode displayLayer -n "layer_dev";
	setAttr ".v" no;
	setAttr ".do" 5;
createNode displayLayer -n "layer_backup";
	setAttr ".v" no;
	setAttr ".do" 6;
createNode displayLayer -n "layer_gameobjects";
	setAttr ".do" 7;
createNode displayLayer -n "layer_curves";
	setAttr ".v" no;
	setAttr ".do" 8;
createNode lambert -n "lambert2";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "D:/_root/00_VAULT/02_Unity/samRobotRace/Project/Assets/Assets/Textures/menuScene/NeonTable_and_Podium_Diffuse.png";
createNode place2dTexture -n "place2dTexture2";
createNode lambert -n "lambert3";
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
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
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n"
		+ "            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n"
		+ "                -showShapes 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n"
		+ "            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n"
		+ "            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n"
		+ "                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n"
		+ "                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n"
		+ "                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n"
		+ "                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n"
		+ "                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n"
		+ "\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n"
		+ "                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n"
		+ "                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 21 100 -ps 2 79 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n"
		+ "\t\t\t\t\t\"outlinerPanel\"\n\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 1 -size 10 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 420 -ast 1 -aet 500 ";
	setAttr ".st" 6;
createNode animCurveTU -n "energyBarrier_actual_scaleX";
	setAttr ".tan" 2;
	setAttr -s 10 ".ktv[0:9]"  1 1 2 1 5 0.64225993766829026 7 0.9 9 9.9999999999999998e-013
		 12 0.79917207111673738 14 0.86906082890308878 16 0.90751446286610626 18 0.76774773018640952
		 20 1;
createNode animCurveTU -n "energyBarrier_actual_scaleY";
	setAttr ".tan" 2;
	setAttr -s 10 ".ktv[0:9]"  1 1 2 1 5 0.07399140954399773 7 0.9 9 9.9999999999999998e-013
		 12 0.36890731700464269 14 0.092616511536459348 16 0.77375236064963049 18 0.18207112357686522
		 20 1;
createNode lambert -n "track_all_tex_objects_01";
createNode shadingEngine -n "track_all_game_barrier_01aSG";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 4 ".gn";
createNode materialInfo -n "materialInfo4";
createNode file -n "file5";
	setAttr ".ftn" -type "string" "D:/Dropbox/3D Graphics/Projects/Robot Race/Textures/All/track_all_tex_objects_01.tga";
createNode place2dTexture -n "place2dTexture3";
createNode displayLayer -n "layer_coll_wall";
	setAttr ".v" no;
	setAttr ".do" 9;
createNode displayLayer -n "layer_buildings";
	setAttr ".do" 10;
createNode displayLayer -n "layer_jump";
	setAttr ".v" no;
	setAttr ".do" 11;
createNode displayLayer -n "layer_placeholder";
	setAttr ".do" 12;
createNode displayLayer -n "layer_game_objects";
	setAttr ".do" 13;
createNode displayLayer -n "layer_goal";
	setAttr ".do" 14;
createNode displayLayer -n "layer_goal_details";
	setAttr ".v" no;
	setAttr ".do" 15;
createNode displayLayer -n "layer_goal_alpha";
	setAttr ".v" no;
	setAttr ".do" 16;
createNode displayLayer -n "layer_original_UV";
	setAttr ".v" no;
	setAttr ".do" 17;
createNode displayLayer -n "layer_off_road";
	setAttr ".v" no;
	setAttr ".do" 18;
createNode displayLayer -n "layer_highway";
	setAttr ".do" 19;
createNode displayLayer -n "layer_highway_rail";
	setAttr ".do" 20;
createNode displayLayer -n "layer_coll_road";
	setAttr ".v" no;
	setAttr ".do" 21;
createNode displayLayer -n "layer_coll_off";
	setAttr ".do" 22;
createNode displayLayer -n "layer_terrain";
	setAttr ".v" no;
	setAttr ".do" 23;
createNode displayLayer -n "layer_speed_hoop";
	setAttr ".do" 24;
createNode groupId -n "groupId13";
	setAttr ".ihi" 0;
createNode groupId -n "groupId14";
	setAttr ".ihi" 0;
createNode groupId -n "groupId15";
	setAttr ".ihi" 0;
createNode groupId -n "groupId16";
	setAttr ".ihi" 0;
createNode lambert -n "track_all_tex_transparent_01";
createNode shadingEngine -n "track_all_game_barrier_01bSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
createNode file -n "file17";
	setAttr ".ftn" -type "string" "D:/Dropbox/3D Graphics/Projects/Robot Race/Textures/All/track_all_tex_transparent_01.tga";
createNode place2dTexture -n "place2dTexture4";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 7 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 6 ".s";
select -ne :defaultTextureList1;
	setAttr -s 4 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 4 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :initialMaterialInfo;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "groupId15.id" "BarrierEmitter_TR_geoShape.iog.og[0].gid";
connectAttr "track_all_game_barrier_01aSG.mwc" "BarrierEmitter_TR_geoShape.iog.og[0].gco"
		;
connectAttr "groupId13.id" "BarrierEmitter_TL_geoShape.iog.og[0].gid";
connectAttr "track_all_game_barrier_01aSG.mwc" "BarrierEmitter_TL_geoShape.iog.og[0].gco"
		;
connectAttr "groupId16.id" "BarrierEmitter_BR_geoShape.iog.og[0].gid";
connectAttr "track_all_game_barrier_01aSG.mwc" "BarrierEmitter_BR_geoShape.iog.og[0].gco"
		;
connectAttr "groupId14.id" "BarrierEmitter_BL_geoShape.iog.og[0].gid";
connectAttr "track_all_game_barrier_01aSG.mwc" "BarrierEmitter_BL_geoShape.iog.og[0].gco"
		;
connectAttr "energyBarrier_actual_scaleX.o" "energyBarrier_actual.sx";
connectAttr "energyBarrier_actual_scaleY.o" "energyBarrier_actual.sy";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "track_military_jump_01SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "track_all_game_barrier_01aSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "track_all_game_barrier_01bSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "track_military_jump_01SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "track_all_game_barrier_01aSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "track_all_game_barrier_01bSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "track_military_jump_01SG.msg" "materialInfo1.sg";
connectAttr "layerManager.dli[1]" "layer_collider.id";
connectAttr "layerManager.dli[2]" "layer_placeholders.id";
connectAttr "layerManager.dli[3]" "layer_road.id";
connectAttr "layerManager.dli[4]" "layer_reference.id";
connectAttr "layerManager.dli[5]" "layer_dev.id";
connectAttr "layerManager.dli[6]" "layer_backup.id";
connectAttr "layerManager.dli[7]" "layer_gameobjects.id";
connectAttr "layerManager.dli[8]" "layer_curves.id";
connectAttr "file2.oc" "lambert2.c";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "lambert2SG.msg" "materialInfo2.sg";
connectAttr "lambert2.msg" "materialInfo2.m";
connectAttr "file2.msg" "materialInfo2.t" -na;
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr "lambert3.oc" "lambert3SG.ss";
connectAttr "lambert3SG.msg" "materialInfo3.sg";
connectAttr "lambert3.msg" "materialInfo3.m";
connectAttr "file5.oc" "track_all_tex_objects_01.c";
connectAttr "track_all_tex_objects_01.oc" "track_all_game_barrier_01aSG.ss";
connectAttr "BarrierEmitter_TL_geoShape.iog.og[0]" "track_all_game_barrier_01aSG.dsm"
		 -na;
connectAttr "BarrierEmitter_BL_geoShape.iog.og[0]" "track_all_game_barrier_01aSG.dsm"
		 -na;
connectAttr "BarrierEmitter_TR_geoShape.iog.og[0]" "track_all_game_barrier_01aSG.dsm"
		 -na;
connectAttr "BarrierEmitter_BR_geoShape.iog.og[0]" "track_all_game_barrier_01aSG.dsm"
		 -na;
connectAttr "groupId13.msg" "track_all_game_barrier_01aSG.gn" -na;
connectAttr "groupId14.msg" "track_all_game_barrier_01aSG.gn" -na;
connectAttr "groupId15.msg" "track_all_game_barrier_01aSG.gn" -na;
connectAttr "groupId16.msg" "track_all_game_barrier_01aSG.gn" -na;
connectAttr "track_all_game_barrier_01aSG.msg" "materialInfo4.sg";
connectAttr "track_all_tex_objects_01.msg" "materialInfo4.m";
connectAttr "file5.msg" "materialInfo4.t" -na;
connectAttr "place2dTexture3.o" "file5.uv";
connectAttr "place2dTexture3.ofu" "file5.ofu";
connectAttr "place2dTexture3.ofv" "file5.ofv";
connectAttr "place2dTexture3.rf" "file5.rf";
connectAttr "place2dTexture3.reu" "file5.reu";
connectAttr "place2dTexture3.rev" "file5.rev";
connectAttr "place2dTexture3.vt1" "file5.vt1";
connectAttr "place2dTexture3.vt2" "file5.vt2";
connectAttr "place2dTexture3.vt3" "file5.vt3";
connectAttr "place2dTexture3.vc1" "file5.vc1";
connectAttr "place2dTexture3.ofs" "file5.fs";
connectAttr "layerManager.dli[9]" "layer_coll_wall.id";
connectAttr "layerManager.dli[10]" "layer_buildings.id";
connectAttr "layerManager.dli[11]" "layer_jump.id";
connectAttr "layerManager.dli[12]" "layer_placeholder.id";
connectAttr "layerManager.dli[13]" "layer_game_objects.id";
connectAttr "layerManager.dli[14]" "layer_goal.id";
connectAttr "layerManager.dli[15]" "layer_goal_details.id";
connectAttr "layerManager.dli[16]" "layer_goal_alpha.id";
connectAttr "layerManager.dli[17]" "layer_original_UV.id";
connectAttr "layerManager.dli[18]" "layer_off_road.id";
connectAttr "layerManager.dli[19]" "layer_highway.id";
connectAttr "layerManager.dli[20]" "layer_highway_rail.id";
connectAttr "layerManager.dli[21]" "layer_coll_road.id";
connectAttr "layerManager.dli[22]" "layer_coll_off.id";
connectAttr "layerManager.dli[23]" "layer_terrain.id";
connectAttr "layerManager.dli[24]" "layer_speed_hoop.id";
connectAttr "file17.oc" "track_all_tex_transparent_01.c";
connectAttr "file17.ot" "track_all_tex_transparent_01.it";
connectAttr "track_all_tex_transparent_01.oc" "track_all_game_barrier_01bSG.ss";
connectAttr "energyBarrier_geoShape.iog" "track_all_game_barrier_01bSG.dsm" -na;
connectAttr "track_all_game_barrier_01bSG.msg" "materialInfo5.sg";
connectAttr "track_all_tex_transparent_01.msg" "materialInfo5.m";
connectAttr "file17.msg" "materialInfo5.t" -na;
connectAttr "place2dTexture4.o" "file17.uv";
connectAttr "place2dTexture4.ofu" "file17.ofu";
connectAttr "place2dTexture4.ofv" "file17.ofv";
connectAttr "place2dTexture4.rf" "file17.rf";
connectAttr "place2dTexture4.reu" "file17.reu";
connectAttr "place2dTexture4.rev" "file17.rev";
connectAttr "place2dTexture4.vt1" "file17.vt1";
connectAttr "place2dTexture4.vt2" "file17.vt2";
connectAttr "place2dTexture4.vt3" "file17.vt3";
connectAttr "place2dTexture4.vc1" "file17.vc1";
connectAttr "place2dTexture4.ofs" "file17.fs";
connectAttr "track_military_jump_01SG.pa" ":renderPartition.st" -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "track_all_game_barrier_01aSG.pa" ":renderPartition.st" -na;
connectAttr "track_all_game_barrier_01bSG.pa" ":renderPartition.st" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "track_all_tex_objects_01.msg" ":defaultShaderList1.s" -na;
connectAttr "track_all_tex_transparent_01.msg" ":defaultShaderList1.s" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file5.msg" ":defaultTextureList1.tx" -na;
connectAttr "file17.msg" ":defaultTextureList1.tx" -na;
connectAttr "file1.oc" ":lambert1.c";
connectAttr "file1.ot" ":lambert1.it";
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "file1.msg" ":initialMaterialInfo.t" -na;
// End of barrier_object.ma
