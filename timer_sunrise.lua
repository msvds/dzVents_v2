return {
	active = true,
	logging = {marker = "timer_sunrise"},
	on = {
		timer = {'every 1 minute between sunrise and 5 minutes after sunrise'}
	},
	execute = function(domoticz, device)
		domoticz.helpers.switch_lights(domoticz,'Outside','Off',0)
		domoticz.log('lampen buiten uitgezet ivm zonsopgang en nacht',domoticz.LOG_INFO)
		-- Gateway status resetten
		domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(0)
		domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(0)
		domoticz.devices('Gateway light eetkamer').switchSelector(0)--off
		domoticz.devices('Gateway light hal boven').switchSelector(0)--off
		domoticz.log('Gateway status gereset')
	end
}