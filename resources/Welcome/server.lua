-- Welcome Message Script
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local playerId = source
    TriggerClientEvent('chat:addMessage', playerId, {
        color = { 255, 0, 0},
        multiline = true,
        args = {"Server", "Üdvözlünk, " .. playerName .. "! Kellemes játékot kívánunk!"}
    })
end)

-- Simple Bank Robbery Script
local banks = {
    {name = "Fleeca Bank", x = 146.92, y = -1044.11, z = 29.37}
}

local isRobbing = false
local robberyTimer = 60

RegisterCommand('startrobbery', function(source, args, rawCommand)
    local player = source
    local playerPed = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(playerPed)
    
    for _, bank in pairs(banks) do
        local distance = GetDistanceBetweenCoords(playerCoords, bank.x, bank.y, bank.z, true)
        
        if distance < 5.0 and not isRobbing then
            isRobbing = true
            TriggerClientEvent('chat:addMessage', -1, {
                color = { 255, 0, 0},
                multiline = true,
                args = {"Bankrablás", "A rablás elindult a " .. bank.name .. " bankban!"}
            })
            
            Citizen.CreateThread(function()
                while robberyTimer > 0 do
                    Citizen.Wait(1000)
                    robberyTimer = robberyTimer - 1
                    TriggerClientEvent('chat:addMessage', player, {
                        color = { 255, 0, 0},
                        multiline = true,
                        args = {"Bankrablás", "Hátralévő idő: " .. robberyTimer .. " másodperc"}
                    })
                end
                
                isRobbing = false
                robberyTimer = 60
                TriggerClientEvent('chat:addMessage', -1, {
                    color = { 0, 255, 0},
                    multiline = true,
                    args = {"Bankrablás", "A rablás véget ért!"}
                })
            end)
            
            break
        end
    end
end)
