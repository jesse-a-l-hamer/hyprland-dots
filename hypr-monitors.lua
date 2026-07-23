return {
    setup = function()
        local vars = require("hypr-vars")
        for monitor, monitor_vars in pairs(vars.monitors) do
            require("monitors." .. monitor).setup(vars, monitor_vars)
        end
    end,
}
