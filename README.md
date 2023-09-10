# HDRP Skill Menu

Here's a simple Skill Menu which uses ox_lib context menu that allows you to create skills through RSG-Core Player Meta Data and display the skills/ reputation through this menu.
- 

## Changes REDM 

local RSGCore = exports['rsg-core']:GetCoreObject() 

## Example Useage:

- Add any meta data (skills) you want into `rsg-core/server/player.lua` 


------------------- JOBS

    PlayerData.metadata['unemployed'] = PlayerData.metadata['unemployed'] or 0
    PlayerData.metadata['police'] = PlayerData.metadata['police'] or 0
    
    -------------- SKILLS

    -- SUPERFIVIENCIA
    PlayerData.metadata['suerte'] = PlayerData.metadata['suerte'] or 0
    PlayerData.metadata['primerosauxiliospets'] = PlayerData.metadata['primerosauxiliospets'] or 0
    PlayerData.metadata['primerosauxilios'] = PlayerData.metadata['primerosauxilios'] or 0
    PlayerData.metadata['polinizacion'] = PlayerData.metadata['polinizacion'] or 0
    PlayerData.metadata['criadeanimales'] = PlayerData.metadata['criadeanimales'] or 0
    PlayerData.metadata['ganaderia'] = PlayerData.metadata['ganaderia'] or 0
    PlayerData.metadata['domacaballo'] = PlayerData.metadata['domacaballo'] or 0
    PlayerData.metadata['domabestia'] = PlayerData.metadata['domabestia'] or 0
    PlayerData.metadata['trapero'] = PlayerData.metadata['trapero'] or 0
    PlayerData.metadata['caza'] = PlayerData.metadata['caza'] or 0
    PlayerData.metadata['pesca'] = PlayerData.metadata['pesca'] or 0
    PlayerData.metadata['cultivo'] = PlayerData.metadata['cultivo'] or 0
    PlayerData.metadata['recolector'] = PlayerData.metadata['recolector'] or 0
    -- ILEGALES
    PlayerData.metadata['drogas'] = PlayerData.metadata['drogas'] or 0
    PlayerData.metadata['robo'] = PlayerData.metadata['robo'] or 0
    PlayerData.metadata['asesinato'] = PlayerData.metadata['asesinato'] or 0
    PlayerData.metadata['planificacionderobos'] = PlayerData.metadata['planificacionderobos'] or 0
    PlayerData.metadata['corrupcion'] = PlayerData.metadata['corrupcion'] or 0
    PlayerData.metadata['contrabando'] = PlayerData.metadata['contrabando'] or 0
    PlayerData.metadata['sustanciasilegales'] = PlayerData.metadata['sustanciasilegales'] or 0
    PlayerData.metadata['bebidasprohibidos'] = PlayerData.metadata['bebidasprohibidos'] or 0
    PlayerData.metadata['falsificacion'] = PlayerData.metadata['falsificacion'] or 0
    PlayerData.metadata['decodificaciondedocumentos'] = PlayerData.metadata['decodificaciondedocumentos'] or 0
    PlayerData.metadata['saqueo'] = PlayerData.metadata['saqueo'] or 0
    -- CONOCIMIENTO/SOCIAL
    PlayerData.metadata['investigacion'] = PlayerData.metadata['investigacion'] or 0
    PlayerData.metadata['exploracion'] = PlayerData.metadata['exploracion'] or 0
    PlayerData.metadata['logistica'] = PlayerData.metadata['logistica'] or 0
    PlayerData.metadata['lectura'] = PlayerData.metadata['lectura'] or 0
    PlayerData.metadata['escritura'] = PlayerData.metadata['escritura'] or 0
    PlayerData.metadata['diseño'] = PlayerData.metadata['diseño'] or 0
    PlayerData.metadata['finanzas'] = PlayerData.metadata['finanzas'] or 0
    PlayerData.metadata['negociacion'] = PlayerData.metadata['negociacion'] or 0
    PlayerData.metadata['comercio'] = PlayerData.metadata['comercio'] or 0
    PlayerData.metadata['comunicacion'] = PlayerData.metadata['comunicacion'] or 0
    PlayerData.metadata['gestion'] = PlayerData.metadata['gestion'] or 0
    PlayerData.metadata['tratamientos'] = PlayerData.metadata['tratamientos'] or 0
    PlayerData.metadata['diagnostico'] = PlayerData.metadata['diagnostico'] or 0
    -- MANUALES
    PlayerData.metadata['mecanica'] = PlayerData.metadata['mecanica'] or 0
    PlayerData.metadata['explosivos'] = PlayerData.metadata['explosivos'] or 0
    PlayerData.metadata['modificaciondearmas'] = PlayerData.metadata['modificaciondearmas'] or 0
    PlayerData.metadata['forjadearmas'] = PlayerData.metadata['forjadearmas'] or 0
    PlayerData.metadata['fabricacion'] = PlayerData.metadata['fabricacion'] or 0
    PlayerData.metadata['peleteria'] = PlayerData.metadata['peleteria'] or 0
    PlayerData.metadata['alquimia'] = PlayerData.metadata['alquimia'] or 0
    PlayerData.metadata['herreria'] = PlayerData.metadata['herreria'] or 0
    PlayerData.metadata['costura'] = PlayerData.metadata['costura'] or 0
    PlayerData.metadata['mineria'] = PlayerData.metadata['mineria'] or 0
    PlayerData.metadata['carpinteria'] = PlayerData.metadata['carpinteria'] or 0
    PlayerData.metadata['medicina'] = PlayerData.metadata['medicina'] or 0
    PlayerData.metadata['cocina'] = PlayerData.metadata['cocina'] or 0
    ----------------------

- Add checks for the players meta data (client side example)
`if RSGCore.Functions.GetPlayerData().metadata['drugrep'] >= 1000 -- If Drug Manufacturing is equal to or greater than 10`

- Add 50 XP through export for completion of task

`exports['HDRP-skills']:XP(1, 'drugrep', 50)`

You can see how the above was used in the /client/main.lua and the config, to add more simply duplicate both and edit accordingly, I've made this very configurable for ease of use to others.

- Add trigger to radial menu (qb-radial or rsg-radialmenu example)

```
id = 'skills',
title = 'Skills',
icon = 'chart-bar',
type = 'client',
event = 'HDRP-skills:client:SkillMenu',
shouldClose = true
```

## Notes
The way I've set this up is that 100xp is 1 level, this doesn't increment for levels, but if required you could always give less xp based off the player level or edit accordingly for your needs with it being open-source.

Credit:
Originally using - https://github.com/boiidevelopment/boii-skillsmenu-qb on my server before moving to more overextended resources, so I took inspiration from there and expanded upon it to use ox_lib menu.
Version edit using - https://github.com/ashleyjrobinson/possible-skills  thanks @ashleyjrobinson

Version editada para redm @sadicius
