fs = require 'fs'
path = require 'path'

ignores = ['.git', 'Cakefile', 'README.md', '.gitignore']
onlyContents = ['config', 'themes']

task 'install', 'Install the files to the user\'s home directory', (options) ->
    cwd = process.cwd()

    fs.readdir cwd, (err, files) ->
        if (err)
            console.log 'This is bad:', err
            return

        linkFile path.join(cwd, file), path.join(process.env.HOME, '.' + file) for file in files when ignores.indexOf(file) is -1

linkFile = (src, dest) ->
    cwd = process.cwd()

    if (onlyContents.indexOf(path.basename(src)) isnt -1)
        fs.readdir src, (err, files) ->
            if (err)
                console.log 'This is bad:', err
                return

            linkFile path.join(src, file), path.join(dest, file) for file in files when ignores.indexOf(file) is -1
        return

    try
        if (fs.lstatSync dest)
            fs.unlinkSync dest
    catch e
        # doesn't exist

    console.log "Linking #{src}"
    fs.symlink src, dest
