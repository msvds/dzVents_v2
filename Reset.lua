return {
	active = true, -- set to false to disable this script
	logging = {marker = "Reset"},
	on = {
		devices = {
			'Reset Domoticz'
		},
	},
	execute = function(domoticz, device)
		domoticz.helpers.switch_lights(domoticz,'All','Off')
		domoticz.log('Lampen uitgezet',domoticz.LOG_INFO)
		domoticz.devices('Roomlars-Stat').updateSetPoint(10)
		domoticz.devices('Bathroom-Stat').updateSetPoint(10)
		domoticz.devices('Chillroom-Stat').updateSetPoint(10)
		domoticz.devices('Roomnienke-Stat').updateSetPoint(10)
		domoticz.log('Thermostaat kranen op 10 graden gezet',domoticz.LOG_INFO)
		--0=Off/10=Away/20=Sleep/30=Home/40=Comfort/50=Manual
		domoticz.devices('Toon Scenes').switchSelector(30)
		domoticz.log('Thermostaat op Home gezet',domoticz.LOG_INFO)
		local alarm = require "ideAlarmModule"
		alarm.zones('My Home').disArmZone(domoticz)
		domoticz.log('Alarm uitgezet',domoticz.LOG_INFO)
		-- Gateway status resetten
		domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(0)
		domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(0)
		domoticz.devices('Gateway light eetkamer').switchSelector(0)--off
		domoticz.devices('Gateway light hal boven').switchSelector(0)--off
		domoticz.log('Gateway status gereset',domoticz.LOG_INFO)
		domoticz.devices('Status').switchSelector(40) --0=Off/10=Away/20=Holiday/30=Sleep/40=Home/50=Guests/60=Home no notif
		domoticz.log('Status op Home gezet',domoticz.LOG_INFO)
		domoticz.helpers.switch_lights(domoticz,'All','Off')
	end
}