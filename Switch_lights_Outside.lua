return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Outside"},
	on = {
		devices = {'Lampen Outside'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Outside').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Outside','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Outside','Off',0)
		end
	end
}