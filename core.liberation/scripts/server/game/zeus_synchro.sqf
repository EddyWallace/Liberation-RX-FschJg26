waitUntil { !isNil "huron_typename" };

_vehicleClassnames = [huron_typename];


{
	_vehicleClassnames = _vehicleClassnames + [_x select 0];
} foreach (light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles) ;

while { true } do {
	0 setRain 0;

	waitUntil { sleep 0.3; count allCurators > 0 };

	_zeusunits = [];
	{
		if ( (side group _x == GRLIB_side_friendly ) && ( _x distance lhd > 500 ) && alive _x ) then {
			_zeusunits pushback _x;
		};
	} foreach allUnits;

	{
		if ((typeof _x in _vehicleClassnames ) && (typeof _x != ammobox_o_typename) && (( _x distance lhd > 500 ) || (typeof _x == huron_typename)) && alive _x ) then {
			_zeusunits pushback _x;
		};
	} foreach vehicles;

	_zeusunits = _zeusunits + switchableUnits;
	_zeusunits = _zeusunits + playableUnits;
	_zeusunits = _zeusunits - (curatorEditableObjects (allCurators select 0));

	_units_to_remove = [];
	{
		if ( !(alive _x) ) then {
			_units_to_remove pushback _x;
		};
	} foreach (curatorEditableObjects (allCurators select 0));

	{
		_zgm = _x;

		// possible fix for missing zeus addons?
		_allAddons = curatorAddons _zgm;
		if (!(_zgm getVariable ["ADDED_CUP_MODS", false])) then {
			removeallCuratorAddons _zgm;
			_zgm addCuratorAddons ("true" configClasses (configfile >> "CfgPatches") apply {configName _x});
			_zgm setVariable ["ADDED_CUP_MODS", true];
		};

		_zgm addCuratorEditableObjects [_zeusunits,true];
		_zgm removeCuratorEditableObjects [_units_to_remove,true];

		_zgm  setCuratorCoef ["edit", 0];
		_zgm  setCuratorCoef ["place", 0];
		_zgm  setCuratorCoef ["synchronize", 0];
		_zgm  setCuratorCoef ["delete", 0];
		_zgm  setCuratorCoef ["destroy", 0];

	} foreach allCurators;

	sleep 10;
};
