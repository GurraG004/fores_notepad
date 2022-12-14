fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "fores_notepad"
description "write notes"
author "Fores#7973"
version "1.1.0"

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}
