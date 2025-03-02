return {
    '3rd/image.nvim',
    config = function ()
        local backend = "ueberzug"

        if os.getenv("TERM") == "xterm-kitty" then
            backend = "kitty"
        end

        require("image").setup({
            backend = backend
        })
    end
}
