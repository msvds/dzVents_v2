local alarm = require "ideAlarmModule"
return {
	active = true, -- set to false to disable this script
	logging = {marker = "alarm_status_indicator"},
	on = {
		devices = {
			alarm.zones('My Home').armingModeTextDevID
		},
	},
	execute = function(domoticz, device)

		-- Handle the Alarm Status Indicator
		if (device.id == alarm.zones('My Home').armingModeTextDevID) then
			if device.state == domoticz.SECURITY_DISARMED then				
				domoticz.devices('Gateway light eetkamer').switchSelector(0)
				domoticz.devices('Gateway light hal boven').switchSelector(0)
				domoticz.devices('Xiaomi RGB Gateway eetkamer').switchOff() -- light off
				domoticz.devices('Xiaomi RGB Gateway hal boven').switchOff() -- light off
				domoticz.log('SECURITY DISARMED',domoticz.LOG_INFO)
			elseif device.state == domoticz.domoticz.SECURITY_ARMEDAWAY then 
				domoticz.devices('Gateway light eetkamer').switchSelector(10)
				domoticz.devices('Gateway light hal boven').switchSelector(10)
				domoticz.log('SECURITY ARMED AWAY',domoticz.LOG_INFO)
			elseif device.state == domoticz.domoticz.SECURITY_ARMEDHOME then 
				domoticz.devices('Gateway light eetkamer').switchSelector(70)
				domoticz.devices('Gateway light hal boven').switchSelector(70)
				domoticz.log('SECURITY ARMED HOME',domoticz.LOG_INFO)
			end
		end

	end
}