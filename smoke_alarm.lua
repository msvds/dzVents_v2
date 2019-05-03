-- smoke alarm checks and notifications are set here
-- test switch idx = 91
return {
	active = true, -- set to false to disable this script
	logging = {marker = "smoke_alarm"},
	on = {
		devices = {'Smoke Detector Zolder','Smoke Detector Keuken','Smoke Detector Garage','Smoke Detector Zolder Top'
			--,'Test Switch'
		},
	},
	execute = function(domoticz, device)
		if (device.state == 'On') then
			domoticz.helpers.sendnotification(domoticz,'Brand!','Een rookmelder gaat af')
		domoticz.helpers.flash_lights(domoticz,domoticz.devices('Schemerlamp deur').state,domoticz.devices('Lamp spoelb keuken').state,domoticz.devices('Tradfri - Group - boven tv').state,domoticz.devices('Schemerlamp bank').state,domoticz.devices('Lamp hal boven').state,1,180,1)
			if (device.name == 'Smoke Detector Zolder' and domoticz.devices('Notifications').level ~= 0) then 
				domoticz.notify('Brand!', "De rookmelder in de hal boven gaat af" ,domoticz.PRIORITY_HIGH)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(30)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(30)
				domoticz.devices('Gateway light eetkamer').switchSelector(10)--red
				domoticz.devices('Gateway light hal boven').switchSelector(10)--red
			end
			if (device.name == 'Smoke Detector Keuken' and domoticz.devices('Notifications').level ~= 0) then 
				domoticz.notify('Brand!', "De rookmelder in de keuken boven gaat af" ,domoticz.PRIORITY_HIGH)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(30)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(30)
				domoticz.devices('Gateway light eetkamer').switchSelector(10)--red
				domoticz.devices('Gateway light hal boven').switchSelector(10)--red
			end
			if (device.name == 'Smoke Detector Garage' and domoticz.devices('Notifications').level ~= 0) then 
				domoticz.notify('Brand!', "De rookmelder in de garage gaat af" ,domoticz.PRIORITY_HIGH)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(30)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(30)
				domoticz.devices('Gateway light eetkamer').switchSelector(10)--red
				domoticz.devices('Gateway light hal boven').switchSelector(10)--red
			end			
			if (device.name == 'Smoke Detector Zolder Top' and domoticz.devices('Notifications').level ~= 0) then 
				domoticz.notify('Brand!', "De rookmelder op de zolder gaat af" ,domoticz.PRIORITY_HIGH)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(30)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(30)
				domoticz.devices('Gateway light eetkamer').switchSelector(10)--red
				domoticz.devices('Gateway light hal boven').switchSelector(10)--red
			end
			if (device.name == 'Test Switch') then 
				domoticz.notify('Brand alarm test!', "Dit was een test, niks aan de hand" ,domoticz.PRIORITY_HIGH)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone eetkamer').switchSelector(30)
				domoticz.devices('Xiaomi Gateway Alarm Ringtone hal boven').switchSelector(30)
				domoticz.devices('Gateway light eetkamer').switchSelector(10)--red
				domoticz.devices('Gateway light hal boven').switchSelector(10)--red
			end
		end
	end
}