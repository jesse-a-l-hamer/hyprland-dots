return {
    setup = function()
        if hl.plugin.hyprgrass ~= nil then
            hl.config({
                plugin = {
                    touch_gestures = {
                        sensitivity = 4.0,
                        workspace_swipe_fingers = 3,
                        workspace_swipe_edge = "n",
                        long_press_delay = 400,
                        resize_on_border_long_press = true,
                        edge_margin = true,
                        emulate_touchpad_swipe = false,
                    },
                },
            })
        end
    end,
}
