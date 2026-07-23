return {
    setup = function()
        local vars = require("hypr-vars")
        require("plugins.hyprgrass").setup(vars)
        require("plugins.pyprland").setup(vars)
    end,
}
