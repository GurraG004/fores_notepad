function notes(data, data2)
	local text = data2.metadata.text

	if text == nil then
		local input = lib.inputDialog('Notepad', {'Text'})
		if not input[1] then return end
		text = tostring(input[1])
		if string.len(text) >= Config.MaxLength then lib.notify({title = 'Too long message', type = 'error'}) return end

		TriggerServerEvent('fores_notes:save', data,data2, text)
	else
		local alert = lib.alertDialog({
			header = 'Notepad',
			content = text,
			centered = true,
			cancel = true
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

exports("notepad", notes)