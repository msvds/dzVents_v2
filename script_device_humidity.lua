-- humidity checks and notifications are set here
return {
	active = true, -- set to false to disable this script
	logging = {marker = "script_device_humidity"},
	on = {
		timer = {'every 15 minutes'}
	},
	data = {
        woonk = { history = true, maxItems = 96  },
		k_lars = { history = true, maxItems = 96  },
		k_nienke = { history = true, maxItems = 96  },
		badk = { history = true, maxItems = 96  },
		bijkeuken = { history = true, maxItems = 96  },
		buiten = { history = true, maxItems = 96  },
		garage = { history = true, maxItems = 96  },
		zolder = { history = true, maxItems = 96  }
        },
	execute = function(domoticz, device)
		message_interval = 96
		message_interval2 = 8
		domoticz.globalData.temperature_message_interval = domoticz.globalData.temperature_message_interval + 1
		domoticz.globalData.temperature_message_interval2 = domoticz.globalData.temperature_message_interval2 + 1
		local message = ''
		local message2 = ''
		
		-- add new data
		domoticz.log("De vochtigheid in de woonkamer is " ..tonumber(domoticz.devices('Vochtigheid woonkamer').humidity),domoticz.LOG_INFO)
		domoticz.data.woonk.add(domoticz.devices('Vochtigheid woonkamer').humidity)
		domoticz.data.k_lars.add(domoticz.devices('Vochtigheid Kamer Lars').humidity)
		domoticz.data.k_nienke.add(domoticz.devices('Vochtigheid Kamer Nienke').humidity)
		domoticz.data.badk.add(domoticz.devices('Vochtigheid Badkamer Bad').humidity)
		domoticz.data.buiten.add(domoticz.devices('Vochtigheid Buiten').humidity)
		domoticz.data.bijkeuken.add(domoticz.devices('Vochtigheid Bijkeuken').humidity)
		domoticz.data.garage.add(domoticz.devices('Vochtigheid garage').humidity)
		domoticz.data.zolder.add(domoticz.devices('Vochtigheid zolder').humidity)
		
		-- average over 96 items each 15 minutes (1 day)
		
		domoticz.log("De vochtigheid in de woonkamer is " ..tonumber(domoticz.devices('Vochtigheid woonkamer').humidity) .. ". De gemiddelde vochtigheid in de woonkamer de afgelopen 24 uur was " ..tonumber(domoticz.data.woonk.avg()) .. ".",domoticz.LOG_INFO)
		domoticz.log("De vochtigheid in de kamer van Lars is " ..tonumber(domoticz.devices('Vochtigheid Kamer Lars').humidity) .. ". De gemiddelde vochtigheid in de kamer van Lars de afgelopen 24 uur was " ..tonumber(domoticz.data.k_lars.avg()) .. ".",domoticz.LOG_INFO)
		domoticz.log("De vochtigheid in de badkamer is " ..tonumber(domoticz.devices('Vochtigheid Badkamer Bad').humidity) .. ". De gemiddelde vochtigheid in de badkamer de afgelopen 24 uur was " ..tonumber(domoticz.data.badk.avg()) .. ".",domoticz.LOG_INFO)
		domoticz.log("De vochtigheid buiten is " ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) .. ". De gemiddelde vochtigheid buiten de afgelopen 24 uur was " ..tonumber(domoticz.data.buiten.avg()) .. ".",domoticz.LOG_INFO)
		domoticz.log("De vochtigheid in de bijkeuken is " ..tonumber(domoticz.devices('Vochtigheid Bijkeuken').humidity) .. ". De gemiddelde vochtigheid in de bijkeuken de afgelopen 24 uur was " ..tonumber(domoticz.data.bijkeuken.avg()) .. ".",domoticz.LOG_INFO)
		
		local hum_string_woonk
		if (domoticz.devices('Vochtigheid woonkamer').humidity > 70) then
			hum_string_woonk = "extreem"
		elseif (domoticz.devices('Vochtigheid woonkamer').humidity > 65) then
			hum_string_woonk = "heel erg"
		elseif (domoticz.devices('Vochtigheid woonkamer').humidity > 63) then
			hum_string_woonk = "erg"
		elseif (domoticz.devices('Vochtigheid woonkamer').humidity > 61) then
			hum_string_woonk = "redelijk"
		end

		if (domoticz.devices('Vochtigheid woonkamer').humidity > 61) then
			if (domoticz.devices('Vochtigheid Buiten').humidity < domoticz.devices('Vochtigheid woonkamer').humidity) then
				message = message ..'De vochtigheid in de woonkamer begint ' ..hum_string_woonk .. ' hoog te worden, namelijk ' ..tonumber(domoticz.devices('Vochtigheid woonkamer').humidity) .. '. Buiten is de vochtigheid lager, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) ..' dus een raampje open zetten kan helpen. De gemiddelde vochtigheid in de woonkamer de afgelopen 24 uur was ' ..tonumber(domoticz.data.woonk.avg())  ..'.\r'	
			--TODO Need to adapt intervals at the end of next line
				--domoticz.helpers.message("De vochtigheid in de woonkamer begint " ..hum_string_woonk .. " hoogte worden, namelijk " ..tonumber(domoticz.devices('Vochtigheid woonkamer').humidity) .. ". Buiten is de vochtigheid lager, namelijk " ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) .." dus een raampje open zetten kan helpen.", 100,90)	
			elseif (domoticz.devices('Vochtigheid Buiten').humidity > domoticz.devices('Vochtigheid woonkamer').humidity) then
				message = message ..'De vochtigheid in de woonkamer begint ' ..hum_string_woonk .. ' te worden, namelijk ' ..tonumber(domoticz.devices('Vochtigheid woonkamer').humidity) .. '. Buiten is de vochtigheid hoger, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) ..' dus een raampje open zetten helpt helaas niet. De gemiddelde vochtigheid in de woonkamer de afgelopen 24 uur was ' ..tonumber(domoticz.data.woonk.avg())  ..'.\r'  
			end
		end
		
		if (domoticz.devices('Vochtigheid Kamer Lars').humidity > 65) then
			if (domoticz.devices('Vochtigheid Buiten').humidity < domoticz.devices('Vochtigheid Kamer Lars').humidity) then
				message = message ..'De vochtigheid in de kamer van Lars begint hoog te worden, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Kamer Lars').humidity) .. '. Buiten is de vochtigheid lager, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) ..' dus een raampje open zetten kan helpen. De gemiddelde vochtigheid in de kamer van Lars de afgelopen 24 uur was ' ..tonumber(domoticz.data.k_lars.avg())  ..'.\r'  
				--TODO Need to adapt intervals at the end of next line
				--domoticz.helpers.message("De vochtigheid in de kamer van Lars begint hoog te worden, namelijk " ..tonumber(domoticz.devices('Vochtigheid Kamer Lars').humidity) .. ". Buiten is de vochtigheid lager, namelijk " ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) .." dus een raampje open zetten kan helpen.", 100,90)	
			elseif (domoticz.devices('Vochtigheid Buiten').humidity > domoticz.devices('Vochtigheid woonkamer').humidity) then
				message = message ..'De vochtigheid in de kamer van Lars begint hoog te worden, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Kamer Lars').humidity) .. '. Buiten is de vochtigheid hoger, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) ..' dus een raampje open zetten helpt helaas niet. De gemiddelde vochtigheid in de kamer van Lars de afgelopen 24 uur was '  ..tonumber(domoticz.data.k_lars.avg())..'.\r'  
			end
		end
		
		local hum_string_badk
		if (domoticz.devices('Vochtigheid Badkamer Bad').humidity - domoticz.data.badk.avg() > 10) then
			hum_string_badk = "Waarschijnlijk wordt er gedouched of zit er iemand in bad"		
			message = message ..hum_string_badk .. ' namelijk het verschil in vochtigheid met het gemiddelde van de afgelopen 24 uur is ' ..tonumber((domoticz.devices('Vochtigheid Badkamer Bad').humidity - domoticz.data.badk.avg()))..'.\r'  
		end
		
		if (domoticz.devices('Vochtigheid woonkamer').humidity - domoticz.data.woonk.avg() > 8) then
			message = message ..'De vochtigheid stijgt snel in de woonkamer, namelijk het verschil in vochtigheid met het gemiddelde van de afgelopen 24 uur is ' ..tonumber(domoticz.devices('Vochtigheid woonkamer').humidity - domoticz.data.woonk.avg()) ..'. Misschien moet de afzuigkap aan?'  
		end
		
		if (domoticz.devices('Vochtigheid Bijkeuken').humidity > 65) then
			if (domoticz.devices('Vochtigheid Buiten').humidity < domoticz.devices('Vochtigheid Bijkeuken').humidity) then
				message = message ..'De vochtigheid in de bijkeuken begint hoog te worden, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Bijkeuken').humidity) .. '. Buiten is de vochtigheid lager, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) ..' dus een raampje open zetten kan helpen. De gemiddelde vochtigheid in de bijkeuken de afgelopen 24 uur was ' ..tonumber(domoticz.data.bijkeuken.avg())  ..'.\r'  
				--TODO Need to adapt intervals at the end of next line
				--domoticz.helpers.message("De vochtigheid in de bijkeuken begint hoog te worden, namelijk " ..tonumber(domoticz.devices('Vochtigheid Bijkeuken').humidity) .. ". Buiten is de vochtigheid lager, namelijk " ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) .." dus een raampje open zetten kan helpen.", 100,90)	
			elseif (domoticz.devices('Vochtigheid Buiten').humidity > domoticz.devices('Vochtigheid Bijkeuken').humidity) then
				message = message ..'De vochtigheid in de bijkeuken begint hoog te worden, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Bijkeuken').humidity) .. '. Buiten is de vochtigheid hoger, namelijk ' ..tonumber(domoticz.devices('Vochtigheid Buiten').humidity) ..' dus een raampje open zetten helpt helaas niet. De gemiddelde vochtigheid in de bijkeuken de afgelopen 24 uur was ' ..tonumber(domoticz.data.bijkeuken.avg()) ..'.\r'  
			end
		end
		if (string.len(message) > 5 and domoticz.globalData.humidity_message_interval > message_interval and domoticz.devices('Notifications').level == 20) then
			domoticz.notify('Vochtigheid',message,domoticz.PRIORITY_LOW)
			domoticz.globalData.humidity_message_interval = 0
			domoticz.devices('Status Notifications').updateText(message).silent()
		end
	end
}