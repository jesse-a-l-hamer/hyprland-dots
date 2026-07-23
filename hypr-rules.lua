return {
    setup = function()
        require("rules.layers").setup()
        require("rules.tags").setup()
        require("rules.windows").setup()
        require("rules.workspaces").setup()
    end,
}
