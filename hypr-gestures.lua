return {
    setup = function(vars)
        if vars.gestures.gesture.horizontal_workspace_swipe then
            hl.gesture({
                fingers = 3,
                direction = "horizontal",
                action = "workspace",
            })
        end

        hl.config({
            gestures = {
                workspace_swipe_create_new = vars.gestures.workspace_swipe_create_new,
                workspace_swipe_cancel_ratio = vars.gestures.workspace_swipe_cancel_ratio,
            },
        })
    end,
}
