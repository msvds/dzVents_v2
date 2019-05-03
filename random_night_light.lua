return {
	active = true, -- set to false to disable this script
	logging = {marker = "random_night_light"},
	on = {
		['timer'] = {
			'every 30 minutes between sunset and 01:59'
		}
	},
	execute = function(domoticz, device)
		local Time = require('Time')
		-- On during holiday (armed away house)	
		if (domoticz.security == domoticz.SECURITY_ARMEDAWAY) then
			if (domoticz.devices('Lamp spoelb keuken').state == 'Off') then
				domoticz.devices('Lamp spoelb keuken').switchOn().withinMin(20).forMin(5)
				domoticz.log('Lamp spoelbak keuken aangezet met random timer ivm inbraakpreventie', domoticz.LOG_INFO)
			end
			if (domoticz.devices('Tradfri - Group - boven tv').state == 'Off') then
				domoticz.devices('Tradfri - Group - boven tv').switchOn().withinMin(20).forMin(5)
				domoticz.log('Lamp boven TV aangezet met random timer ivm inbraakpreventie', domoticz.LOG_INFO)
			end
			if (domoticz.devices('Grote lamp naast bank').state == 'Off') then
				domoticz.devices('Grote lamp naast bank').switchOn().withinMin(22).forMin(5)
				domoticz.log('Grote lamp naast bank aangezet met random timer ivm inbraakpreventie', domoticz.LOG_INFO)
			end
			if (domoticz.devices('Yeelight eetkamer 1').state == 'Off') then
				domoticz.devices('White Temp Yeelight eetkamer 1').dimTo(20)
				domoticz.devices('Yeelight eetkamer 1').switchOn().withinMin(20).forMin(2)
				domoticz.log('Lamp bank aangezet met random timer ivm inbraakpreventie', domoticz.LOG_INFO)
			end	
			if (domoticz.devices('Schemerlamp deur').state == 'Off') then
				domoticz.devices('Schemerlamp deur').switchOn().withinMin(20).forMin(5)
				domoticz.log('Schemerlamp deur aangezet met random timer ivm inbraakpreventie', domoticz.LOG_INFO)
			end
		end
	end
}