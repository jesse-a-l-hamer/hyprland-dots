local shell_overrides = {
    default = function(rules) end,
    noctalia = function(rules)
        hl.workspace_rule({ workspace = "1", persistent = true })
        hl.workspace_rule({ workspace = "2", persistent = true })
        hl.workspace_rule({ workspace = "3", persistent = true })
        hl.workspace_rule({ workspace = "4", persistent = true })
        hl.workspace_rule({ workspace = "5", persistent = true })
    end,
}

return {
    setup = function()
        local vars = require("hypr-vars")
        local rules = vars.rules.workspaces
        local shell = vars.apps.shell

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

        (shell_overrides[shell] or shell_overrides.default)(rules)
    end,
}
