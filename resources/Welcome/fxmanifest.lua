-- fxmanifest.lua

fx_version 'cerulean'
game 'gta5'

author 'YourName'
description 'Fejlesztői és Adminisztrátori Funkciók'
version '1.0.0'

-- Server Scripts
server_scripts {
    'server.lua' -- Admin és fejlesztői parancsok
}

-- Admin jogok kezelése
server_only 'yes'

-- Admin jogok engedélyezése az 'server.cfg'-ben
-- add_ace group.admin command.tp allow
-- add_ace group.admin command.spawncar allow
-- add_ace group.admin command.kick allow
-- add_ace group.admin command.debug allow
-- add_ace group.admin command.checkvehicle allow
