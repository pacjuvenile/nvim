local M = {}

M.cmd = { "lua-language-server" }
M.filetype = { "lua" }
M.root_markers = {
    ".git"
}
M.settings = {
    Lua = {
        workspace = {
            library = {
                vim.env.VIMRUNTIME
            }
        },
        runtime = {
            version = "LuaJIT",
        },
    }
}

return M
