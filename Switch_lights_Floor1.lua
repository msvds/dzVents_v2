return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Floor1"},
	on = {
		devices = {'Lampen Floor1'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Floor1').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Floor1','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Floor1','Off',0)
		end
	end
}