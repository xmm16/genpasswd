project('genpasswd',
        'c',
        version: '0.1',
        default_options: ['warning_level=3'])

libsodium_dep = dependency('libsodium')

executable('genpasswd',
           'src/main.c',
           dependencies: libsodium_dep,
           install: true)
