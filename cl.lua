local QBCore = exports['qb-core']:GetCoreObject()
local method
vault = {x = 253.92, y = 224.56, z = 101.88, type = "v_ilev_bk_vaultdoor"},

RegisterNetEvent('ate-onkapi', function()-- Ön Kapı
    local ped = GetPlayerPed(-1) 
    local pos = GetEntityCoords(ped)
    local dist = GetDistanceBetweenCoords(pos, 256.87, 220.14, 106.29)
    if dist < 1.5 then
        QBCore.Functions.TriggerCallback('ate-bank:server:getCops', function(cops)
            if cops >= Config.Police then
                TriggerEvent("ate-opendoor")
            else
                QBCore.Functions.Notify("Yeterli Sayıda Polis Yok!!", "error")    
            end
        end)
    end            
end)  
  

--  RegisterCommand('kasa', function()
--      TriggerEvent('ate-opendoor2')
--  end)

 
RegisterNetEvent('ate-iki', function()-- Ön Kapı
    local ped = GetPlayerPed(-1) 
    local pos = GetEntityCoords(ped)
    local dist = GetDistanceBetweenCoords(pos, 261.77, 222.48, 106.28, 250.82)
    if dist < 1.5 then
        QBCore.Functions.TriggerCallback('ate-bank:server:getCops', function(cops)
            if cops >= Config.Police then
                TriggerEvent("ate-opendoor2")
            else
                QBCore.Functions.Notify("Yeterli Sayıda Polis Yok!!", "error")    
            end
        end)
    end            
end)  
  
RegisterNetEvent('kapi1-cl', function()
    TriggerServerEvent('kapi1')
end)
RegisterNetEvent('kapi2-cl', function()
    TriggerServerEvent('kapi2')
end)

RegisterNetEvent('case-cl', function()
    TriggerServerEvent('case')
end)

RegisterNetEvent('ate-opendoor', function()
    exports["memorygame"]:thermiteminigame(2, 2, 2, 2,
function()
    TriggerEvent("ate-bankopendoor") --ön kapının açılması için gerekli event
    QBCore.Functions.Notify("Başarılı", "success")
    TriggerServerEvent('itemsil')
end,
function()
    QBCore.Functions.Notify('Başarısız oldun thermite yandı', 'error')
    TriggerServerEvent('itemsil')
end)
end)

RegisterCommand('sontest', function()
    TriggerEvent('altkapisal')
end)

RegisterNetEvent('altkapisal', function()
    exports["memorygame"]:thermiteminigame(4, 4, 4, 4,
    function()
   QBCore.Functions.Notify("Başarılı Uzaklaş Thermite Patlıycak", "success")
   thermiteanime3()
   Citizen.Wait(15000)
   TriggerEvent('ate-altkapiopen')
    AddExplosion(253.35, 225.41, 101.88, 178.86, 150000.0, true, false, 4.0)
    end,
    function()
        QBCore.Functions.Notify('Başarısız oldun thermite yandı', 'error')
        TriggerServerEvent('itemsil')
end)
end)


Citizen.CreateThread(function()
    CreateObject(269934519, 257.44, 215.07, 100.68, 345.4)
    CreateObject(269934519, 262.7, 213.88, 100.68, 345.4)
    CreateObject(269934519, 264.86, 215.64, 100.78, 345.4)
end)

vector3(263.7, 212.88, 100.84)
RegisterCommand('ate', function()
    ate()
end)

RegisterNetEvent('ate-opendoor2', function()
    exports["memorygame"]:thermiteminigame(2, 2, 2, 2,
function()
    TriggerEvent("ate-bankopendoor2") --arka kapının açılması için gerekli event
    QBCore.Functions.Notify("Başarılı", "success")
    TriggerServerEvent('itemsil')
end,
function()
    QBCore.Functions.Notify('Başarısız oldun thermite yandı', 'error')
    TriggerServerEvent('itemsil')
end)
end)






RegisterNetEvent('ate-bankopendoor', function()
	thermiteanime()
    TriggerServerEvent('nui_doorlock:server:updateState', 1, false, false ,true, false)
end)

RegisterNetEvent('ate-bankopendoor2', function() 
	thermiteanime2()
    TriggerServerEvent('nui_doorlock:server:updateState', 2, false, false ,true, false)
end)

RegisterNetEvent('ate-altkapiopen', function()
   TriggerEvent('kapitest')
end)







RegisterNetEvent("ate-babanimsel", function(method)
    local anim

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        anim = vector3(256.76, 219.83, 106.29)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", anim, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    print("anim fix")
    StopParticleFxLooped(effect, 0)
end)


