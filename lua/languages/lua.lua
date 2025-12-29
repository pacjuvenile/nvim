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
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        }
      },
      workspace = {
        -- checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
          "${3rd}/busted/library"
        }
      },
    }
  }
}

vim.lsp.config("lua_ls", M.ls_config)
vim.lsp.enable("lua_ls")

return M
