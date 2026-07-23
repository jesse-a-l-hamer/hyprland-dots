return {
    setup = function()
        local vars = require("hypr-vars")
        for device, device_vars in pairs(vars.devices) do
            require("devices." .. device).setup(vars, device_vars)
        end
    end,
}
