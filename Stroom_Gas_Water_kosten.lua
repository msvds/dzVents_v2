return {
	active = true, -- set to false to disable this script
	logging = {marker = "Stroom_Gas_Water_kosten"},
	on = { timer   = { "every 5 minutes" }},                    -- script draait iedere 5 minuten
	-- on = { devices = { "Stroom","Gas"}},--,"Waterverbruik" }},    -- Verwijder -- aan het begin van deze regel en plaats -- voor bovenstaande regel als 
                                                                -- je het script wilt draaien zodra er een nieuw verbruik aan Domoticz is doorgegeven
    
	execute = function(dz)
		-- Devices
        local vandaagKwh      = dz.devices('Stroom').counterToday         -- Stroommeter device
        local vandaagM3Gas    = dz.devices('Gas').counterToday            -- Gasmeter device
        --local vandaagM3Water  = dz.devices('Waterverbruik').counterToday  -- Watermeter device
        
        local StroomKosten  = dz.devices('Stroomkosten')                -- Stroomkosten device
        local GasKosten     = dz.devices('Gaskosten')                   -- Gaskosten device
        --local WaterKosten   = dz.devices('Waterkosten')                 -- Waterkosten device
        -- Eenheidsprijs in Euro's / Kwh - M3
		-- prijzen van vandebron 29-12-2018
        local kwhPrijs      = 0.05158+0.12654
        local gasM3Prijs    = 0.21867+0.31461
        --local waterM3Prijs  = 0.8200
        
        -- Vaste kosten in Euro's per dag (zoals vastrecht) 
        local kwhPrijsVast = 0.10959+0.61444
        local gasM3PrijsVast = 0.10959+0.46173
        --local waterM3PrijsVast = 0.0000
        
        -- Kosten berekenen
        local kwhKosten      = tonumber(dz.utils.round( (kwhPrijs * vandaagKwh),2) + kwhPrijsVast)--)--:gsub("%.",",")   -- rounded to two decimals and replace dot by comma
        local GasM3Kosten    = tonumber(dz.utils.round( (gasM3Prijs * vandaagM3Gas),2) + gasM3PrijsVast)--)--:gsub("%.",",")
        --local WaterM3Kosten  = tonumber(dz.utils.round( (waterM3Prijs * vandaagM3Water)/1000,2) + waterM3PrijsVast)--)--:gsub("%.",",")
        
        -- Kosten updaten
          StroomKosten.updateCustomSensor(kwhKosten)
          GasKosten.updateCustomSensor(GasM3Kosten)
          --WaterKosten.updateCustomSensor(WaterM3Kosten)
    end
}