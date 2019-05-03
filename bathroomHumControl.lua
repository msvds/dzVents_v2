--[[
bathroomHumControl.lua by BakSeeDaa
Version 1.3.1
	This script controls the humidity in a typical bathroom setting by detecting
	relative rises in humidity in a short period.
--]]

local FAN_DEVICE = 'Centrale Afzuiging Boost' -- Fan device
local FORCE_FAN_DEVICE_1 = 'Wall Switch WC Beneden' --= 'Sw6_Nienke' -- (Optional)
local FORCE_FAN_DEVICE_2 = 'Wall Switch WC Boven' --= 'Sw6_Nienke' -- (Optional)
local FORCE_FAN_TIME = 5 -- Minutes to force the fan when button pushed
local HUMIDITY_SENSORS =  {'Vochtigheid Badkamer Bad','Vochtigheid Badkamer Douche'}
local FAN_DELTA_TRIGGER = 3 -- % Rise in humidity that will trigger the fan
local FAN_MAX_TIME = 90 -- Maximum minutes that the fan can be on in case we never reach the target humidity;default = 60
local TARGET_OFFSET = 3 -- Fan goes off if target + offset is reached;default = 2
local TEST_MODE_HUMIDITY_READING = 0 -- Set to a value between 1 and 100. Set to 0 to disable test mode
local READING_SAMPLES = 15

-- Create the data declarations
local data = {}
for i, device in pairs(HUMIDITY_SENSORS) do
	data[device] = {history = true, maxItems = READING_SAMPLES + 1}
	data['dehumidProgramActive'..i] = {history = true, maxItems = 1} -- Need history to get time stamp
	data['forceFan'] = {history = true, maxItems = 1} -- Need history to get time stamp
	data['targetHum'..i] = {initial=0}
end

return {
	active = true,
	logging = {
		--level = domoticz.LOG_DEBUG, -- Select one of LOG_DEBUG, LOG_INFO, LOG_ERROR, LOG_FORCE to override system log level
		marker = "bathRoom"
	},
	on = {
		devices = {
			FORCE_FAN_DEVICE_1,FORCE_FAN_DEVICE_2
		},
		timer = {
			'every 1 minutes'
		}
	},
	data = data,
	execute = function(domoticz, device, triggerInfo)
		local forceFanReadings = domoticz.data.forceFan

		if (triggerInfo.type == domoticz.EVENT_TYPE_TIMER) then
			local fanCmd = 'Off'
			for i = 1, #HUMIDITY_SENSORS do
				local humidityReadings = domoticz.data[HUMIDITY_SENSORS[i]]
				-- Store the read value in the persistant data
				for j = 1, (humidityReadings.size == 0 and READING_SAMPLES + 1 or 1) do
					humidityReadings.add((TEST_MODE_HUMIDITY_READING == 0
						and domoticz.devices(HUMIDITY_SENSORS[i]).humidity or TEST_MODE_HUMIDITY_READING))
				end

				-- INIT
				local programActiveReadings = domoticz.data['dehumidProgramActive'..i]
				if (programActiveReadings.size == 0) then
					domoticz.log('programActiveReadings, Initialization was needed', domoticz.LOG_INFO)
					programActiveReadings.add(false)
				end
				local targetHum = domoticz.data['targetHum'..i]
				if (targetHum == nil) then
					domoticz.log('targetHum'..i..', Initialization was needed', domoticz.LOG_INFO)
					domoticz.data['targetHum'..i] = 0
					targetHum = 0
				end
				if (forceFanReadings.size == 0) then
					domoticz.log('forceFanReadings, Initialization was needed', domoticz.LOG_INFO)
					forceFanReadings.add('Init')
				end

				local programActiveState = programActiveReadings.getLatest()
				if (programActiveState.data) then -- The fan control program is active
					-- Has the fan control program timed out or have we reached the target humidity?
					local maxTime = (programActiveState.time.minutesAgo > FAN_MAX_TIME)
					local targetHumReached = (humidityReadings.getLatest().data <= targetHum)
					if (maxTime or targetHumReached) then
						domoticz.log('Dehumidification program stops for: '..HUMIDITY_SENSORS[i], domoticz.LOG_INFO)
						domoticz.log('Reason(s): '..(maxTime and 'Max time. ' or '')..(targetHumReached and 'Target humidity reached.' or ''), domoticz.LOG_INFO)
						programActiveReadings.add(false)
						programActiveState = programActiveReadings.getLatest()
					else
						domoticz.log('Dehumidification program is active for: '..HUMIDITY_SENSORS[i], domoticz.LOG_INFO)
						fanCmd = 'On'
					end
				else -- The fan is currently not running under the control of this program
					-- Has there been a significant rise in humidity lately?
					local humDelta = humidityReadings.getLatest().data - humidityReadings.min(2, READING_SAMPLES + 1)
					-- Calculate a target humidity but never try to push humidity below 40
					targetHum = math.max(humidityReadings.min(2, READING_SAMPLES + 1) + TARGET_OFFSET, 40)
					if (humDelta > FAN_DELTA_TRIGGER and humidityReadings.getLatest().data > targetHum) then
						domoticz.data['targetHum'..i] = targetHum
						programActiveReadings.add(true)
						programActiveState = programActiveReadings.getLatest()
						fanCmd = 'On'
						domoticz.log('Dehumidification program starts as a respond to: '..HUMIDITY_SENSORS[i], domoticz.LOG_INFO)
					else
						domoticz.log('Dehumidification program doesn\'t run  for: '..HUMIDITY_SENSORS[i], domoticz.LOG_INFO)
					end
					domoticz.log('targetHum: '..targetHum..', Current humidity: '..humidityReadings.getLatest().data..', humDelta: '..humDelta, domoticz.LOG_INFO)
				end
			end

			if ((forceFanReadings.getLatest().time.minutesAgo < FORCE_FAN_TIME)
			and (forceFanReadings.getLatest().data == 'On')) then fanCmd = 'On' end

			if (domoticz.devices(FAN_DEVICE).state ~= fanCmd) then
				domoticz.log('Turning the fan '..fanCmd, domoticz.LOG_INFO)
				domoticz.devices(FAN_DEVICE).toggleSwitch()
			end
		else
			-- The script gets executed due to a device-change event
			if (device.name == FORCE_FAN_DEVICE_1 and device.state == 'On') then
				forceFanReadings.add('On')
				domoticz.log('The fan has been forced on for '..FORCE_FAN_TIME..'minutes.', domoticz.LOG_INFO)
				-- domoticz.helpers.speak(domoticz, 'joke sting')
				if (domoticz.devices(FAN_DEVICE).state ~= 'On') then domoticz.devices(FAN_DEVICE).switchOn() end
			end
			if (device.name == FORCE_FAN_DEVICE_2 and device.state == 'On') then
				forceFanReadings.add('On')
				domoticz.log('The fan has been forced on for '..FORCE_FAN_TIME..'minutes.', domoticz.LOG_INFO)
				-- domoticz.helpers.speak(domoticz, 'joke sting')
				if (domoticz.devices(FAN_DEVICE).state ~= 'On') then domoticz.devices(FAN_DEVICE).switchOn() end
			end
		end

	end
}