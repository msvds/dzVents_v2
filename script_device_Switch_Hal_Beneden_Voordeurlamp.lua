return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Switch_Hal_Beneden_Voordeurlamp"},
	on = {
		devices = {
			'Wireless Wall Switch Voordeurlamp'
		},
	},

	execute = function(domoticz, device)
		--213 - Voordeurlamp
		if domoticz.devices(213).state == 'On' then
			domoticz.devices(213).switchOff()
			domoticz.log('Voordeurlamp uitgezet',domoticz.LOG_INFO)
		elseif domoticz.devices(213).state == 'Off' then
			domoticz.devices(213).switchOn()
			domoticz.log('Voordeurlamp aangezet',domoticz.LOG_INFO)
		end	
	end
}