local shell_overrides = {
    default = function() end,
    noctalia = function()
        local ipc = "noctalia msg "

        hl.bind(
            "XF86MonBrightnessUp",
            hl.dsp.exec_cmd(ipc .. "brightness-up"),
            { repeating = true, locked = true }
        )
        hl.bind(
            "XF86MonBrightnessDown",
            hl.dsp.exec_cmd(ipc .. "brightness-down"),
            { repeating = true, locked = true }
        )
    end,
}
return {
    setup = function()
        local vars = require("hypr-vars")
        local shell = vars.apps.shell
        if require("utils").contains_key(shell, shell_overrides) then
            shell_overrides[shell]()
        else
            hl.bind(
                "XF86MonBrightnessUp",
                hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
                { repeating = true, locked = true }
            )
            hl.bind(
                "XF86MonBrightnessDown",
                hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
                { repeating = true, locked = true }
            )
        end
    end,
}
