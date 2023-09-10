fx_version 'cerulean'

games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Sadicius'

description 'VERSION the Possible Skill Menu - ox_lib Skill Menu that users Core Player Meta Data'

version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*'
}
client_scripts {
    'client/*',
}
server_scripts {
    'server/*',
}

dependencies {
    'rsg-core',
    'ox_lib',
}