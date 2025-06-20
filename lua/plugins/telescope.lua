local M = {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim'
    },
    config = function ()
        local status, builtin = pcall(require, "telescope.builtin")

        local find_docs = function()
            return builtin.live_grep({
                search_dirs = {vim.env.VIMRUNTIME .. '/doc'}
            })
        end

        if status then
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end

        vim.keymap.set('n', '<leader>fd', find_docs, {})
    end
}

return M
