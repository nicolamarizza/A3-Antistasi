/*
    Author: [Hazey]
    Description:
		Send group to search a nearby building.

    Arguments:
        <Group> Group you want to search building.

    Return Value:
    	<BOOL>

    Scope: Any
    Environment: Any
    Public: No

    Example: 

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group"];

// Get nearestBuilding around group leader to search.
private _buildings = nearestObjects [leader _group, ["House", "Building"], 50];

// Exit if no buildings are found around group leader.
if (count _buildings == 0) exitwith {};

// Get random building inside the building array.
private _building = selectRandom _buildings;

// Exit if for some reason the group leader is further than 250m of the building.
if ((leader _group) distance _building > 250) exitwith {};

[_group, _building] spawn {
    params ["_group", "_building"];

	ServerDebug_2("PATCOM | Group: %1 | Searching Building: %2", _group, _building);

    private _leader = leader _group;
	_group lockWP true;

    // Add a waypoint to regroup after the search
	[_group, "MOVE", "PATCOM_HOUSE_SEARCH", getPos _building, -1, 50] call A3A_fnc_patrolCreateWaypoint;

    // Prepare group to search
    _group setBehaviour "AWARE";
    _group setFormDir ([_leader, _building] call BIS_fnc_dirTo);

    // Search while there are still available positions
    private _positions = _building buildingPos -1;
    while {_positions isNotEqualTo []} do {

        // Update units in case of death
        private _units = units _group;

        // Abort search if the group has no units left
        if (_units isEqualTo []) exitWith {};

        // Send all available units to the next available position
        {
            if (_positions isEqualTo []) exitWith {};

            if (unitReady _x) then {
                private _pos = _positions deleteAt 0;
                _x doMove _pos;
                sleep 2;
            };
        } forEach _units;
    };
    _group lockWP false;
	_group setBehaviour "SAFE";

	// We set this waypoint quickly to leave the area. Hopefully this will help with units that get stuck
	private _nextWaypoint = [getPos (leader _group), 50, 100, 0, 0, -1, 0, getPos (leader _group)] call A3A_fnc_getSafeSpawnPos;
	[_group, "MOVE", "PATCOM_PATROL_AREA", _nextWaypoint, -1, 50] call A3A_fnc_patrolCreateWaypoint;
};