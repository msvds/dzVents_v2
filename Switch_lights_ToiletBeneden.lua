return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_ToiletBeneden"},
	on = {
		devices = {'Lampen ToiletBeneden'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen ToiletBeneden').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'ToiletBeneden','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'ToiletBeneden','Off',0)
		end
	end
}