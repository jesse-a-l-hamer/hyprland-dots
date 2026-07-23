local shell_overrides = {
    default = function() end,
    noctalia = function()
        local ipc = "noctalia msg "

        -- 5. Volume
        hl.bind(
            "XF86AudioRaiseVolume",
            hl.dsp.exec_cmd(ipc .. "volume-up"),
            { repeating = true, locked = true, description = "Volume up" }
        )
        hl.bind(
            "XF86AudioLowerVolume",
            hl.dsp.exec_cmd(ipc .. "volume-down"),
            { repeating = true, locked = true, description = "Volume down" }
        )
        hl.bind(
            "XF86AudioMute",
            hl.dsp.exec_cmd(ipc .. "volume-mute"),
            { locked = true, description = "Volume mute" }
        )
        hl.bind(
            "XF86AudioMicMute",
            hl.dsp.exec_cmd(ipc .. "mic-mute"),
            { locked = true, description = "Mic mute" }
        )
    end,
}
return {
    setup = function()
        local vars = require("hypr-vars")
        local scripts = vars.paths.scripts
        local shell = vars.apps.shell

        if require("utils").contains_key(shell, shell_overrides) then
            shell_overrides[shell]()
        else
            -- 5. Volume
            hl.bind(
                "XF86AudioRaiseVolume",
                hl.dsp.exec_cmd(scripts .. "binds/volume up"),
                { repeating = true, locked = true, description = "Volume up" }
            )
            hl.bind(
                "XF86AudioLowerVolume",
                hl.dsp.exec_cmd(scripts .. "binds/volume down"),
                { repeating = true, locked = true, description = "Volume down" }
            )
            hl.bind(
                "XF86AudioMute",
                hl.dsp.exec_cmd(scripts .. "binds/volume mute"),
                { locked = true, description = "Volume mute" }
            )
            hl.bind(
                "XF86AudioMicMute",
                hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
                { locked = true, description = "Mic mute" }
            )
        end
    end,
}
