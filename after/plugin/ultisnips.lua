vim.g.UltiSnipsSnippetDirectories = {'./snips'}

function IsTexMathEnv()
    return require('tex-env').isMathEnv()
end

