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
    src = path.join cwd, file
    dest = path.join process.env.HOME, '.' + file

    if (fs.lstatSync dest)
        fs.unlinkSync dest

    console.log "Linking ~/.#{file}"
    fs.symlink src, dest
