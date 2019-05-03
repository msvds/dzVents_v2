return {
	active = true,
	logging = {marker = "timer_reboot_gateways"},
	on = {
		timer = {'every 4 hours'}
	},
	execute = function(domoticz, device)
		domoticz.devices('IKEA en EQ-3 MAX gateways').switchOff()
		domoticz.devices('IKEA en EQ-3 MAX gateways').switchOn().afterSec(15)
		domoticz.log('IKEA en EQ-3 MAX gateways gereset',domoticz.LOG_INFO)		
	end
}