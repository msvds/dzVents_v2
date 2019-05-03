return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Zijkant"},
	on = {
		devices = {'Lampen Zijkant'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Zijkant').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Zijkant','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Zijkant','Off',0)
		end
	end
}