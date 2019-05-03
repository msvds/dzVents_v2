return {
	active = false, -- set to false to disable this script
	logging = {marker = "gashaard"},
	on = {
		devices = {'Gashaard'
		},
	},
	execute = function(domoticz, device)
		if (device.state == 'Run Up') then			
			--0=Off/10=Away/20=Sleep/30=Home/40=Comfort/50=Manual
			domoticz.devices('Toon Scenes').switchSelector(10)
			domoticz.log('Toon Scenes gezet op Away (10) omdat de gashaard aangezet is',domoticz.LOG_INFO)
		end
	end
}