return {
    setup = function()
        local vars = require("hypr-vars")
        local main_mod = vars.binds.mods.main
        local pypr = vars.plugins.pypr

        hl.bind(main_mod .. " + A", hl.dsp.exec_cmd(pypr .. " expose"))
        hl.bind(main_mod .. " + Z", hl.dsp.exec_cmd(pypr .. " zoom ++0.5"))
        hl.bind(main_mod .. " + CTRL + Z", hl.dsp.exec_cmd(pypr .. " zoom"))
    end,
}
