params [
	[ "_source_position", (getpos player) ],
	[ "_includeLHD", false ]
];
private [ "_retvalue" ];

private _fobs = +GRLIB_all_fobs;
if (_includeLHD) then {
	_fobs pushBackUnique (getPos lhd);
};

_retvalue = [0,0,0];
if ( count _fobs > 0 ) then {
	_retvalue = ( [ _fobs , [] , { _source_position distance2D _x } , 'ASCEND' ] call BIS_fnc_sortBy ) select 0;
};

_retvalue
