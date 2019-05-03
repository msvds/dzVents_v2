-- front door bell checks and actions are set here
-- test switch idx = 91
return {
	active = true, -- set to false to disable this script
	logging = {marker = "voordeurbel"},
	on = {
		devices = {'Deurbel'
		--,'Test Switch'
		}
	},
	execute = function(domoticz, device)
		if (domoticz.devices('Deurbel').state == 'Group On' or domoticz.devices('Deurbel').state == 'On') then			
			local Time = require('Time')
			domoticz.devices('Xiaomi Gateway Doorbell hal boven').switchSelector(10)
			local sceneCmd = 'curl -s -i -H "Accept: application/json" "http://192.168.190.3:8084/json.htm?type=command&param=setcolbrightnessvalue&idx=53&hue=236&brightness=1&iswhite=false"'
			os.execute(sceneCmd)

			domoticz.devices('Xiaomi Gateway Doorbell eetkamer').switchSelector(10)
			local sceneCmd = 'curl -s -i -H "Accept: application/json" "http://192.168.190.37:8084/json.htm?type=command&param=setcolbrightnessvalue&idx=54&hue=236&brightness=1&iswhite=false"'
			os.execute(sceneCmd)
			
			domoticz.devices('Xiaomi Gateway Doorbell zolder').switchSelector(10)
			local sceneCmd = 'curl -s -i -H "Accept: application/json" "http://192.168.190.12:8084/json.htm?type=command&param=setcolbrightnessvalue&idx=54&hue=236&brightness=1&iswhite=false"'
			os.execute(sceneCmd)

			domoticz.helpers.sendnotification(domoticz,'De deurbel gaat','Er staat iemand voor de deur')
			--domoticz.helpers.flash_lights(domoticz,domoticz.devices('Schemerlamp deur').state,domoticz.devices('Lamp spoelb keuken').state,domoticz.devices('Lamp boven TV').state,domoticz.devices('Schemerlamp bank').state,domoticz.devices('Lamp hal boven').state,1,2,1)
			if (domoticz.devices('IsDonker (virt)').state == 'On') then
				domoticz.helpers.switch_lights(domoticz,'Voortuin','On',0)
				domoticz.helpers.switch_lights(domoticz,'HalBeneden','On',0)
				domoticz.log('Voordeurlamp aangezet omdat iemand aanbelt in het donker',domoticz.LOG_INFO)
			end
		end
	end
}
