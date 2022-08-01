RegisterNetEvent('kz-meta:server:UpdateMetaWeight', function(nb)
    local Player = exports['qbr-core']:GetPlayer(source)
    if Player then
        local newWeight = Player.PlayerData.metadata['metaweight'] - nb
        if newWeight <= 0 then
            newWeight = 0
        end
        if newWeight >= 100 then
            newWeight = 100
        end
        Player.Functions.SetMetaData('metaweight', newWeight)
    end
end)

--[[
RegisterNetEvent('kz-meta:server:Save', function()
    local Player = exports['qbr-core']:GetPlayer(source)
    Player.Functions.Save()
end)
]]--