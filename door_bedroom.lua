return {
	active = true, -- set to false to disable this script
	logging = {marker = "door_bedroom"},
	on = {
		timer = {'every 5 minutes'},
		--devices = {'Test Switch'},
	},
	execute = function(domoticz, device)
		--1: 5min: door_bedroom_message_interval = 1: message -> door_bedroom_message_interval = 1 - 180/5 = -35
		--2: 10 min: door_bedroom_message_interval = -34: no message
		--3: 15 min: door_bedroom_message_interval = -33: no message
		--...
		--36: 180 min: door_bedroom_message_interval = 0: no message
		--37: 185 min: door_bedroom_message_interval = 1: message -> door_bedroom_message_interval = 1 - 180/5 = -35
		local temp_diff = 7
		local Open_timeout_floor2 = 10
		local Temperature_limit = '12'
		script_interval_minutes = 5
		message_interval_minutes = 180
		domoticz.globalData.door_bedroom_message_interval = domoticz.globalData.door_bedroom_message_interval + 1  
		debug = true
		if debug == true then 
			domoticz.log('domoticz.globalData.OpenC_Slaapkdeur = ' ..domoticz.globalData.OpenC_Slaapkdeur,domoticz.LOG_INFO)
			domoticz.log('domoticz.globalData.door_bedroom_message_interval = ' ..domoticz.globalData.door_bedroom_message_interval,domoticz.LOG_INFO)
			domoticz.log('Open_timeout_floor2 = ' ..Open_timeout_floor2,domoticz.LOG_INFO)
		end
		
		--Do something when outside temp > limit
		if tonumber(domoticz.devices('Temperatuur Buiten').temperature) >  tonumber(Temperature_limit) then
			if (domoticz.globalData.OpenC_Slaapkdeur > Open_timeout_floor2 and domoticz.globalData.door_bedroom_message_interval > 0 and domoticz.devices('SomeoneHome').state == 'On') then
				domoticz.helpers.sendnotification(domoticz,'Slaapkamerdeur open','Deur slaapkamer open voor ' ..domoticz.globalData.OpenC_Slaapkdeur .. ' minuten.')
				--domoticz.helpers.flash_lights(domoticz, domoticz.devices('Schemerlamp deur').state,domoticz.devices('Lamp spoelb keuken').state,domoticz.devices('Lamp boven TV').state,domoticz.devices('Schemerlamp bank').state,domoticz.devices('Lamp hal boven').state,3,5,5)
				domoticz.globalData.door_bedroom_message_interval = domoticz.globalData.door_bedroom_message_interval - (message_interval_minutes/script_interval_minutes)
			end
		end
	end
}