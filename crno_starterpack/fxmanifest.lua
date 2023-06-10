fx_version 'cerulean'

game 'gta5'

author "SirCanario#2866"
discord "https://discord.gg/XqWrFymfzP"
hosting "https://canario-hosting.com/ ---- https://discord.gg/canariohosting"

description "Simple pack de inicio"


client_scripts {
  'Client/Modules/*.lua',
  'Client/*.lua',

}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'Server/Modules/Functions.lua',
  'Server/*.lua',
}

shared_scripts {
  'Config.lua'
}

