return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Switch_Hal_Beneden"},
	on = {
		devices = {
			'Dual Wall Switch Hal Beneden' -- Dual Wall Switch Hal_Beneden
		},
	},

	execute = function(domoticz, device)
		if device.state == 'Switch 2' then
			if (device.lastUpdate.secondsAgo > 2) then
				if (domoticz.devices('Tradfri - Group - entree').state == 'Off') then
					domoticz.devices('Tradfri - Group - entree').switchOn()	
					domoticz.devices('Tradfri - Group - entree').switchOn().afterSec(2)
					domoticz.log('Lampen entree aangezet',domoticz.LOG_INFO)
				else
					domoticz.devices('Tradfri - Group - entree').switchOff()
					domoticz.devices('Tradfri - Group - entree').switchOff().afterSec(2)
					domoticz.log('Lampen entree uitgezet',domoticz.LOG_INFO)
				end
			else
				domoticz.devices('Tradfri - Group - entree').switchOff()
				domoticz.devices('Tradfri - Group - entree').switchOff().afterSec(2)
				domoticz.log('Lampen entree uitgezet',domoticz.LOG_INFO)
			end
		elseif device.state == 'Switch 1' then
			if (device.lastUpdate.secondsAgo > 2) then
				if (domoticz.devices('Tradfri - Group - hal').state == 'Off') then
					domoticz.devices('Tradfri - Group - hal').switchOn()
					domoticz.devices('Tradfri - Group - hal').switchOn().afterSec(2)
					domoticz.log('Lampen hal aangezet',domoticz.LOG_INFO)
				else
					domoticz.devices('Tradfri - Group - hal').switchOff()
					domoticz.devices('Tradfri - Group - hal').switchOff().afterSec(2)
					domoticz.log('Lampen hal uitgezet',domoticz.LOG_INFO)
				end
			else
				domoticz.devices('Tradfri - Group - hal').switchOff()
				domoticz.devices('Tradfri - Group - hal').switchOff().afterSec(2)
				domoticz.log('Lampen hal uitgezet',domoticz.LOG_INFO)
			end
			
		elseif (device.state == 'Both_Click') then
			if (device.lastUpdate.secondsAgo > 2) then
				if (domoticz.devices('Tradfri - Group - entree').state == 'Off') then
					domoticz.devices('Tradfri - Group - entree').switchOn()	
					domoticz.devices('Tradfri - Group - entree').switchOn().afterSec(2)
					domoticz.log('Lampen entree aangezet',domoticz.LOG_INFO)
				else
					domoticz.devices('Tradfri - Group - entree').switchOff()
					domoticz.devices('Tradfri - Group - entree').switchOff().afterSec(2)
					domoticz.log('Lampen entree uitgezet',domoticz.LOG_INFO)
				end
				if (domoticz.devices('Tradfri - Group - hal').state == 'Off') then
					domoticz.devices('Tradfri - Group - hal').switchOn()
					domoticz.devices('Tradfri - Group - hal').switchOn().afterSec(2)
					domoticz.log('Lampen hal aangezet',domoticz.LOG_INFO)
				else
					domoticz.devices('Tradfri - Group - hal').switchOff()
					domoticz.devices('Tradfri - Group - hal').switchOff().afterSec(2)
					domoticz.log('Lampen hal uitgezet',domoticz.LOG_INFO)
				end
			else
				domoticz.devices('Tradfri - Group - entree').switchOff()
				domoticz.devices('Tradfri - Group - entree').switchOff().afterSec(2)
				domoticz.log('Lampen entree uitgezet',domoticz.LOG_INFO)
				domoticz.devices('Tradfri - Group - hal').switchOff()
				domoticz.devices('Tradfri - Group - hal').switchOff().afterSec(2)
				domoticz.log('Lampen hal uitgezet',domoticz.LOG_INFO)
			end
		end		
	end
}