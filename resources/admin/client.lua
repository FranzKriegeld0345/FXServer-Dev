-- Admin Client Script
-- Author: ChatGPT
-- Date: 2024

local isSpectating = false
local targetPlayer = nil

RegisterNetEvent('admin:openMenu')
AddEventHandler('admin:openMenu', function()
    -- Nyisd meg az admin menüt (UI-t itt meg kell valósítani, pl. NUI segítségével)
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
