return {
	active = true,
	logging = {marker = "timer_sunrise2"},
	on = {
		timer = {'every 1 minute between 10 minutes after sunrise and 15 minutes after sunrise'}
	},
	execute = function(domoticz, device)
		if (domoticz.devices('Lux woonkamer').lux > 2) then
			domoticz.helpers.switch_lights(domoticz,'Inside','Off',3)
		end
		domoticz.log('lampen binnen uitgezet ivm zonsopgang',domoticz.LOG_INFO)
		-- Gateway status resetten
		domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(0)
		domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(0)
		domoticz.devices('Gateway light eetkamer').switchSelector(0)--off
		domoticz.devices('Gateway light hal boven').switchSelector(0)--off
		domoticz.log('Gateway status gereset')
	end
}