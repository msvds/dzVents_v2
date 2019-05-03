-- Timer action

return {
	active = false, -- set to false to disable this script
	logging = {marker = "timer_actions_lampen_buiten_off2"},
	on = {
		timer = {'5 minutes after sunrise'}
	},
	execute = function(domoticz, device)
		local Time = require('Time')

		domoticz.helpers.switch_lights(domoticz,'Outside','Off',0)
		domoticz.log('Outside Lights turned off ivm zonsopgang',domoticz.LOG_INFO)
	end
}