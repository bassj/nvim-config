function get_uname()
    local handle = io.popen("uname -r")
    local output = handle:read("*a")
    handle:close()
    return output
end

local enabled = true
local uname = get_uname()

if string.find(uname, "microsoft") then
    enabled = false
end


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
