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
    enabled = enabled
}

return M
