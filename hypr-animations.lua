return {
    setup = function()
        local vars = require("hypr-vars")
        hl.config({
            animations = {
                enable = vars.animations.enable,
                workspace_wraparound = vars.animations.workspace_wraparound,
            },
        })
        require("animations." .. vars.animations.animation).setup()
    end,
}
