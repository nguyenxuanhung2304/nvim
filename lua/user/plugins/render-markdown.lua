return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = "markdown",
    opts = {},
    config = function()
        local render_markdown = require("render-markdown")
        render_markdown.enable()
    end
}
