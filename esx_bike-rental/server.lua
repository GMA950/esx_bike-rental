ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_bike:lowmoney")
AddEventHandler("esx_bike:lowmoney", function(money, bike)
	local xPlayer = ESX.GetPlayerFromId(source)
    --local _source = source	
	--local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= money then
		xPlayer.removeMoney(money)
		--TriggerClientEvent('esx_bike:spawnBike', xPlayer.source, bike)
		TriggerClientEvent('esx_bike:spawnBike', source, bike)
		--xPlayer.showNotification('Haz re por $'..costo..' pesos')_U('bikes')
		xPlayer.showNotification(_U('bikes')..' '.._U('bike_pay', money))
	else
		xPlayer.showNotification('No tienes suficiente efectivo')
	end
end)

RegisterServerEvent("esx_bike:unblock")
AddEventHandler("esx_bike:unblock", function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= money then
		xPlayer.removeMoney(money)
		TriggerClientEvent('esx_bike:unblockBike', source)
		xPlayer.showNotification(_U('bikes')..' '.._U('bike_pay', money))
	else
		xPlayer.showNotification('No tienes suficiente efectivo')
	end
end)

RegisterServerEvent("esx_bike:chargePlayer")
AddEventHandler("esx_bike:chargePlayer", function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= money then
		xPlayer.removeMoney(money)
		xPlayer.showNotification('Te han cobrado ~g~ $'..money..' ~w~por la renta del vehículo')
	else
		xPlayer.showNotification('Ya no tienes suficiente efectivo')
		TriggerClientEvent('esx_bike:blockBike', source)
	end
end)

--[[Citizen.CreateThread(function()
	Citizen.Wait(5000)
	local ver = "5.5"
	print("ESX Bike Rental started v"..ver)
end)--]]

