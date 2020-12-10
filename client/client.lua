
--[[

Jeg har opbygget det sådan er det køre separet fra den standarde resoruce "esx_policejob" https://github.com/ESX-Org/esx_policejob/blob/master

dette vil altså sige i kan enten lave nogle events eller exports den funktion der åbner menenu(har lavet det her som funktion)

]]


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


function politiVaabenMenu()
	local playerped = PlayerPedId()
	local grade = ESX.PlayerData.Job.grade_name

	local elements = {
		{label = 'Fjern Våben License', value = 'fjernLiceense'},
		{label = 'Opret Våbenlicense', value = 'opretLicense'},
	}

 -- Her oprettes en meget simpel menu, som er lavet som en function, så den kan exporteres og køres igennem esx_policejob i dette tilfælde. 
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vl_politimanemangt', {
			title	= 'POLITI VÅBEN MENU',
			align	= 'center',
			elements = elements
		}, function(data, menu)

			local valdemar = data.current.value
		
			if valdemar == 'fjernLiceense' then
				TriggerEvent('VL_PolitiMangement:fjernVaapenLicense') -- Meget simpelt, her bliver de event jeg har lavet i server.lua kørt.
				ESX.UI.Menu.CloseAll()
			end

			if valdemar == 'opretLicense' then 
				TriggerEvent('VL_PolitiMangement:givVaapenLicense')
				ESX.UI.Menu.CloseAll()
			end
		end, function(data, menu)
			menu.close()
	end)
end 



