return {
    setup = function()
        local vars = require("hypr-vars")
        local render_vars = vars.render

        hl.config({
            render = {
                cm_sdr_eotf = render_vars.cm_sdr_eotf,
                cm_auto_hdr = render_vars.cm_auto_hdr,
                use_shader_blur_blend = render_vars.use_shader_blur_blend,
            },
        })
    end,
}
