return {
    setup = function()
        local output = ""
        local mode = "preferred"
        local position = "auto"
        local scale = "1"

        hl.monitor({
            output = output,
            mode = mode,
            position = position,
            scale = scale,
        })
    end,
}
