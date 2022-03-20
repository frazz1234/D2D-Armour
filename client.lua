--MADE BY DareToDoyle#3835--

ESX = nil
vestL = false
vestM = false
vestH = false
vestA = false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
		ESX = obj
		end)
	end
end)

RegisterNetEvent('D2D-Armor:Light')
AddEventHandler('D2D-Armor:Light', function()
	if vestL == true then 
		local player = PlayerPedId()
		TaskPlayAnim(PlayerPedId(), 'clothingtie', 'try_tie_negative_a', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)
		SendNUIMessage({sound = "bpvest", volume = 0.2})      
		SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
		SetPedArmour(player, 0)
		vestL = false  

	elseif vestL == false  then
		local player = PlayerPedId()
		ESX.Streaming.RequestAnimDict('clothingtie', function()                                               -- Loads a animation Dictionary (catagory)
		TaskPlayAnim(PlayerPedId(), 'clothingtie', 'try_tie_negative_a', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)     -- Plays a specific animation within the dictionary.
		Citizen.Wait(200)
		SendNUIMessage({sound = "bpvest", volume = 0.2})                                                      -- Plays a sound in the UI folder.
		SetPedComponentVariation(player, 9, 1, 0, 2)                                                         -- This means "ped, Clothing Type (bulletproof vest) , bulletproof vest 1 (/skin menu), bulletproof vest 2(/skin menu), unknown"
		SetPedArmour(player, 25)    
		vestL = true                                                                         -- Doesn't allow players to "stack" the armor.
	end)



end
end)

RegisterNetEvent('D2D-Armor:Medium')
AddEventHandler('D2D-Armor:Medium', function()
	if vestM == true then 
		local player = PlayerPedId()
		TaskPlayAnim(PlayerPedId(), 'clothingtie', 'try_tie_negative_a', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)
		SendNUIMessage({sound = "bpvest", volume = 0.2})      
		SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
		SetPedArmour(player, 0)
		vestM = false  

	elseif vestM == false  then
		local player = PlayerPedId()
		ESX.Streaming.RequestAnimDict('clothingtie', function()                                               -- Loads a animation Dictionary (catagory)
		TaskPlayAnim(PlayerPedId(), 'clothingtie', 'try_tie_negative_a', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)     -- Plays a specific animation within the dictionary.
		Citizen.Wait(200)
		SendNUIMessage({sound = "bpvest", volume = 0.2})                                                      -- Plays a sound in the UI folder.
		SetPedComponentVariation(player, 9, 1, 1, 2) 
		SetPedArmour(player, 50)    
		vestM = true                                                                         -- Doesn't allow players to "stack" the armor.
	end)



end
end)





RegisterNetEvent('D2D-Armor:Heavy')
AddEventHandler('D2D-Armor:Heavy', function()
	if vestH == true then 
		local player = PlayerPedId()
		TaskPlayAnim(PlayerPedId(), 'clothingtie', 'try_tie_negative_a', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)
		SendNUIMessage({sound = "bpvest", volume = 0.2})      
		SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
		SetPedArmour(player, 0)
		vestH = false  

	elseif vestH == false  then
		local player = PlayerPedId()
		ESX.Streaming.RequestAnimDict('clothingtie', function()                                               -- Loads a animation Dictionary (catagory)
		TaskPlayAnim(PlayerPedId(), 'clothingtie', 'try_tie_negative_a', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)     -- Plays a specific animation within the dictionary.
		Citizen.Wait(200)
		SendNUIMessage({sound = "bpvest", volume = 0.2})                                                      -- Plays a sound in the UI folder.
		SetPedComponentVariation(player, 9, 1, 2, 2) 
		SetPedArmour(player, 75)    
		vestH = true                                                                         -- Doesn't allow players to "stack" the armor.
	end)



end
end)

RegisterNetEvent('D2D-Armor:Military')
AddEventHandler('D2D-Armor:Military', function()
	if vestA == true then 
		local player = PlayerPedId()
		TaskPlayAnim(PlayerPedId(), 'clothingtie', 'try_tie_negative_a', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)
		SendNUIMessage({sound = "bpvest", volume = 0.2})      
		SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
		SetPedArmour(player, 0)
		vestA = false  

	elseif vestA == false  then
		local player = PlayerPedId()
		ESX.Streaming.RequestAnimDict('clothingtie', function()                                               -- Loads a animation Dictionary (catagory)
		TaskPlayAnim(PlayerPedId(), 'clothingtie', 'try_tie_negative_a', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)     -- Plays a specific animation within the dictionary.
		Citizen.Wait(200)
		SendNUIMessage({sound = "bpvest", volume = 0.2})                                                      -- Plays a sound in the UI folder.
		SetPedComponentVariation(player, 9, 1, 2, 2) 
		SetPedArmour(player, 100)    
		vestA = true                                                                         -- Doesn't allow players to "stack" the armor.
	end)



end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	local player = PlayerPedId()
	if vestL == true then 
		TriggerServerEvent("armour:light")
		SetPedComponentVariation(player, 9, 0, 0, 0) 
		vestL = false
	elseif vestM == true then
		TriggerServerEvent("armour:medium")
		SetPedComponentVariation(player, 9, 0, 0, 0) 

		vestM = false
	elseif vestH == true then
		TriggerServerEvent("armour:heavy")
		SetPedComponentVariation(player, 9, 0, 0, 0) 

		vestH = false
	elseif vestA == true then
		TriggerServerEvent("armour:military")
		SetPedComponentVariation(player, 9, 0, 0, 0) 

		vestA = false
    end

end)


--MADE BY DareToDoyle#3835--
--modify by frazz--
