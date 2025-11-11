local M = {}

M.ensure_installed = true
M.enabled = true

M.setup = function()
    require("catppuccin").setup({
        transparent_background = true,
        styles = {
            keywords = { "italic" }
        }
    })
    vim.cmd [[
        colorscheme catppuccin-macchiato
    ]]
end

M.config = {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled
    return M.config
end

return {}
