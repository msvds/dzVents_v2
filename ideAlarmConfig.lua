--[[
Edit this file suit your needs 
Place this file in the dzVents scripts folder using the name ideAlarmConfig.lua
See https://github.com/allan-gam/ideAlarm/wiki/configuration
After editing, always verify that it's valid LUA at http://codepad.org/ (Mark your paste as "Private"!!!)
--]]

local _C = {}

local SENSOR_CLASS_A = 'a' -- Sensor can be triggered in both arming modes. E.g. "Armed Home" and "Armed Away".
local SENSOR_CLASS_B = 'b' -- Sensor can be triggered in arming mode "Armed Away" only.

--[[
-------------------------------------------------------------------------------
DO NOT ALTER ANYTHING ABOVE THIS LINE
-------------------------------------------------------------------------------
--]]

_C.ALARM_TEST_MODE = false -- if ALARM_TEST_MODE is set to true it will prevent audible alarm

-- Interval for how often we shall trigger the script to check if nagging about open doors needs to be made 
_C.NAG_SCRIPT_TRIGGER_INTERVAL = {'every other minute'} -- Format as defined by dzVents timers
-- Interval for how often we shall repeat nagging.
_C.NAG_INTERVAL_MINUTES = 6 

-- Number of seconds which after the alert devices will be turned off
-- automatically even if an active alert situation still exists.
-- 0 = Disable automatic turning off alert devices.   
_C.ALARM_ALERT_MAX_SECONDS = 30

--	Uncomment 3 lines below to override the default logging level
--	_C.loggingLevel = function(domoticz)
--		return domoticz.LOG_INFO -- Select one of LOG_DEBUG, LOG_INFO, LOG_ERROR, LOG_FORCE to override system log level
--	end

--	If You named your Domoticz Security Panel different from "Security Panel", uncomment the line below to specify the name.
-- _C.SECURITY_PANEL_NAME = 'Security Panel Fancy Name'

_C.ALARM_ZONES = {
	-- Start configuration of the first alarm zone
	{
		name='My Home',
		armingModeTextDevID=383,
		statusTextDevID=384,
		entryDelay=120,
		exitDelay=180,
		alertDevices={},--{'Xiaomi RGB Gateway','Schemerlamp deur'},--{'Xiaomi Gateway Alarm Ringtone'},
		sensors = {
			['Eetkamerdeur'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = false, ['enabled'] = true},
			['Zitkamerdeur'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = false, ['enabled'] = true},
			['Beweging balkon'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = false, ['enabled'] = true},
			['Balkondeur slaapkamer'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = true, ['enabled'] = true},
			['Balkondeur Nienke'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = true, ['enabled'] = true},
			['Garage deur'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = true, ['enabled'] = true},
			['Beweging woonkamer'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = true, ['enabled'] = true},
			['Deur garage tuinkant'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = true, ['enabled'] = true},
			--['Beweging naast huis'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = true, ['enabled'] = true},
			['Beweging garage'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = true, ['enabled'] = true},
			['Front door'] = {['class'] = SENSOR_CLASS_A, ['nag'] = true, ['nagTimeoutMins'] = 5, ['armWarn'] = true, ['enabled'] = true},
		},
		armAwayToggleBtn='Toggle Z1 Arm Away',
		armHomeToggleBtn='Toggle Z1 Arm Home',
		mainZone = true,
		canArmWithTrippedSensors = true,
		syncWithDomoSec = true, -- Only a single zone is allowed to sync with Domoticz's built in Security Panel
	},
	-- End configuration of the first alarm zone

	--armingModeTextDevID: (Required) The Domoticz virtual text device idx that You created for this zone. Holds the zones arming mode.
	--statusTextDevID: (Required) The Domoticz virtual text device idx that You created for this zone. Holds the zones event status.
	--entryDelay: (Required) Entry delay in seconds. Valid range: 0-999. Default setting: 15.
	--exitDelay: (Required) Exit delay in seconds. Valid range: 0-999. Default setting: 60.
	--alertDevices: (Elements are Optional) A Lua table containing the named Domoticz devices that shall be automatically switched on during an alert situation. Typically you put your siren devices names here but it can actually be any kind of Domoticz devices that can be switched "On" and "Off". If you have no alert devices or you'd like to control them using custom logic you should supply an empty table {}
	--sensors: See Sensors in the configuration file.
	--armAwayToggleBtn: (Required) Switch device to toggle alarm status between Disarmed and Armed away.
	--armHomeToggleBtn: (Required) Switch device to toggle alarm status between Disarmed and Armed home.
	--mainZone: (Required) Set this to true if this is your main zone. Otherwise set this to false. (The main will be the default zone). You don't need to have a main zone but if you define one, it's important that you define only a single zone as your main zone.
	--canArmWithTrippedSensors: (Required) Set this to true if you want to be able to arm this zone even if sensors are tripped when arming. If set to false, arming attempts with tripped sensors won't be possible and will cause an error.
	--syncWithDomoSec: (Required) Set this to true if you'd like to synchronize arming mode changes with Domoticz's built in Security Panel. Synchronization is bi-directional. Only a single zone is allowed to sync with Domoticz's built in Security Panel.
}

return _C