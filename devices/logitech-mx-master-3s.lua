return {
    setup = function()
        local vars = require("hypr-vars")
        local device_name = "logitech-mx-master-3s"
        local device_vars = vars.devices[device_name]
        hl.device({
            name = device_name,
            sensitivity = device_vars.sensitivity,
            accel_profile = device_vars.accel_profile,
        })
    end,
}
