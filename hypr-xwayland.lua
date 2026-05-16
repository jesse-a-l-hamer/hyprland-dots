return {
    setup = function(vars)
        hl.config({
            xwayland = {
                enabled = vars.xwayland.enabled,
                create_abstract_socket = vars.xwayland.create_abstract_socket,
            },
        })
    end,
}
