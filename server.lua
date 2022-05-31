local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-methdelivery:server:StartJob', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'cash-roll'
    local quantity = 1

    Player.Functions.AddItem(item, quantity)
end)

RegisterNetEvent('qb-methdelivery:server:KnockDoor', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = 'cash-roll'
    local item2 = 'meth-large'
    local quantity = 1

    Player.Functions.RemoveItem(item1, quantity)
    Player.Functions.AddItem(item2, quantity)
end)

RegisterNetEvent('qb-methdelivery:server:ReceivePayment', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local payment = Config.DeliveryPayment

    Player.Functions.RemoveItem('meth-large', 1)
    Player.Functions.AddMoney('cash', payment)
    TriggerServerEvent('qb-methdelivery:server:DeliveryReward')
end)

RegisterNetEvent('qb-methdelivery:server:DeliveryReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local otherchance = math.random(1, 4)
    local odd = math.random(1, 4)

    if otherchance == odd then
        local item = math.random(1, #Config.DeliveryReward)
        local amount = math.random(Config.DeliveryReward[item]["amount"]["min"], Config.DeliveryReward[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.DeliveryReward[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.DeliveryReward[item]["item"]], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.to_much'), 'error')
        end
    else
        local amount = math.random(2, 4)
        if Player.Functions.AddItem("cryptostick", amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.to_much'), 'error')
        end
    end
end)