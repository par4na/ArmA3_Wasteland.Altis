//	@file Version: 1.0
//	@file Name: planeSpawning.sqf
//	@file Author: AgentRev
//	@file Created: 21/09/2013 17:13
//	@file Args:

if (!isServer) exitWith {};

private "_counter";
_counter = 0;

{
	if (["planeSpawn_", _x] call fn_findString == 0) then
	{
		if (random 1 < 0.75) then // 75% chance spawning
		{
			_noBuzzard = ["_noBuzzard", _x] call fn_findString != -1;
			[markerPos _x, markerDir _x, _noBuzzard] call planeCreation;
			_counter = _counter + 1;
		};
	};
} forEach allMapMarkers;

diag_log format["WASTELAND SERVER - %1 Planes Spawned",_counter];
