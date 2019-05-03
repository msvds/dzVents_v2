return {
	active = true,
	logging = {marker = "test_alerts"},
	on = {
		['timer'] = {
			--'at 23:00 on fri'
		}
	},
	execute = function(domoticz, device)
		activate_test = true
		local alarm = require "ideAlarmModule"
		if (activate_test == true) then
			alarm.testAlert(domoticz)
		end
	end
}