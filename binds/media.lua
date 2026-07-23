local shell_overrides = {
    default = function() end,
    noctalia = function()
        local ipc = "noctalia msg "

        hl.bind(
            "XF86AudioNext",
            hl.dsp.exec_cmd(ipc .. "media next"),
            { locked = true }
        )
        hl.bind(
            "XF86AudioPause",
            hl.dsp.exec_cmd(ipc .. "media toggle"),
            { locked = true }
        )
        hl.bind(
            "XF86AudioPlay",
            hl.dsp.exec_cmd(ipc .. "media toggle"),
            { locked = true }
        )
        hl.bind(
            "XF86AudioPrev",
            hl.dsp.exec_cmd(ipc .. "media previous"),
            { locked = true }
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
                "XF86AudioNext",
                hl.dsp.exec_cmd("playerctl next"),
                { locked = true }
            )
            hl.bind(
                "XF86AudioPause",
                hl.dsp.exec_cmd("playerctl play-pause"),
                { locked = true }
            )
            hl.bind(
                "XF86AudioPlay",
                hl.dsp.exec_cmd("playerctl play-pause"),
                { locked = true }
            )
            hl.bind(
                "XF86AudioPrev",
                hl.dsp.exec_cmd("playerctl previous"),
                { locked = true }
            )
        end
    end,
}
