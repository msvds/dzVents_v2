return {
	active = true,
	logging = {marker = "timer_thermostaat"},
	on = {
		timer = {'every 1 minutes'}
	},
	execute = function(domoticz, device)
		local Time = require('Time')		
		if (domoticz.time.matchesRule('at 7:20-7:45 on mon,tue,wed,thu,fri') and domoticz.devices('SomeoneHome').state == 'On') then				
			domoticz.helpers.change_heat(domoticz,'Floor1','Home')
			domoticz.helpers.change_heat(domoticz,'Badkamer','Comfort')
		end
		if (domoticz.time.matchesRule('at 8:00-8:05 on mon,thu,fri')) then			
			domoticz.helpers.change_heat(domoticz,'Inside','Away')
		end
		if (domoticz.time.matchesRule('at 14:00-14:05 on mon') and domoticz.devices('SomeoneHome').state == 'On') then				
			domoticz.helpers.change_heat(domoticz,'Floor1','Home')
		end
		if (domoticz.time.matchesRule('at 17:00-17:05 on mon,tue,wed,fri') and domoticz.devices('SomeoneHome').state == 'On') then				
			domoticz.helpers.change_heat(domoticz,'Floor1','Home')
		end
		if (domoticz.time.matchesRule('at 18:00-18:05 on thu') and domoticz.devices('SomeoneHome').state == 'On') then				
			domoticz.helpers.change_heat(domoticz,'Floor1','Home')
		end
		if (domoticz.time.matchesRule('at 23:55-23:59')) then				
			domoticz.helpers.change_heat(domoticz,'Inside','Sleep')
		end
		if (domoticz.time.matchesRule('at 21:15-21:20 on sun,mon,tue,wed,thu')) then				
			domoticz.helpers.change_heat(domoticz,'Inside','Sleep')
		end
		if (domoticz.time.matchesRule('at 22:15-22:20 on fri,sat')) then				
			domoticz.helpers.change_heat(domoticz,'Inside','Sleep')
		end
		
	end
}