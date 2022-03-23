-- Density values from 0.0 to 1.0.
DensityMultiplier = 0.1
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(10)
		local playerPed = GetPlayerPed(-1)
		local playerLocalisation = GetEntityCoords(playerPed)
		ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
	    SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetPedDensityMultiplierThisFrame(DensityMultiplier)
	    SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
	end
end)