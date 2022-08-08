-- Longo Development -- 

local isNear = false 
local mechanic = false 

Citizen.CreateThread(function()
    local location = Config.Location -- The Location
    local distance = Config.Distance
    local coords = GetEntityCoords(PlayerPedId()) -- The peds coords 
    local ped = PlayerPedId() -- The ped 
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false) -- The vehicle the ped is In
    while true do
    Citizen.Wait(1)
    DrawMarker(2, Config.Location.x, Config.Location.y, Config.Location.z, 0,0, 0.0, 0.0, 0.0, 0.0, 1.20, 1.20, 1.20, 255, 255, 255, 230, false, false, 2, false, NULL, NULL, false)
                                                                                                                    -- 255, 0, 0 for the color red
        if Vdist(GetEntityCoords(PlayerPedId()), location) < distance then
            isNear = true
            if GetVehiclePedIsIn(PlayerPedId(), false) then
                if IsPedInAnyVehicle(PlayerPedId(), true) and not IsPedDeadOrDying(PlayerPedId(), true) then
                    DisplayText("Press ~INPUT_CONTEXT~ to repair your vehicle!", true, -1)
                    if IsControlJustReleased(0, 38) then
                        SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId(), false))
                        mechanic = true
            else 
                if not IsPedInAnyVehicle(PlayerPedId(), true) then
                        return
                else 
                    if not IsPedInAnyVehicle(PlayerPedId(), true) and IsPedDeadOrDying(PlayerPedId(), true) then
                                return
                            end
                        end
                    end
                 end
            end
        end
    end
end)

-- The key binding players can make for this script
RegisterKeyMapping('Repair Vehicle', 'Repair Vehicle', 'keyboard', 'E')

function DisplayText(message, beep, duration)
    AddTextEntry('LD_ALERT', message)
    BeginTextCommandDisplayHelp('LD_ALERT')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end

function text(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function subtitle(text, duration, drawImmed)
    BeginTextCommandPrint("STRING")
    AddTextComponentString(text)
    EndTextCommandPrint(duration, drawImmed)
end