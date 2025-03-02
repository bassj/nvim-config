local M = {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-lua/plenary.nvim',
        'hrsh7th/nvim-cmp',
        {
            'stevearc/dressing.nvim', -- Optional: Improves the default Neovim UI
            opts = {},
        },
        'j-hui/fidget.nvim'
    },
    cmd = {
        'CodeCompanion',
        'CodeCompanionChat',
        'CodeCompanionToggle',
        'CodeCompanionActions',
    },
    config = function()
        require('codecompanion').setup({
            strategies = {
                chat = { adapter = "ollama" },
                inline = { adapter = "ollama" },
            },
            adapters = {
                ollama = function()
                    return require('codecompanion.adapters').extend(
                        'ollama',
                        { schema = { model = { default = 'deepseek-coder-v2' } } }
                    )
                end
            },
        })
    end,
    keys = {
        { "<leader>lo", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggles CodeCompanion Chat" }
    },
    init = function ()
        require("plugins.codecompanion.fidget-spinner"):init()
    end
}


return M
