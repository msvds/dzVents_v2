return {
	active = true, -- set to false to disable this script
	logging = {marker = "someOneHome"},
	on = {
		timer = {'every 1 minutes'}
		--devices = {
		--	'Suzanne smartphone',
		--	'Martijn smartphone'
		--},
	},

	execute = function(domoticz, device)
		local movement_delay = 2
		local nomovement_delay = 5
		local open_delay = 0
		--if (domoticz.devices('SomeoneHome').state == 'Off' and (domoticz.devices('Suzanne smartphone').state == 'On' or domoticz.devices('Martijn smartphone').state == 'On') or domoticz.globalData.MC_Overall > movement_delay or domoticz.globalData.OpenC_Overall > open_delay) then
		if (domoticz.devices('SomeoneHome').state == 'Off' and (domoticz.devices('Life360 - Suzanne Presence').state == 'On' or domoticz.devices('Life360 - Martijn Presence').state == 'On')) then
			domoticz.log('SomeoneHome switchOn',domoticz.LOG_INFO)
			domoticz.devices('SomeoneHome').switchOn()
		--elseif (domoticz.devices('SomeoneHome').state == 'On' and (domoticz.devices('Suzanne smartphone').state == 'Off' and domoticz.devices('Martijn smartphone').state == 'Off') and domoticz.globalData.NMC_Overall > nomovement_delay) then
		elseif (domoticz.devices('SomeoneHome').state == 'On' and (domoticz.devices('Life360 - Suzanne Presence').state == 'Off' and domoticz.devices('Life360 - Martijn Presence').state == 'Off')) then
			domoticz.log('SomeoneHome switchOff',domoticz.LOG_INFO)
			domoticz.devices('SomeoneHome').switchOff()
		end
	end
}