-- Admin Management Script

RegisterCommand('tp', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "command.tp") then
        local target = tonumber(args[1])
        local x, y, z = tonumber(args[2]), tonumber(args[3]), tonumber(args[4])
        if target and x and y and z then
            SetEntityCoords(GetPlayerPed(target), x, y, z, false, false, false, true)
            TriggerClientEvent('chat:addMessage', source, {
                color = { 0, 255, 0 },
                multiline = true,
                args = {"Admin", "Játékos teleportálva!"}
            })
        else
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0 },
                multiline = true,
                args = {"Admin", "Használat: /tp [playerID] [x] [y] [z]"}
            })
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            multiline = true,
            args = {"Admin", "Nincs jogosultságod ehhez a parancshoz!"}
        })
    end
end)

RegisterCommand('spawncar', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "command.spawncar") then
        local vehicleName = args[1] or "adder"
        local playerPed = GetPlayerPed(source)
        local coords = GetEntityCoords(playerPed)
        
        RequestModel(vehicleName)
        while not HasModelLoaded(vehicleName) do
            Citizen.Wait(500)
        end
        
        local vehicle = CreateVehicle(vehicleName, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
        SetPedIntoVehicle(playerPed, vehicle, -1)
        TriggerClientEvent('chat:addMessage', source, {
            color = { 0, 255, 0 },
            multiline = true,
            args = {"Admin", "Jármű spawnolva: " .. vehicleName}
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            multiline = true,
            args = {"Admin", "Nincs jogosultságod ehhez a parancshoz!"}
        })
    end
end)

RegisterCommand('kick', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "command.kick") then
        local target = tonumber(args[1])
        local reason = table.concat(args, " ", 2)
        if target then
            DropPlayer(target, reason or "Ki lettél rúgva!")
            TriggerClientEvent('chat:addMessage', -1, {
                color = { 255, 0, 0 },
                multiline = true,
                args = {"Admin", "Játékos kickelve lett!"}
            })
        else
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0 },
                multiline = true,
                args = {"Admin", "Használat: /kick [playerID] [reason]"}
            })
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            multiline = true,
            args = {"Admin", "Nincs jogosultságod ehhez a parancshoz!"}
        })
    end
end)

-- Developer Tools Script

RegisterCommand('debug', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "command.debug") then
        local playerPed = GetPlayerPed(source)
        local coords = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)
        local health = GetEntityHealth(playerPed)
        
        TriggerClientEvent('chat:addMessage', source, {
            color = { 0, 255, 255 },
            multiline = true,
            args = {"Debug", "Pozíció: " .. coords .. " Irány: " .. heading .. " Élet: " .. health}
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            multiline = true,
            args = {"Debug", "Nincs jogosultságod ehhez a parancshoz!"}
        })
    end
end)

RegisterCommand('checkvehicle', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "command.checkvehicle") then
        local playerPed = GetPlayerPed(source)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        
        if vehicle ~= 0 then
            local health = GetVehicleEngineHealth(vehicle)
            local fuel = GetVehicleFuelLevel(vehicle)
            local plate = GetVehicleNumberPlateText(vehicle)
            
            TriggerClientEvent('chat:addMessage', source, {
                color = { 0, 255, 255 },
                multiline = true,
                args = {"Jármű", "Rendszám: " .. plate .. " Motor állapot: " .. health .. " Üzemanyag: " .. fuel}
            })
        else
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0 },
                multiline = true,
                args = {"Jármű", "Nem vagy egy járműben!"}
            })
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            multiline = true,
            args = {"Jármű", "Nincs jogosultságod ehhez a parancshoz!"}
        })
    end
end)
