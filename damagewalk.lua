local hurt = false

Citizen.CreateThread(function()
    while true do
        Wait(8)
        if GetEntityHealth(GetPlayerPed(-1)) <= 180 then
            setHurt()
        elseif hurt and GetEntityHealth(GetPlayerPed(-1)) > 200 then
            setNotHurt()
        end
    end
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
end

function setNotHurt()
    hurt = false
    ResetPedMovementClipset(GetPlayerPed(-1))
    ResetPedWeaponMovementClipset(GetPlayerPed(-1))
    ResetPedStrafeClipset(GetPlayerPed(-1))
end