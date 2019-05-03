return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Logeerkamer"},
	on = {
		devices = {'Lampen Logeerkamer'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Logeerkamer').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Logeerkamer','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Logeerkamer','Off',0)
		end
	end
}