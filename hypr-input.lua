return {
    setup = function()
        local vars = require("hypr-vars")
        hl.config({
            input = {
                kb_layout = vars.input.kb_layout,
                follow_mouse = vars.input.follow_mouse,
                touchpad = vars.input.touchpad,
            },
        })
    end,
}
