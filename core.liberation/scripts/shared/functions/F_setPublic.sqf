params ["_vehicle"];
if (isNil "_vehicle") exitWith {};

_vehicle setVariable ["GRLIB_vehicle_owner", "public", true];
