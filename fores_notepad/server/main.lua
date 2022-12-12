RegisterNetEvent('fores_notes:save', function (data,data2, text)
    exports.ox_inventory:SetMetadata(source, data2.slot, {text = text})
end)