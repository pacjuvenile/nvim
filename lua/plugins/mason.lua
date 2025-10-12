return {
    "mason-org/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason-lspconfig.nvim"
    },
    lazy = true,
    event = "VeryLazy",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    },
    config = function(_, opts)
        require("mason").setup(opts)
        local function setup(mason_lsp, config)
            local success, package = pcall(require("mason-registry").get_package, mason_lsp)
            if success and not package:is_installed() then
                package:install()
            end
            local nvim_lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[mason_lsp]

            -- 以前的写法require + LspStart
            -- require("lspconfig")[nvim_lsp].setup(config)

            -- 现在的写法
            vim.lsp.config(nvim_lsp, config)
            vim.lsp.enable(nvim_lsp)
        end

        local lsp_config_table = {
            -- shell lsp
            ["bash-language-server"]       = {},
            -- toml lsp
            ["tombi"]                      = {},
            -- yaml/json lsp
            ["spectral-language-server"]   = {},
            -- vimscript lsp
            ["vim-language-server"]        = {},
            -- lua lsp
            ["lua-language-server"]        = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            },

            -- markdown lsp
            ["marksman"]                   = {},
            -- typst lsp
            ["tinymist"]                   = {},

            -- matlab lsp
            ["matlab-language-server"]     = {},
            -- haskell lsp
            ["haskell-language-server"]    = {},

            -- R lsp
            ["air"]                        = {},

            -- python lsp
            ["python-lsp-server"]          = {},
            -- Java lsp
            -- ["java-language-server"] = {},
            -- Go lsp
            -- ["golangci-lint-langserver"] = {},

            -- C/Cpp lsp
            ["clangd"]                     = {},
            -- zig lsp
            ["zls"]                        = {},
            -- rust lsp
            ["rust-analyzer"]              = {},

            -- html lsp
            ["html-lsp"]                   = {},
            -- css lsp
            ["css-lsp"]                    = {},
            -- JS/TS lsp
            ["typescript-language-server"] = {},

            -- Verilog/VHDL lsp
            -- ["hdl-checker"] = {}
        }
        for mason_lsp, config in pairs(lsp_config_table) do
            setup(mason_lsp, config)
        end

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true
        })
    end
}
