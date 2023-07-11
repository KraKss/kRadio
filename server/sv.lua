---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by KraKss.
--- DateTime: 05/07/2023 16:02
---

MySQL.ready(function()
    if (not cfg.sql.itemNeeded) then return end

    local query <const> = ("SELECT * FROM %s WHERE name = '%s'"):format(cfg.sql.tableName, cfg.sql.itemName)
    MySQL.Async.fetchAll(query, {}, function(result)
        if (not next(result)) then
            local insertQuery <const> = ("INSERT INTO %s (name, label, weight, rare, can_remove) VALUES ('radio', 'Radio', 1.0, 0, 1)"):format(cfg.sql.tableName)
            MySQL.Async.execute(insertQuery, {}, function(success)
                local successMessage <const> = "[^2INFO^0] radio item was missing, created it into the database | ^1You must restart your server^0"
                local errorMessage <const> = "[^1ERROR^0] radio item is missing and couldn't be created"
                print(success and successMessage or errorMessage)
            end)
        end
    end)
end)

CreateThread(function()
    local frequencies = {}
    for _,v in pairs(cfg.privateJobFrequencies) do
        if (not frequencies[v.frequency]) then
            frequencies[v.frequency] = true
        else
            error(("The frequency '%s' in 'privateJobFrequencies' is already used. Please change it."):format(v.frequency))
        end
    end
end)

local function getNumberPlayersInChannel(frequency)
    local channelData <const> = PMA:getPlayersInRadioChannel(frequency)
    local users = 0

    for _ in pairs(channelData) do
        users = users + 1
    end

    return users
end

local channels = {}
RegisterNetEvent("KraKss:radio:fetchPlayersInChannel", function()
    for i = 1, (cfg.maxFrequency) do
        local users = getNumberPlayersInChannel(i)
        if (users > 0 or channels[i]) then
            channels[i] = users
        end
    end
    TriggerClientEvent("KraKss:radio:fetchPlayersInChannelResponse", -1, channels)
end)

RegisterNetEvent("KraKss:radio:checkItem", function()
    local _src <const> = source
    local xPlayer <const> = ESX.GetPlayerFromId(_src)
    TriggerClientEvent("KraKss:radio:checkItemResponse", _src, xPlayer.getInventoryItem(cfg.sql.itemName).count > 0)
end)