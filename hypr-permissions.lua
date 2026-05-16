return {
    setup = function(vars)
        if vars.permissions.grim then
            hl.permission({
                binary = "/usr/(bin|local/bin)/grim",
                type = "screencopy",
                mode = "allow",
            })
        end

        if vars.permissions.xdg_desktop_portal_hyprland then
            hl.permission({
                binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",
                type = "screencopy",
                mode = "allow",
            })
        end

        if vars.permissions.hyprlock then
            hl.permission({
                binary = "/usr/(bin|local/bin)/hyprlock",
                type = "screencopy",
                mode = "allow",
            })
        end

        if vars.permissions.hyprpm then
            hl.permission({
                binary = "/usr/(bin|local/bin)/hyprpm",
                type = "plugin",
                mode = "allow",
            })
        end
    end,
}
