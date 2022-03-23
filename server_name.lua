function SetData()
	players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		table.insert( players, player )
    end

	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "~p~NEOLIFE ~w~| ~p~Discord : ~w~https://discord.gg/5qPWZ8h~p~ ~w~| ~p~ID: ~b~"..id.." ~w~| ~g~".. #players .." ~p~connecté(e)s")
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)
		SetData()
	end
end)

Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_LEAVE", "~r~Se déconnecter")
end)

Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_QUIT", "~r~Quitter")
end)

