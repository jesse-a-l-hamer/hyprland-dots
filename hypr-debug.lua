return {
    setup = function()
        local debug_vars = require("hypr-vars").debug

        hl.config({
            debug = {
                disable_logs = debug_vars.disable_logs,
                disable_time = debug_vars.disable_time,
            },
        })
    end,
}
