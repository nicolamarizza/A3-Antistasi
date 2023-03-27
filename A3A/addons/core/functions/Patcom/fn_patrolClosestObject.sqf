/*
    Author: [Hazey]
    Description:
		Checks closest object from an array of objects.

    Arguments:
    	

    Return Value:
    	

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		

    License: MIT License

	Notes:
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_list", "_object", ["_order",true]];

private _position = [0,0,0];
if (isNil "_object" || {isNil "_list"}) exitWith {
	_closestObject = [0,0,0];
	_closestObject
};

switch (TypeName _object) do {
    case "OBJECT": {_position = getPosATL _object;};
    case "STRING": {_position = getMarkerPos _object;}; 
    case "ARRAY": {_position = _object;}; 
    case "GROUP": {_position = (getPosATL (leader _object));}; 
};

private _distanceArray = [];
private _newObjectDistance = 0;

{
	if !(isNil "_x") then {
		_compareObjectPos = [0,0,0];
		switch (TypeName _x) do {
				case "OBJECT": {_compareObjectPos = getPosATL _x;};
				case "STRING": {_compareObjectPos = getMarkerPos _x;}; 
				case "ARRAY": {_compareObjectPos = _x;}; 
				case "GROUP": {_compareObjectPos = (getPosATL (leader _x));}; 
		};
		_newObjectDistance = _compareObjectPos distance2D _position;
		_distanceArray pushback [_newObjectDistance, _x];
	};
} forEach _list;

_distanceArray sort _order;

private _closestObject = ((_distanceArray # 0) # 1);

if (isNil "_closestObject") then {
	_closestObject = [0,0,0];
};
_closestObject