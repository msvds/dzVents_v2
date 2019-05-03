return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Switch_Hal_Boven"},
	on = {
		devices = {
			'Single Wall Switch Hal Boven'
		},
	},

	execute = function(domoticz, device)
		if domoticz.devices('Lampen zolder').state == 'On' then
			domoticz.devices('Lampen zolder').switchOff()
			domoticz.log('Lampen zolder uitgezet',domoticz.LOG_INFO)
		elseif domoticz.devices('Lampen zolder').state == 'Off' then
			domoticz.devices('Lampen zolder').switchOn()	
			domoticz.log('Lampen zolder aangezet',domoticz.LOG_INFO)
		end	
	end
}