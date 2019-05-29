return {
	logging = {marker = "ToonGetInfo"},
	on = {
		timer = {
			'every minute'
		}
	},
	execute = function(domoticz)
        local ToonThermostatSensorName = domoticz.variables('UV_ToonThermostatSensorName').value -- Sensor showing current setpoint
        local ToonTemperatureSensorName = domoticz.variables('UV_ToonTemperatureSensorName').value -- Sensor showing current room temperature
        local ToonScenesSensorName  = domoticz.variables('UV_ScenesSensorName').value -- Sensor showing current program
        local ToonAutoProgramSensorName = domoticz.variables('UV_ToonAutoProgramSensorName').value -- Sensor showing current auto program status
        local ToonProgramInformationSensorName = domoticz.variables('UV_ToonProgramInformationSensorName').value -- Sensor showing displaying program information status
        local ToonIP = domoticz.variables('UV_ToonIP').value
        local DomoticzIP = '192.168.190.2'
		local ToonBoilerTempIn = domoticz.variables('UV_ToonboilerInTempName').value -- Sensor showing water temp return
        local ToonBoilerTempOut = domoticz.variables('UV_ToonboilerOutTempName').value -- Sensor showing current water temp out
        local ToonBoilerPressure = domoticz.variables('UV_ToonboilerPressure').value -- Sensor showing current room temperature
        local ToonBoilerModulation = domoticz.variables('UV_ToonboilerModulationLevel').value -- Sensor showing current Boiler Modulation
		local ToonBurnerName = domoticz.variables('UV_ToonBurnerName').value
    	local ToonBoilerSetpoint = domoticz.variables('UV_ToonBoilerTempSetpointSensorName').value  -- Sensor showing current boiler set point water temp out
        local P1SmartMeterPower     = domoticz.variables('UV_P1SmartMeterElectra').value
		local P1SmartMeterGas1      = domoticz.variables('UV_P1SmartMeterGasMeterStand').value
		-- Handle json
        --local json = assert(loadfile "C:\\Program Files (x86)\\Domoticz\\scripts\\lua\\json.lua")()  -- For Windows
        local json = assert(loadfile "/home/pi/domoticz/scripts/lua/JSON.lua")()  -- For Linux
        
        local handle = assert(io.popen(string.format('curl http://%s/happ_thermstat?action=getThermostatInfo', ToonIP)))
        local ThermostatInfo = handle:read('*all')
        handle:close()
        
        local jsonThermostatInfo = json:decode(ThermostatInfo)
        
        if jsonThermostatInfo == nil then
            return
        end
		
		local handle2 = assert(io.popen(string.format('curl http://%s/boilerstatus/boilervalues.txt', ToonIP)))
        local BoilerInfo = handle2:read('*all')
        handle2:close()
		
        -- JSON data from Toon contains a extra "," which should not be there.
        BoilerInfo = string.gsub(BoilerInfo, ",}", "}")
        jsonBoilerInfo = json:decode(BoilerInfo)
				
		-- http://IP_TOON/hdrv_zwave?action=getDevices.json 
        local handle4 = assert(io.popen(string.format('curl http://%s/hdrv_zwave?action=getDevices.json', ToonIP)))
        local GasPowerInfo = handle4:read('*all')
        handle4:close()
        
        -- JSON data from Toon contains a extra "." which should not be there.
        GasPowerInfo = string.gsub(GasPowerInfo, "dev_3.", "dev_3")
        GasPowerInfo = string.gsub(GasPowerInfo, "dev_3:", "dev_3\":")
        
        local jsonGasPower = json:decode(GasPowerInfo)
        
        domoticz.log(jsonGasPower,domoticz.LOG_INFO)
		local CurrentElectricityFlowHoog = tonumber(jsonGasPower.dev_35.CurrentElectricityFlow )
		local CurrentElectricityQuantityHoog = tonumber(jsonGasPower.dev_35.CurrentElectricityQuantity)
		local CurrentElectricityFlowLaag = tonumber(jsonGasPower.dev_33.CurrentElectricityFlow )
		local CurrentElectricityQuantityLaag = tonumber(jsonGasPower.dev_33.CurrentElectricityQuantity)
		local CurrentGasFlow = tonumber(jsonGasPower.dev_31.CurrentGasFlow)
		local CurrentGasQuantity = tonumber(jsonGasPower.dev_31.CurrentGasQuantity)
		local CurrentElectricityQuantity =   CurrentElectricityFlowHoog + CurrentElectricityFlowLaag
		local CurrentElectricityDeliveredLaag = 0
		local CurrentElectricityDeliveredHoog = 0
		local totalDeliveredPower = 0
		domoticz.log(CurrentElectricityFlowHoog,domoticz.LOG_INFO)
		domoticz.log(CurrentElectricityQuantityHoog,domoticz.LOG_INFO)
		domoticz.log(CurrentElectricityFlowLaag,domoticz.LOG_INFO)
		domoticz.log(CurrentElectricityQuantityLaag,domoticz.LOG_INFO)
		domoticz.log(CurrentGasFlow,domoticz.LOG_INFO)
		domoticz.log(CurrentGasQuantity,domoticz.LOG_INFO)		
		domoticz.log(CurrentElectricityQuantity,domoticz.LOG_INFO)
		domoticz.devices(P1SmartMeterPower).updateP1(CurrentElectricityQuantityLaag, CurrentElectricityQuantityHoog, CurrentElectricityDeliveredLaag, CurrentElectricityDeliveredHoog, CurrentElectricityQuantity, totalDeliveredPower).silent()
        
        domoticz.devices(P1SmartMeterGas1).updateGas(CurrentGasQuantity).silent()
        
		-- Update the Boiler Water In to current value
--        local currentboilerInTemp = tonumber(jsonBoilerInfo.boilerInTemp)
--       if domoticz.utils.round(domoticz.devices(ToonBoilerTempIn).temperature,0) ~= domoticz.utils.round(currentboilerInTemp,0) then
--             domoticz.log('Updating Boiler Water In to current value: ' ..currentboilerInTemp)
--            domoticz.devices(ToonBoilerTempIn).updateTemperature(currentboilerInTemp).silent()
--        end
        
		-- Update the Boiler water Out to current value
--     	local currentboilerOutTemp = tonumber(jsonBoilerInfo.boilerOutTemp)
--        if domoticz.utils.round(domoticz.devices(ToonBoilerTempOut).temperature,0) ~= domoticz.utils.round(currentboilerOutTemp,0) then
--            domoticz.log('Updating Boiler Water Out to current value: ' ..currentboilerOutTemp)
--            domoticz.devices(ToonBoilerTempOut).updateTemperature(currentboilerOutTemp).silent()
--        end
        
	-- Update the Boiler water Pressure to current value
--        local currentBoilerPressure = tonumber(jsonBoilerInfo.boilerPressure)
--        if domoticz.utils.round(domoticz.devices(ToonBoilerPressure)._nValue,0) ~= domoticz.utils.round(currentBoilerPressure,0) then
--            domoticz.log('Updating Boiler Pressure to current value: ' ..currentBoilerPressure)
--            domoticz.devices(ToonBoilerPressure).updatePressure(currentBoilerPressure).silent()
--        end
		
		
        local currentSetpoint = tonumber(jsonThermostatInfo.currentSetpoint) / 100
		if currentSetpoint == nil then
			return
		end
        local currentTemperature = tonumber(jsonThermostatInfo.currentTemp) / 100
        local currentProgramState = tonumber(jsonThermostatInfo.programState)
	    if currentProgramState == 0 then currentProgramState = 10 -- No
		elseif currentProgramState == 1 then currentProgramState = 20 -- Yes
		elseif currentProgramState == 2 then currentProgramState = 30 -- Temporary       
	    end      
        local currentActiveState = tonumber(jsonThermostatInfo.activeState)
		if currentActiveState == -1 then currentActiveState = 50 -- Manual
		elseif currentActiveState == 0 then currentActiveState = 40 -- Comfort
		elseif currentActiveState == 1 then currentActiveState = 30 -- Home
		elseif currentActiveState == 2 then currentActiveState = 20 -- Sleep
		elseif currentActiveState == 3 then currentActiveState = 10 -- Away
		end
		
		
		
--		-- Update the toon burner selector to current program state
--        local currentBurnerInfo = tonumber(jsonThermostatInfo.burnerInfo)   
--        local CurrentToonBurnerValue = domoticz.devices(ToonBurnerName).level
  
--        if currentBurnerInfo == 0 then currentBurnerInfo = 0 -- uit
--            elseif currentBurnerInfo == 1 then currentBurnerInfo = 10 -- cv aan
--            elseif currentBurnerInfo == 2 then currentBurnerInfo = 20 -- warmwater aan<br>            elseif currentBurnerInfo == 3 then currentBurnerInfo = 10 -- voorverwarmen volgend setpoint
--        end
            
--        if CurrentToonBurnerValue ~= currentBurnerInfo then  -- Update toon burner selector if it has changed
--            domoticz.log('Updating Toon burner info:')
--            domoticz.devices(ToonBurnerName).switchSelector(currentBurnerInfo)
--        end
                    
        -- Update the modulation level of the burner
--        local currentModulationLevel = tonumber(jsonThermostatInfo.currentModulationLevel)
--        if domoticz.devices(ToonBoilerModulation).percentage + 1 ~= currentModulationLevel + 1 then 
--            domoticz.log('Updating the Modulation sensor to new value: ' ..currentModulationLevel)
--            domoticz.devices(ToonBoilerModulation).updatePercentage(currentModulationLevel)
--        end
        
         -- Update the temperature Boiler setpoint to current boiler set point
--      local currentInternalBoilerSetpoint = jsonThermostatInfo.currentInternalBoilerSetpoint+1
--        if domoticz.utils.round(domoticz.devices(ToonBoilerSetpoint).temperature, 1) ~= domoticz.utils.round(currentInternalBoilerSetpoint, 1) then 
--            domoticz.log('Updating the Boiler internal temperature setpoint to new value: ' ..currentInternalBoilerSetpoint)
--            domoticz.devices(ToonBoilerSetpoint).updateTemperature(currentInternalBoilerSetpoint)
--        end
		
		

        ----
        
	domoticz.log('currentSetpoint: ' ..currentSetpoint,domoticz.LOG_INFO)
	domoticz.log('currentActiveState: ' ..currentActiveState,domoticz.LOG_INFO)
	domoticz.log('currentProgramState: ' ..currentProgramState,domoticz.LOG_INFO)
	domoticz.log('currentTemperature: ' ..currentTemperature,domoticz.LOG_INFO)
		
        -- Update the thermostat sensor to current setpoint
        if domoticz.devices(ToonThermostatSensorName).setPoint*100 ~= currentSetpoint*100 then
            domoticz.log('Updating thermostat sensor to new set point: ' ..currentSetpoint,domoticz.LOG_INFO)
            domoticz.devices(ToonThermostatSensorName).updateSetPoint(currentSetpoint).silent()
        end
        

        -- Update the temperature sensor to current room temperature
        if domoticz.utils.round(domoticz.devices(ToonTemperatureSensorName).temperature, 1) ~= domoticz.utils.round(currentTemperature, 1) then 
            domoticz.log('Updating the temperature sensor to new value: ' ..currentTemperature,domoticz.LOG_INFO)
            domoticz.devices(ToonTemperatureSensorName).updateTemperature(currentTemperature)
        end
        
        -- Update the toon scene selector sensor to current program state
        if domoticz.devices(ToonScenesSensorName).level ~= currentActiveState then  -- Update toon selector if it has changed
            domoticz.log('Updating Toon Scenes selector to: '..currentActiveState,domoticz.LOG_INFO)
            domoticz.devices(ToonScenesSensorName).switchSelector(currentActiveState).silent()
        end
        
        -- Updates the toon auto program switch 
        if domoticz.devices(ToonAutoProgramSensorName).level ~= currentProgramState then -- Update toon auto program selector if it has changed
            domoticz.log('Updating Toon Auto Program selector to: '..currentProgramState,domoticz.LOG_INFO)
            domoticz.devices(ToonAutoProgramSensorName).switchSelector(currentProgramState).silent()
        end
        
        -- Updates the toon program information text box				
        local currentNextTime = jsonThermostatInfo.nextTime
        local currentNextSetPoint = tonumber(jsonThermostatInfo.nextSetpoint) / 100
        local currentBoiletSetPoint = jsonThermostatInfo.currentInternalBoilerSetpoint
        if currentNextTime == 0 or currentNextSetPoint == 0 then
            ToonProgramInformationSensorValue = 'Op ' ..currentSetpoint.. '°'
        else
            ToonProgramInformationSensorValue = 'Om ' ..os.date('%H:%M', currentNextTime).. ' op ' ..currentNextSetPoint.. '°'
        end
        
        if domoticz.devices(ToonProgramInformationSensorName).text ~= ToonProgramInformationSensorValue then
            domoticz.log('Updating Toon Program Information to: '..ToonProgramInformationSensorValue,domoticz.LOG_INFO)
            domoticz.devices(ToonProgramInformationSensorName).updateText(ToonProgramInformationSensorValue)
        end
	end
}
