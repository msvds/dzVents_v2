-- Counters for motion, no motion, open and closed windows/doors
-- When motion, no motion, open or closed windows/door are detected, the counters are set to 0 here
-- Also when manually a light is switched on, counters reset
return {
	active = true,
	logging = {marker = "counters_device"},
	on = {
		devices = {'Eetkamerdeur','Dakraam slaapkamer','Balkondeur slaapkamer','Front door','Balkondeur Nienke','Slaapkamerdeur','Deur bijkeuken','Zolderdakraam achter','Garage deur','Beweging woonkamer','Beweging kamer Lars','Beweging kamer Nienke','Beweging badkamer','Beweging chillkamer','Beweging hal boven','Dimmer bed Martijn','Dimmer bed Suzanne','Lamp hal boven','Schemerlamp deur','Lamp spoelb keuken'},
	},
	execute = function(domoticz,device)	
		debug = false
		if (device.name == domoticz.devices('Eetkamerdeur').name and domoticz.devices('Eetkamerdeur').state == 'Open') then
			domoticz.globalData.ClosedC_Eetkamerdeur = 0
			domoticz.globalData.ClosedC_Floor1  = 0	
			if debug == true then domoticz.log('ClosedC_Eetkamerdeur and ClosedC_Floor1 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Eetkamerdeur').name and domoticz.devices('Eetkamerdeur').state == 'Closed') then
			domoticz.globalData.OpenC_Eetkamerdeur = 0
			domoticz.globalData.OpenC_Floor1 = 0
			if debug == true then domoticz.log('OpenC_Eetkamerdeur and OpenC_Floor1 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Dakraam slaapkamer').name and domoticz.devices('Dakraam slaapkamer').state == 'Open') then
			domoticz.globalData.ClosedC_Dakraamslaapk = 0			
			domoticz.globalData.ClosedC_Floor2  = 0
			if debug == true then domoticz.log('ClosedC_Dakraamslaapk and ClosedC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Dakraam slaapkamer').name and domoticz.devices('Dakraam slaapkamer').state == 'Closed') then
			domoticz.globalData.OpenC_Dakraamslaapk = 0
			domoticz.globalData.OpenC_Floor2 = 0
			if debug == true then domoticz.log('OpenC_Dakraamslaapk and OpenC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Balkondeur slaapkamer').name and domoticz.devices('Balkondeur slaapkamer').state == 'Open') then
			domoticz.globalData.ClosedC_Balkondeurslaapk = 0
			domoticz.globalData.ClosedC_Floor2  = 0
			if debug == true then domoticz.log('ClosedC_Balkondeurslaapk and ClosedC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Balkondeur slaapkamer').name and domoticz.devices('Balkondeur slaapkamer').state == 'Closed') then
			domoticz.globalData.OpenC_Balkondeurslaapk = 0
			domoticz.globalData.OpenC_Floor2 = 0
			if debug == true then domoticz.log('OpenC_Balkondeurslaapk and OpenC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Front door').name and domoticz.devices('Front door').state == 'Open') then
			domoticz.globalData.ClosedC_Voordeur = 0
			domoticz.globalData.ClosedC_Floor1  = 0	
			if debug == true then domoticz.log('ClosedC_Voordeur and ClosedC_Floor1 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Front door').name and domoticz.devices('Front door').state == 'Closed') then
			domoticz.globalData.OpenC_Voordeur = 0
			domoticz.globalData.OpenC_Floor1 = 0
			if debug == true then domoticz.log('OpenC_Voordeur and OpenC_Floor1 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Balkondeur Nienke').name and domoticz.devices('Balkondeur Nienke').state == 'Open') then
			domoticz.globalData.ClosedC_BalkondeurNienke = 0
			domoticz.globalData.ClosedC_Floor2  = 0
			if debug == true then domoticz.log('ClosedC_BalkondeurNienke and ClosedC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Balkondeur Nienke').name and domoticz.devices('Balkondeur Nienke').state == 'Closed') then
			domoticz.globalData.OpenC_BalkondeurNienke = 0
			domoticz.globalData.OpenC_Floor2 = 0
			if debug == true then domoticz.log('OpenC_BalkondeurNienke and OpenC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Slaapkamerdeur').name and domoticz.devices('Slaapkamerdeur').state == 'Open') then
			domoticz.globalData.ClosedC_Slaapkdeur = 0
			domoticz.globalData.ClosedC_Floor2  = 0
			if debug == true then domoticz.log('ClosedC_Slaapkdeur and ClosedC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Slaapkamerdeur').name and domoticz.devices('Slaapkamerdeur').state == 'Closed') then
			domoticz.globalData.OpenC_Slaapkdeur = 0
			domoticz.globalData.OpenC_Floor2 = 0
			if debug == true then domoticz.log('OpenC_Slaapkdeur and OpenC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Deur bijkeuken').name and domoticz.devices('Deur bijkeuken').state == 'Open') then
			domoticz.globalData.ClosedC_Deurbijkeuken = 0
			domoticz.globalData.ClosedC_Floor1  = 0
			if debug == true then domoticz.log('ClosedC_Deurbijkeuken and ClosedC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Deur bijkeuken').name and domoticz.devices('Deur bijkeuken').state == 'Closed') then
			domoticz.globalData.OpenC_Deurbijkeuken = 0
			domoticz.globalData.OpenC_Floor1 = 0
			if debug == true then domoticz.log('OpenC_Deurbijkeuken and OpenC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Zolderdakraam achter').name and domoticz.devices('Zolderdakraam achter').state == 'Open') then
			domoticz.globalData.ClosedC_Dakraamzolder = 0
			domoticz.globalData.ClosedC_Floor3 = 0
			if debug == true then domoticz.log('ClosedC_Dakraamzolder and ClosedC_Floor3 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Zolderdakraam achter').name and domoticz.devices('Zolderdakraam achter').state == 'Closed') then
			domoticz.globalData.OpenC_Dakraamzolder = 0
			domoticz.globalData.OpenC_Floor3 = 0
			if debug == true then domoticz.log('OpenC_Dakraamzolder and OpenC_Floor3 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Zolderdakraam voor').name and domoticz.devices('Zolderdakraam voor').state == 'Open') then
			domoticz.globalData.ClosedC_Dakraamzoldervoor = 0
			domoticz.globalData.ClosedC_Floor3 = 0
			if debug == true then domoticz.log('ClosedC_Dakraamzoldervoor and ClosedC_Floor3 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Zolderdakraam voor').name and domoticz.devices('Zolderdakraam voor').state == 'Closed') then
			domoticz.globalData.OpenC_Dakraamzoldervoor = 0
			domoticz.globalData.OpenC_Floor3 = 0
			if debug == true then domoticz.log('OpenC_Dakraamzoldervoor and OpenC_Floor3 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Garage deur').name and domoticz.devices('Garage deur').state == 'Open') then
			domoticz.globalData.ClosedC_Deurgarage = 0
			domoticz.globalData.ClosedC_Outside = 0
			if debug == true then domoticz.log('ClosedC_Deurgarage and ClosedC_Outside set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Garage deur').name and domoticz.devices('Garage deur').state == 'Closed') then
			domoticz.globalData.OpenC_Deurgarage = 0
			domoticz.globalData.OpenC_Outside = 0
			if debug == true then domoticz.log('OpenC_Deurgarage and OpenC_Outside set to zero',domoticz.LOG_INFO) end
		end		
		if (device.name == domoticz.devices('Beweging woonkamer').name and domoticz.devices('Beweging woonkamer').state == 'On') then
			domoticz.globalData.NMC_PIR_woonk = 0
			domoticz.globalData.NMC_Floor1  = 0	
			if debug == true then domoticz.log('NMC_PIR_woonk and NMC_Floor1 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Beweging woonkamer').name and domoticz.devices('Beweging woonkamer').state == 'Off') then
			domoticz.globalData.MC_PIR_woonk = 0
			domoticz.globalData.MC_Floor1   = 0	
			if debug == true then domoticz.log('MC_PIR_woonk and MC_Floor1 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Beweging kamer Lars').name and domoticz.devices('Beweging kamer Lars').state == 'On') then
			domoticz.globalData.NMC_PIR_kamerLars = 0
			domoticz.globalData.NMC_Floor2  = 0	
			if debug == true then domoticz.log('NMC_PIR_kamerLars and NMC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Beweging kamer Lars').name and domoticz.devices('Beweging kamer Lars').state == 'Off') then
			domoticz.globalData.MC_PIR_kamerLars = 0
			domoticz.globalData.MC_Floor2   = 0
			if debug == true then domoticz.log('MC_PIR_kamerLars and MC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Beweging kamer Nienke').name and domoticz.devices('Beweging kamer Nienke').state == 'On') then
			domoticz.globalData.NMC_PIR_kamerNienke = 0
			domoticz.globalData.NMC_Floor2  = 0	
			if debug == true then domoticz.log('NMC_PIR_kamerNienke and NMC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Beweging kamer Nienke').name and domoticz.devices('Beweging kamer Nienke').state == 'Off') then
			domoticz.globalData.MC_PIR_kamerNienke = 0
			domoticz.globalData.MC_Floor2   = 0
			if debug == true then domoticz.log('MC_PIR_kamerNienke and MC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Beweging badkamer').name and domoticz.devices('Beweging badkamer').state == 'On') then
			domoticz.globalData.NMC_PIR_badkamer = 0
			domoticz.globalData.NMC_Floor2  = 0	
			if debug == true then domoticz.log('NMC_PIR_badkamer and NMC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Beweging badkamer').name and domoticz.devices('Beweging badkamer').state == 'Off') then
			domoticz.globalData.MC_PIR_badkamer = 0
			domoticz.globalData.MC_Floor2   = 0
			if debug == true then domoticz.log('MC_PIR_badkamer and MC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Beweging chillkamer').name and domoticz.devices('Beweging chillkamer').state == 'On') then
			domoticz.globalData.NMC_PIR_chillkamer = 0
			domoticz.globalData.NMC_Floor3  = 0	
			if debug == true then domoticz.log('NMC_PIR_chillkamer and NMC_Floor3 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Beweging chillkamer').name and domoticz.devices('Beweging chillkamer').state == 'Off') then
			domoticz.globalData.MC_PIR_chillkamer = 0
			domoticz.globalData.MC_Floor3   = 0
			if debug == true then domoticz.log('MC_PIR_chillkamer and MC_Floor3 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Beweging hal boven').name and domoticz.devices('Beweging hal boven').state == 'On') then
			domoticz.globalData.NMC_PIR_halboven = 0
			domoticz.globalData.NMC_Floor2  = 0	
			if debug == true then domoticz.log('NMC_PIR_halboven and NMC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Beweging hal boven').name and domoticz.devices('Beweging hal boven').state == 'Off') then
			domoticz.globalData.MC_PIR_halboven = 0
			domoticz.globalData.MC_Floor2   = 0
			if debug == true then domoticz.log('MC_PIR_halboven and MC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Dimmer bed Martijn').name and domoticz.devices('Dimmer bed Martijn').state == 'On') then
			domoticz.globalData.NMC_Floor2 = 0
			if debug == true then domoticz.log('NMC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Dimmer bed Suzanne').name and domoticz.devices('Dimmer bed Suzanne').state == 'Off') then
			domoticz.globalData.MC_Floor2 = 0		  
			if debug == true then domoticz.log('MC_Floor2 set to zero',domoticz.LOG_INFO) end
		end		
		if (device.name == domoticz.devices('Dimmer bed Suzanne').name and domoticz.devices('Dimmer bed Suzanne').state == 'On') then
			domoticz.globalData.NMC_Floor2 = 0
			if debug == true then domoticz.log('NMC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Dimmer bed Suzanne').name and domoticz.devices('Dimmer bed Suzanne').state == 'Off') then
			domoticz.globalData.MC_Floor2 = 0		  
			if debug == true then domoticz.log('MC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Lamp hal boven').name and domoticz.devices('Lamp hal boven').state == 'On') then
			domoticz.globalData.NMC_Floor2 = 0
			if debug == true then domoticz.log('NMC_Floor2 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Lamp hal boven').name and domoticz.devices('Lamp hal boven').state == 'Off') then
			domoticz.globalData.MC_Floor2 = 0		  
			if debug == true then domoticz.log('MC_Floor2 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Schemerlamp deur').name and domoticz.devices('Schemerlamp deur').state == 'On') then
			domoticz.globalData.NMC_Floor1 = 0
			if debug == true then domoticz.log('NMC_Floor1 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Schemerlamp deur').name and domoticz.devices('Schemerlamp deur').state == 'Off') then
			domoticz.globalData.MC_Floor1 = 0		  
			if debug == true then domoticz.log('MC_Floor1 set to zero',domoticz.LOG_INFO) end
		end
		if (device.name == domoticz.devices('Lamp spoelb keuken').name and domoticz.devices('Lamp spoelb keuken').state == 'On') then
			domoticz.globalData.NMC_Floor1 = 0
			if debug == true then domoticz.log('NMC_Floor1 set to zero',domoticz.LOG_INFO) end
		elseif (device.name == domoticz.devices('Lamp spoelb keuken').name and domoticz.devices('Lamp spoelb keuken').state == 'Off') then
			domoticz.globalData.MC_Floor1 = 0		  
			if debug == true then domoticz.log('MC_Floor1 set to zero',domoticz.LOG_INFO) end
		end
		if (domoticz.globalData.OpenC_Floor1 == 0 or domoticz.globalData.OpenC_Floor2 == 0 or domoticz.globalData.OpenC_Floor3 == 0 or domoticz.globalData.OpenC_Outside == 0) then
			domoticz.globalData.OpenC_Overall = 0
		end
		if (domoticz.globalData.ClosedC_Floor1 == 0 and domoticz.globalData.ClosedC_Floor2 == 0 and domoticz.globalData.ClosedC_Floor3 == 0 and domoticz.globalData.ClosedC_Outside == 0) then
			domoticz.globalData.ClosedC_Overall = 0
		end
		if (domoticz.globalData.MC_Floor1 == 0 or domoticz.globalData.MC_Floor2 == 0) then
			domoticz.globalData.MC_Overall = 0
		end
		if (domoticz.globalData.NMC_Floor1 == 0 and domoticz.globalData.NMC_Floor2 == 0) then
			domoticz.globalData.NMC_Overall = 0
		end
	end
}