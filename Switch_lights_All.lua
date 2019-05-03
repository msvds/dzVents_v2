return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_All"},
	on = {
		devices = {'Lampen All'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen All').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'All','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'All','Off',0)
		end
	end
}