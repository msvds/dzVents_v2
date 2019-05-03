-- Timer action

return {
	active = false, -- set to false to disable this script
	logging = {marker = "timer_actions_lampen_woonkamer"},
	on = {
		timer = {'at sunset'}
	},
	execute = function(domoticz, device)
		local Time = require('Time')

		-- woonkamer bij zonsondergang
		domoticz.helpers.switch_lights(domoticz,'Woonkamer','On',0)
		domoticz.log('lampen woonkamer aangezet ivm zonsondergang', domoticz.LOG_INFO)
	end
}