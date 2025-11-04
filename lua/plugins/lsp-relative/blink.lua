local M = {}

M.ensure_installed = true

M.setup = function()
    require("blink.cmp").setup({
        completion = {
            documentation = {
                auto_show = true
            }
        },
        keymap = {
            preset = "super-tab"
        },
        sources = {
            default = {
                "buffer",
                "path",
                "lsp",
                "snippets"
            }
        },
        cmdline = {
            sources = function()
                if vim.fn.getcmdtype() == "/" then
                    return { "buffer" }
                elseif vim.fn.getcmdwintype() ~= "" then
                    return { "cmdline" }
                else
                    return {}
                end
            end,
            keymap = {
                preset = "super-tab"
            },
            completion = {
                menu = {
                    auto_show = true
                }
            }
        }
    })
end

M.config = {
    "saghen/blink.cmp",
    build = 'cargo build --release',
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    lazy = true,
    event = "VeryLazy",
    config = M.setup
}

if M.ensure_installed then
    return M.config
end

return {}
