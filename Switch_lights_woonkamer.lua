return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_woonkamer"},
	on = {
		devices = {'Lampen Woonkamer'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Woonkamer').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Woonkamer','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Woonkamer','Off',0)
		end
	end
}