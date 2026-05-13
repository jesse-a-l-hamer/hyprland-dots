return {
    setup = function(vars)
        local system_key = " + delete"
        hl.bind(
            vars.binds.mods.main .. system_key,
            hl.dsp.exec_cmd("app2unit -- wleave"),
            { submap_universal = true }
        )
        hl.bind(
            vars.binds.mods.main .. " + ALT" .. system_key,
            hl.dsp.exec_cmd("sleep 1 && hyprctl dispatch dpms off"),
            { submap_universal = true }
        )
        hl.bind(
            vars.binds.mods.main .. " + SHIFT" .. system_key,
            hl.dsp.exec_cmd("systemctl suspend"),
            { submap_universal = true }
        )
        hl.bind(
            vars.binds.mods.main .. " + CTRL" .. system_key,
            hl.dsp.exec_cmd("systemctl hibernate"),
            { submap_universal = true }
        )
        hl.bind(
            vars.binds.mods.main .. " + SHIFT + ALT" .. system_key,
            hl.dsp.exec_cmd("uwsm stop"),
            { submap_universal = true }
        )
        hl.bind(
            vars.binds.mods.main .. " + CTRL + ALT" .. system_key,
            hl.dsp.exec_cmd("systemctl reboot"),
            { submap_universal = true }
        )
        hl.bind(
            vars.binds.mods.main .. vars.binds.mods.meh .. system_key,
            hl.dsp.exec_cmd("systemctl poweroff"),
            { submap_universal = true }
        )
    end,
}
