#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if (isNil QGVAR(TaskUID)) then { GVAR(TaskUID) = 0 };
if (isNil QGVAR(ChainStates)) then { GVAR(ChainStates) = createHashMap };
if (isNil QGVAR(Settings)) then { GVAR(Settings) = createHashMap };

//no cba fallback
if !("TaskLingerTime" in GVAR(Settings)) then { GVAR(Settings) set ["TaskLingerTime", 180] };
if !("MaxTestMissions" in GVAR(Settings)) then { GVAR(Settings) set ["MaxTestMissions", 3] };

//CBA settings
if (isClass (configfile >> "CBA_Extended_EventHandlers")) then {

    [QGVAR(TaskLingerTime), "SLIDER", ["Task linger time", "Time in minutes a task remains in the task list after completion"], ["Antistasi","Tasks"], [1, 15, 3, 0], true, {
        GVAR(Settings) set ["TaskLingerTime",round _this * 60];
    }] call CBA_fnc_addSetting;

    [QGVAR(MaxTestMissions), "SLIDER", ["Max test missions", "Maximum amount of test missions that can be active at the same time"], ["Antistasi","Tasks"], [0, 10, 3, 0], true, {
        GVAR(Settings) set ["MaxTasksOfCat_Test",round _this];
    }] call CBA_fnc_addSetting;

};
