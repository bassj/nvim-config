function get_uname()
    local handle = io.popen("uname -r")
    local output = handle:read("*a")
    handle:close()
    return output
end



local enabled = true
local backend = "ueberzug"
local uname = get_uname()

if string.find(uname, "microsoft") then
    enabled = false
end

if os.getenv("TERM") == "xterm-kitty" then
    backend = "kitty"
end

return {
    '3rd/image.nvim',
    opts = {
        backend = backend,
    },
    enabled = enabled
}
