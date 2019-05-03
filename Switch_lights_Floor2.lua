return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Floor2"},
	on = {
		devices = {'Lampen Floor2'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Floor2').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Floor2','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Floor2','Off',0)
		end
	end
}