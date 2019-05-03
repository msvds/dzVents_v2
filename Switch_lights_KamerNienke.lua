return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_KamerNienke"},
	on = {
		devices = {'Lampen KamerNienke'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen KamerNienke').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'KamerNienke','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'KamerNienke','Off',0)
		end
	end
}