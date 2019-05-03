return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Voortuin1"},
	on = {
		devices = {'Lampen Voortuin'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Voortuin').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Voortuin','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Voortuin','Off',0)
		end
	end
}