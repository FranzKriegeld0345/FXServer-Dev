fx_version 'cerulean'
game 'gta5'

-- Az admin menü HTML fájlja
ui_page 'admin_menu.html'

-- Az UI-hoz szükséges fájlok
files {
    'admin_menu.html',
    'admin_menu.css',
    'admin_menu.js'
}

-- Kliens oldali script
client_scripts {
    'client.lua'
}

-- Szerver oldali script
server_scripts {
    'server.lua'
}
