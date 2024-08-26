-- Welcome Message Script
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local playerId = source
    TriggerClientEvent('chat:addMessage', playerId, {
        color = { 255, 0, 0},
        multiline = true,
        args = {"Server", "Üdvözlünk, " .. playerName .. "! Kellemes játékot kívánunk!"}
    })
end)
