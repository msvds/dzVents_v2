return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Leeslamp_Lars"},
	on = {
		devices = {'Leeslamp Lars'},
	},

	execute = function(domoticz, device)
		if (domoticz.time.matchesRule('at 7:10-21:00') or domoticz.time.matchesRule('at 23:00-06:00')) then
		
		else
			domoticz.devices('Leeslamp Lars').switchOff().silent()
		end
	end
}
