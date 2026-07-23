return {
    setup = function()
        local vars = require("hypr-vars")
        for monitor, _ in pairs(vars.monitors) do
            require("monitors." .. monitor).setup()
        end
    end,
}
