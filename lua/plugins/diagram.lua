local M = {
    '3rd/diagram.nvim',
    dependencies = {
        '3rd/image.nvim'
    },
    opts = {
        mermaid = {
            theme = "forest",
        },
    },
    config = function ()
        require("diagram").setup({})
    end
}

return M
