local M = {}

M.ensure_installed = true
M.url = "https://github.com/saghen/blink.cmp"
M.build = 'cargo build --release'
M.dependencies = {
    {
        url = "rafamadriz/friendly-snippets"
    }
}

M.lazy = true
M.event = "VeryLazy"

M.config = function()
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

return M
