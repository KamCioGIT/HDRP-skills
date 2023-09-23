local RSGCore = exports['rsg-core']:GetCoreObject()
local menus = {}
local PlayerData = nil
local currentXP = {}  -- Declarar una tabla para almacenar las experiencias actuales

RegisterNetEvent('RSGCore:Client:OnPlayerLoaded')
AddEventHandler('RSGCore:Client:OnPlayerLoaded', function(playerData)
    PlayerData = playerData
end)

local function XP(args, metadata, amount)
    TriggerServerEvent('HDRP-skills:server:XP', args, metadata, amount)
end
exports('XP', XP)


local function RegisterCategoryEvent(mainCategory, category, menuData)
    RegisterNetEvent('HDRP-skills:client:' .. mainCategory .. '_' .. category)
    AddEventHandler('HDRP-skills:client:' .. mainCategory .. '_' .. category, function()
        lib.registerContext(menuData)
        lib.showContext(menuData.id)
    end)
end

local function CreateMainMenuOption(mainMenu, mainCategory, category)
    table.insert(mainMenu.options, {
        title = mainCategory .. ' - ' .. category,
        description = 'Explora ' .. category,
        icon = 'fa-solid fa-kitchen-set',
        event = 'HDRP-skills:client:show_category',
        args = { mainCategory = mainCategory, category = category },
        arrow = true
    })
end

local function CreateMenuOption(mainCategory, category, data, newXP)
    local currentXP = newXP or (PlayerData and PlayerData.metadata[data.Rep]) or 0
    local progress = (currentXP % 100) / 100 * 100

    local option = {
        title = data.title,
        icon = data.Icon,
        iconColor = data.IconColour,
        description = 'Nivel: ' .. math.floor(currentXP / 100) .. '  ' .. 'Experiencia: ' .. progress .. '%',
        progress = { progress },
        colorScheme = data.ProgressColour,
        event = data.event,
        args = data.args,
    }

    if Config.Debug == true then
        print("Información actualizada en el cliente:")
        print("title: " .. data.title)
        print(mainCategory .. '_' .. category)
        print("currentXP: " ..currentXP)
        print("description: " .. option.description)
    end

    if not menus[mainCategory] then
        menus[mainCategory] = {}
    end

    if not menus[mainCategory][category] then
        menus[mainCategory][category] = {
            id = 'menu_' .. mainCategory .. '_' .. category,
            title = 'Menú - ' .. mainCategory .. ' - ' .. category,
            menu = 'main_menu',
            onBack = function() end,
            options = { option }
        }
    else
        table.insert(menus[mainCategory][category].options, option)
    end
end


-- Itera a través de las habilidades y reputaciones
for _, data in ipairs(Config.Skills) do
    local mainCategory = 'Skills'
    local category = data.categorySkill
    CreateMenuOption(mainCategory, category, data)
    if Config.Debug == true then
        print("Itera a través de las habilidades")
        print(mainCategory .. '_' .. category)
    end
end

for _, rep in ipairs(Config.JobReputations) do
    local mainCategory = 'Reputaciones'
    local category = rep.categoryJob
    CreateMenuOption(mainCategory, category, rep)

    if Config.Debug == true then
        print("Itera a través de las reputaciones")
        print(mainCategory .. '_' .. category)
    end
end

-- Registrar eventos de menú por categoría
for mainCategory, categories in pairs(menus) do
    for category, menuData in pairs(categories) do
        if Config.Debug == true then
            print("Registrar eventos de menú por categoría")
            print(mainCategory .. '_' .. category)
        end
        RegisterCategoryEvent(mainCategory, category, menuData)
    end
end

-- Evento principal para abrir el menú principal
RegisterNetEvent('HDRP-skills:client:openmenu')
AddEventHandler('HDRP-skills:client:openmenu', function(playerId)

    local mainMenu = {
        id = 'main_menu',
        title = 'Menú Principal',
        options = {}
    }

    for mainCategory, categories in pairs(menus) do
        for category, _ in pairs(categories) do
            CreateMainMenuOption(mainMenu, mainCategory, category)
        end
    end

    lib.registerContext(mainMenu)
    lib.showContext(mainMenu.id)
    -- Después de abrir el menú, solicita las experiencias actualizadas al servidor
    for metadata, _ in pairs(currentXP) do
        TriggerServerEvent('HDRP-skills:server:requestXPData', metadata)
    end
end)

-- Evento para mostrar habilidades o reputaciones de una categoría específica
RegisterNetEvent('HDRP-skills:client:show_category')
AddEventHandler('HDRP-skills:client:show_category', function(data)
    local mainCategory = data.mainCategory
    local category = data.category
    local categoryMenu = menus[mainCategory][category]
    --TriggerClientEvent('HDRP-skills:client:updateXPData', playerId, newXP)

    if Config.Debug == true then
        print("Evento para mostrar habilidades o reputaciones")
    end

    lib.registerContext(categoryMenu)
    lib.showContext(categoryMenu.id)
end)

-- Actualización de la tabla de experiencias actuales
RegisterNetEvent('HDRP-skills:client:updateXPData')
AddEventHandler('HDRP-skills:client:updateXPData', function(metadata, newXP)
    currentXP[metadata] = newXP
end)

RegisterNetEvent('HDRP-skills:client:updateProgress')
AddEventHandler('HDRP-skills:client:updateProgress', function(metadata)
    print("Evento 'HDRP-skills:client:updateProgress' recibido con metadata: " .. metadata)
end)
