fx_version 'bodacious'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Kz#5669'
description 'KZ-Meta'
version '1.0.0'

shared_scripts {
	'@qbr-core/shared/locale.lua',
	'config.lua'
}
client_scripts {
    'client/*.lua'
}
server_scripts {
    'server/*.lua'
}

dependencies {
	'qbr-core'
}

lua54 'yes'