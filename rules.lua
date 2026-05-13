return {
    setup = function(vars)
        require("./rules/layers.lua").setup(vars)
        require("./rules/tags.lua").setup(vars)
        require("./rules/windows.lua").setup(vars)
        require("./rules/workspaces.lua").setup(vars)
    end,
}
