local M = {}

M.ts_config = {
    parser_installed = true,
    parser = { "lua" }
}

M.ls_config = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
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
