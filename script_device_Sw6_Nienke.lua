return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Sw6_Nienke"},
	on = {
		devices = {
			'Sw6_Nienke'
		},
	},

	execute = function(domoticz, device)
		if (domoticz.time.matchesRule('at 7:10-20:30') or domoticz.time.matchesRule('at 23:00-06:00')) then
			if device.state == 'Double Click' then
				if domoticz.devices('Single Wall Switch Lamp Nienke').state == 'On' then
					domoticz.devices('Single Wall Switch Lamp Nienke').switchOn()
					domoticz.devices('Leeslamp Nienke').switchOff()		
				else
					domoticz.devices('Single Wall Switch Lamp Nienke').switchOff()
					domoticz.devices('Leeslamp Nienke').switchOn()
				end
			elseif device.state == 'Click' then
				domoticz.devices('Leeslamp Nienke').switchOff()
				domoticz.devices('Single Wall Switch Lamp Nienke').switchOff()
				domoticz.log('Lampen kamer Nienke uitgezet',domoticz.LOG_INFO)
			elseif (device.state == 'Long Click') then
				domoticz.devices('Leeslamp Nienke').switchOn()
				domoticz.devices('Single Wall Switch Lamp Nienke').switchOn()	
				domoticz.log('Lampen kamer Nienke aangezet',domoticz.LOG_INFO)
			end
		else
			domoticz.devices('Leeslamp Nienke').switchOff()
			domoticz.devices('Single Wall Switch Lamp Nienke').switchOff()
			domoticz.log('Lampen kamer Nienke uitgezet',domoticz.LOG_INFO)
		end
	end
}
