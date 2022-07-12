local QBCore = exports['qb-core']:GetCoreObject()








QBCore.Functions.CreateCallback('ate-bank:server:getCops', function(source, cb)
	local cops = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                cops = cops + 1
            end
        end
	end
	cb(cops)
end)



RegisterServerEvent('zortingen', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddMoney('cash', 50000)
    end)

    RegisterServerEvent('zortingen2', function()
        local xPlayer = QBCore.Functions.GetPlayer(source)
            xPlayer.Functions.AddMoney('cash', 50000)
        end)

        RegisterServerEvent('zortingen3', function()
            local xPlayer = QBCore.Functions.GetPlayer(source)
                xPlayer.Functions.AddMoney('cash', 50000)
            end)

RegisterServerEvent('itemsil', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.Functions.GetItemByName('thermite') ~= nil then
        local trtturk = xPlayer.Functions.GetItemByName('thermite', 1)
        xPlayer.Functions.RemoveItem("thermite", 1)
        else
            print('testingkk')
        end
    end)

    RegisterNetEvent("kapi1")
    AddEventHandler("kapi1", function()
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName('thermite') ~= nil then
            local amt = xPlayer.Functions.GetItemByName('thermite', 1)
                xPlayer.Functions.RemoveItem("thermite", 1)
                TriggerClientEvent("ate-onkapi", source)

            
            else
                TriggerClientEvent("QBCore:Notify", source, "Üstünde Thermite Yok Mal?", "error")
            end
    end)  

    RegisterNetEvent("kapi2")
    AddEventHandler("kapi2", function()
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName('thermite') ~= nil then
            local amt = xPlayer.Functions.GetItemByName('thermite', 1)
                xPlayer.Functions.RemoveItem("thermite", 1)
                TriggerClientEvent("ate-iki", source)

            
            else
                TriggerClientEvent("QBCore:Notify", source, "Üstünde Thermite Yok Mal?", "error")
            end
    end)  
    
    RegisterNetEvent("case")
    AddEventHandler("case", function()
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName('thermite') ~= nil then
            local amt = xPlayer.Functions.GetItemByName('thermite', 1)
                xPlayer.Functions.RemoveItem("thermite", 1)
                TriggerClientEvent("altkapisal", source)

            
            else
                TriggerClientEvent("QBCore:Notify", source, "Üstünde Thermite Yok Mal?", "error")
            end
    end)  