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

vim.diagnostic.config({
  virtual_text = false, -- Optional: Turns off inline virtual text if you find it cluttered
  underline = true,
  signs = true,
})

-- Change the cursor hold delay (default is 4000ms)
vim.o.updatetime = 300

-- Automatically show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always', -- Shows the source of the error (e.g., tsserver, pyright)
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

vim.keymap.set({ "n", "v" }, "<leader>F", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format current buffer or selection" })

require("config.lazy")
