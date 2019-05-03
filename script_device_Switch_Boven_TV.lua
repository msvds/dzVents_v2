return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Switch_Boven_TV"},
	on = {
		devices = {
			'Wireless Wall Switch Boven TV'
		},
	},

	execute = function(domoticz, device)
		if (device.lastUpdate.secondsAgo > 2) then
			if (domoticz.devices('Tradfri - Group - boven tv').state == 'Off') then
				domoticz.devices('Tradfri - Group - boven tv').switchOn()
				domoticz.devices('Tradfri - Group - boven tv').switchOn().afterSec(2)
				domoticz.log('Lampen boven tv aangezet',domoticz.LOG_INFO)
			else
				domoticz.devices('Tradfri - Group - boven tv').switchOff()			
				domoticz.devices('Tradfri - Group - boven tv').switchOff().afterSec(2)
				domoticz.log('Lampen boven tv uitgezet',domoticz.LOG_INFO)
			end
		else
			domoticz.devices('Tradfri - Group - boven tv').switchOff()			
			domoticz.devices('Tradfri - Group - boven tv').switchOff().afterSec(2)
			domoticz.log('Lampen boven tv uitgezet',domoticz.LOG_INFO)
		end
	end
}