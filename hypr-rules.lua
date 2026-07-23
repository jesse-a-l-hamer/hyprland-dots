return {
    setup = function()
        local vars = require("hypr-vars")
        require("rules.layers").setup(vars)
        require("rules.tags").setup(vars)
        require("rules.windows").setup(vars)
        require("rules.workspaces").setup(vars)
    end,
}
