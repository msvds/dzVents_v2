-- Timer action

return {
	active = true, -- set to false to disable this script
	logging = {marker = "timer_actions_lampen_kamernienke"},
	on = {
		timer = {'at 20:30'}
	},
	execute = function(domoticz, device)
		local Time = require('Time')
		if domoticz.devices('Leeslamp Nienke').state == 'On' then
			domoticz.devices('Leeslamp Nienke').switchOff()
			domoticz.devices('Single Wall Switch Lamp Nienke').switchOff()	
			domoticz.devices('Leeslamp Nienke').switchOn().forSec(20).afterSec(2)
			domoticz.devices('Leeslamp Nienke').switchOff().afterSec(30)
			domoticz.log('Nienke lampen uitgezet',domoticz.LOG_INFO)
		else
			domoticz.devices('Single Wall Switch Lamp Nienke').switchOff()
		end
	end
}
