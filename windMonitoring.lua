--[[
windMonitoring.lua by BakSeeDaa
Version 1.0.2
--]]
local WIND_DATA_MAX_AGE = 30
--local ALERT_SENSOR = 'Wind Alert'
--local WIND_DEVICE = 'Wind Klundert'
local WIND_HURRICANE_TEXT = 'Orkaan. Meer dan 32,7 m/s'
local WIND_VIOLENT_STORM_TEXT = 'Zware storm. 28,5–32,6 m/s'
local WIND_STORM_TEXT = 'Storm. 24,5–28,4 m/s'
local WIND_STRONG_GALE_TEXT = 'Halve storm. 20,8–24,4 m/s'
local WIND_FRESH_GALE_TEXT = 'Harde wind. 17,2–20,7 m/s'
local WIND_MODERATE_GALE_TEXT = 'Stevige wind. 13,9–17,1 m/s'
local WIND_STRONG_BREEZE_TEXT = 'Harde bries. 10,8–13,8 m/s'
local WIND_FRESH_BREEZE_TEXT = 'Stevige bries. 8,0–10,7 m/s'
local WIND_MODERATE_BREEZE_TEXT = 'Matig briesje. 5,5–7,9 m/s'
local WIND_GENTLE_BREEZE_TEXT = 'Goed briesje. 3,4–5,4 m/s'
local WIND_CALM_TO_LIGHT_BREEZE_TEXT = 'Kalm tot licht briesje. 0–3,3 m/s'
local WIND_HURRICANE_LEVEL = 32.7
local WIND_VIOLENT_STORM_LEVEL = 28.5
local WIND_STORM_LEVEL = 24.5
local WIND_STRONG_GALE_LEVEL = 20.8
local WIND_FRESH_GALE_LEVEL = 17.2
local WIND_MODERATE_GALE_LEVEL = 13.9
local WIND_STRONG_BREEZE_LEVEL = 10.8
local WIND_FRESH_BREEZE_LEVEL = 8
local WIND_MODERATE_BREEZE_LEVEL = 5.5
local WIND_GENTLE_BREEZE_LEVEL = 3.4

