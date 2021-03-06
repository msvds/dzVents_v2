return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Sw5_garage"},
	on = {
		devices = {
			'Sw5_garage' -- Switch garage
		},
	},

	execute = function(domoticz, device)
		local alarm = require "ideAlarmModule"
		if device.state == 'Double Click' then
			-- Beveiliging uitzetten (thuis)
			domoticz.devices('Status').switchSelector(40) --0=Off/10=Away/20=Holiday/30=Sleep/40=Home/50=Guests/60=Home no notif
			for i=1, alarm.qtyAlarmZones() do
				alarm.zones(i).disArmZone(domoticz)
			end
			-- Gateway status resetten
			domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(0)
			domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(0)
			domoticz.devices('Gateway light eetkamer').switchSelector(0)--off
			domoticz.devices('Gateway light hal boven').switchSelector(0)--off
			-- Lampen aanzetten
			if (domoticz.time.isNightTime) then
				domoticz.devices('Status').switchSelector(40) --0=Off/10=Away/20=Holiday/30=Sleep/40=Home/50=Guests/60=Home no notif
				domoticz.helpers.switch_lights(domoticz,'Outside','On',0)
				domoticz.log('Outside Lights turned on',domoticz.LOG_INFO)
			end
		elseif device.state == 'Click' then
			-- Alles uit en beveiliging aanzetten bij gaan weggaan (away)
			domoticz.devices('Status').switchSelector(10) --0=Off/10=Away/20=Holiday/30=Sleep/40=Home/50=Guests/60=Home no notif
			domoticz.helpers.switch_lights(domoticz,'Inside','Off',0)
			domoticz.helpers.switch_lights(domoticz,'Outside','Off',0)
			domoticz.helpers.check_doors_and_windows(domoticz)
			--domoticz.log('Huidige setpoint is '.. domoticz.helpers.currentSetpoint(domoticz))
			--domoticz.helpers.changeSetPoint(domoticz,'10','omdat de gaan weggaan knop ingedrukt is',false,domoticz.helpers.currentSetpoint(domoticz))
			--0=Off/10=Away/20=Sleep/30=Home/40=Comfort/50=Manual
			domoticz.devices('Toon Scenes').switchSelector(20)
			domoticz.log('Toon Scenes gezet op Sleep (20) omdat de gaan slapen knop ingedrukt is',domoticz.LOG_INFO)
			alarm.zones('My Home').armZone(domoticz, domoticz.SECURITY_ARMEDAWAY) -- This will  the zone "My Home" to "Armed Away" after the default exit delay
		elseif (device.state == 'Long Click') then
			-- Lampen aanzetten
			domoticz.devices('Status').switchSelector(40) --0=Off/10=Away/20=Holiday/30=Sleep/40=Home/50=Guests/60=Home no notif
			domoticz.helpers.switch_lights(domoticz,'Outside','On',0)
			domoticz.log('Outside Lights turned on',domoticz.LOG_INFO)
		end		
	end
}
