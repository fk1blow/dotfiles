"use strict"

fs = require 'fs'
path = require 'path'

task 'install', 'Install the files to the user\'s home directory', (options) ->
    cwd = process.cwd()
    ignores = ['.git', 'Cakefile', 'README.md', '.gitignore']

    fs.readdir cwd, (err, files) ->
        if (err)
            console.log 'This is bad:', err
            return

        linkFile file for file in files when ignores.indexOf(file) is -1

linkFile = (file) ->
    cwd = process.cwd()

    console.log "Linking ~/.#{file}"
    fs.symlink path.join(cwd, file), path.join(process.env.HOME, '.' + file)
