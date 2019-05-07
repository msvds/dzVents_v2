return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Sw3_bed"},
	on = {
		devices = {
			'Sw3_bed' -- Switch naast bed
		},
	},

	execute = function(domoticz, device)
		local alarm = require "ideAlarmModule"
		if device.state == 'Double Click' then
			-- Beveiliging uitzetten (thuis)
			domoticz.log('1')
			domoticz.devices('Status').switchSelector(40) --0=Off/10=Away/20=Holiday/30=Sleep/40=Home/50=Guests/60=Home no notif
			domoticz.log('2')
			for i=1, alarm.qtyAlarmZones() do
				alarm.zones(i).disArmZone(domoticz)
			end
			domoticz.log('3')
			-- Gateway status resetten
			domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(0)
			domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(0)
			domoticz.devices('Gateway light eetkamer').switchSelector(0)--off
			domoticz.devices('Gateway light hal boven').switchSelector(0)--off
			domoticz.log('4')
			-- Lampen aanzetten
			--if (domoticz.time.isNightTime) then
				domoticz.log('5')
				if domoticz.devices('Yeelight slaapkamer').state == "Off" then
					domoticz.devices('Yeelight slaapkamer').setRGB(255,0,0)
					domoticz.devices('Yeelight slaapkamer').dimTo(10)				
					--domoticz.devices('Yeelight slaapkamer').setKelvin(75)							
					domoticz.devices('Yeelight slaapkamer').setState('On')
				else
					domoticz.devices('Yeelight slaapkamer').switchOff()
					domoticz.devices('Yeelight slaapkamer').setState('Off')
				end
				--domoticz.devices('White Temp Yeelight slaapkamer').dimTo(20)
				--domoticz.devices('Yeelight Dimmer slaapkamer').dimTo(50)
				--domoticz.devices('Yeelight slaapkamer').switchOn().checkFirst()
			--end
		elseif device.state == 'Click' then
			-- Alles uit en beveiliging aanzetten bij gaan slapen (sleep)
			domoticz.devices('Status').switchSelector(30) --0=Off/10=Away/20=Holiday/30=Sleep/40=Home/50=Guests/60=Home no notif
			domoticz.helpers.switch_lights(domoticz,'Inside','Off',0)
			domoticz.devices('Yeelight light slaapkamer').switchSelector(0)
			domoticz.helpers.check_doors_and_windows(domoticz)
			--domoticz.log('Huidige setpoint is '.. domoticz.helpers.currentSetpoint(domoticz))
			--domoticz.helpers.changeSetPoint(domoticz,'10','omdat de gaan slapen knop ingedrukt is',false,domoticz.helpers.currentSetpoint(domoticz))
			--0=Off/10=Away/20=Sleep/30=Home/40=Comfort/50=Manual
			alarm.zones('My Home').armZone(domoticz, domoticz.SECURITY_ARMEDHOME) -- This will  the zone "My Home" to "Armed Home" after the default exit delay
			domoticz.devices('Toon Scenes').switchSelector(20)
			domoticz.log('Toon Scenes gezet op Sleep (20) omdat de gaan slapen knop ingedrukt is',domoticz.LOG_INFO)
			-- Gateway status resetten
			domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(0)
			domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(0)
			domoticz.devices('Gateway light eetkamer').switchSelector(0)--off
			domoticz.devices('Gateway light hal boven').switchSelector(0)--off
		elseif (device.state == 'Long Click') then
			-- Lampen aanzetten
			domoticz.devices('Status').switchSelector(40) --0=Off/10=Away/20=Holiday/30=Sleep/40=Home/50=Guests/60=Home no notif
			if (domoticz.devices('Dimmer bed Martijn').state == 'Off') then
				domoticz.devices('Dimmer bed Martijn').dimTo(20)
				--domoticz.devices('Dimmer bed Martijn').switchOn()
				domoticz.log('Slaapkamerdeur open terwijl het donker is, Nachtlampje Martijn aangezet', domoticz.LOG_INFO)
			end
			if (domoticz.devices('Dimmer bed Suzanne').state == 'Off') then
				domoticz.devices('Dimmer bed Suzanne').dimTo(20)
				--domoticz.devices('Dimmer bed Suzanne').switchOn()
				domoticz.log('Slaapkamerdeur open terwijl het donker is, Nachtlampje Suzanne aangezet', domoticz.LOG_INFO)
			end
			--domoticz.devices('Lamp hal boven').switchOn().checkFirst()
			--domoticz.devices('White Temp Yeelight slaapkamer').dimTo(20)
			--domoticz.devices('Yeelight Dimmer slaapkamer').dimTo(50)
			--domoticz.devices('Yeelight light slaapkamer').switchSelector(10)
			--domoticz.devices('Yeelight slaapkamer').switchOn().checkFirst()
			domoticz.log('Lights turned on',domoticz.LOG_INFO)
		end		
	end
}
