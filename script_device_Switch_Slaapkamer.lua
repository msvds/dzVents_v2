return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Switch_Slaapkamer"},
	on = {
		devices = {
			'Dual Wall Switch Slaapkamer' -- Dual Wall Switch Slaapkamer
		},
	},

	execute = function(domoticz, device)
		local alarm = require "ideAlarmModule"
		if device.state == 'Switch 1' then		
			if (domoticz.devices('Dimmer bed Martijn').state == 'Off') then
				domoticz.devices('Dimmer bed Martijn').dimTo(20)
				domoticz.log('Switch 1 ingedrukt, Nachtlampje Martijn aangezet', domoticz.LOG_INFO)
			elseif domoticz.devices('Dimmer bed Martijn').state == 'On' then	
				domoticz.devices('Dimmer bed Martijn').switchOff()
				domoticz.log('Switch 1 ingedrukt, Nachtlampje Martijn uitgezet', domoticz.LOG_INFO)
			end
			if (domoticz.devices('Dimmer bed Suzanne').state == 'Off') then
				domoticz.devices('Dimmer bed Suzanne').dimTo(20)
				domoticz.log('Switch 1 ingedrukt, Nachtlampje Suzanne aangezet', domoticz.LOG_INFO)
			elseif (domoticz.devices('Dimmer bed Suzanne').state == 'On') then
				domoticz.devices('Dimmer bed Suzanne').switchOff()
				domoticz.log('Switch 1 ingedrukt, Nachtlampje Suzanne aangezet', domoticz.LOG_INFO)
			end		
			domoticz.log('Nachtlampjes aangezet')
		elseif device.state == 'Switch 2' then
			if (domoticz.devices('Yeelight slaapkamer').state == 'Off') then			
				--getestte regels
				--setRGB moet samen gebruikt worden met brightness
				--setKelvin(0): cold white
				--setKelvin(100): very warm white
				--domoticz.devices('Yeelight slaapkamer').setRGB(0,0,0)
				--domoticz.devices('Yeelight slaapkamer').dimTo(10)				
				--domoticz.devices('Yeelight slaapkamer').setKelvin(1700)
				domoticz.devices('Yeelight slaapkamer').switchOn().silent()
				domoticz.devices('Yeelight slaapkamer').setRGB(0,0,0)
				domoticz.devices('Yeelight slaapkamer').dimTo(10)				
				domoticz.devices('Yeelight slaapkamer').setKelvin(75)
				domoticz.log('Lamp slaapkamer aangezet', domoticz.LOG_INFO)
				domoticz.log(domoticz.devices('Yeelight slaapkamer').state, domoticz.LOG_INFO)
			else
				domoticz.devices('Yeelight slaapkamer').switchOff().silent()
				domoticz.log('Lamp slaapkamer aangezet', domoticz.LOG_INFO)
			end
		elseif (device.state == 'Both_Click') then
			-- Lampen uitzetten
			domoticz.helpers.switch_lights(domoticz,'Slaapkamer','Off',0)
			domoticz.log('Alle lampen slaapkamer uitgezet', domoticz.LOG_INFO)
		end		
	end
}
