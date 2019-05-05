return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Switch_Lamp_Lars"},
	on = {
		devices = {
			'Sw Lamp Lars'
		},
	},

	execute = function(domoticz, device)
		if (domoticz.time.matchesRule('at 7:10-21:00') or domoticz.time.matchesRule('at 23:00-06:00')) then
			if device.state == 'Double Click' then
				if domoticz.devices('Lamp Lars').state == 'On' then
					domoticz.devices('Lamp Lars').switchOn()
					domoticz.devices('Leeslamp Lars').switchOff()					
				else
					domoticz.devices('Lamp Lars').switchOff()
					domoticz.devices('Leeslamp Lars').switchOn()
				end	
			elseif device.state == 'Click' then
				domoticz.devices('Leeslamp Lars').switchOff()
				domoticz.devices('Lamp Lars').switchOff()
				domoticz.log('Lampen kamer Lars uitgezet',domoticz.LOG_INFO)
			elseif (device.state == 'Long Click') then
				domoticz.devices('Leeslamp Lars').switchOn()
				domoticz.devices('Lamp Lars').switchOn()	
				domoticz.log('Lampen kamer Lars aangezet',domoticz.LOG_INFO)
			end
		else
			domoticz.devices('Leeslamp Lars').switchOff()
			domoticz.devices('Lamp Lars').switchOff()
			domoticz.log('Lampen kamer Lars uitgezet',domoticz.LOG_INFO)
		end
	end
}
