-- Configuración de habilidades y reputación
Config = {}

Config.Debug = true

Config.SkillMenuCommand = 'habilidades'
Config.SkillMenuCommandDescription = 'Ver tus habilidades actuales o reputación laboral!'

-- Menú principal de habilidades
Config.SkillMenu = {
    MainTitle = 'Habilidades y Reputacion',
    SkillsMenuTitle = 'Habilidades',
    SkillMenuDescription = 'Ver tus habilidades.',
    SkillMenuIconColor = 'gold',
    ReputationMenuTitle = 'Reputación Laboral',
}

-- Menú principal de reputación
Config.ReputationMenu = {
    Title = 'Reputación Laboral',
    Description = 'Ver tu reputación laboral.',
    Icon = 'fa-solid fa-briefcase',
    IconColor = 'green',
}
------------------------------------

Config.SkillMenuTitleInner = 'Niveles de Habilidad'

Config.Skills = {
    -- ILEGAL
    {   title = 'Fabricación de Drogas',
        categorySkill = 'ilegal',
        Icon = 'fa-solid fa-cannabis',
        IconColour = 'gold',
        Rep = 'drogas',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Robo a Mano Armada',
        categorySkill = 'ilegal',
        Icon = 'fa-solid fa-dice',
        IconColour = 'gold',
        Rep = 'robo',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Asesinatos',
        categorySkill = 'ilegal',
        Icon = 'fa-solid fa-skull',
        IconColour = 'gold',
        Rep = 'asesinato',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Planificacion de robos',
        categorySkill = 'ilegal',
        Icon = 'fa-solid fa-gamepad',
        IconColour = 'gold',
        Rep = 'planificacionderobos',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Saqueo',
        categorySkill = 'ilegal',
        Icon = 'fa-solid fa-people-robbery',
        IconColour = 'gold',
        Rep = 'saqueo',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    -- CONOCIMIENTO
    {   title = 'Investigacion',
        categorySkill = 'conocimiento',
        Icon = 'fa-solid fa-magnifying-glass-plus',
        IconColour = 'gold',
        Rep = 'investigacion',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Exploracion',
        categorySkill = 'conocimiento',
        Icon = 'fa-solid fa-eye',
        IconColour = 'gold',
        Rep = 'exploracion',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Logistica',
        categorySkill = 'conocimiento',
        Icon = 'fa-solid fa-road',
        IconColour = 'gold',
        Rep = 'logistica',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Lectura',
        categorySkill = 'conocimiento',
        Icon = 'fa-solid fa-book',
        IconColour = 'gold',
        Rep = 'lectura',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Escritura',
        categorySkill = 'conocimiento',
        Icon = 'fa-solid fa-pencil',
        IconColour = 'gold',
        Rep = 'escritura',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    -- MANUALES
    {   title = 'Mecanica',
        categorySkill = 'manuales',
        Icon = 'fa-solid fa-gear',
        IconColour = 'gold',
        Rep = 'mecanica',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Fabricación',
        categorySkill = 'manuales',
        Icon = 'fa-solid fa-hand',
        IconColour = 'gold',
        Rep = 'fabricacion',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Herreria',
        categorySkill = 'manuales',
        Icon = 'fa-solid fa-road-spikes',
        IconColour = 'gold',
        Rep = 'herreria',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Carpinteria',
        categorySkill = 'supervivencia',
        Icon = 'fa-solid fa-tree',
        IconColour = 'gold',
        Rep = 'carpinteria',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Mineria',
        categorySkill = 'supervivencia',
        Icon = 'fa-solid fa-tower-observation',
        IconColour = 'gold',
        Rep = 'mineria',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Medicina',
        categorySkill = 'manuales',
        Icon = 'fa-solid fa-notes-medical',
        IconColour = 'gold',
        Rep = 'medicina',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Cocina',
        categorySkill = 'supervivencia',
        Icon = 'fa-solid fa-plate-wheat',
        IconColour = 'gold',
        Rep = 'cocina',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    -- SUPERVIVIENCIA
    {   title = 'Suerte',
        categorySkill = 'conocimiento',
        Icon = 'fa-solid fa-dice',
        IconColour = 'gold',
        Rep = 'suerte',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Primeros auxilios pets',
        categorySkill = 'manuales',
        Icon = 'fa-solid fa-user-nurse',
        IconColour = 'gold',
        Rep = 'primerosauxiliospets',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Primeros auxilios',
        categorySkill = 'manuales',
        Icon = 'fa-solid fa-heart',
        IconColour = 'gold',
        Rep = 'primerosauxilios',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Caza',
        categorySkill = 'supervivencia',
        Icon = 'fa-solid fa-paw',
        IconColour = 'gold',
        Rep = 'caza',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Cultivo',
        categorySkill = 'supervivencia',
        Icon = 'fa-solid fa-tractor',
        IconColour = 'gold',
        Rep = 'cultivo',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    {   title = 'Recolector',
        categorySkill = 'supervivencia',
        Icon = 'fa-solid fa-leaf',
        IconColour = 'gold',
        Rep = 'recolector',
        ProgressColour = 'gold',
        skillargs = {
            { Level = 10, Label = 'Nivel 10', Value = 'Fabricar' },
        },
    },
    -- Agregar más habilidades aquí
}

Config.JobReputationMenuTitle = 'Reputación Laboral'

Config.JobReputations = {
    {   title = 'Unemployed',
        Icon = 'fa-solid fa-face-smile',
        IconColour = 'silver',
        categoryJob = 'miscelanea',
        Rep = 'unemployed',
        ProgressColour = 'orange',
        repargs = {
            LevelRange = 'Level 1-5',
            Value = 'Quick processes and more returns',
            --[[ SkillRep = {
            } ]]
        },
    },
    {   title = 'Policia',
        Icon = 'fa-solid fa-star',
        IconColour = 'silver',
        categoryJob = 'legal y medica',
        Rep = 'police',
        ProgressColour = 'orange',
        repargs = {
            LevelRange = 'Level 1-5',
            Value = 'Quick processes and more returns',
            --[[ SkillRep = {
                'tacticasdearresto',
                'suerte',
                'investigacion',
            } ]]
        },
    },
    -- Agregar más reputaciones aquí
}
