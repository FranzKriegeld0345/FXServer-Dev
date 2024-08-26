-- Admin ellenőrzés (ezt testreszabhatod)
function IsPlayerAdmin(player)
    return IsPlayerAceAllowed(player, "admin")
end

-- /admin parancs kezelése
RegisterCommand("admin", function(source, args, rawCommand)
    local src = source

    if IsPlayerAdmin(src) then
        TriggerClientEvent('admin:openMenu', src)
    else
        TriggerClientEvent('chat:addMessage', src, {
            args = {"^1SYSTEM", "You are not an admin!"}
        })
    end
end, false)

-- Jármű spawnolás parancs kezelése
RegisterNetEvent('admin:spawnVehicle')
AddEventHandler('admin:spawnVehicle', function(vehicleName)
    local src = source
    TriggerClientEvent('admin:spawnVehicle', src, vehicleName)
end)
