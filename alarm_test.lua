return {
	active = true,
	logging = {
		level = domoticz.LOG_INFO,
		marker = "alarm_test"
	},
	on = {
		devices = {
			'Test Switch',
		},
	},
	execute = function(domoticz, device)
		if device.state == 'On' then
			local alarm = require "ideAlarmModule"
			domoticz.log(alarm.statusAll(domoticz),domoticz.LOG_INFO)
		end
	end
}