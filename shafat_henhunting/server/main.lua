ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('shafat-henhunting:reward')
AddEventHandler('shafat-henhunting:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 then
        xPlayer.addInventoryItem('meat', 1)
    elseif Weight >= 9 then
        xPlayer.addInventoryItem('meat', 2)
    elseif Weight >= 15 then
        xPlayer.addInventoryItem('meat', 3)
    end
end)

RegisterServerEvent('shafat-henhunting:sell')
AddEventHandler('shafat-henhunting:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local MeatPrice = 355

    local MeatQuantity = xPlayer.getInventoryItem('meat').count

    if MeatQuantity > 0  then
        xPlayer.addMoney(MeatQuantity * MeatPrice)

        xPlayer.removeInventoryItem('meat', MeatQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' ..  MeatQuantity .. ' and earned $' ..  MeatPrice * MeatQuantity)
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end
