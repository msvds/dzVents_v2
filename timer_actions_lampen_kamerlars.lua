-- Timer action

return {
	active = true, -- set to false to disable this script
	logging = {marker = "timer_actions_lampen_kamerlars"},
	on = {
		timer = {'at 21:00'}
	},
	execute = function(domoticz, device)
		local Time = require('Time')
		if domoticz.devices('Leeslamp Lars').state == 'On' then
			domoticz.devices('Leeslamp Lars').switchOff()
			domoticz.devices('Lamp Lars').switchOff()	
			domoticz.devices('Leeslamp Lars').switchOn().forSec(20).afterSec(2)
			domoticz.devices('Leeslamp Lars').switchOff().afterSec(30)
			domoticz.log('Lars lampen uitgezet',domoticz.LOG_INFO)
		else
			domoticz.devices('Lamp Lars').switchOff()
		end
	end
}
