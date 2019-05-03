-- Send a warning when the garage door has been open for more than 30 minutes
-- Switch off when timeout is reached

return {
	active = true, -- set to false to disable this script
	logging = {marker = "door_garage"},
	on = {
		timer = {'every 10 minutes'},
		--devices = {'Test Switch'},
	},
	execute = function(domoticz, device)
		--1: 10min: door_garage_message_interval = 1: message -> door_garage_message_interval = 1 - 180/10 = -17
		--2: 20 min: door_garage_message_interval = -16: no message
		--3: 30 min: door_garage_message_interval = -15: no message
		--...
		--18: 180 min: door_garage_message_interval = 0: no message
		--19: 190 min: door_garage_message_interval = 1: message -> door_garage_message_interval = 1 - 180/10 = -17
		testing_on = false
		local Open_timeout_outside = 10
		script_interval_minutes = 10
		message_interval_minutes = 180
		if tonumber(domoticz.globalData.door_garage_message_interval) >  (message_interval_minutes/script_interval_minutes) then
			domoticz.globalData.door_garage_message_interval = 0
		end
		domoticz.globalData.door_garage_message_interval = domoticz.globalData.door_garage_message_interval + 1  
		local Time = require('Time')
		debug = false
		if (domoticz.devices('Garage deur').state == 'Open' and domoticz.devices('Garage deur').lastUpdate.minutesAgo > 30) then
			if ((domoticz.globalData.OpenC_Deurgarage > Open_timeout_outside and domoticz.globalData.door_garage_message_interval > 0) or (test == true and domoticz.devices('Test Switch').state == 'On')) then				
				domoticz.helpers.sendnotification(domoticz,'Garage deur alarm','De garage deur is voor meer dan 30 minuten open!')
				domoticz.helpers.flash_lights(domoticz,domoticz.devices('Schemerlamp deur').state,domoticz.devices('Lamp spoelb keuken').state,domoticz.devices('Tradfri - Group - boven tv').state,domoticz.devices('Schemerlamp bank').state,domoticz.devices('Lamp hal boven').state,3,3,5)
				domoticz.globalData.door_garage_message_interval = domoticz.globalData.door_garage_message_interval - (message_interval_minutes/script_interval_minutes)
			end
		end
	end
}