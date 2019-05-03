return {
	active = true, -- set to false to disable this script
	logging = {marker = "zout_voorraad"},
	on = {
		devices = {'Zout Voorraad Op Sensor'},
	},
	execute = function(domoticz, device)
		if (device.state == 'On') then
			domoticz.helpers.sendnotification(domoticz,'Zout','De zout voorraad van de ontharder is op. Het is tijd om bij te vullen')
		end
	end
}