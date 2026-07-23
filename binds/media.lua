local shell_overrides = {
    default = function() end,
    noctalia = function()
        local ipc = "noctalia msg "

        -- 6. Media
        hl.bind(
            "XF86AudioNext",
            hl.dsp.exec_cmd(ipc .. "media next"),
            { locked = true, description = "Media player next" }
        )
        hl.bind(
            "XF86AudioPause",
            hl.dsp.exec_cmd(ipc .. "media toggle"),
            { locked = true, description = "Media player toggle play/pause" }
        )
        hl.bind(
            "XF86AudioPlay",
            hl.dsp.exec_cmd(ipc .. "media toggle"),
            { locked = true, description = "Media player toggle play/pause" }
        )
        hl.bind(
            "XF86AudioPrev",
            hl.dsp.exec_cmd(ipc .. "media previous"),
            { locked = true, description = "Media player previous" }
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
            -- 6. Media
            hl.bind(
                "XF86AudioNext",
                hl.dsp.exec_cmd("playerctl next"),
                { locked = true, description = "Media player next" }
            )
            hl.bind(
                "XF86AudioPause",
                hl.dsp.exec_cmd("playerctl play-pause"),
                { locked = true, description = "Media player toggle play/pause" }
            )
            hl.bind(
                "XF86AudioPlay",
                hl.dsp.exec_cmd("playerctl play-pause"),
                { locked = true, description = "Media player toggle play/pause" }
            )
            hl.bind(
                "XF86AudioPrev",
                hl.dsp.exec_cmd("playerctl previous"),
                { locked = true, description = "Media player previous" }
            )
        end
    end,
}
