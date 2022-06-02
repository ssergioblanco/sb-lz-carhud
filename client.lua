CreateThread(function()
    local _s = 2000 -- variable para loops
    while true do
        if IsPedInAnyVehicle(PlayerPedId(), false) then -- Si hay un jugador dentro de un vehículo entonces...
            local health = GetVehicleEngineHealth(vehicle)
            _s = 100 -- loop cada 100 ms
            SendNUIMessage({ -- Enviar mensaje a js
                action = "InVeh"; -- acción: estas en un vehículo, en js sale todo lo que hace la función
                salud = GetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), false));
                fuel   = GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId(), false)); -- obtener gasolina
                kmh    = (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 3.6); -- Obtener velocidad en kmh
                gear   = GetVehicleCurrentGear(GetVehiclePedIsIn(PlayerPedId(), false)); -- Obtener Marcha
            })
        elseif not IsPedInAnyVehicle(PlayerPedId()) then -- pero si no hay un jugador en un vehiculo entonces...
            SendNUIMessage({ action = "outVeh"; }) -- mandar accion en js, hace que oculte el carhud
        end -- fin

        if IsPedInAnyVehicle(PlayerPedId(), false) and IsPauseMenuActive() then -- si hau un jugador en un vehiculo y tiene el menu pausa activo entonces...
            SendNUIMessage({ action = "outVeh"; }) -- accion ocultar carhud
        end -- fin

        Wait(_s) -- loop cada 2 segundos
    end -- fin
end) -- fin