function get_uname()
    local handle = io.popen("uname -r")
    local output = handle:read("*a")
    handle:close()
    return output
end


function supports_images()
    if jit and jit.os == "Windows" then
        return false
    end
    
    local uname = get_uname()

    if string.find(uname, "microsoft") then
        return false
    end

    return true
end


local enabled = supports_images()
local backend = "ueberzug"

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
