return {
    setup = function()
        hl.workspace_rule({
            workspace = "special:exposed",
            gaps_in = 30,
            gaps_out = 60,
            border_size = 5,
            no_border = false,
            no_shadow = true,
        })
    end,
}
