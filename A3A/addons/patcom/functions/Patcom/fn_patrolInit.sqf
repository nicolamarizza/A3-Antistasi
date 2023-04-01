/*
    Author: [Hazey]
    Description:
		PATCOM Init, starts the Patrol Commander Logic

    Arguments:
    	N/A

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[] call A3A_fnc_patrolInit;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

PATCOM_DEBUG = true; // Enable PATCOM specific debug.
publicVariable "PATCOM_DEBUG";

PATCOM_VISUAL_RANGE = 200; // How far before PATCOM can start to detect enemies.
publicVariable "PATCOM_VISUAL_RANGE";

PATCOM_ARTILLERY_MANAGER = true; //Allow Patcome to control AI Artillery. False is default A3 Artillery AI.
publicVariable "PATCOM_ARTILLERY_MANAGER";

PATCOM_ARTILLERY_DELAY = 5; // How quickly artillery becomes available again after firing in seconds.
publicVariable "PATCOM_ARTILLERY_DELAY";

PATCOM_AI_VEHICLES = false; // Allow AI to man nearby vehicles and put them to use.
publicVariable "PATCOM_AI_VEHICLES";

PATCOM_AI_STATICS = true; // Allow AI to find and arm statics near their group.
publicVariable "PATCOM_AI_STATICS";

PATCOM_AI_STATIC_ARM = 120; // How long AI stay on static weapons after they arm them.
publicVariable "PATCOM_AI_ARM_STATICS";

// This Hashmap acts as a blacklist to remove unwanted buildings
PATCOM_Building_Blacklist = createHashMap;

// Get bad buildings from VarsCommon
{
	PATCOM_Building_Blacklist set [_x, "REMOVED"];
} forEach A3A_buildingBlacklist;

publicVariable "PATCOM_Building_Blacklist";

// This HashMap contains a list of valid garrison positions.
PATCOM_Garrison_Positions = createHashMapFromArray [
	["Land_Cargo_HQ_V1_F", [6,7,8]],
	["Land_Cargo_HQ_V2_F", [6,7,8]],
	["Land_Cargo_HQ_V3_F", [6,7,8]],
	["Land_Medevac_HQ_V1_F", [6,7,8]],
	["Land_Cargo_Tower_V3_F", [15,12,8]],
	["Land_Cargo_Tower_V2_F", [15,12,8]],
	["Land_Cargo_Tower_V1_F", [15,12,8]],
	["Land_Cargo_Patrol_V1_F", [1,0]],
	["Land_Cargo_Patrol_V2_F", [1,0]],
	["Land_Cargo_Patrol_V3_F", [1,0]],
	["Land_CarService_F", [2,5]],
	["Land_u_Barracks_V2_F", [36,37,35,34,32,33,40,44]],
	["Land_i_Barracks_V1_F", [36,37,35,34,32,33,40,44]],
	["Land_i_Barracks_V2_F", [36,37,35,34,32,33,40,44]],
	["Land_BagBunker_Small_F", [2,3]],
	["Land_Barracks_01_dilapidated_F", [0,34,1,18,17,35,36,37,10,11,12,13,14,15,16,19,20,2,3,4,5,6,7,8,9,21,22,23,24,25,26,27,28,29,30,31,32]],
	["Land_BagBunker_01_large_green_F", [1,3,5,0,11,12,6,4,2,7,8,9,10]],
	["Land_BagBunker_01_small_green_F", [2,3]],
	["Land_Cargo_House_V4_F", [1]],
	["Land_Cargo_HQ_V4_F", [2,3,4,5,6,7,8,9,10,11,12,13]],
	["Land_Cargo_Patrol_V4_F", [1,2]],
	["Land_Cargo_Tower_V4_F", [0,5,3,4,6,7,17,1,16,12,13,15,1,2,8,9,10,11,14]],
	["Land_PillboxBunker_01_big_F", [2,0,3,1,4,5]],
	["Land_PillboxBunker_01_hex_F", [0,2,3,1,4]],
	["Land_PillboxBunker_01_rectangle_F", [2,3,4]],
	["Land_GuardTower_01_F", [2,3,4,5]],
	["Land_GuardTower_02_F", [0]],
	["Land_Radar_01_HQ_F", [30,31,32,33,34,35]],
	["land_bunker_garage", [17,13,16,15,14,18]],
	["Land_GuardHouse_03_F", [1,2]],
	["Land_DeerStand_01_F", [1]],
	["Land_DeerStand_02_F", [2]],
	["Land_Sawmill_01_illuminati_tower_F", [0]],
	["Land_Nasypka", [3]],
	["Land_Ind_TankBig", [2,3,4,5,6,7]],
	["Land_Ind_Expedice_1", [7,8,10,6,13,12,11]],
	["Land_A_Office01", [0,1,8,6,9]],
	["Land_A_Crane_02b", [7,1]],
	["Land_A_Crane_02a", [2,3,4,5,6,7]],
	["Land_A_CraneCon", [1,2,3]],
	["Land_A_MunicipalOffice", [15,17,10,9,11,12,13,14]],
	["Land_Smokestack_01_F", [5,6,4]],
	["Land_ControlTower_02_F", [10,9,13,12,8,1]],
	["Land_ServiceHangar_01_L_F", [10,11]],
	["Land_ServiceHangar_01_L_F", [10,9,8]],
	["Land_MobileRadar_01_radar_F", [0,1,2,3,4]],
	["Land_dp_bigTank_F", [0,5,4,3,2,1]],
	["Land_Ind_SiloVelke_01", [7,3,1,4,5,2,6]],
	["Land_Ind_Mlyn_01", [9,5,7,6,4,3]]
];

publicVariable "PATCOM_Garrison_Positions";

PATCOM_Patrol_Animations = [
	//"acts_rifle_operations_back",
	//"acts_rifle_operations_barrel",
	//"acts_rifle_operations_checking_chamber",
	//"acts_rifle_operations_front",
	//"acts_rifle_operations_right",
	//"acts_rifle_operations_left",
	//"acts_rifle_operations_zeroing",
	"acts_ambient_cleaning_nose",
	"acts_ambient_gestures_sneeze",
	"acts_ambient_gestures_tired",
	"acts_ambient_gestures_yawn",
	"acts_ambient_picking_up",
	"acts_ambient_relax_1",
	"acts_ambient_relax_2",
	"acts_ambient_relax_3",
	"acts_ambient_relax_4",
	"acts_ambient_rifle_drop",
	"acts_ambient_shoelaces",
	"acts_ambient_stretching",
	"acts_shieldfromsun_in"
];

publicVariable "PATCOM_Patrol_Animations";

[] spawn {
	while {true} do {
		PATCOM_AI_LOAD = (count allunits);
		publicVariable "PATCOM_AI_LOAD";
		sleep 30;
	};
};

PATCOM_INIT_COMPLETE = true;
publicVariable "PATCOM_INIT_COMPLETE";

Info("PATCOM | Init Complete");