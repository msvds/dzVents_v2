return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_ToiletBoven"},
	on = {
		devices = {'Lampen ToiletBoven'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen ToiletBoven').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'ToiletBoven','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'ToiletBoven','Off',0)
		end
	end
}