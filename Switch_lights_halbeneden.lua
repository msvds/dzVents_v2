return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_halbeneden"},
	on = {
		devices = {'Lampen HalBeneden'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen HalBeneden').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'HalBeneden','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'HalBeneden','Off',0)
		end
	end
}