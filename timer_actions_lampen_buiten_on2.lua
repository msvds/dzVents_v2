-- Timer action

return {
	active = true, -- set to false to disable this script
	logging = {marker = "timer_actions_lampen_buiten_on2"},
	on = {
		timer = {'at 06:10'}
	},
	execute = function(domoticz, device)
		local Time = require('Time')

		-- woonkamer bij zonsondergang
		if (domoticz.devices('IsDonker (virt)').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Outside','On',0)
			domoticz.log('lampen buiten aangezet ivm zonsondergang en ochtends',domoticz.LOG_INFO)
		
		else
			domoticz.helpers.switch_lights(domoticz,'Outside','Off',0)
		end
	end
}