return {
	active = true, -- set to false to disable this script
	logging = {marker = "Aqara_cube_woonkamer"},
	on = {
		devices = {'Aqara Cube woonkamer'},
	},

	execute = function(domoticz, device)
		if (device.state == 'flip90') then
			--activeer sfeerlichten
			domoticz.log('3',domoticz.LOG_INFO)
			domoticz.devices('Tradfri - Group - bar').dimTo(10)
			domoticz.devices('Tradfri - Group - boven tv').dimTo(10)
			domoticz.devices('Tradfri - Group - keuken').dimTo(10)			
			domoticz.devices('Tradfri - Group - hal').dimTo(10)
			domoticz.devices('Tradfri - Group - entree').dimTo(10)
			domoticz.devices('Yeelight eetkamer 1').dimTo(10)										
			domoticz.devices('Yeelight eetkamer 1').setState('On')
			domoticz.devices('Yeelight eetkamer 2').dimTo(10)										
			domoticz.devices('Yeelight eetkamer 2').setState('On')
			domoticz.devices('Normaal licht').setState('Off').silent()			
			domoticz.devices('Fel licht').setState('Off').silent()
			domoticz.devices('Zacht licht').setState('On').silent()
		elseif (device.state == 'flip180') then
			--activeer fel licht
			domoticz.log('2',domoticz.LOG_INFO)
			domoticz.devices('Tradfri - Group - bar').dimTo(100)
			domoticz.devices('Tradfri - Group - boven tv').dimTo(100)
			domoticz.devices('Tradfri - Group - keuken').dimTo(100)			
			domoticz.devices('Tradfri - Group - hal').dimTo(100)
			domoticz.devices('Tradfri - Group - entree').dimTo(100)			
			domoticz.devices('Yeelight eetkamer 1').dimTo(100)										
			domoticz.devices('Yeelight eetkamer 1').setState('On')
			domoticz.devices('Yeelight eetkamer 2').dimTo(100)										
			domoticz.devices('Yeelight eetkamer 2').setState('On')
			domoticz.devices('Fel licht').setState('On').silent()
			domoticz.devices('Normaal licht').setState('Off').silent()
			domoticz.devices('Zacht licht').setState('Off').silent()
		elseif (device.state == 'rotate') then
			domoticz.helpers.switch_lights(domoticz,'All','Off',0)
			domoticz.log('Lampen uitgezet',domoticz.LOG_INFO)
			domoticz.helpers.change_heat(domoticz,'Inside','Away')
			local alarm = require "ideAlarmModule"
			alarm.zones('My Home').disArmZone(domoticz)
			domoticz.log('Alarm uitgezet',domoticz.LOG_INFO)
			-- Gateway status resetten
			domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(0)
			domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(0)
			domoticz.devices('Gateway light eetkamer').switchSelector(0)--off
			domoticz.devices('Gateway light hal boven').switchSelector(0)--off
			domoticz.log('Gateway status gereset',domoticz.LOG_INFO)
		elseif (device.state == 'move') then
			domoticz.helpers.change_heat(domoticz,'Inside','Home')
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
		elseif (device.state == 'tap_twice') then
			--activeer Normaal
			domoticz.log('4',domoticz.LOG_INFO)
			domoticz.devices('Tradfri - Group - bar').dimTo(50)
			domoticz.devices('Tradfri - Group - boven tv').dimTo(50)
			domoticz.devices('Tradfri - Group - keuken').dimTo(50)			
			domoticz.devices('Tradfri - Group - hal').dimTo(50)
			domoticz.devices('Tradfri - Group - entree').dimTo(50)
			domoticz.devices('Yeelight eetkamer 1').dimTo(50)										
			domoticz.devices('Yeelight eetkamer 1').setState('On')
			domoticz.devices('Yeelight eetkamer 2').dimTo(50)										
			domoticz.devices('Yeelight eetkamer 2').setState('On')
			domoticz.devices('Fel licht').setState('Off').silent()
			domoticz.devices('Zacht licht').setState('Off').silent()
		elseif (device.state == 'shake_air') then
			domoticz.helpers.change_heat(domoticz,'Badkamer','Comfort')
		elseif (device.state == 'alert') then
		end
	end
}