return {
	active = false,
	logging = {marker = "windMonitoring"},
	on = {
		timer = {'every minute'},
		devices = {'Wind Klundert'},
	},
	data = {
		lastSeenHurricane = { history = true, maxItems = 1 },
		lastSeenViolentStorm = { history = true, maxItems = 1 },
		lastSeenStorm = { history = true, maxItems = 1 },
		lastSeenStrongGale = { history = true, maxItems = 1 },
		lastSeenFreshGale = { history = true, maxItems = 1 },
		lastSeenModerateGale = { history = true, maxItems = 1 },
		lastSeenStrongBreeze = { history = true, maxItems = 1 },
		lastSeenFreshBreeze = { history = true, maxItems = 1 },
		lastSeenModerateBreeze = { history = true, maxItems = 1 },
		lastSeenGentleBreeze = { history = true, maxItems = 1 }
	},
	execute = function(domoticz, device, triggerInfo)
		domoticz.log('Wind',domoticz.LOG_INFO)
		local LOG_LEVEL = domoticz.LOG_DEBUG -- Script default log level. You may change this.
		--domoticz.log('triggerInfo.type ' ..triggerInfo.type, LOG_LEVEL)
		--domoticz.log('domoticz.EVENT_TYPE_TIMER ' ..domoticz.EVENT_TYPE_TIMER, LOG_LEVEL)
		if (triggerInfo.type == domoticz.EVENT_TYPE_TIMER) then
			-- Timer event occurred

			-- Init data if missing (e.g. the first time that the scripts runs)
			-- Note that all wind speeds initially will have the current time as "Last Seen", it will cause an alert.
			if (domoticz.data['lastSeenHurricane'].size == 0) then domoticz.data['lastSeenHurricane'].add('Init') end
			if (domoticz.data['lastSeenViolentStorm'].size == 0) then domoticz.data['lastSeenViolentStorm'].add('Init') end
			if (domoticz.data['lastSeenStorm'].size == 0) then domoticz.data['lastSeenStorm'].add('Init') end
			if (domoticz.data['lastSeenStrongGale'].size == 0) then domoticz.data['lastSeenStrongGale'].add('Init') end
			if (domoticz.data['lastSeenFreshGale'].size == 0) then domoticz.data['lastSeenFreshGale'].add('Init') end
			if (domoticz.data['lastSeenModerateGale'].size == 0) then domoticz.data['lastSeenModerateGale'].add('Init') end
			if (domoticz.data['lastSeenStrongBreeze'].size == 0) then domoticz.data['lastSeenStrongBreeze'].add('Init') end
			if (domoticz.data['lastSeenFreshBreeze'].size == 0) then domoticz.data['lastSeenFreshBreeze'].add('Init') end
			if (domoticz.data['lastSeenModerateBreeze'].size == 0) then domoticz.data['lastSeenModerateBreeze'].add('Init') end
			if (domoticz.data['lastSeenGentleBreeze'].size == 0) then domoticz.data['lastSeenGentleBreeze'].add('Init') end

			-- Update the Wind Alert virtual sensor
			local alertLevel = domoticz.ALERTLEVEL_GREY
			local alertText = WIND_CALM_TO_LIGHT_BREEZE_TEXT
			local alertSensor = domoticz.devices('Wind Alert')
			--domoticz.log('domoticz.data[lastSeenHurricane].getLatest().time.minutesAgo' ..domoticz.data['lastSeenHurricane'].getLatest().time.minutesAgo, LOG_LEVEL)
			if (domoticz.data['lastSeenHurricane'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_RED
				alertText = WIND_HURRICANE_TEXT
			elseif (domoticz.data['lastSeenViolentStorm'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_RED
				alertText = WIND_VIOLENT_STORM_TEXT
			elseif (domoticz.data['lastSeenStorm'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_RED
				alertText = WIND_STORM_TEXT
			elseif (domoticz.data['lastSeenStrongGale'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_ORANGE
				alertText = WIND_STRONG_GALE_TEXT
			elseif (domoticz.data['lastSeenFreshGale'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_ORANGE
				alertText = WIND_FRESH_GALE_TEXT
			elseif (domoticz.data['lastSeenModerateGale'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_YELLOW
				alertText = WIND_MODERATE_GALE_TEXT
			elseif (domoticz.data['lastSeenStrongBreeze'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_YELLOW
				alertText = WIND_STRONG_BREEZE_TEXT
			elseif (domoticz.data['lastSeenFreshBreeze'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_GREEN
				alertText = WIND_FRESH_BREEZE_TEXT
			elseif (domoticz.data['lastSeenModerateBreeze'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_GREEN
				alertText = WIND_MODERATE_BREEZE_TEXT
			elseif (domoticz.data['lastSeenGentleBreeze'].getLatest().time.minutesAgo < WIND_DATA_MAX_AGE) then
				alertLevel = domoticz.ALERTLEVEL_GREY
				alertText = WIND_GENTLE_BREEZE_TEXT
			end
			domoticz.log('alertSensor.rawData[1]: '..alertSensor.rawData[1],domoticz.LOG_INFO)
			domoticz.log('alertText: '..alertText,domoticz.LOG_INFO)
			if(alertSensor.rawData[1] ~= alertText) then
				alertSensor.updateAlertSensor(alertLevel, alertText)
			end
		else
			-- Device event occurred
			local sWindDirectionDegrees = tonumber(device.rawData[1])
			local sWindDirection = device.rawData[2]
			local sWindSpeed = tonumber(device.rawData[3]) * 0.1
			local sWindGust = tonumber(device.rawData[4]) * 0.1
			local sWindTemperature = tonumber(device.rawData[5])
			local sWindChill = tonumber(device.rawData[6])
			
			domoticz.log('______________________________________________________________________________________',domoticz.LOG_INFO)
			domoticz.log('Windmeter: Winddirection (in degrees) is: '..sWindDirectionDegrees,domoticz.LOG_INFO)
			domoticz.log('Windmeter: Winddirection is: '..sWindDirection,domoticz.LOG_INFO)
			domoticz.log('Windmeter: Windspeed is: '..sWindSpeed,domoticz.LOG_INFO)
			domoticz.log('Windmeter: Windgust is: '..sWindGust,domoticz.LOG_INFO)
			domoticz.log('Windmeter: Windtemperature is: '..sWindTemperature,domoticz.LOG_INFO)
			domoticz.log('Windmeter: Windchill is: '..sWindChill,domoticz.LOG_INFO)
			domoticz.log('______________________________________________________________________________________',domoticz.LOG_INFO)
			if (sWindGust >= WIND_GENTLE_BREEZE_LEVEL) then domoticz.data['lastSeenGentleBreeze'].add() end
			if (sWindGust >= WIND_MODERATE_BREEZE_LEVEL) then domoticz.data['lastSeenModerateBreeze'].add() end
			if (sWindGust >= WIND_FRESH_BREEZE_LEVEL) then domoticz.data['lastSeenFreshBreeze'].add() end
			if (sWindGust >= WIND_STRONG_BREEZE_LEVEL) then domoticz.data['lastSeenStrongBreeze'].add() end
			if (sWindGust >= WIND_MODERATE_GALE_LEVEL) then domoticz.data['lastSeenModerateGale'].add() end
			if (sWindGust >= WIND_FRESH_GALE_LEVEL) then domoticz.data['lastSeenFreshGale'].add() end
			if (sWindGust >= WIND_STRONG_GALE_LEVEL) then domoticz.data['lastSeenStrongGale'].add() end
			if (sWindGust >= WIND_STORM_LEVEL) then domoticz.data['lastSeenStorm'].add() end
			if (sWindGust >= WIND_VIOLENT_STORM_LEVEL) then domoticz.data['lastSeenViolentStorm'].add() end
			if (sWindGust >= WIND_HURRICANE_LEVEL) then domoticz.data['lastSeenHurricane'].add() end
		end
	end
}