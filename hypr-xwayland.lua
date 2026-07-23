return {
    setup = function()
        local vars = require("hypr-vars")
        hl.config({
            xwayland = {
                enabled = vars.xwayland.enabled,
                create_abstract_socket = vars.xwayland.create_abstract_socket,
            },
        })
    end,
}
