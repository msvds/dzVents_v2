return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Sw2_zolderkamer"},
	on = {
		devices = {
			'Sw2_chillkamer' -- Switch chill kamer
		},
	},

	execute = function(domoticz, device)
		local alarm = require "ideAlarmModule"
		if device.state == 'Double Click' then
			-- Lampen uitzetten
			domoticz.helpers.switch_lights(domoticz,'Logeerkamer','Off',0)
			domoticz.log('Lights logeerkamer turned off',domoticz.LOG_INFO)
		elseif device.state == 'Click' then
			-- Lampen switchen
			--if domoticz.devices('Lampen logeerkamer').state == 'On' then
			    --domoticz.helpers.switch_lights(domoticz,'Logeerkamer','Off',0)
			    --domoticz.log('Lights logeerkamer turned off',domoticz.LOG_INFO)   
			--elseif domoticz.devices('Lampen logeerkamer').state == 'Off' then
			    --domoticz.helpers.switch_lights(domoticz,'Logeerkamer','On',0)
			    --domoticz.log('Lights logeerkamer turned on',domoticz.LOG_INFO)
			--end
		elseif (device.state == 'Long Click') then
			-- Lampen aanzetten
			domoticz.helpers.switch_lights(domoticz,'Logeerkamer','On',0)
			domoticz.log('Lights logeerkamer turned on',domoticz.LOG_INFO)
		end		
	end
}