vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.syntax = 'on'

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.foldenable = false -- Start unfolded by default
vim.opt.foldmethod = 'indent'

vim.opt.background = 'dark'

vim.opt.wrap = false

vim.opt.list = true
vim.opt.listchars = {
    tab = "»·",
    trail = "·",
}


local noexpandtab_languages = {
    ["gdscript"] = true
}

vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function(args)
        local buftype = vim.bo[args.buf].filetype
        vim.bo[args.buf].expandtab = not noexpandtab_languages[buftype]
        if noexpandtab_languages[buftype] then
            vim.wo[0].listchars.lead = "space:·"
            -- vim.wo[0].listchars = vim.wo[0].listchars..",space:·"
        end
    end
})

require("config.lazy")
