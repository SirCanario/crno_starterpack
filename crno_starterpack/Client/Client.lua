ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end 
    ESX.PlayerData = ESX.GetPlayerData()
    SpawnNPC()
end)

Citizen.CreateThread(function()
    while true do 
        local _crno = 850
        local _ped = PlayerPedId()
        local _pedpos = GetEntityCoords(_ped)
        if GetDistanceBetweenCoords(_pedpos, Config.Coords.x, Config.Coords.y, Config.Coords.z, true) < 3 then
            _crno = 0
            showFloatingHelpNotification(Config.Text, vector3(Config.Coords.x, Config.Coords.y, Config.Coords.z + 1.8))
            if IsControlJustPressed(1, 38) then
                ESX.TriggerServerCallback('crno_starterpack:server:checkIfUsed', function(hasChecked)
                    if hasChecked then
                        ESX.ShowNotification('~r~Ya has obtenido tu pack de inicio')
                    else
                        Menu() 
                    end
                end)
            end
        end
        Citizen.Wait(_crno)
    end
end)

function showFloatingHelpNotification(message, coords)
    AddTextEntry('float', message)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('float')
    EndTextCommandDisplayHelp(2, false, false, -1)
end
