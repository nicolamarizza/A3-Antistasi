/*
    Author: [Hazey]
    Description:
		Patrol Loop, Add's units to Array to be controlled.

    Arguments:
    	N/A

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[] call A3A_fnc_patrolLoop;

    License: MIT License

	Todo: 
		Giddi: Make sleep dynamic with AI population - hazey: Good idea.
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

A3A_Patrol_Loop = [] spawn {
	while {true} do {
		{
			if ((isNull _x) || (({alive _x} count units _x) < 1)) exitWith {
				A3A_Patrol_Controlled_AI deleteAt _forEachIndex;
			};
			private _patcomControlled = _x getVariable ["PATCOM_Controlled", false];
			if (!_patcomControlled) then {
				private _scriptComplete = [_x] call A3A_fnc_patrolGroupVariables;
				waituntil {sleep 1; _scriptComplete};
			};

			if ((side leader _x) == civilian) then {
				[_x] call A3A_fnc_patrolCivilianCommander;
			} else {
				[_x] call A3A_fnc_patrolCommander;
			};
		} forEach A3A_Patrol_Controlled_AI;
        
		sleep 5;
	};
};