return {
	active = true, -- set to false to disable this script
	logging = {marker = "thermostaat"},
	on = {
		timer = {'every 1 minutes'}
	},
	execute = function(domoticz, device)
		local temp_buiten = domoticz.devices(409)
		local Temperature_limit = '18'
		local NM_timeout = 60
		local Open_timeout = 10
		local Time = require('Time')
		debug = false
		--ToonState = '50' -- Manual
		--ToonState = '40' -- Comfort
		--ToonState = '30' -- Home
		--ToonState = '20' -- Sleep
		--ToonState = '10' -- Away
		local ToonScenesSensorName  = 'Toon Temperature' -- Sensor showing current program
		local ToonThermostatSensorName = 'Toon Thermostat' 
		local ToonIP = '192.168.178.20'
		local json = assert(loadfile "/home/pi/domoticz/scripts/lua/JSON.lua")()  -- For Linux (LEDE)

		local handle = assert(io.popen(string.format('curl -m 5 http://%s/happ_thermstat?action=getThermostatInfo', ToonIP)))
		local ThermostatInfo = handle:read('*all')
		handle:close()

		local jsonThermostatInfo = json:decode(ThermostatInfo)

		if jsonThermostatInfo ~= nil then
			local currentSetpoint = tonumber(jsonThermostatInfo.currentSetpoint) / 100
			local currentTemperature = tonumber(jsonThermostatInfo.currentTemp) / 100
			local currentProgramState = tonumber(jsonThermostatInfo.programState)
			local currentActiveState = tonumber(jsonThermostatInfo.activeState)
			local currentNextTime = jsonThermostatInfo.nextTime
			local currentNextSetPoint = tonumber(jsonThermostatInfo.nextSetpoint) / 100
			if debug then domoticz.log('script_time_thermostaat: Huidige programma Toon is '.. currentActiveState,domoticz.LOG_INFO) end
			if debug then domoticz.log('script_time_thermostaat: Huidige setpoint is '.. currentSetpoint,domoticz.LOG_INFO) end

			--Do something when outside temp > limit
			if tonumber(temp_buiten.temperature) >  tonumber(Temperature_limit) then
				if currentActiveState ~=  3 then
					if debug then domoticz.log('script_time_thermostaat: De buiten temperatuur is ' ..temp_buiten.temperature .. ' graden',domoticz.LOG_INFO) end
					--changeSetPoint('12',' omdat het buiten warmer is dan ' ..Temperature_limit .. ' graden',false)
					--domoticz.helpers.changeSetPoint(domoticz,'12',' omdat het buiten warmer is dan ' ..Temperature_limit .. ' graden',false,currentSetpoint,currentActiveState)
					--domoticz.helpers.changeToonScene(domoticz,'10',' omdat het buiten warmer is dan ' ..Temperature_limit .. ' graden',false,currentSetpoint,currentActiveState)
					--0=Off/10=Away/20=Sleep/30=Home/40=Comfort/50=Manual
					domoticz.devices('Toon Scenes').switchSelector(10)
					domoticz.log('Toon Scenes gezet op Away (10) omdat het buiten warmer is dan ' ..Temperature_limit .. ' graden',domoticz.LOG_INFO)
				end
			end
			--Do something when no movement timeout is reached
			if (domoticz.globalData.NMC_Overall > NM_timeout) then
				if currentActiveState ~=  3 then
					if debug then domoticz.log('thermostaat.lua: domoticz.globalData.NMC_Overall: ' ..domoticz.globalData.NMC_Overall,domoticz.LOG_INFO) end
					--domoticz.helpers.changeSetPoint(domoticz,'12','omdat de total no movement timout van ' ..NM_timeout .. ' bereikt is',true,currentSetpoint,currentActiveState)
					--domoticz.helpers.changeToonScene(domoticz,'10','omdat de total no movement timout van ' ..NM_timeout .. ' bereikt is',false,currentSetpoint,currentActiveState)
					--0=Off/10=Away/20=Sleep/30=Home/40=Comfort/50=Manual
					domoticz.devices('Toon Scenes').switchSelector(10)
					domoticz.log('Toon Scenes gezet op Away (10) omdat de total no movement timout van ' ..NM_timeout .. ' bereikt is',domoticz.LOG_INFO)
				end
			end
			--Do something when open doors timeout is reached
			if (domoticz.globalData.OpenC_Floor1 > Open_timeout) then
				if currentActiveState ~=  3 then
					if debug then domoticz.log('thermostaat.lua: domoticz.globalData.OpenC_Floor1: ' ..domoticz.globalData.OpenC_Floor1,domoticz.LOG_INFO) end
					--domoticz.helpers.changeSetPoint(domoticz,'12','omdat de total open timout van ' ..Open_timeout .. ' bereikt is',true,currentSetpoint,currentActiveState)
					--domoticz.helpers.changeToonScene(domoticz,'10','omdat de floor1 open timout van ' ..Open_timeout .. ' bereikt is',false,currentSetpoint,currentActiveState)
					--0=Off/10=Away/20=Sleep/30=Home/40=Comfort/50=Manual
					domoticz.devices('Toon Scenes').switchSelector(10)
					domoticz.log('Toon Scenes gezet op Away (10) omdat de floor1 open timout van ' ..Open_timeout .. ' bereikt is',domoticz.LOG_INFO)
				end
			end			
		else
			domoticz.log('jsonThermostatInfo = nil, nothing done',domoticz.LOG_INFO)
		end
	end
}
