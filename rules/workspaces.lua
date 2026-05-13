return {
    setup = function(vars)
        local rules = vars.rules.workspaces

        if rules.first_ws_persistent then
            hl.workspace_rule({ workspace = "1", persistent = true })
        end

        if rules.smart_gaps then
            hl.workspace_rule({
                workspace = "w[tv1]s[false]",
                gaps_in = 0,
                gaps_out = 0,
            })
            hl.workspace_rule({ workspace = "f[1]s[false]", gaps_in = 0, gaps_out = 0 })
        end
    end,
}
