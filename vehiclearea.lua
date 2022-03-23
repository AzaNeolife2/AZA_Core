Citizen.CreateThread(function()
	while true do
		Citizen.Wait(8) -- prevent crashing
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
        local joueurs = GetPlayerPed(-1)
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);

		-- fix OneSync NPC by Albert0
        if IsPedSittingInAnyVehicle(joueurs) then

            if GetPedInVehicleSeat(GetVehiclePedIsIn(joueurs,false),-1) == joueurs then
                SetVehicleDensityMultiplierThisFrame(0.1)
                SetParkedVehicleDensityMultiplierThisFrame(0.0)
            else
                SetVehicleDensityMultiplierThisFrame(0.0)
                SetParkedVehicleDensityMultiplierThisFrame(0.1)
            end
        else
          SetParkedVehicleDensityMultiplierThisFrame(0.0)
          SetVehicleDensityMultiplierThisFrame(0.1)
        end
	end
end)