local ESX
if Config.SaveUser then -- EDIT THIS IF YOU DONT USE ESX
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

RegisterNetEvent('fores_notes:save', function (data,data2, text)
    if Config.SaveTime and not Config.SaveUser then
        exports.ox_inventory:SetMetadata(source, data2.slot, {description = os.date(Config.TimeStamp), text = text})
    elseif Config.SaveUser then
        exports.ox_inventory:SetMetadata(source, data2.slot, {description = GetName(source)..' '..os.date(Config.TimeStamp), text = text})
    else
        exports.ox_inventory:SetMetadata(source, data2.slot, {text = text})
    end
end)

GetName = function(source) -- EDIT THIS IF YOU DONT USE ESX
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.GetName()
end