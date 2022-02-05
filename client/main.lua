Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local isInVehicle = IsPedInAnyVehicle(ped, false)

        Citizen.Wait(Config['checktime'])

        if isInVehicle then

            Citizen.Wait(0)

            local fahrzeug = GetVehiclePedIsIn(ped, false)
            local speed = GetEntitySpeed(fahrzeug)*3.6

            SendNUIMessage({
                isInVehicle = isInVehicle;
                speed = speed;
            });
        else
            SendNUIMessage({
                isInVehicle = false;
            });
        end
    end
end)
