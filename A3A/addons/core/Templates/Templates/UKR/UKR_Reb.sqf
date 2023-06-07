///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "UKR"] call _fnc_saveToTemplate; 

["flag", "Flag_Ukraine_F"] call _fnc_saveToTemplate;
["flagTexture", "ua_factions_rhs\data\flags\flag_ukraine_01.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "FlagUkraine"] call _fnc_saveToTemplate;

["vehiclesBasic", ["b_afougf_quadbike_01"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["b_afougf_offroad_armored_01", "b_afougf_m1151_base"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["b_afougf_offroad_armored_01_dshkm", "b_afougf_m1151_m2_v1"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["b_afougf_gaz66_truck"]] call _fnc_saveToTemplate;
["vehiclesAT", ["b_afougf_offroad_armored_at"]] call _fnc_saveToTemplate;
["vehiclesAA", ["b_afougf_gaz66_zu23"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["CUP_C_DC3_CIV"]] call _fnc_saveToTemplate;       // replace from civ varient s
["vehiclesCivPlane", ["CUP_C_AN2_CIV", "CUP_C_C47_CIV"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["b_afougf_m1151_med"]] call _fnc_saveToTemplate;


["vehiclesCivCar", ["C_Offroad_01_F", "CUP_O_Hilux_unarmed_CR_CIV", "CUP_C_Golf4_random_Civ", "CUP_C_Octavia_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["C_Truck_02_transport_F", "C_Van_01_box_F", "C_Van_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_412", "CUP_I_Merlin_HC3_PMC_Lux_3C", "CUP_C_Merlin_HC3_CIV_Rescue"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["b_afougf_DSHKM", "b_afougf_DSHkM_Mini_TriPod", "b_afougf_M2_TriPod_high", "b_afougf_M2_TriPod_low", "b_afougf_nsv_tripod", "b_afougf_AGS30_TriPod", "b_afougf_MK19_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["b_afougf_SPG9M", "b_afougf_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["b_afougf_ZU23", "b_afougf_Stinger_AA_pod"]] call _fnc_saveToTemplate;

["staticMortars", ["b_afougf_2b14_82mm", "b_afougf_D30_AT", "b_afougf_D30", "b_afougf_m119"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "CUP_MineE_M"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

///////////////////////////
//  Official Uniforms  //
///////////////////////////

//Uniforms given to AI Rebels
private _rebUniformsAI = [
    // multi
    "U_B_afou_ubacs_mm14", "U_B_afougf_yt_m88str_multicam_01", 
    // forest
    "U_B_afougf_yt_m88str_dub_dpm03", "U_B_afougf_yt_m88str_dub_dpm04", "U_B_afougf_yt_m88str_dubok01"
];

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "rhs_weap_ak74m", "rhs_weap_ak74m_camo",
    "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_camo_AK", "CUP_10x_303_M",
    "rhs_weap_pya", "rhs_mag_9x19_17",
    ["launch_RPG7_F", 5],
    ["rhs_rpg7_PG7VL_mag", 10],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_RGD5", "SmokeShell",
    // backpacks
    "bp_ngu_eagle_green", "bp_ngu_eagle_green_eng", "bp_afougf_eagle_mm14", "bp_afougf_eagle_medic", 
    "bp_afougf_fast_zhaba_01", "bp_afougf_fast_mm14_01",

    // vests multi
    "rhsusf_spcs_ocp_teamleader", "rhsusf_spcs_ocp_squadleader", "rhsusf_spcs_ocp_sniper", "rhsusf_spcs_ocp_rifleman",
    "vest_afou_spcs_multi01", "vest_afou_spcs_multi02", "vest_afougf_gl_mm14",
    // vests forest
    "vest_afou_tacvest_green", "vest_mbav_ngu_light", "vest_afougf_gl_des6col",

    "Binocular"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "tf_anprc155";
    _initialRebelEquipment pushBack "tf_anprc155_coyote";
};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "TFAR_anprc155";
    _initialRebelEquipment pushBack "TFAR_anprc155_coyote";
};

_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

//Uniforms given to Player Rebels
private _rebUniforms = [
    "CUP_I_B_PARA_Unit_2",
    "CUP_I_B_PARA_Unit_6",
    "CUP_I_B_PARA_Unit_9",
    "CUP_U_I_GUE_Anorak_01",
    "CUP_U_I_GUE_Anorak_03",
    "CUP_U_I_GUE_Anorak_02",
    "CUP_U_I_GUE_WorkU_01",
    "CUP_U_I_GUE_WorkU_02",
    "CUP_U_I_GUE_Flecktarn2",
    "CUP_U_I_GUE_Flecktarn3",
    "CUP_U_I_GUE_Flecktarn",
    "CUP_U_I_GUE_Flecktarn4",
    "CUP_U_I_GUE_Woodland1",
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F"
];

_rebUniforms append _rebUniformsAI;

//These Items get added to the Arsenal
["uniforms", _rebUniforms] call _fnc_saveToTemplate;

// Headgear used by Rebell Ai until you have Armored Headgear.
// None since ukr army already has issued helmets
["headgear", []] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem","GreekHead_A3_05",
"GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09",
"Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR","CUP_D_Male04_CZ_ACR","CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniformsAI];
_loadoutData set ["facewear", ["None","CUP_G_Balaclava_blk","CUP_G_Balaclava_oli","CUP_G_Bandanna_aviator","CUP_G_Bandanna_beast",
"CUP_G_Bandanna_blk","CUP_G_Bandanna_khk","CUP_G_Bandanna_oli","CUP_G_Bandanna_shades","CUP_G_Shades_Black"
]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;