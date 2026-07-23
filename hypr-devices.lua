return {
    setup = function()
        local vars = require("hypr-vars")
        for device, _ in pairs(vars.devices) do
            require("devices." .. device).setup()
        end
    end,
}
