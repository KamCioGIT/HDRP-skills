local RSGCore = exports['rsg-core']:GetCoreObject()
--local PlayerData = RSGCore.Functions.GetPlayerData()
local menus = {}

local function XP(args, metadata, amount)
    TriggerServerEvent('HDRP-skills:server:XP', args, metadata, amount)
end
exports('XP', XP)

RegisterNetEvent('RSGCore:Client:OnPlayerLoaded')
AddEventHandler('RSGCore:Client:OnPlayerLoaded', function()
    --isLoggedIn = true
    PlayerData = RSGCore.Functions.GetPlayerData()
end)

--[[ RegisterNetEvent('RSGCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    PlayerData = {}
end) ]]

RegisterNetEvent('RSGCore:Client:OnJobUpdate')
AddEventHandler('RSGCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

-- Función para agregar una habilidad o reputación a un menú
local function AddSkillOrReputationToMenu(mainCategory, category, data)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local currentXP = PlayerData.metadata[data.Rep] or 0 
    
    --[[local currentXP = RSGCore.Functions.GetPlayerData().metadata[data.Rep] or 0]]

    local option = {
        title = data.title,
        icon = data.Icon,
        iconColor = data.IconColour,
        description = 'Nivel: ' .. math.floor(currentXP / 100) .. '  ' .. 'Experiencia: ' ..((currentXP % 100) / 100 * 100).. '%',
        progress = { (currentXP % 100) / 100 * 100 },
        colorScheme = data.ProgressColour,
        event = data.event,
        --metadata = data.skillargs or data.repargs,
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
    AddSkillOrReputationToMenu(mainCategory, category, data)
    if Config.Debug == true then
        print("Itera a través de las habilidades")
        print(mainCategory .. '_' .. category)
    end
end

for _, rep in ipairs(Config.JobReputations) do
    local mainCategory = 'Reputaciones'
    local category = rep.categoryJob
    AddSkillOrReputationToMenu(mainCategory, category, rep)

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

        RegisterNetEvent('HDRP-skills:client:' .. mainCategory .. '_' .. category)
        AddEventHandler('HDRP-skills:client:' .. mainCategory .. '_' .. category, function()
            lib.registerContext(menuData)
            lib.showContext(menuData.id)
        end)
    end
end

-- Evento principal para abrir el menú principal
RegisterNetEvent('HDRP-skills:client:openmenu')
AddEventHandler('HDRP-skills:client:openmenu', function()
    -- Crear un menú principal con las categorías
    local mainMenu = {
        id = 'main_menu',
        title = 'Menú Principal',
        options = {}
    }

    for mainCategory, categories in pairs(menus) do
        for category, _ in pairs(categories) do
            table.insert(mainMenu.options, {
                title = mainCategory .. ' - ' .. category,
                description = 'Explora ' .. category,
                icon = 'fa-solid fa-kitchen-set',
                event = 'HDRP-skills:client:show_category',
                args = { mainCategory = mainCategory, category = category },
                arrow = true
            })
        end
    end
    print("Crear un menú principal con las categorías")

    lib.registerContext(mainMenu)
    lib.showContext(mainMenu.id)
end)

-- Evento para mostrar habilidades o reputaciones de una categoría específica
RegisterNetEvent('HDRP-skills:client:show_category')
AddEventHandler('HDRP-skills:client:show_category', function(data)
    local mainCategory = data.mainCategory
    local category = data.category
    local categoryMenu = menus[mainCategory][category]

    if Config.Debug == true then
        print("Evento para mostrar habilidades o reputaciones")
    end

    lib.registerContext(categoryMenu)
    lib.showContext(categoryMenu.id)
end)





