fx_version 'cerulean'
game 'gta5'

author 'AngelicXS'
version '0.4'

client_script {
    'client/*.lua',
}

server_script {
    '@mysql-async/lib/MySQL.lua',
	'server.lua',
}

shared_script 'config.lua'
