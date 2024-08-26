fx_version 'cerulean'
game 'gta5'

-- Admin menü HTML fájl
ui_page 'html/admin_menu.html'

-- Az UI-hoz szükséges fájlok
files {
    'html/admin_menu.html',
    'html/admin_menu.css',
    'html/admin_menu.js'
}

-- Kliens oldali script
client_scripts {
    'client.lua'
}

-- Szerver oldali script
server_scripts {
    'server.lua'
}
