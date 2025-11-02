local M = {}

M.lsp_install = function(mason_lsp)
    local success, package = pcall(require("mason-registry").get_package, mason_lsp)
    if success and not package:is_installed() then
        package:install()
    end
end

M.lsp_enable = function(lsp_config_table)
    for _, lsp_config in ipairs(lsp_config_table) do
        M.lsp_install(lsp_config.cmd[1])
        local nvim_lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[lsp_config.cmd[1]]

        -- lsp配置
        -- 以前的写法
        -- require("lspconfig")[nvim_lsp].setup(config)
        -- 现在的写法
        vim.lsp.config(nvim_lsp, lsp_config)

        -- lsp激活
        vim.lsp.enable(nvim_lsp)
    end
end

M.setup = function()
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    M.lsp_enable({
        require("lsp.lua"),
    })
end

return {
    "mason-org/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason-lspconfig.nvim"
    },
    lazy = true,
    event = "VeryLazy",
    config = function()
        M.setup()
    end
}
