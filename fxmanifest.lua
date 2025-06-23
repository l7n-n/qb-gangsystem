fx_version 'cerulean'
game 'gta5'

author 'YourName'
description 'نظام العصابات مع دعم اللابتوب'
version '1.1.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'shared/*.lua'
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}
