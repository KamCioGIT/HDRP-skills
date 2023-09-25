local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Commands.Add(Config.SkillMenuCommand, Config.SkillMenuCommandDescription, {}, true, function(source, args)
    TriggerClientEvent('HDRP-skills:client:openmenu', source)
end)

RegisterServerEvent('HDRP-skills:server:XP', function(args, metadata, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local currentxp = Player.PlayerData.metadata[metadata]-- 0  -- Inicializa currentxp en 0

    args = tonumber(args)

    if Config.Debug == true then
        print("XP Event Triggered - Player: " .. source .. " | Metadata: " .. metadata .. " | Amount: " .. amount)
    end

    if args == 1 then
        Player.Functions.SetMetaData(metadata, (currentxp + amount))
       
        if Config.Debug == true then
            print("XP Added - Player: " .. source .. " | Metadata: " .. metadata .. " | Current XP: " .. currentxp .. " | Added Amount: " .. amount)
        end

    elseif args == 2 then
        if currentxp >= amount then
            Player.Functions.SetMetaData(metadata, (currentxp - amount))

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

    -- Después de actualizar el progreso en el servidor, envía los datos actualizados al cliente
    TriggerClientEvent('HDRP-skills:server:updateXPData', src, metadata, Player.PlayerData.metadata[metadata])

end)

-- Después de actualizar el progreso en el servidor, envía los datos actualizados al cliente
RegisterServerEvent('HDRP-skills:server:updateProgress')
AddEventHandler('HDRP-skills:server:updateProgress', function(playerId, metadata)
    TriggerClientEvent('HDRP-skills:client:updateProgress', playerId, metadata)
    print("Evento 'HDRP-skills:server:updateProgress' enviado al cliente con metadata: " .. metadata)
end)


-- Evento para enviar información actualizada de XP al cliente
RegisterServerEvent('HDRP-skills:server:updateXPData')
AddEventHandler('HDRP-skills:server:updateXPData', function(metadata, currentXP)
    local source = source
    TriggerClientEvent('HDRP-skills:client:updateXPData', source, metadata, currentXP)
    print("Evento 'HDRP-skills:server:updateXPData' enviado al cliente con metadata: " .. metadata)
end)


