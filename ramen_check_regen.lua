-- Send a warning when a window is open and it's going to rain
return {
	active = true,
	logging = {marker = "ramen_check_regen"},
	on = {
		['timer'] = 'every minute',
	},
	execute = function(domoticz)
		domoticz.log(domoticz.devices['Rain Expected Levels'].levelName,domoticz.LOG_INFO)
		if (domoticz.devices['Rain Expected Levels'].levelName ~= 'Droog') then
			if (domoticz.devices('Dakraam slaapkamer').state == 'Open' and domoticz.devices('Notifications').level ~= 0) then
			   domoticz.notify('Dakraam open bij regen','Het dakraam in de slaapkamer staat open en het gaat regenen',domoticz.PRIORITY_HIGH)
			elseif (domoticz.devices('Zolderdakraam voor').state == 'Open' and domoticz.devices('Notifications').level ~= 0) then
			   domoticz.notify('Dakraam open bij regen','Het dakraam op zolder voor staat open en het gaat regenen',domoticz.PRIORITY_HIGH)
			elseif (domoticz.devices('Zolderdakraam achter').state == 'Open' and domoticz.devices('Notifications').level ~= 0) then
			   domoticz.notify('Dakraam open bij regen','Het dakraam op zolder achter staat open en het gaat regenen',domoticz.PRIORITY_HIGH)
			elseif (domoticz.devices('Dakraam badkamer').state == 'Open' and domoticz.devices('Notifications').level ~= 0) then
			   domoticz.notify('Dakraam open bij regen','Het dakraam in de badkamer staat open en het gaat regenen',domoticz.PRIORITY_HIGH)
			end 
		end
	end
}