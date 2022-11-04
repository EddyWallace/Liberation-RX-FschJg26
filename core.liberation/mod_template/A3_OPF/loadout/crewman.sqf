_unit = _this select 0;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit addWeapon "CUP_arifle_AKS74U";
_unit addPrimaryWeaponItem "CUP_30Rnd_545x39_AK74_plum_M";

for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
_unit addVest "CUP_Vest_RUS_6B45_Sh117_BeigeDigital";
for "_i" from 1 to 3 do { _unit addItemToVest "CUP_30Rnd_545x39_AK74_plum_M";};
for "_i" from 1 to 2 do { _unit addItemToVest "CUP_HandGrenade_RGD5";};
for "_i" from 1 to 2 do { _unit addItemToVest "SmokeShell";};

_unit addHeadgear "H_Tank_black_F";
_unit addGoggles "CUP_RUS_Balaclava_blk_v2";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "CUP_NVG_HMNVS_Hide";
