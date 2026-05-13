local palette = require("./palettes/catppuccin-macchiato.lua")

return {
    apps = {
        browser = "zen.desktop",
        calendar = "khal.desktop",
        email = "neomutt",
        file_manager = "yazi",
        mediaplayer_local = "mpv.desktop",
        mediaplayer_remote = "yt-x.desktop",
        launcher = "rofi",
        sms = "org.kde.kdeconnect.sms.desktop",
        system_monitor = "btop",
    },
    paths = {
        scripts = "~/.config/hypr/scripts/",
    },
    debug = {},
    env = {
        uwsm = true,
        cursor_theme = "catppuccin-macchiato-dark-cursors",
        cursor_size = 24,
    },
    prefs = {
        cursor = {},
        ecosystem = {},
        misc = {},
        quirks = {},
    },
    render = {},
    theme = {
        general = {},
        decoration = {
            -- choose file from ./shaders/
            shader_file = "vibrance-alt.frag",
        },
        group = {},
        colors = {
            map = {
                background = palette.crust,
                base = palette.base,
                text = palette.text,
                alternate_base = palette.mantle,
                bright_text = palette.lavender,
                accent = palette.flamingo,
                accent_secondary = palette.sapphire,
                accent2 = palette.maroon,
                accent2_secondary = palette.blue,
                accent3 = palette.green,
                accent3_secondary = palette.yellow,
                accent4 = palette.teal,
                accent4_secondary = palette.peach,
            },
            alpha = {
                active = "ee",
                inactive = "66",
            },
            gradient_degrees = 45,
        },
        fonts = {
            default = "VictorMono Nerd Font Propo",
            mono = "VictorMono Nerd Font",
            h1_size = 19,
            h2_size = 15,
            h3_size = 13,
            size = 12,
            small_size = 10,
        },
        icons = {
            name = "Papirus-Dark",
        },
        gtk = {
            name = "catppuccin-macchiato-flamingo-standard+default",
        },
    },
    animations = {
        enabled = true,
        workspace_wraparound = false,
        -- choose file from ./animations/
        -- do NOT include the file extension
        animation = "optimized",
    },
    permissions = {},
    input = {},
    devices = {
        ["logitech-mx-master-3s"] = {
            sensitivity = 1,
            accel_profile = "flat",
        },
    },
    gestures = {},
    layouts = {
        use = "dwindle",
    },
    monitors = {
        samsung_qcq90 = {
            use_10bpc = true,
        },
        bonobo = {},
        surface = {},
        fallback = {},
    },
    binds = {
        mods = {
            main = "SUPER",
            launcher = "CTRL",
            meh = "SHIFT + CTRL + ALT",
            notifications = {
                all = " + ALT",
                show = " + SHIFT",
                close = " + CTRL",
                delete = " + SHIFT + CTRL",
            },
            windowman = {
                workspace = " + ALT",
                move = " + CTRL",
                resize = " + SHIFT",
                cycling = {
                    prev = " + SHIFT",
                    swap = " + CTRL",
                },
            },
        },
        catchall_notify = "notify-send -t 5000 -u normal -a Hyprland -i keyboard",
    },
    xwayland = {},
    rules = {
        workspaces = {
            first_ws_persistent = true,
            smart_gaps = true,
        },
        windows = {
            browser = {
                idle_inhibit = true,
                opacity = true,
            },
            desktop_portal = {
                opacity = true,
            },
            media_player = {
                idle_inhibit = true,
            },
            picture_in_picture = {
                pin_float = true,
                keep_aspect_ratio = true,
                move_size = true,
            },
            polkit_agent = {
                opacity = true,
            },
            qt_manager = {
                opacity = true,
            },
            terminal = {
                opacity = true,
            },
            utility = {
                opacity = true,
            },
            video_call = {
                pin_float = true,
            },
            untagged = {
                fix_wayland_drags = true,
                smart_gaps = true,
                suppress_maximize_events = true,
            },
        },
        layers = {
            launcher = {
                blur = true,
                ignore_alpha = 0,
                no_anim = true,
            },
            bar = {
                blur = true,
                blur_popups = true,
                ignore_alpha = 0,
                above_lock = 2,
            },
            virtual_keyboard = {
                blur = true,
                blur_popups = true,
                ignore_alpha = 0,
                above_lock = 2,
                animation = "slide bottom",
            },
            logout_dialog = {
                blur = true,
                blur_popups = true,
            },
            notifications = {
                blur = true,
                blur_popups = true,
                ignore_alpha = 0,
            },
        },
    },
    startup = {},
    plugins = {
        pypr = "app2unit -- /usr/bin/pypr-client",
        hyprgrass = {},
    },
}
