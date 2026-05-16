return {
    setup = function(vars)
        hl.window_rule({
            name = "tag-browser",
            match = {
                class = "^(.*brave.*)$|"
                    .. "^(.*firefox.*)$|"
                    .. "^(.*chromium.*)$|"
                    .. "^(.*zen.*)$",
            },
            tag = "+browser",
        })
        hl.window_rule({
            name = "tag-desktop_portal",
            match = {
                class = "^(org.freedesktop.impl.portal.desktop.gtk)$|"
                    .. "^(org.freedesktop.impl.portal.desktop.hyprland)$|"
                    .. "^(org.freedesktop.impl.portal.desktop.termfilechooser)$",
            },
            tag = "+desktop_portal",
        })
        hl.window_rule({
            name = "tag-media_player",
            match = { class = "^(.*celluloid.*)$|" .. "^(.*mpv.*)$|" .. "^(.*vlc.*)$" },
            tag = "+media_player",
        })
        hl.window_rule({
            name = "tag-picture_in_picture",
            match = { class = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
            tag = "+picture_in_picture",
        })
        hl.window_rule({
            name = "tag-polkit_agent",
            match = { class = "^(.*hyprpolkitagent.*)$" },
            tag = "+polkit_agent",
        })
        hl.window_rule({
            name = "tag-qt_manager",
            match = { class = "^(qt5ct)$|" .. "^(qt6ct)$|" .. "^(kvantummanager)$" },
            tag = "+qt_manager",
        })
        hl.window_rule({
            name = "tag-terminal",
            match = { class = "^(kitty)$|" .. "^(alacritty)$|" .. "^(foot)$" },
            tag = "+terminal",
        })
        hl.window_rule({
            name = "tag-utility",
            match = {
                class = "^(org.pulseaudio.pavucontrol)$|"
                    .. "^(blueman-manager)$|"
                    .. "^(nm-applet)$|"
                    .. "^(nm-connection-editor)$",
            },
            tag = "+utility",
        })
        hl.window_rule({
            name = "tag-video_call-zoom",
            match = {
                class = "^(zoom)$",
                initial_title = "^(.*[Mm]eeting.*)$",
                xwayland = true,
            },
            tag = "+video_call",
        })
    end,
}
