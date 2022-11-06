if ( isDedicated ) exitWith {};

params [["_medicCargo", objNull], ["_isAreaHeal", false]];

if (isNull _medicCargo) exitWith {};

if (! _isAreaHeal) then {
	[player, player] remoteExec ["ace_medical_treatment_fnc_fullHeal", player];
	[player, 0] remoteExec ["ace_medical_treatment_fnc_setTriageStatus", player];

	[(localize "STR_EDDY_Actions_healSelf_hint")] remoteExec ["hintSilent", player];
} else {
	{
		private _otherPlayer = _x;

		[player, _otherPlayer] remoteExec ["ace_medical_treatment_fnc_fullHeal", _otherPlayer];
		[_otherPlayer, 0] remoteExec ["ace_medical_treatment_fnc_setTriageStatus", _otherPlayer];
		[_otherPlayer, false] remoteExec ["ace_medical_status_fnc_setUnconsciousState", _otherPlayer];

		[format[(localize "STR_EDDY_Actions_healOther_hint"), name player]] remoteExec ["hintSilent", _otherPlayer];
	} forEach (allPlayers inAreaArray [(getPos _medicCargo), 15, 15, 0, false, 7]);

	[(localize "STR_EDDY_Actions_healSelf_hint")] remoteExec ["hintSilent", player];
};
