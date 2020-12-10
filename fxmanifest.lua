fx_version 'adamant'

game 'gta5'

server_scripts {
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}

dependencies {
	'esx_policejob',
	'esx_licenseshop',
	'esx_license'
}
-- EXPORTER FUCTION så den kan benyttes i andre scirpts.
exports {
    'politiVaabenMenu'
}