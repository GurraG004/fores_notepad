local menuIsOpen = false

function Notes(data, data2)
	local text = data2.metadata.text

	if not text then
		menuIsOpen = true
		local input = lib.inputDialog(String.notepad, {'Text'})
		menuIsOpen = false
		if not input[1] then return end
		text = tostring(input[1])
		if string.len(text) >= Config.MaxLength then lib.notify({title = String.tolongmsg, type = 'error'}) return end

		TriggerServerEvent('fores_notes:save', data,data2, text)
	else
		if Config.Uniqe then
			local desc = data2.metadata.description
			if not desc then desc = String.unknown end
			lib.alertDialog({
				header = desc,
				content = text,
				centered = true,
				cancel = true,
			})
		else
			local alert = lib.alertDialog({
				header = String.notepad,
				content = text,
				centered = true,
				cancel = true,
				labels = {
					cancel = String.cancel,
					confirm = String.rewtrite
				}
			})

			if alert == 'confirm' then
				menuIsOpen = true
				local input = lib.inputDialog(String.notepad, {'Text'})
				menuIsOpen = false
				if not input[1] then return end
				text = tostring(input[1])
				if string.len(text) >= Config.MaxLength then lib.notify({title = String.tolongmsg, type = 'error'}) return end
			end

			TriggerServerEvent('fores_notes:save', data,data2, text)
		end
	end
end

CreateThread(function()
    while true do
        local sleep = 300
        if menuIsOpen then
            sleep = 5
            DisableAllControlActions(0)
        end
        Wait(sleep)
    end
 end)

exports("notepad", Notes)
