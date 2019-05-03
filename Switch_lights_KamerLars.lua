return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_KamerLars"},
	on = {
		devices = {'Lampen KamerLars'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen KamerLars').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'KamerLars','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'KamerLars','Off',0)
		end
	end
}