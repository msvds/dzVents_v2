return {
	active = true,
	logging = {marker = "auto_disarm_alarm"},
	on = {
		timer = {
			'at 6:00'
		}
	},

	execute = function(domoticz, _)
		local alarm = require "ideAlarmModule"

		if (domoticz.devices('SomeoneHome').state == 'On' 
		and (alarm.zones('My Home').armingMode(domoticz) ~= domoticz.SECURITY_DISARMED)) then
			alarm.zones('My Home').disArmZone(domoticz)
		end
	end
}