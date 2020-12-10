
ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) -- ESX 


-- Opretter EVENT
RegisterNetevent('VL_PolitiMangement:fjernVaapenLicense')
AddEventHandler('VL_PolitiMangement:fjernVaapenLicense', function(target)
    --[[
        Locals der henter oplysninger omkring den personer der giver licens og modtager. 
    ]]
        local source = _source
        local sourceXPlayer = ESX.GetPlayerFromId(source)
        local targetXPlayer = ESX.GetPlayerFromId(target)

        TriggerEvent('esx_license:removeLicense', target, 'weapon', function() -- Det event der fjerne det givende våben license. 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'sucess', text = 'Du fjernede et våben license..', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } }) -- Sender besked Mythic Notify
end)
-- Opretter EVENT
RegisterNetevent('VL_PolitiMangement:givVaapenLicense')
AddEventHandler('VL_PolitiMangement:givVaapenLicense', function(target)
        --[[
        Locals der skal være der...
        ]]
        local source = _source
        local sourceXPlayer = ESX.GetPlayerFromId(source)
        local targetXPlayer = ESX.GetPlayerFromId(target)

        TriggerEvent('esx_license:addLicense', target, 'weapon', function() -- Det event der giver der weapon license
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'sucess', text = 'Du oprettede en våben license til personen', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } }) -- Sender besked Mythic Notify
end)