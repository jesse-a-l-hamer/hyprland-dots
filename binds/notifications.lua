local notify_unbound = function(operation)
    local parts = {
        "notify-send",
        "-a hyprland",
        "-e",
        '"Unbound Action"',
        operation,
    }
    return table.concat(parts, " ")
end

return {
    setup = function()
        local vars = require("hypr-vars")
        local main_mod = vars.binds.mods.main
        local notif_mods = vars.binds.mods.notifications
        local notif_key = " + N"
        local scripts = vars.paths.scripts

        local notif_app = vars.apps.notifications

        local notif_cmds = {
            toggle_dnd = {
                dunst = "dunstctl set-paused toggle",
                wayle = "wayle notify dnd",
                noctalia = "noctalia msg notification-dnd-toggle",
            },
            show_single = {
                dunst = "dunstctl history-pop",
                wayle = notify_unbound("show_single"),
                noctalia = notify_unbound("show_single"),
            },
            show_all = {
                dunst = "python " .. scripts .. "binds/notifications/show-all.py",
                wayle = notify_unbound("show_all"),
                noctalia = notify_unbound("show_all"),
            },
            close_single = {
                dunst = "dunstctl close",
                wayle = notify_unbound("close_single"),
                noctalia = notify_unbound("close_single"),
            },
            close_all = {
                dunst = "dunstctl close-all",
                wayle = notify_unbound("close_all"),
                noctalia = "noctalia msg notification-clear-active",
            },
            delete_single = {
                dunst = "python "
                    .. scripts
                    .. "binds/notifications/delete-single.py --notifier dunst",
                wayle = "python "
                    .. scripts
                    .. "binds/notifications/delete-single.py --notifier wayle",
                noctalia = notify_unbound("delete_single"),
            },
            delete_all = {
                dunst = "dunstctl history-clear",
                wayle = "wayle notify dismiss-all",
                noctalia = "noctalia msg notification-clear-history",
            },
        }

        hl.bind(
            main_mod .. notif_key,
            hl.dsp.exec_cmd(notif_cmds.toggle_dnd[notif_app])
        )
        hl.bind(
            main_mod .. notif_mods.show .. notif_key,
            hl.dsp.exec_cmd(notif_cmds.show_single[notif_app])
        )
        hl.bind(
            main_mod .. notif_mods.show .. notif_mods.all .. notif_key,
            hl.dsp.exec_cmd(notif_cmds.show_all[notif_app])
        )
        hl.bind(
            main_mod .. notif_mods.close .. notif_key,
            hl.dsp.exec_cmd(notif_cmds.close_single[notif_app])
        )
        hl.bind(
            main_mod .. notif_mods.show .. notif_mods.all .. notif_key,
            hl.dsp.exec_cmd(notif_cmds.close_all[notif_app])
        )
        hl.bind(
            main_mod .. notif_mods.delete .. notif_key,
            hl.dsp.exec_cmd(notif_cmds.delete_single[notif_app])
        )
        hl.bind(
            main_mod .. notif_mods.delete .. notif_mods.all .. notif_key,
            hl.dsp.exec_cmd(notif_cmds.delete_all[notif_app])
        )
    end,
}
