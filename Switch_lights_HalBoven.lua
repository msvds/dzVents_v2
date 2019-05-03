return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_HalBoven1"},
	on = {
		devices = {'Lampen HalBoven'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen HalBoven').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'HalBoven','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'HalBoven','Off',0)
		end
	end
}