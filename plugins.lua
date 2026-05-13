return {
    setup = function(vars)
        require("./plugins/hyprgrass.lua").setup(vars)
        require("./plugins/pyprland.lua").setup(vars)
    end
}
