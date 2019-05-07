return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_Switch_Keuken"},
	on = {
		devices = {
			'Dual Wall Switch Keuken' -- Dual Wall Switch Keuken
		},
	},

	execute = function(domoticz, device)
		if device.state == 'Switch 2' then
			if (device.lastUpdate.secondsAgo > 2) then
				if (domoticz.devices('Tradfri - Group - bar').state == 'Off') then
					domoticz.devices('Tradfri - Group - bar').switchOn()	
					domoticz.devices('Tradfri - Group - bar').switchOn().afterSec(2)
					domoticz.log('Lampen bar aangezet',domoticz.LOG_INFO)
				else
					domoticz.devices('Tradfri - Group - bar').switchOff()
					domoticz.devices('Tradfri - Group - bar').switchOff().afterSec(2)
					domoticz.log('Lampen bar uitgezet',domoticz.LOG_INFO)
				end
			else
				domoticz.devices('Tradfri - Group - bar').switchOff()
				domoticz.devices('Tradfri - Group - bar').switchOff().afterSec(2)
				domoticz.log('Lampen bar uitgezet',domoticz.LOG_INFO)
			end
		elseif device.state == 'Switch 1' then			
			if (device.lastUpdate.secondsAgo > 2) then
				if (domoticz.devices('Tradfri - Group - keuken').state == 'Off') then
					domoticz.devices('Tradfri - Group - keuken').switchOn()
					domoticz.devices('Tradfri - Group - keuken').switchOn().afterSec(2)
					domoticz.devices('Lamp spoelb keuken').switchOn()
					domoticz.devices('Sfeerlamp keuken').switchOn()
					domoticz.log('Lampen keuken aangezet',domoticz.LOG_INFO)
				else
					domoticz.devices('Tradfri - Group - keuken').switchOff()
					domoticz.devices('Tradfri - Group - keuken').switchOff().afterSec(2)
					domoticz.devices('Lamp spoelb keuken').switchOff()
					domoticz.devices('Sfeerlamp keuken').switchOff()
					domoticz.log('Lampen keuken uitgezet',domoticz.LOG_INFO)
				end
			else
				domoticz.devices('Tradfri - Group - keuken').switchOff()
				domoticz.devices('Tradfri - Group - keuken').switchOff().afterSec(2)
				domoticz.devices('Lamp spoelb keuken').switchOff()
				domoticz.devices('Sfeerlamp keuken').switchOff()
				domoticz.log('Lampen keuken uitgezet',domoticz.LOG_INFO)
			end
		elseif (device.state == 'Both_Click') then
			if (device.lastUpdate.secondsAgo > 2) then
				if (domoticz.devices('Tradfri - Group - bar').state == 'Off') then
					domoticz.devices('Tradfri - Group - bar').switchOn()	
					domoticz.devices('Tradfri - Group - bar').switchOn().afterSec(2)
					domoticz.log('Lampen bar aangezet',domoticz.LOG_INFO)
				else
					domoticz.devices('Tradfri - Group - bar').switchOff()
					domoticz.devices('Tradfri - Group - bar').switchOff().afterSec(2)
					domoticz.log('Lampen bar uitgezet',domoticz.LOG_INFO)
				end
				if (domoticz.devices('Tradfri - Group - keuken').state == 'Off') then
					domoticz.devices('Tradfri - Group - keuken').switchOn()
					domoticz.devices('Tradfri - Group - keuken').switchOn().afterSec(2)
					domoticz.devices('Lamp spoelb keuken').switchOn()
					domoticz.devices('Sfeerlamp keuken').switchOn()
					domoticz.log('Lampen keuken aangezet',domoticz.LOG_INFO)
				else
					domoticz.devices('Tradfri - Group - keuken').switchOff()
					domoticz.devices('Tradfri - Group - keuken').switchOff().afterSec(2)
					domoticz.devices('Lamp spoelb keuken').switchOff()
					domoticz.devices('Sfeerlamp keuken').switchOff()
					domoticz.log('Lampen keuken uitgezet',domoticz.LOG_INFO)
				end
			else
				domoticz.devices('Tradfri - Group - bar').switchOff()
				domoticz.devices('Tradfri - Group - bar').switchOff().afterSec(2)
				domoticz.log('Lampen bar uitgezet',domoticz.LOG_INFO)
				domoticz.devices('Tradfri - Group - keuken').switchOff()
				domoticz.devices('Tradfri - Group - keuken').switchOff().afterSec(2)
				domoticz.devices('Lamp spoelb keuken').switchOff()
				domoticz.log('Lampen keuken uitgezet',domoticz.LOG_INFO)
			end
		end		
	end
}
