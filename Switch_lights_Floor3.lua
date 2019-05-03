return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Floor3"},
	on = {
		devices = {'Lampen Floor3'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Floor3').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Floor3','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Floor3','Off',0)
		end
	end
}