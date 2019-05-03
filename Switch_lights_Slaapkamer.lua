return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Slaapkamer"},
	on = {
		devices = {'Lampen Slaapkamer'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Slaapkamer').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Slaapkamer','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Slaapkamer','Off',0)
		end
	end
}