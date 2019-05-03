return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Switch_Hal_Beneden_Lamp_Hal_Boven"},
	on = {
		devices = {
			'Wireless Wall Switch Hal Beneden Lampen Hal Boven'
		},
	},

	execute = function(domoticz, device)
		if domoticz.devices('Lamp hal boven').state == 'On' then
			domoticz.devices('Lamp hal boven').switchOff()
			domoticz.log('Lampen hal boven uitgezet',domoticz.LOG_INFO)
		elseif domoticz.devices('Lamp hal boven').state == 'Off' then
			domoticz.devices('Lamp hal boven').switchOn()
			domoticz.log('Lampen hal boven aangezet',domoticz.LOG_INFO)
		end	
	end
}