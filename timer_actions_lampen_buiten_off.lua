-- Timer action

return {
	active = true, -- set to false to disable this script
	logging = {marker = "timer_actions_lampen_buiten_off"},
	on = {
		timer = {'at 00:10'}
	},
	execute = function(domoticz, device)
		local Time = require('Time')

		-- woonkamer bij zonsondergang
		domoticz.helpers.switch_lights(domoticz,'Outside','Off',0)
		domoticz.log('Outside Lights turned off',domoticz.LOG_INFO)
	end
}