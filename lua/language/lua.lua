local M = {}

M.ls_config = {
    cmd = { "lua-language-server" },
    filetype = { "lua" },
    root_markers = {
        ".git"
    },

    settings = {
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
}

return M
