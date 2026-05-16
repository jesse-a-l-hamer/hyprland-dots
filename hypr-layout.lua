return {
    setup = function(vars)
        hl.config({
            general = {
                layout = vars.layout.use,
            },
            layout = {
                single_window_aspect_ratio = vars.layout.single_window_aspect_ratio,
            },
            dwindle = {
                preserve_split = vars.layout.dwindle.preserve_split,
                smart_resizing = vars.layout.dwindle.smart_resizing,
            },
            master = {
                new_status = vars.layout.master.new_status,
            },
        })
    end,
}
