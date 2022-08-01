--------------------------------------------------------------
-- Tips : https://github.com/femga/rdr3_discoveries/blob/a4b4bcd5a3006b0c1434b03e4095d038164932f7/discoveredNatives/discovered_natives_by_me
--------------------------------------------------------------

--------------------------------------------------------------
-- Citizen
--------------------------------------------------------------

Citizen.CreateThread(function()
    local _Weight = 0
    while true do Wait(Checkrate)
        local running = IsPedRunning(PlayerPedId())
        local walking = IsPedWalking(PlayerPedId())
        
        if running then
            _Weight = Weight.Running
        elseif walking then
            _Weight = Weight.Walking
        else
            _Weight = Weight.Standing
        end
        TriggerServerEvent('kz-meta:server:UpdateMetaWeight', _Weight)
    end   
end)


Citizen.CreateThread(function()
    while true do
        Wait(500)
        if LocalPlayer.state['isLoggedIn'] then

            weight = exports['qbr-core']:GetPlayerData().metadata["metaweight"]
            print("Metaweight value :"..weight)

            if weight <= 5 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1745814259)
                print("Set metaweight : Stage 1")
            elseif weight >= 5.1 and weight <= 10 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-325933489)
                print("Set metaweight : Stage 2")
            elseif weight >= 10.1 and weight <= 15 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1065791927)
                print("Set metaweight : Stage 3")
            elseif weight >= 15.1 and weight <= 20 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-844699484)
                print("Set metaweight : Stage 4")
            elseif weight >= 20.1 and weight <= 25 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1273449080)
                print("Set metaweight : Stage 5")
            elseif weight >= 25.1 and weight <= 30 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),927185840)
                print("Set metaweight : Stage 6")
            elseif weight >= 30.1 and weight <= 35 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),149872391)
                print("Set metaweight : Stage 7")
            elseif weight >= 35.1 and weight <= 40 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),399015098)
                print("Set metaweight : Stage 8")
            elseif weight >= 40.1 and weight <= 45 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-644349862)
                print("Set metaweight : Stage 9")
            elseif weight >= 45.1 and weight <= 50 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1745919061)
                print("Set metaweight : Stage 10")
            elseif weight >= 50.1 and weight <= 55 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1004225511)
                print("Set metaweight : Stage 11")
            elseif weight >= 55.1 and weight <= 60 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1278600348)
                print("Set metaweight : Stage 12")
            elseif weight >= 60.1 and weight <= 65 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),502499352)
                print("Set metaweight : Stage 13")
            elseif weight >= 65.1 and weight <= 70 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-2093198664)
                print("Set metaweight : Stage 14")
            elseif weight >= 70.1 and weight <= 75 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1837436619)
                print("Set metaweight : Stage 15")
            elseif weight >= 75.1 and weight <= 80 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1736416063)
                print("Set metaweight : Stage 16")
            elseif weight >= 80.1 and weight <= 85 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),2040610690)
                print("Set metaweight : Stage 17")
            elseif weight >= 85.1 and weight <= 90 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1173634986)
                print("Set metaweight : Stage 18")
            elseif weight >= 90.1 and weight <= 95 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-867801909)
                print("Set metaweight : Stage 19")
            elseif weight >= 95.1 and weight <= 100 then
                Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1960266524)
                print("Set metaweight : Stage 20")
            end
            
            Citizen.InvokeNative(0xCC8CA3E88256E58F,PlayerPedId(), 0, 1, 1, 1, false);
            print("Body weight update")
            Wait((1000 * 60) * RefreshBody)
        end
    end
end)

--------------------------------------------------------------
-- Event (Optional)
--------------------------------------------------------------

RegisterNetEvent("kz-meta:client:Meta", function(nb)
    TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", exports['qbr-core']:GetPlayerData().metadata["metaweight"] + nb)
    --print(exports['qbr-core']:GetPlayerData().metadata["metaweight"] + nb)
end)

--------------------------------------------------------------
-- Debug Command (Edit true / false in config.lua)
--------------------------------------------------------------

if Debug then
    RegisterCommand('debug_meta', function()
        print(exports['qbr-core']:GetPlayerData().metadata["metaweight"])
    end)

    RegisterCommand('debug_meta_max', function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", 100)
    end)

    RegisterCommand('debug_meta_min', function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", 0)
    end)

    RegisterCommand('debug_meta_save', function()
        TriggerServerEvent("kz-meta:server:Save")
    end)

    RegisterCommand('debug_meta_set',function (source, args)
        TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", args[1])
    end)

    RegisterCommand('debug_meta_body', function()
        weight = tonumber(exports['qbr-core']:GetPlayerData().metadata["metaweight"])
        print(weight)

        if weight <= 5 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1745814259)
        elseif weight >= 5.1 and weight <= 10 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-325933489)
        elseif weight >= 10.1 and weight <= 15 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1065791927)
        elseif weight >= 15.1 and weight <= 20 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-844699484)
        elseif weight >= 20.1 and weight <= 25 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1273449080)
        elseif weight >= 25.1 and weight <= 30 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),927185840)
        elseif weight >= 30.1 and weight <= 35 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),149872391)
        elseif weight >= 35.1 and weight <= 40 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),399015098)
        elseif weight >= 40.1 and weight <= 45 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-644349862)
        elseif weight >= 45.1 and weight <= 50 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1745919061)
        elseif weight >= 50.1 and weight <= 55 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1004225511)
        elseif weight >= 55.1 and weight <= 60 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1278600348)
        elseif weight >= 60.1 and weight <= 65 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),502499352)
        elseif weight >= 65.1 and weight <= 70 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-2093198664)
        elseif weight >= 70.1 and weight <= 75 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1837436619)
        elseif weight >= 75.1 and weight <= 80 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1736416063)
        elseif weight >= 80.1 and weight <= 85 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),2040610690)
        elseif weight >= 85.1 and weight <= 90 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-1173634986)
        elseif weight >= 90.1 and weight <= 95 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),-867801909)
        elseif weight >= 95.1 and weight <= 100 then
            Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(),1960266524)
        end
        Citizen.InvokeNative(0xCC8CA3E88256E58F,PlayerPedId(), 0, 1, 1, 1, false);
        print("update body")    
    end)
end