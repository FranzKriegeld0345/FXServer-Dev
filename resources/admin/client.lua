-- Admin Client Script
-- Author: ChatGPT
-- Date: 2024

local isSpectating = false
local targetPlayer = nil

RegisterNetEvent('admin:openMenu')
AddEventHandler('admin:openMenu', function()
    -- Megnyitjuk a NUI felületet és beállítjuk a fókuszt
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openMenu"
    })
end)

RegisterNUICallback('closeMenu', function(data, cb)
    -- Bezárjuk a NUI felületet és visszaállítjuk a fókuszt
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNetEvent('admin:spawnVehicle')
AddEventHandler('admin:spawnVehicle', function(vehicleName)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    -- Ellenőrizzük, hogy a jármű neve meg van-e adva
    if vehicleName then
        RequestModel(vehicleName)

        -- Várjuk meg, amíg a modell betöltődik
        while not HasModelLoaded(vehicleName) do
            Citizen.Wait(0)
        end

        -- Hozzuk létre a járművet a játékban
        local vehicle = CreateVehicle(vehicleName, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)

        -- Ha szükséges, adjuk hozzá a játékoshoz
        SetPedIntoVehicle(playerPed, vehicle, -1)
    else
        -- Küldjünk vissza egy hibát, ha nincs járműnév megadva
        TriggerEvent('chat:addMessage', {
            args = {"^1SYSTEM", "Vehicle name is required!"}
        })
    end
end)


RegisterNetEvent('admin:spectate')
AddEventHandler('admin:spectate', function(target)
    if isSpectating then
        -- Stop spectating
        local playerPed = PlayerPedId()
        NetworkSetInSpectatorMode(false, playerPed)
        isSpectating = false
        targetPlayer = nil
    else
        -- Start spectating
        targetPlayer = target
        local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
        NetworkSetInSpectatorMode(true, targetPed)
        isSpectating = true
    end
end)

-- Optionally add a loop to control spectate mode
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isSpectating and targetPlayer then
            local targetPed = GetPlayerPed(GetPlayerFromServerId(targetPlayer))
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(targetPed)
            SetEntityCoords(playerPed, coords.x, coords.y, coords.z, false, false, false, true)
        end
    end
end)
