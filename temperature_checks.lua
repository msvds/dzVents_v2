-- temperature checks and notifications are set here
return {
	active = true, -- set to false to disable this script
	logging = {marker = "temperature_checks"},
	on = {
		timer = {'every 15 minutes'}
	},
	data = {
        woonk = { history = true, maxItems = 96 },
		k_lars = { history = true, maxItems = 96 },
		k_nienke = { history = true, maxItems = 96 },
		badk = { history = true, maxItems = 96 },
		bijkeuken = { history = true, maxItems = 96 },
		buiten = { history = true, maxItems = 96 },
		garage = { history = true, maxItems = 96 },
		zolder = { history = true, maxItems = 96 }
        },
	execute = function(domoticz, device)     	
		message_interval = 96
		message_interval2 = 8
		domoticz.globalData.temperature_message_interval = domoticz.globalData.temperature_message_interval + 1
		domoticz.globalData.temperature_message_interval2 = domoticz.globalData.temperature_message_interval2 + 1
		local message = ''
		local message2 = ''
		-- add new data
		domoticz.data.woonk.add(domoticz.devices('Temperatuur woonkamer').temperature)
		domoticz.data.k_lars.add(domoticz.devices('Temperatuur Kamer Lars').temperature)
		domoticz.data.k_nienke.add(domoticz.devices('Temperatuur Kamer Nienke').temperature)
		domoticz.data.badk.add(domoticz.devices('Temperatuur Badkamer Bad').temperature)
		domoticz.data.buiten.add(domoticz.devices('Temperatuur Buiten').temperature)
		domoticz.data.bijkeuken.add(domoticz.devices('Temperatuur Bijkeuken').temperature)
		domoticz.data.garage.add(domoticz.devices('Temperatuur garage').temperature)
		domoticz.data.zolder.add(domoticz.devices('Temperatuur zolder').temperature)
		
		domoticz.log('average_temperatures_woonk = ' ..domoticz.data.woonk.avg(),domoticz.LOG_INFO)
		domoticz.log('average_temperatures_k_lars = ' ..domoticz.data.k_lars.avg(),domoticz.LOG_INFO)
		domoticz.log('average_temperatures_k_nienke = ' ..domoticz.data.k_nienke.avg(),domoticz.LOG_INFO)
		domoticz.log('average_temperatures_badk = ' ..domoticz.data.badk.avg(),domoticz.LOG_INFO)
		domoticz.log('average_temperatures_buiten = ' ..domoticz.data.buiten.avg(),domoticz.LOG_INFO)
		domoticz.log('average_temperatures_bijkeuken = ' ..domoticz.data.bijkeuken.avg(),domoticz.LOG_INFO)
		domoticz.log('average_temperatures_garage = ' ..domoticz.data.garage.avg(),domoticz.LOG_INFO)
		domoticz.log('average_temperatures_zolder = ' ..domoticz.data.zolder.avg(),domoticz.LOG_INFO)
		
		--domoticz.log("De temperatuur in de woonkamer is " ..tonumber(domoticz.devices('Temperatuur woonkamer').temperature) .. ". De gemiddelde temperatuur in de woonkamer de afgelopen 24 uur was " ..tonumber(round(domoticz.data.woonk.avg(),1)) .. ".")
		--domoticz.log("De temperatuur in de kamer van Lars is " ..tonumber(domoticz.devices('Temperatuur Kamer Lars').temperature) .. ". De gemiddelde temperatuur in de kamer van Lars de afgelopen 24 uur was " ..tonumber(round(domoticz.data.k_lars.avg(),1)) .. ".")
		--domoticz.log("De temperatuur in de badkamer is " ..tonumber(domoticz.devices('Temperatuur Badkamer Bad').temperature) .. ". De gemiddelde temperatuur in de badkamer de afgelopen 24 uur was " ..tonumber(round(domoticz.data.badk.avg(),1)) .. ".")
		--domoticz.log("De temperatuur buiten is " ..tonumber(domoticz.devices('Temperatuur Buiten').temperature) .. ". De gemiddelde temperatuur buiten de afgelopen 24 uur was " ..tonumber(round(domoticz.data.buiten.avg(),1)) .. ".")
		--domoticz.log("De temperatuur in de bijkeuken is " ..tonumber(domoticz.devices('Temperatuur Bijkeuken').temperature) .. ". De gemiddelde temperatuur in de bijkeuken de afgelopen 24 uur was " ..tonumber(round(domoticz.data.bijkeuken.avg(),1)) .. ".")
		--domoticz.log("De temperatuur in de garage is " ..tonumber(domoticz.devices('Temperatuur garage').temperature) .. ". De gemiddelde temperatuur in de garage de afgelopen 24 uur was " ..tonumber(round(domoticz.data.garage.avg(),1)) .. ".")
		
		local temperature_string_woonk
		if (domoticz.devices('Temperatuur woonkamer').temperature > 30) then
			temperature_string_woonk = "extreem"
		elseif (domoticz.devices('Temperatuur woonkamer').temperature > 28) then
			temperature_string_woonk = "heel erg"
		elseif (domoticz.devices('Temperatuur woonkamer').temperature > 26) then
			temperature_string_woonk = "erg"
		elseif (domoticz.devices('Temperatuur woonkamer').temperature > 24) then
			temperature_string_woonk = "redelijk"
		end

		if (domoticz.devices('Temperatuur woonkamer').temperature > 25) then
			if (domoticz.devices('Temperatuur Buiten').temperature < domoticz.devices('Temperatuur woonkamer').temperature) then
				message2 = message2 .."De temperatuur in de woonkamer begint " ..temperature_string_woonk .. " hoog te worden, namelijk " ..tonumber(domoticz.devices('Temperatuur woonkamer').temperature) .. ". Buiten is de temperatuur lager, namelijk " ..tonumber(domoticz.devices('Temperatuur Buiten').temperature) .." dus deuren en ramen open zetten kan helpen. De gemiddelde temperatuur in de woonkamer de afgelopen 24 uur was " ..tonumber(domoticz.data.woonk.avg()) .."."
				--domoticz.helpers.message("De temperatuur in de woonkamer begint " ..temperature_string_woonk .. " hoog te worden, namelijk " ..tonumber(domoticz.devices('Temperatuur woonkamer').temperature) .. ". Buiten is de temperatuur lager, namelijk " ..tonumber(domoticz.devices('Temperatuur Buiten').temperature) .." dus een raampje open zetten kan helpen.", 100,90)	
			elseif (domoticz.devices('Temperatuur Buiten').temperature > domoticz.devices('Temperatuur woonkamer').temperature) then
				--message = message .."De temperatuur in de woonkamer begint " ..temperature_string_woonk .. " hoog te worden, namelijk " ..tonumber(domoticz.devices('Temperatuur woonkamer').temperature) .. ". Buiten is de temperatuur hoger, namelijk " ..tonumber(domoticz.devices('Temperatuur Buiten').temperature) .." dus deuren en ramen open zetten helpt helaas niet. De gemiddelde temperatuur in de woonkamer de afgelopen 24 uur was " ..tonumber(domoticz.data.woonk.avg()) .."." 
			end
		end

		if (domoticz.devices('Temperatuur woonkamer').temperature - domoticz.data.woonk.avg() > 2) then
			message = message .." De temperatuur stijgt snel in de woonkamer, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.devices('Temperatuur woonkamer').temperature - domoticz.data.woonk.avg()) 
		end
		if (domoticz.devices('Temperatuur Kamer Lars').temperature - domoticz.data.k_lars.avg() > 2) then
			message = message .."De temperatuur stijgt snel in de kamer van Lars, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.devices('Temperatuur Kamer Lars').temperature - domoticz.data.k_lars.avg())
			domoticz.helpers.change_heat(domoticz,'KamerLars','Away')
		end
		if (domoticz.devices('Temperatuur Badkamer Bad').temperature - domoticz.data.badk.avg() > 2) then
			message = message .."De temperatuur stijgt snel in de badkamer, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.devices('Temperatuur Badkamer Bad').temperature - domoticz.data.badk.avg()) 
			domoticz.helpers.change_heat(domoticz,'Badkamer','Away')
		end
		if (domoticz.devices('Temperatuur Buiten').temperature - domoticz.data.buiten.avg() > 5) then
			message = message .."De temperatuur stijgt snel buiten, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.devices('Temperatuur Buiten').temperature - domoticz.data.buiten.avg())
		end
		if (domoticz.devices('Temperatuur woonkamer').temperature - domoticz.data.woonk.avg() < -2) then
			message = message .."De temperatuur daalt snel in de woonkamer, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.data.woonk.avg() - domoticz.devices('Temperatuur woonkamer').temperature)  
		end
		if (domoticz.devices('Temperatuur Kamer Lars').temperature - domoticz.data.k_lars.avg() < -2) then
			message = message .."De temperatuur daalt snel in de kamer van Lars, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.data.k_lars.avg() - domoticz.devices('Temperatuur Kamer Lars').temperature) 
		end
		if (domoticz.devices('Temperatuur Badkamer Bad').temperature - domoticz.data.badk.avg() < -2) then
			message = message .."De temperatuur daalt snel in de badkamer, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.data.badk.avg() - domoticz.devices('Temperatuur Badkamer Bad').temperature) 
		end
		if (domoticz.devices('Temperatuur Buiten').temperature - domoticz.data.buiten.avg() < -5) then
			message = message .." De temperatuur daalt snel buiten, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.data.buiten.avg()-domoticz.devices('Temperatuur Buiten').temperature)  
		end
		
		
		if (domoticz.devices('Temperatuur woonkamer').temperature - domoticz.data.woonk.avg() > 20) then
			message = message .."De temperatuur stijgt extreem snel in de woonkamer, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.devices('Temperatuur woonkamer').temperature - domoticz.data.woonk.avg())
		end
		if (domoticz.devices('Temperatuur Kamer Lars').temperature - domoticz.data.k_lars.avg() > 20) then
			message = message .."De temperatuur stijgt extreem snel in de kamer van Lars, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.devices('Temperatuur Kamer Lars').temperature - domoticz.data.k_lars.avg()) 
		end
		if (domoticz.devices('Temperatuur Badkamer Bad').temperature - domoticz.data.badk.avg() > 20) then
			message = message .."De temperatuur stijgt extreem snel in de badkamer, namelijk het verschil in temperatuur met het gemiddelde van de afgelopen 24 uur is " ..tonumber(domoticz.devices('Temperatuur Badkamer Bad').temperature - domoticz.data.badk.avg())
		end
		
		if (domoticz.devices('Temperatuur Bijkeuken').temperature < 0) then
			message = message .."De temperatuur in de bijkeuken wordt laag, namelijk " ..tonumber(domoticz.devices('Temperatuur Bijkeuken').temperature) ..". Let op bevriezing van de waterleiding!"
		end
		if (domoticz.devices('Temperatuur garage').temperature < 0) then
			message = message .."De temperatuur in de garage wordt laag, namelijk " ..tonumber(domoticz.devices('Temperatuur garage').temperature) ..". Let op bevriezing van de waterleiding!"
		end
		
		if (domoticz.devices('Temperatuur Buiten').temperature < -8) then
			message = message .."De temperatuur buiten is erg laag, namelijk " ..tonumber(domoticz.devices('Temperatuur Buiten').temperature) ..". Let op bevriezing van de waterleiding!"
		end
		
		--if (domoticz.devices('Temperatuur woonkamer').temperature > 25) then			
			--domoticz.devices('Gashaard').setState('Run Down')
			--message = message ..'De gashaard is uitgezet omdat het warmer is dan 25 graden in de woonkamer' 
		
		--end
		
		if (string.len(message) > 5 and domoticz.globalData.temperature_message_interval > message_interval and domoticz.devices('Notifications').level == 20) then
			domoticz.notify('Temperatuur waarschuwing',message,domoticz.PRIORITY_LOW)
			domoticz.globalData.temperature_message_interval = 0
			domoticz.devices('Status Notifications').updateText(message).silent()
		end
		if (string.len(message2) > 5 and domoticz.globalData.temperature_message_interval2 > message_interval2 and domoticz.devices('Notifications').level == 20) then
			domoticz.notify('Temperatuur waarschuwing',message2,domoticz.PRIORITY_LOW)
			domoticz.globalData.temperature_message_interval2 = 0
			domoticz.devices('Status Notifications').updateText(message2).silent()
		end
	end
}