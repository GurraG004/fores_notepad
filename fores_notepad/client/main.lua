function notes(data, data2)
	local text = data2.metadata.text

	if not text then
		local input = lib.inputDialog('Notepad', {'Text'})
		if not input[1] then return end
		text = tostring(input[1])
		if string.len(text) >= Config.MaxLength then lib.notify({title = 'Too long message', type = 'error'}) return end

		TriggerServerEvent('fores_notes:save', data,data2, text)
	else
		if Config.Uniqe then
			local desc = data2.metadata.description
			if not desc then desc = 'Unknown' end
			lib.alertDialog({
				header = desc,
				content = text,
				centered = true,
				cancel = true,
			})
		else
			local alert = lib.alertDialog({
				header = 'Notepad',
				content = text,
				centered = true,
				cancel = true,
				labels = {
					cancel = 'Close',
					confirm = 'Rewrite note'
				}
			})

			if alert == 'confirm' then
				local input = lib.inputDialog('Notepad', {'Text'})
				if not input[1] then return end
				text = tostring(input[1])
				if string.len(text) >= Config.MaxLength then lib.notify({title = 'Too long message', type = 'error'}) return end
			end

			TriggerServerEvent('fores_notes:save', data,data2, text)
		end
	end
end

exports("notepad", notes)