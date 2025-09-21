return {
  "mason-org/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim"
  },
  lazy = true,
  event = "VeryLazy",
  opts = {},
  config = function (_, opts)
    require("mason").setup(opts)
    local registry = require("mason-registry")
    local function setup(mason_lsp,config)
      local success, package = pcall(registry.get_package, mason_lsp)
      if success and not package:is_installed() then
        package:install()
      end
      local nvim_lsp = require("mason-lspconfig.mappings").get_mason_map().package_to_lspconfig[mason_lsp]
      vim.lsp.config(nvim_lsp, config)
    end

    local lsp_config_table = {
      -- lua lsp配置
      ["lua-language-server"] = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      },
      ["python-lsp-server"] = {},
      ["html-lsp"] = {},
      ["css-lsp"] = {},
      ["typescript-language-server"] = {}
    }

    for mason_lsp, config in pairs(lsp_config_table) do
      setup(mason_lsp, config)
    end

    vim.cmd("LspStart")
    vim.diagnostic.config({
      virtual_text = true,
      update_in_insert = true
    })
  end
}
