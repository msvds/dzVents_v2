return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Leeslamp_Nienke"},
	on = {
		devices = {'Leeslamp Nienke'},
	},

	execute = function(domoticz, device)
		if (domoticz.time.matchesRule('at 7:10-20:20') or domoticz.time.matchesRule('at 23:00-06:00')) then
		
		else
			domoticz.devices('Leeslamp Nienke').switchOff().silent()
		end
	end
}