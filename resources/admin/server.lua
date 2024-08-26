-- FiveM Admin Script
-- Author: ChatGPT
-- Date: 2024

-- Admin Menu Command
RegisterCommand("admin", function(source, args, rawCommand)
    local src = source
    local player = GetPlayerPed(src)

    -- Check if the player is an admin (you can customize the admin check)
    if IsPlayerAdmin(src) then
        TriggerClientEvent('admin:openMenu', src)
    else
        TriggerClientEvent('chat:addMessage', src, {
            args = {"^1SYSTEM", "You are not an admin!"}
        })
    end
end, false)

-- Admin Functions
RegisterServerEvent('admin:kickPlayer')
AddEventHandler('admin:kickPlayer', function(target, reason)
    DropPlayer(target, reason or "You have been kicked by an admin.")
end)

RegisterServerEvent('admin:banPlayer')
AddEventHandler('admin:banPlayer', function(target, reason)
    -- You would need to implement a ban system with a database
    DropPlayer(target, reason or "You have been banned by an admin.")
    -- Example: AddBanToDatabase(target, reason)
end)

RegisterServerEvent('admin:healPlayer')
AddEventHandler('admin:healPlayer', function(target)
    local playerPed = GetPlayerPed(target)
    SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

RegisterServerEvent('admin:killPlayer')
AddEventHandler('admin:killPlayer', function(target)
    local playerPed = GetPlayerPed(target)
    SetEntityHealth(playerPed, 0)
end)

RegisterServerEvent('admin:deleteVehicle')
AddEventHandler('admin:deleteVehicle', function(vehicle)
    if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
    end
end)

RegisterServerEvent('admin:spawnVehicle')
AddEventHandler('admin:spawnVehicle', function(vehicleName)
    local src = source
    local playerPed = GetPlayerPed(src)
    local coords = GetEntityCoords(playerPed)

    -- Check if the vehicle exists
    if IsModelInCdimage(vehicleName) and IsModelAVehicle(vehicleName) then
        RequestModel(vehicleName)
        while not HasModelLoaded(vehicleName) do
            Citizen.Wait(500)
        end

        local vehicle = CreateVehicle(vehicleName, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
        SetPedIntoVehicle(playerPed, vehicle, -1)
        SetModelAsNoLongerNeeded(vehicleName)
    else
        TriggerClientEvent('chat:addMessage', src, {
            args = {"^1SYSTEM", "Invalid vehicle model."}
        })
    end
end)

RegisterServerEvent('admin:spectatePlayer')
AddEventHandler('admin:spectatePlayer', function(target)
    local src = source
    TriggerClientEvent('admin:spectate', src, target)
end)

-- Utility function to check if a player is an admin
function IsPlayerAdmin(player)
    -- Replace with your own admin check logic (e.g., checking player roles)
    return IsPlayerAceAllowed(player, "command")
end
