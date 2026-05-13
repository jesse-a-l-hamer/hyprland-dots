return {
    setup = function(vars)
        local scripts = vars.paths.scripts

        hl.bind(
            "XF86AudioRaiseVolume",
            hl.dsp.exec_cmd(scripts .. "binds/volume up"),
            { repeating = true, locked = true }
        )
        hl.bind(
            "XF86AudioLowerVolume",
            hl.dsp.exec_cmd(scripts .. "binds/volume down"),
            { repeating = true, locked = true }
        )
        hl.bind(
            "XF86AudioMute",
            hl.dsp.exec_cmd(scripts .. "binds/volume mute"),
            { locked = true }
        )
        hl.bind(
            "XF86AudioMicMute",
            hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
            { locked = true }
        )
    end,
}
