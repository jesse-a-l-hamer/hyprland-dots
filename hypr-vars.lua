local palette = require("palettes.catppuccin-macchiato")

return {
    animations = {
        enabled = true,
        workspace_wraparound = false,
        -- choose file from ./animations/
        -- do NOT include the file extension
        animation = "optimized",
    },
    apps = {
        browser = "zen.desktop",
        calendar = "khal.desktop",
        email = "neomutt",
        file_manager = "yazi",
        mediaplayer_local = "mpv.desktop",
        mediaplayer_remote = "yt-x.desktop",
        notifications = "wayle",
        launcher = "hyprlauncher",
        sms = "org.kde.kdeconnect.sms.desktop",
        system_monitor = "btop",
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
    debug = {
        disable_logs = false,
        disable_time = false,
    },
    devices = {
        ["logitech-mx-master-3s"] = {
            sensitivity = 1,
            accel_profile = "flat",
        },
    },
    env = {
        uwsm = true,
        cursor_theme = "catppuccin-macchiato-dark-cursors",
        cursor_size = 24,
    },
    gestures = {
        workspace_swipe_create_new = true,
        workspace_swipe_cancel_ratio = 0.15,
        gesture = {
            horizontal_workspace_swipe = true,
        },
    },
    input = {
        kb_layout = "us",
        follow_mouse = 2,
        touchpad = {
            natural_scroll = false,
        },
    },
    layout = {
        use = "dwindle",
        single_window_aspect_ratio = { 4, 3 },
        dwindle = {
            preserve_split = true,
            smart_resizing = true,
        },
        master = {
            new_status = "master",
        },
    },
    monitors = {
        samsung_qcq90 = {
            opts_8bpc = {
                cm = "auto",
                sdrbrightness = 1.0,
                sdrsaturation = 1.0,
            },
            opts_10bpc = {
                -- set to true to use bitdepth 10, otherwise defaults to 8
                enabled = true,
                cm = "hdr",
                sdrbrightness = 1.0,
                sdrsaturation = 1.0,
            },
        },
        bonobo = {},
        surface = {},
        fallback = {},
    },
    paths = {
        scripts = "~/.config/hypr/scripts/",
    },
    permissions = {
        grim = true,
        xdg_desktop_portal_hyprland = true,
        hyprlock = true,
        hyprpm = true,
    },
    plugins = {
        pypr = "app2unit -- /usr/bin/pypr-client",
        hyprgrass = {},
    },
    prefs = {
        cursor = {
            persistent_warps = true,
            inactive_timeout = 0,
        },
        ecosystem = {
            no_update_news = true,
            no_donation_nag = true,
            enforce_permissions = true,
        },
        misc = {
            force_default_wallpaper = 0,
            disable_hyprland_logo = true,
            disable_splash_rendering = true,
            key_press_enables_dpms = true,
            allow_session_lock_restore = true,
            disable_xdg_env_checks = true,
            enable_swallow = true,
            swallow_regex = "^(kitty)$|^(alacritty)$|^(foot)$",
            swallow_exception_regex = "^(?!mpv).*$",
        },
        quirks = {
            prefer_hdr = 1,
        },
    },
    render = {
        cm_sdr_eotf = "gamma22force",
        cm_auto_hdr = 1,
        use_shader_blur_blend = true,
    },
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
            vault = {
                pin_float = true,
                move_size = true,
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
    startup = {
        uwsm_env_setup = true,
        hyprpm_reload = true,
    },
    theme = {
        general = {
            snap = { enabled = true },
        },
        decoration = {
            -- choose file from ./shaders/
            shader_file = "vibrance-alt.frag",
            blur = { enabled = true },
            shadow = { enabled = true },
            glow = { enabled = false },
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
    xwayland = {
        enabled = true,
        create_abstract_socket = true,
    },
}
