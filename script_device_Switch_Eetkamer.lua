return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Switch_Eetkamer"},
	on = {
		devices = {
			'Single Wall Switch Lampen Eetkamer'
		},
	},

	execute = function(domoticz, device)
		if (domoticz.devices('Yeelight eetkamer 1').state == 'On' or domoticz.devices('Yeelight eetkamer 2').state == 'On') then
			domoticz.helpers.switch_lights(domoticz,'Eetkamer','Off',0)	
		end
		if (domoticz.devices('Yeelight eetkamer 1').state == 'Off' or domoticz.devices('Yeelight eetkamer 2').state == 'Off') then
			domoticz.helpers.switch_lights(domoticz,'Eetkamer','On',0)
		end
	end
}