-- Timer action

return {
	active = true, -- set to false to disable this script
	logging = {marker = "timer_actions_lampen_buiten_on"},
	on = {
		timer = {'5 minutes before sunset'}
	},
	execute = function(domoticz, device)
		local Time = require('Time')

		-- woonkamer bij zonsondergang
		domoticz.helpers.switch_lights(domoticz,'Outside','On',0)
		domoticz.log('lampen buiten aangezet ivm zonsondergang en ochtends',domoticz.LOG_INFO)

	end
}