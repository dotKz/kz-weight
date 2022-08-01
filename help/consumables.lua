-------------------------------------------------------------------------------------------
-- Local
-------------------------------------------------------------------------------------------

local sharedItems = exports['qbr-core']:GetItems()
local isBusy = false


-------------------------------------------------------------------------------------------
-- Function
-------------------------------------------------------------------------------------------

function loadAnimDict(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

function loadModel(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

function doAnim (Amodel, bone, pX, pY, pZ, rX, rY, rZ, anim, Adict, duration)
    local model = loadModel(GetHashKey(Amodel))
    object = CreateObject(model, GetEntityCoords(PlayerPedId()), true, false, false)
    AttachEntityToEntity(object, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), bone), pX, pY, pZ, rX, rY, rZ, false, true, true, true, 0, true)
    local dict = loadAnimDict(Adict)
    TaskPlayAnim(PlayerPedId(), Adict, anim, 5.0, 5.0, duration, 1, false, false, false)
end

function AnimDetatch (sleep)
    Citizen.Wait(sleep)
    if object ~= nil then
        print('Ok')
        DetachEntity(object, true, true)
        DeleteObject(object)
    end
end


-------------------------------------------------------------------------------------------
-- Event
-------------------------------------------------------------------------------------------


RegisterNetEvent("consumables:client:Drink", function(itemName)
    if isBusy then
        return
    else
        isBusy = not isBusy
        local sleep = 5000
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
        Citizen.Wait(100)
        if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) then
            local object = nil
            doAnim("p_mugcoffee01x", "SKEL_R_FINGER12", 0.0, -0.05, 0.03, 0.0, 180.0, 180.0, 'action', 'mech_inventory@drinking@coffee', sleep)
        end
        exports['qbr-core']:Progressbar("drink_something", "Boit..", sleep, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", sharedItems[itemName], "remove")
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName].thirst)
            TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", exports['qbr-core']:GetPlayerData().metadata["metaweight"] + ConsumeablesDrink[itemName].metaweight)
        end)
        ClearPedTasks(PlayerPedId())
        AnimDetatch (sleep)
        isBusy = not isBusy
    end
end)

RegisterNetEvent("consumables:client:Eat", function(itemName)
    if isBusy then
        return
    else
        isBusy = not isBusy
        local sleep = 5000
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
        Citizen.Wait(100)
        if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) then
            local object = nil
            doAnim("s_bit_bread06", "SKEL_R_FINGER12", 0.03, -0.05, 0.05, 15.0, 175.0, 0.0, 'neck_2_face_rh', 'mech_inventory@clothing@bandana', sleep)
        end
        exports['qbr-core']:Progressbar("eat_something", "Mange..", sleep, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", sharedItems[itemName], "remove")
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", exports['qbr-core']:GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].hunger)
            TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", exports['qbr-core']:GetPlayerData().metadata["metaweight"] + ConsumeablesEat[itemName].metaweight)
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        end)
        ClearPedTasks(PlayerPedId())
        AnimDetatch (sleep)
        isBusy = not isBusy
    end
end)

RegisterNetEvent("consumables:client:DrinkEat", function(itemName)
    if isBusy then
        return
    else
        isBusy = not isBusy
        local sleep = 5000
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
        Citizen.Wait(100)
        if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) then
            local object = nil
            doAnim("p_mugcoffee01x", "SKEL_R_FINGER12", 0.0, -0.05, 0.03, 0.0, 180.0, 180.0, 'action', 'mech_inventory@drinking@coffee', sleep)
        end
        exports['qbr-core']:Progressbar("drink_something", "Boit et Mange ..", sleep, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", sharedItems[itemName], "remove")
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName].thirst)
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", exports['qbr-core']:GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].hunger)
            TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", exports['qbr-core']:GetPlayerData().metadata["metaweight"] + ConsumeablesEat[itemName].metaweight)
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        end)
        ClearPedTasks(PlayerPedId())
        AnimDetatch (sleep)
        isBusy = not isBusy
    end
end)

RegisterNetEvent("consumables:client:DrinkAlcohol", function(itemName)
    if isBusy then
        return
    else
        isBusy = not isBusy
        sleep = 5000
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
        Citizen.Wait(100)
        local bottle = nil
        if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) then
            doAnim("s_inv_whiskey01x", "SKEL_R_FINGER12", 0.0, -0.05, 0.22, 0.0, 180.0, 180.0, 'base_trans_cheers_putaway', 'mp_mech_inventory@drinking@moonshine@drunk@male_a', sleep)
        end
        exports['qbr-core']:Progressbar("drink_alcohol", "Boit de l'alcool..", math.random(3000, 6000), false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", sharedItems[itemName], "remove")
            TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName].thirst)
            TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", exports['qbr-core']:GetPlayerData().metadata["metaweight"] + ConsumeablesAlcohol[itemName].metaweight)
        end, function()
            exports['qbr-core']:Notify(9, "Cancelled..", 2000, 0, 'mp_lobby_textures', 'cross')
        end)
        Citizen.Wait(sleep)
        if bottle ~= nil then
            DetachEntity(bottle, true, true)
            DeleteObject(bottle)
        end
        ClearPedTasks(PlayerPedId())
        AnimDetatch (sleep)
        isBusy = not isBusy
    end
end)

RegisterNetEvent("consumables:client:Smoke", function(itemName)
    if isBusy then
        return
    else
        isBusy = not isBusy
        local sleep = 10000
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
        Citizen.Wait(100)
        local cigar = nil
        if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) then
            local item_model = nil
            local pX, pY, pZ, rX, rY, rZ = nil, nil, nil, nil, nil, nil
            if itemName == "cigar" then
                sleep = 20000
                item_model = "p_cigar01x"
                pX, pY, pZ, rX, rY, rZ = 0.0, 0.03, 0.0, 0.0, 00.0, 0.0
            else
                item_model = "p_cigarette_cs01x"
                pX, pY, pZ, rX, rY, rZ = 0.0, 0.03, 0.01, 0.0, 180.0, 90.0
            end
            doAnim(item_model, "SKEL_R_FINGER12", pX, pY, pZ, rX, rY, rZ, 'base', 'amb_wander@code_human_smoking_wander@cigar@male_a@base', sleep)
        end
        exports['qbr-core']:Progressbar("smoking", "Fume..", sleep, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", sharedItems[itemName], "remove")
            TriggerServerEvent('hud:server:RelieveStress', math.random(20, 40))
        end)
        ClearPedTasks(PlayerPedId())
        AnimDetatch (sleep)
        isBusy = not isBusy
    end
end)


-------------------------------------------------------------------------------------------
-- Other ?
-------------------------------------------------------------------------------------------


RegisterNetEvent("qb:Dual", function()
    local player = PlayerPedId()
	Citizen.InvokeNative(0xB282DC6EBD803C75, player, GetHashKey("weapon_revolver_cattleman"), 500, true, 0)
	Citizen.InvokeNative(0x5E3BDDBCB83F3D84, player, GetHashKey("weapon_pistol_volcanic"), 500, true, 0, true, 1.0)
end)
