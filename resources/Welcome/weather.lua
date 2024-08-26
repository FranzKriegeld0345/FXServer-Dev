-- Weather Change Script
RegisterCommand('setweather', function(source, args, rawCommand)
    local player = source
    if IsPlayerAceAllowed(player, "command.setweather") then
        local weatherType = args[1] or "CLEAR"
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 255, 255, 255},
            multiline = true,
            args = {"Időjárás", "Az időjárás mostantól: " .. weatherType}
        })
        TriggerClientEvent('changeWeather', -1, weatherType)
    else
        TriggerClientEvent('chat:addMessage', player, {
            color = { 255, 0, 0},
            multiline = true,
            args = {"Időjárás", "Nincs jogosultságod ehhez a parancshoz!"}
        })
    end
end)

RegisterNetEvent('changeWeather')
AddEventHandler('changeWeather', function(weatherType)
    SetWeatherTypeOverTime(weatherType, 15.0)
    Citizen.Wait(15000)
    SetWeatherTypePersist(weatherType)
    SetWeatherTypeNow(weatherType)
    SetWeatherTypeNowPersist(weatherType)
end)
