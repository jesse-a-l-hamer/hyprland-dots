return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        local system_key = " + delete"
        hl.bind(
            main_mod .. system_key,
            hl.dsp.exec_cmd("app2unit -- wleave"),
            { submap_universal = true }
        )
        hl.bind(
            main_mod .. " + ALT" .. system_key,
            hl.dsp.exec_cmd("sleep 1 && hyprctl dispatch dpms off"),
            { submap_universal = true }
        )
        hl.bind(
            main_mod .. " + SHIFT" .. system_key,
            hl.dsp.exec_cmd("systemctl suspend"),
            { submap_universal = true }
        )
        hl.bind(
            main_mod .. " + CTRL" .. system_key,
            hl.dsp.exec_cmd("systemctl hibernate"),
            { submap_universal = true }
        )
        hl.bind(
            main_mod .. " + SHIFT + ALT" .. system_key,
            hl.dsp.exec_cmd("uwsm stop"),
            { submap_universal = true }
        )
        hl.bind(
            main_mod .. " + CTRL + ALT" .. system_key,
            hl.dsp.exec_cmd("systemctl reboot"),
            { submap_universal = true }
        )
        hl.bind(
            main_mod .. meh_mod .. system_key,
            hl.dsp.exec_cmd("systemctl poweroff"),
            { submap_universal = true }
        )
    end,
}
