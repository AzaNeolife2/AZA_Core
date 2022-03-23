local vehWeapons = {
	0x1D073A89, -- ShotGun
	0x83BF0278, -- Carbine
	0x5FC3C11, -- Sniper
}


local hasBeenInPoliceVehicle = false

local alreadyHaveWeapon = {}

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(1000)
		local joueurs = GetPlayerPed(-1)
		if(IsPedInAnyPoliceVehicle(joueurs)) then
			if(not hasBeenInPoliceVehicle) then
				hasBeenInPoliceVehicle = true
			end
		else
			if(hasBeenInPoliceVehicle) then
				for i,k in pairs(vehWeapons) do
					if(not alreadyHaveWeapon[i]) then
						TriggerServerEvent("PoliceVehicleWeaponDeleter:askDropWeapon",k)
					end
				end
				hasBeenInPoliceVehicle = false
			end
		end

	end

end)


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(1000)
		local joueurs = GetPlayerPed(-1)

		if(not IsPedInAnyVehicle(joueurs)) then
			for i=1,#vehWeapons do
				if(HasPedGotWeapon(joueurs, vehWeapons[i], false)==1) then
					alreadyHaveWeapon[i] = true
				else
					alreadyHaveWeapon[i] = false
				end
			end
		end
		Citizen.Wait(5000)
	end

end)


RegisterNetEvent("PoliceVehicleWeaponDeleter:drop")
AddEventHandler("PoliceVehicleWeaponDeleter:drop", function(wea)
	local joueurs = GetPlayerPed(-1)
	RemoveWeaponFromPed(joueurs, wea)
end)