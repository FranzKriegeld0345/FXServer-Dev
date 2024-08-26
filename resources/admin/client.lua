-- NUI menü megnyitása
RegisterNetEvent('admin:openMenu')
AddEventHandler('admin:openMenu', function()
    -- NUI fókusz beállítása
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openMenu"
    })
end)

-- NUI menü bezárása
RegisterNUICallback('closeMenu', function(data, cb)
    -- NUI fókusz visszaállítása
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Jármű spawnolása
RegisterNetEvent('admin:spawnVehicle')
AddEventHandler('admin:spawnVehicle', function(vehicleName)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    if vehicleName then
        RequestModel(vehicleName)

        -- Várunk, amíg a modell betöltődik
        while not HasModelLoaded(vehicleName) do
            Citizen.Wait(0)
        end

        -- Jármű létrehozása
        local vehicle = CreateVehicle(vehicleName, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)

        -- Játékos beültetése a járműbe
        SetPedIntoVehicle(playerPed, vehicle, -1)
    else
        -- Hibaüzenet, ha nincs járműnév megadva
        TriggerEvent('chat:addMessage', {
            args = {"^1SYSTEM", "Vehicle name is required!"}
        })
    end
end)
