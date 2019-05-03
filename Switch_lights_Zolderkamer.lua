return {
	active = true, -- set to false to disable this script
	logging = {marker = "Switch_lights_Zolderkamer"},
	on = {
		devices = {'Lampen Zolderkamer'},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Lampen Zolderkamer').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Zolderkamer','On',0)
		else
			domoticz.helpers.switch_lights(domoticz,'Zolderkamer','Off',0)
		end
	end
}