return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Achtertuin"},
	on = {
		devices = {'Lampen Achtertuin'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Achtertuin').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Achtertuin','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Achtertuin','Off',0)
		end
	end
}