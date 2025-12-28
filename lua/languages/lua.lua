local M = {}

M.ts_config = {
    parser_installed = true,
    parser = { "lua" }
}

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

vim.lsp.config("lua_ls", M.ls_config)
vim.lsp.enable("lua_ls")

return M
