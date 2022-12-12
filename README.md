Simple notepad script using ox_lib and ox_inventory

no framework


add in ox_inventory/data/items.lua
```lua
	['notepad'] = {
		label = 'Notepad',
		weight = 50,
		stack = false,
		client = {
			export = 'fores_notepad.notepad'
		}
	},
```
