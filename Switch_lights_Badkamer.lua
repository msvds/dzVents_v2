return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Badkamer"},
	on = {
		devices = {'Lampen Badkamer'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Badkamer').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Badkamer','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Badkamer','Off',0)
		end
	end
}