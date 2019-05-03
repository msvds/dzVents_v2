local devicesToCheck = {
	{ ['idx'] = 91 , ['threshold'] = 30 }
}
return {
	active = false,
	logging = {marker = "check_dead_devices"},
	on = {
		['timer'] = 'every 5 minutes'
	},
	execute = function(domoticz)

		local message=""

		for i, deviceToCheck in pairs(devicesToCheck) do
			local idx = deviceToCheck['idx']
			local threshold = deviceToCheck['threshold']
			local minutes = domoticz.devices[idx].lastUpdate.minutesAgo
			local name = domoticz.devices[idx].name

			if ( minutes > threshold) then
				message = message .. 'Device ' ..
						name .. ' seems to be dead. No heartbeat for at least ' ..
						minutes .. ' minutes.\r'
			end
		end

		if (string.len(message) > 5 and domoticz.devices('Notifications').level == 20) then			
			domoticz.log('Dead devices found: ' .. message, domoticz.LOG_ERROR)
			domoticz.notify('Dead devices','Dead devices found: ' .. message,domoticz.PRIORITY_LOW)
			domoticz.devices('Status Notifications').updateText(message).silent()
		end
	end
}