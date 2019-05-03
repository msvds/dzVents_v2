-- Counters for motion, no motion, open and closed windows/doors in minutes
-- PIR for floor 3 missing
return {
	active = true,
	logging = {marker = "counters_time"},
	on = {
		timer = {'every minute'}
	},
	execute = function(domoticz)
		-- OpenC increases if 1 door on a floor is open
		-- ClosedC increases only if all doors on a floor are closed
		local OpenC_Floor1 = 0
		local OpenC_Floor2 = 0
		local OpenC_Floor3 = 0
		local ClosedC_Floor1 = 0
		local ClosedC_Floor2 = 0
		local ClosedC_Floor3 = 0
		local MC_Floor1 = 0
		local MC_Floor2 = 0
		local MC_Floor3 = 0
		local NMC_Floor1 = 0
		local NMC_Floor2 = 0
		local NMC_Floor3 = 0
		local message_time = 15
		domoticz.globalData.Counters_time_message_interval = domoticz.globalData.Counters_time_message_interval + 1  
		
		OpenC_Eetkamerdeur = domoticz.helpers.Counter(domoticz, domoticz.devices('Eetkamerdeur'), tonumber(domoticz.globalData.OpenC_Eetkamerdeur),'Open')
		domoticz.globalData.OpenC_Eetkamerdeur = OpenC_Eetkamerdeur
		ClosedC_Eetkamerdeur = domoticz.helpers.Counter(domoticz, domoticz.devices('Eetkamerdeur'), tonumber(domoticz.globalData.ClosedC_Eetkamerdeur),'Closed')
		domoticz.globalData.ClosedC_Eetkamerdeur = ClosedC_Eetkamerdeur
		if (domoticz.globalData.OpenC_Eetkamerdeur ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_Eetkamerdeur: ' ..domoticz.globalData.OpenC_Eetkamerdeur,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.ClosedC_Eetkamerdeur ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_Eetkamerdeur: ' ..domoticz.globalData.ClosedC_Eetkamerdeur,domoticz.LOG_INFO)		
		end
		
		OpenC_Dakraamslaapk = domoticz.helpers.Counter(domoticz, domoticz.devices('Dakraam slaapkamer'), tonumber(domoticz.globalData.OpenC_Dakraamslaapk),'Open')
		domoticz.globalData.OpenC_Dakraamslaapk = OpenC_Dakraamslaapk
		ClosedC_Dakraamslaapk = domoticz.helpers.Counter(domoticz, domoticz.devices('Dakraam slaapkamer'), tonumber(domoticz.globalData.ClosedC_Dakraamslaapk),'Closed')
		domoticz.globalData.ClosedC_Dakraamslaapk = ClosedC_Dakraamslaapk	
		if (domoticz.globalData.OpenC_Dakraamslaapk ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_Dakraamslaapk: ' ..domoticz.globalData.OpenC_Dakraamslaapk,domoticz.LOG_INFO)		
		end
		if (domoticz.globalData.ClosedC_Dakraamslaapk ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_Dakraamslaapk: ' ..domoticz.globalData.ClosedC_Dakraamslaapk,domoticz.LOG_INFO)
		end
		
		OpenC_Balkondeurslaapk = domoticz.helpers.Counter(domoticz, domoticz.devices('Balkondeur slaapkamer'), tonumber(domoticz.globalData.OpenC_Balkondeurslaapk),'Open')
		domoticz.globalData.OpenC_Balkondeurslaapk = OpenC_Balkondeurslaapk
		ClosedC_Balkondeurslaapk = domoticz.helpers.Counter(domoticz, domoticz.devices('Balkondeur slaapkamer'), tonumber(domoticz.globalData.ClosedC_Balkondeurslaapk),'Closed')
		domoticz.globalData.ClosedC_Balkondeurslaapk = ClosedC_Balkondeurslaapk	
		if (domoticz.globalData.OpenC_Balkondeurslaapk ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_Balkondeurslaapk: ' ..domoticz.globalData.OpenC_Balkondeurslaapk,domoticz.LOG_INFO)	
		end
		if (domoticz.globalData.ClosedC_Balkondeurslaapk ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_Balkondeurslaapk: ' ..domoticz.globalData.ClosedC_Balkondeurslaapk,domoticz.LOG_INFO)
		end
		
		OpenC_Voordeur = domoticz.helpers.Counter(domoticz, domoticz.devices('Front door'), tonumber(domoticz.globalData.OpenC_Voordeur),'Open')
		domoticz.globalData.OpenC_Voordeur = OpenC_Voordeur
		ClosedC_Voordeur = domoticz.helpers.Counter(domoticz, domoticz.devices('Front door'), tonumber(domoticz.globalData.ClosedC_Voordeur),'Closed')
		domoticz.globalData.ClosedC_Voordeur = ClosedC_Voordeur
		if (domoticz.globalData.OpenC_Voordeur ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_Voordeur: ' ..domoticz.globalData.OpenC_Voordeur,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.ClosedC_Voordeur ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_Voordeur: ' ..domoticz.globalData.ClosedC_Voordeur,domoticz.LOG_INFO)
		end
		
		OpenC_BalkondeurNienke = domoticz.helpers.Counter(domoticz, domoticz.devices('Balkondeur Nienke'), tonumber(domoticz.globalData.OpenC_BalkondeurNienke),'Open')
		domoticz.globalData.OpenC_BalkondeurNienke = OpenC_BalkondeurNienke
		ClosedC_BalkondeurNienke = domoticz.helpers.Counter(domoticz, domoticz.devices('Balkondeur Nienke'), tonumber(domoticz.globalData.ClosedC_BalkondeurNienke),'Closed')
		domoticz.globalData.ClosedC_BalkondeurNienke = ClosedC_BalkondeurNienke
		if (domoticz.globalData.OpenC_BalkondeurNienke ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_BalkondeurNienke: ' ..domoticz.globalData.OpenC_BalkondeurNienke,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.ClosedC_BalkondeurNienke ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_BalkondeurNienke: ' ..domoticz.globalData.ClosedC_BalkondeurNienke,domoticz.LOG_INFO)
		end
		
		OpenC_Deurbijkeuken  = domoticz.helpers.Counter(domoticz, domoticz.devices('Deur bijkeuken'), tonumber(domoticz.globalData.OpenC_Deurbijkeuken),'Open')
		domoticz.globalData.OpenC_Deurbijkeuken = OpenC_Deurbijkeuken
		ClosedC_Deurbijkeuken  = domoticz.helpers.Counter(domoticz, domoticz.devices('Deur bijkeuken'), tonumber(domoticz.globalData.ClosedC_Deurbijkeuken),'Closed')
		domoticz.globalData.ClosedC_Deurbijkeuken = ClosedC_Deurbijkeuken
		if (domoticz.globalData.OpenC_Deurbijkeuken ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_Deurbijkeuken: ' ..domoticz.globalData.OpenC_Deurbijkeuken,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.ClosedC_Deurbijkeuken ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_Deurbijkeuken: ' ..domoticz.globalData.ClosedC_Deurbijkeuken,domoticz.LOG_INFO)
		end
		
		OpenC_Slaapkdeur = domoticz.helpers.Counter(domoticz, domoticz.devices('Slaapkamerdeur'), tonumber(domoticz.globalData.OpenC_Slaapkdeur),'Open')
		domoticz.globalData.OpenC_Slaapkdeur = OpenC_Slaapkdeur
		ClosedC_Slaapkdeur = domoticz.helpers.Counter(domoticz, domoticz.devices('Slaapkamerdeur'), tonumber(domoticz.globalData.ClosedC_Slaapkdeur),'Closed')
		domoticz.globalData.ClosedC_Slaapkdeur = ClosedC_Slaapkdeur
		if (domoticz.globalData.OpenC_Slaapkdeur ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_Slaapkdeur: ' ..domoticz.globalData.OpenC_Slaapkdeur,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.ClosedC_Slaapkdeur ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_Slaapkdeur: ' ..domoticz.globalData.ClosedC_Slaapkdeur,domoticz.LOG_INFO)
		end
		
		OpenC_Dakraamzolder = domoticz.helpers.Counter(domoticz, domoticz.devices('Zolderdakraam achter'), tonumber(domoticz.globalData.OpenC_Dakraamzolder),'Open')
		domoticz.globalData.OpenC_Dakraamzolder = OpenC_Dakraamzolder
		ClosedC_Dakraamzolder = domoticz.helpers.Counter(domoticz, domoticz.devices('Zolderdakraam achter'), tonumber(domoticz.globalData.ClosedC_Dakraamzolder),'Closed')
		domoticz.globalData.ClosedC_Dakraamzolder = ClosedC_Dakraamzolder
		if (domoticz.globalData.ClosedC_Dakraamzolder ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_Dakraamzolder: ' ..domoticz.globalData.ClosedC_Dakraamzolder,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.OpenC_Dakraamzolder ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_Dakraamzolder: ' ..domoticz.globalData.OpenC_Dakraamzolder,domoticz.LOG_INFO)
		end
		
		OpenC_Dakraamzoldervoor = domoticz.helpers.Counter(domoticz, domoticz.devices('Zolderdakraam voor'), tonumber(domoticz.globalData.OpenC_Dakraamzoldervoor),'Open')
		domoticz.globalData.OpenC_Dakraamzoldervoor = OpenC_Dakraamzoldervoor
		ClosedC_Dakraamzoldervoor = domoticz.helpers.Counter(domoticz, domoticz.devices('Zolderdakraam voor'), tonumber(domoticz.globalData.ClosedC_Dakraamzoldervoor),'Closed')
		domoticz.globalData.ClosedC_Dakraamzoldervoor = ClosedC_Dakraamzoldervoor
		if (domoticz.globalData.ClosedC_Dakraamzoldervoor ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_Dakraamzoldervoor: ' ..domoticz.globalData.ClosedC_Dakraamzoldervoor,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.OpenC_Dakraamzoldervoor ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_Dakraamzoldervoor: ' ..domoticz.globalData.OpenC_Dakraamzoldervoor,domoticz.LOG_INFO)
		end

		OpenC_Deurgarage = domoticz.helpers.Counter(domoticz, domoticz.devices('Garage deur'), tonumber(domoticz.globalData.OpenC_Deurgarage),'Open')
		domoticz.globalData.OpenC_Deurgarage = OpenC_Deurgarage
		ClosedC_Deurgarage = domoticz.helpers.Counter(domoticz, domoticz.devices('Garage deur'), tonumber(domoticz.globalData.ClosedC_Deurgarage),'Closed')
		domoticz.globalData.ClosedC_Deurgarage = ClosedC_Deurgarage
		if (domoticz.globalData.ClosedC_Deurgarage ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.ClosedC_Deurgarage: ' ..domoticz.globalData.ClosedC_Deurgarage,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.OpenC_Deurgarage ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.OpenC_Deurgarage: ' ..domoticz.globalData.OpenC_Deurgarage,domoticz.LOG_INFO)
		end		
		MC_PIR_woonk = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging woonkamer'), tonumber(domoticz.globalData.MC_PIR_woonk),'On')
		domoticz.globalData.MC_PIR_woonk = MC_PIR_woonk
		NMC_PIR_woonk = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging woonkamer'), tonumber(domoticz.globalData.NMC_PIR_woonk),'Off')
		domoticz.globalData.NMC_PIR_woonk = NMC_PIR_woonk
		if (domoticz.globalData.MC_PIR_woonk ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.MC_PIR_woonk: ' ..domoticz.globalData.MC_PIR_woonk,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.NMC_PIR_woonk ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.NMC_PIR_woonk: ' ..domoticz.globalData.NMC_PIR_woonk,domoticz.LOG_INFO)
		end
		
		MC_PIR_kamerLars = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging kamer Lars'), tonumber(domoticz.globalData.MC_PIR_kamerLars),'On')
		domoticz.globalData.MC_PIR_kamerLars = MC_PIR_kamerLars
		NMC_PIR_kamerLars = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging kamer Lars'), tonumber(domoticz.globalData.NMC_PIR_kamerLars),'Off')
		domoticz.globalData.NMC_PIR_kamerLars = NMC_PIR_kamerLars
		if (domoticz.globalData.MC_PIR_kamerLars ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.MC_PIR_kamerLars: ' ..domoticz.globalData.MC_PIR_kamerLars,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.NMC_PIR_kamerLars ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.NMC_PIR_kamerLars: ' ..domoticz.globalData.NMC_PIR_kamerLars,domoticz.LOG_INFO)
		end
		
		MC_PIR_kamerNienke = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging kamer Nienke'), tonumber(domoticz.globalData.MC_PIR_kamerNienke),'On')
		domoticz.globalData.MC_PIR_kamerNienke = MC_PIR_kamerNienke
		NMC_PIR_kamerNienke = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging kamer Nienke'), tonumber(domoticz.globalData.NMC_PIR_kamerNienke),'Off')
		domoticz.globalData.NMC_PIR_kamerNienke = NMC_PIR_kamerNienke
		if (domoticz.globalData.MC_PIR_kamerNienke ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.MC_PIR_kamerNienke: ' ..domoticz.globalData.MC_PIR_kamerNienke,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.NMC_PIR_kamerNienke ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.NMC_PIR_kamerNienke: ' ..domoticz.globalData.NMC_PIR_kamerNienke,domoticz.LOG_INFO)
		end
		
		MC_PIR_chillkamer = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging chillkamer'), tonumber(domoticz.globalData.MC_PIR_chillkamer),'On')
		domoticz.globalData.MC_PIR_chillkamer = MC_PIR_chillkamer
		NMC_PIR_chillkamer = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging chillkamer'), tonumber(domoticz.globalData.NMC_PIR_chillkamer),'Off')
		domoticz.globalData.NMC_PIR_chillkamer = NMC_PIR_chillkamer
		if (domoticz.globalData.MC_PIR_chillkamer ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.MC_PIR_chillkamer: ' ..domoticz.globalData.MC_PIR_chillkamer,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.NMC_PIR_chillkamer ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.NMC_PIR_chillkamer: ' ..domoticz.globalData.NMC_PIR_chillkamer,domoticz.LOG_INFO)
		end
		
		MC_PIR_halboven = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging hal boven'), tonumber(domoticz.globalData.MC_PIR_halboven),'On')
		domoticz.globalData.MC_PIR_halboven = MC_PIR_halboven
		NMC_PIR_halboven = domoticz.helpers.Counter(domoticz, domoticz.devices('Beweging hal boven'), tonumber(domoticz.globalData.NMC_PIR_halboven),'Off')
		domoticz.globalData.NMC_PIR_halboven = NMC_PIR_halboven
		if (domoticz.globalData.MC_PIR_halboven ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.MC_PIR_halboven: ' ..domoticz.globalData.MC_PIR_halboven,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.NMC_PIR_halboven ~= 0 and domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('domoticz.globalData.NMC_PIR_halboven: ' ..domoticz.globalData.NMC_PIR_halboven,domoticz.LOG_INFO)
		end
		
		--Floor1
		--Eetkamerdeur
		--Voordeur
		--PIR_woonk
		if (domoticz.globalData.OpenC_Eetkamerdeur ~= 0 or domoticz.globalData.OpenC_Voordeur ~= 0) then
			domoticz.globalData.OpenC_Floor1 = domoticz.globalData.OpenC_Floor1 + 1
			domoticz.globalData.ClosedC_Floor1 = 0
		end
		if (domoticz.globalData.ClosedC_Eetkamerdeur ~= 0 and domoticz.globalData.ClosedC_Voordeur ~= 0) then
			domoticz.globalData.ClosedC_Floor1 = domoticz.globalData.ClosedC_Floor1 + 1
			domoticz.globalData.OpenC_Floor1 = 0
		end		
		if (domoticz.globalData.MC_PIR_woonk ~= 0) then
			domoticz.globalData.MC_Floor1 = domoticz.globalData.MC_Floor1 + 1
			domoticz.globalData.NMC_Floor1 = 0
		end
		if (domoticz.globalData.NMC_PIR_woonk ~= 0) then
			domoticz.globalData.NMC_Floor1 = domoticz.globalData.NMC_Floor1 + 1
			domoticz.globalData.MC_Floor1 = 0
		end
		--Floor2
		--Dakraamslaapk
		--Balkondeurslaapk
		--BalkondeurNienke
		--Slaapkdeur
		--PIR_kamerLars
		--PIR_kamerNienke
		--PIR_halboven
		--PIR_badkamer
		if (domoticz.globalData.OpenC_Dakraamslaapk ~= 0 or domoticz.globalData.OpenC_Balkondeurslaapk ~= 0 or domoticz.globalData.OpenC_BalkondeurNienke ~= 0 or domoticz.globalData.OpenC_Slaapkdeur ~= 0) then
			domoticz.globalData.OpenC_Floor2 = domoticz.globalData.OpenC_Floor2 + 1
			domoticz.globalData.ClosedC_Floor2 = 0
		end
		if (domoticz.globalData.ClosedC_Dakraamslaapk ~= 0 and domoticz.globalData.ClosedC_Balkondeurslaapk ~= 0 and domoticz.globalData.ClosedC_BalkondeurNienke ~= 0 and domoticz.globalData.ClosedC_Slaapkdeur ~= 0) then
			domoticz.globalData.ClosedC_Floor2 = domoticz.globalData.ClosedC_Floor2 + 1
			domoticz.globalData.OpenC_Floor2 = 0
		end		
		if (domoticz.globalData.MC_PIR_kamerLars ~= 0 or domoticz.globalData.MC_PIR_halboven ~= 0 or domoticz.globalData.MC_PIR_badkamer ~= 0 or domoticz.globalData.MC_PIR_kamerNienke ~= 0) then
			domoticz.globalData.MC_Floor2 = domoticz.globalData.MC_Floor2 + 1
			domoticz.globalData.NMC_Floor2 = 0
		end
		if (domoticz.globalData.NMC_PIR_kamerLars ~= 0 and domoticz.globalData.NMC_PIR_halboven ~= 0 and domoticz.globalData.NMC_PIR_badkamer ~= 0 and domoticz.globalData.NMC_PIR_kamerNienke ~= 0) then
			domoticz.globalData.NMC_Floor2 = domoticz.globalData.NMC_Floor2 + 1
			domoticz.globalData.MC_Floor2 = 0
		end
		
		--Floor3
		--Zolderdakraam voor
		--Zolderdakraam achter
		--PIR_chillkamer
		if (domoticz.globalData.OpenC_Dakraamzolder ~= 0 or domoticz.globalData.OpenC_Dakraamzoldervoor ~= 0) then
			domoticz.globalData.OpenC_Floor3 = domoticz.globalData.OpenC_Floor3 + 1
			domoticz.globalData.ClosedC_Floor3 = 0
		end
		if (domoticz.globalData.ClosedC_Dakraamzolder ~= 0 and domoticz.globalData.ClosedC_Dakraamzoldervoor ~= 0) then
			domoticz.globalData.ClosedC_Floor3 = domoticz.globalData.ClosedC_Floor3 + 1
			domoticz.globalData.OpenC_Floor3 = 0
		end
		if (domoticz.globalData.MC_PIR_chillkamer ~= 0) then
			domoticz.globalData.MC_Floor3 = domoticz.globalData.MC_Floor3 + 1
			domoticz.globalData.NMC_Floor3 = 0
		end
		if (domoticz.globalData.NMC_PIR_chillkamer ~= 0) then
			domoticz.globalData.NMC_Floor3 = domoticz.globalData.NMC_Floor3 + 1
			domoticz.globalData.MC_Floor3 = 0
		end
		
		--Total
		if (domoticz.globalData.OpenC_Floor1 ~= 0 or domoticz.globalData.OpenC_Floor2 ~= 0 or domoticz.globalData.OpenC_Floor3 ~= 0) then
			domoticz.globalData.OpenC_Overall = domoticz.globalData.OpenC_Overall + 1
			domoticz.globalData.ClosedC_Overall = 0
		end
		if (domoticz.globalData.ClosedC_Floor1 ~= 0 and domoticz.globalData.ClosedC_Floor2 ~= 0 and domoticz.globalData.ClosedC_Floor3 ~= 0) then
			domoticz.globalData.ClosedC_Overall = domoticz.globalData.ClosedC_Overall + 1
			domoticz.globalData.OpenC_Overall = 0
		end
		if (domoticz.globalData.MC_Floor1 ~= 0 or domoticz.globalData.MC_Floor2 ~= 0) then
			domoticz.globalData.MC_Overall = domoticz.globalData.MC_Overall + 1
			domoticz.globalData.NMC_Overall = 0
		end
		if (domoticz.globalData.NMC_Floor1 ~= 0 and domoticz.globalData.NMC_Floor2 ~= 0) then
			domoticz.globalData.NMC_Overall = domoticz.globalData.NMC_Overall + 1
			domoticz.globalData.MC_Overall = 0
		end
		if (domoticz.globalData.Counters_time_message_interval == message_time) then
			domoticz.log('OpenC_Floor1 = ' ..domoticz.globalData.OpenC_Floor1,domoticz.LOG_INFO)
			domoticz.log('ClosedC_Floor1 = ' ..domoticz.globalData.ClosedC_Floor1,domoticz.LOG_INFO)
			domoticz.log('MC_Floor1 = ' ..domoticz.globalData.MC_Floor1,domoticz.LOG_INFO)
			domoticz.log('NMC_Floor1 = ' ..domoticz.globalData.NMC_Floor1,domoticz.LOG_INFO)
			domoticz.log('OpenC_Floor2 = ' ..domoticz.globalData.OpenC_Floor2,domoticz.LOG_INFO)
			domoticz.log('ClosedC_Floor2 = ' ..domoticz.globalData.ClosedC_Floor2,domoticz.LOG_INFO)
			domoticz.log('MC_Floor2 = ' ..domoticz.globalData.MC_Floor2,domoticz.LOG_INFO)
			domoticz.log('NMC_Floor2 = ' ..domoticz.globalData.NMC_Floor2,domoticz.LOG_INFO)
			domoticz.log('OpenC_Floor3 = ' ..domoticz.globalData.OpenC_Floor3,domoticz.LOG_INFO)	
			domoticz.log('ClosedC_Floor3 = ' ..domoticz.globalData.ClosedC_Floor3,domoticz.LOG_INFO)
			domoticz.log('OpenC_Overall = ' ..domoticz.globalData.OpenC_Overall,domoticz.LOG_INFO)
			domoticz.log('ClosedC_Overall = ' ..domoticz.globalData.ClosedC_Overall,domoticz.LOG_INFO)
			domoticz.log('MC_Overall = ' ..domoticz.globalData.MC_Overall,domoticz.LOG_INFO)	
			domoticz.log('NMC_Overall = ' ..domoticz.globalData.NMC_Overall,domoticz.LOG_INFO)
		end
		if (domoticz.globalData.Counters_time_message_interval >= message_time) then
			domoticz.globalData.Counters_time_message_interval = 0
		end
	end
}