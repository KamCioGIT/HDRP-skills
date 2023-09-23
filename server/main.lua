local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Commands.Add(Config.SkillMenuCommand, Config.SkillMenuCommandDescription, {}, true, function(source, args)
    TriggerClientEvent('HDRP-skills:client:openmenu', source)
end)

RegisterServerEvent('HDRP-skills:server:XP', function(args, metadata, amount)
    local PlayerData = RSGCore.Functions.GetPlayer(source)
    local currentxp = PlayerData.PlayerData.metadata[metadata]-- 0  -- Inicializa currentxp en 0

     --[[ ]] if PlayerData and PlayerData.metadata then
       currentxp = PlayerData.metadata[metadata] or 0
    end
    
    args = tonumber(args)

    if Config.Debug == true then
        print("XP Event Triggered - Player: " .. source .. " | Metadata: " .. metadata .. " | Amount: " .. amount)
    end

    if args == 1 then
        PlayerData.Functions.SetMetaData(metadata, (currentxp + amount))
       
        if Config.Debug == true then
            print("XP Added - Player: " .. source .. " | Metadata: " .. metadata .. " | Current XP: " .. currentxp .. " | Added Amount: " .. amount)
        end

    elseif args == 2 then
        if currentxp >= amount then
            PlayerData.Functions.SetMetaData(metadata, (currentxp - amount))

            if Config.Debug == true then
                print("XP Deducted - Player: " .. source .. " | Metadata: " .. metadata .. " | Current XP: " .. currentxp .. " | Deducted Amount: " .. amount)
            end

        else
            -- Aquí puedes manejar el caso en el que el jugador no tenga suficiente XP para deducir
            if Config.Debug == true then
                print("No hay suficiente XP para deducir - Player: " .. source .. " | Metadata: " .. metadata .. " | Current XP: " .. currentxp .. " | Deducted Amount: " .. amount)
            end
            
        end
    end
end)

-- Después de actualizar el progreso en el servidor, envía los datos actualizados al cliente
RegisterServerEvent('HDRP-skills:server:updateProgress')
AddEventHandler('HDRP-skills:server:updateProgress', function(playerId, metadata)
    TriggerClientEvent('HDRP-skills:client:updateProgress', playerId, metadata)
    print("Evento 'HDRP-skills:server:updateProgress' enviado al cliente con metadata: " .. metadata)
end)


RegisterServerEvent('HDRP-skills:server:requestXPData')
AddEventHandler('HDRP-skills:server:requestXPData', function(metadata)
    local source = source
    local Player = RSGCore.Functions.GetPlayer(source)

    if not Player then
        return
    end

    local currentXP = Player.Functions.GetMetaData(metadata) or 0

    -- Enviar la información actualizada de XP al cliente
    TriggerClientEvent('HDRP-skills:client:updateXPData', source, metadata, currentXP)
end)