function thermiteanime() -- Ön Kapı
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 337.17) 
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(256.31, 220.66, 106.43, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 256.31, 220.66, 106.43,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("ate-babanimsel", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", anim, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end

function thermiteanime2() -- İkinci Kapı
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 238.94)
    Citizen.Wait(100) 
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(262.2, 222.52, 106.43 , rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 262.2, 222.52, 106.43,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("ate-babanimsel", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", anim, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end

function thermiteanime3() -- İkinci Kapı
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 165.12) 
    Citizen.Wait(100) 
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(253.35, 225.42, 101.88 , rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 253.35, 225.42, 101.88,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("ate-babanimsel", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", anim, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end




 RegisterNetEvent("kapitest")
 AddEventHandler("kapitest", function(method)
 	--local obj = ESX.Game.GetClosestObject(UTK.vault.type, vector3(UTK.vault.x, UTK.vault.y, UTK.vault.z))
 	local obj = GetClosestObjectOfType(253.92, 224.56, 101.88, 1.53, GetHashKey('v_ilev_bk_vaultdoor'))
     local count = 2
     if method == 0 then
         repeat
 	        local rotation = GetEntityHeading(obj) - -1.0
             SetEntityHeading(obj, rotation)
             count = count + 1
             Citizen.Wait(10)
         until count == 1100
     else
 	  repeat      local rotation = GetEntityHeading(obj) + -50
             SetEntityHeading(obj, rotation)
             count = count + 400
             Citizen.Wait(500000)
             print('31kk31')
     until  count == 1100
     end
     FreezeEntityPosition(obj, method, true)
 end)

 RegisterNetEvent('topla', function()
     if not topla then
        TriggerServerEvent('zortingen')
         topla = true
     else
        QBCore.Functions.Notify("Nah Alırsın.", 'error')
     end
 end)

 RegisterNetEvent('topla2', function()
     if not topla2 then
        TriggerServerEvent('zortingen2')
         topla2 = true
     else
        QBCore.Functions.Notify("Nah Alırsın.", 'error')
     end
 end)

 RegisterNetEvent('topla3', function()
     if not topla3 then
        TriggerServerEvent('zortingen3')
         topla3 = true
     else
        QBCore.Functions.Notify("Nah Alırsın.", 'error')
     end
 end)



 Citizen.CreateThread(function ()
    exports['qb-target']:AddBoxZone("zort1",vector3(257.4, 215.7, 101.68), 3, 3, {
        name = "zort1",
        heading = 228.81,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "topla",
                icon = "fas fa-solid fa-sack-dollar",
                label = 'Paraları Al',
                job = 'all',

            },
        },
        distance = 1.5
    })
end)

Citizen.CreateThread(function ()
    exports['qb-target']:AddBoxZone("zort2",vector3(262.71, 214.41, 101.68), 3, 3, {
        name = "zort2",
        heading = 179.74,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "topla2",
                icon = "fas fa-solid fa-sack-dollar",
                label = 'Paraları Al',
                job = 'all',

            },
        },
        distance = 1.5
    })
end)

Citizen.CreateThread(function ()
    exports['qb-target']:AddBoxZone("zort3",vector3(265.3, 215.0, 101.68), 3, 3, {
        name = "zort3",
        heading = 28.72,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "topla3",
                icon = "fas fa-solid fa-sack-dollar",
                label = 'Parayı Al',
                job = 'all',

            },
        },
        distance = 1.5
    })
end)


        Citizen.CreateThread(function ()
            exports['qb-target']:AddBoxZone("kapi1",vector3(256.68, 220.13, 106.29), 3, 3, {
                name = "kapi1",
                heading = 331.17,
                debugPoly = false,
            }, {
                options = {
                    {
                        type = "Client",
                        event = "kapi1-cl",
                        icon = "fas fa-solid fa-bomb",
                        label = 'Kapıyı Patlat',
                        job = 'all',
        
                    },
                },
                distance = 1.5
            })
        end)



            Citizen.CreateThread(function ()
                exports['qb-target']:AddBoxZone("kapi2",vector3(261.76, 222.37, 106.28), 3, 3, {
                    name = "kapi2",
                    heading = 251.19,
                    debugPoly = false,
                }, {
                    options = {
                        {
                            type = "Client",
                            event = "kapi2-cl",
                            icon = "fas fa-solid fa-bomb",
                            label = 'Kapıyı Patlat',
                            job = 'all',
            
                        },
                    },
                    distance = 1.5
                })
            end)



                Citizen.CreateThread(function ()
                    exports['qb-target']:AddBoxZone("kapi3",vector3(253.98, 225.22, 101.88), 3, 3, {
                        name = "kapi3",
                        heading = 157.32,
                        debugPoly = false,
                    }, {
                        options = {
                            {
                                type = "Client",
                                event = "case-cl",
                                icon = "fas fa-solid fa-bomb",
                                label = 'Kasayı Patlat',
                                job = 'all',
                
                            },
                        },
                        distance = 1.5
                    })
                end)