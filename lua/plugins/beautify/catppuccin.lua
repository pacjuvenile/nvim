local M = {}

M.ensure_installed = true
M.enabled = true

M.config = function()
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

M.spec = {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = M.config,
    enabled = M.enabled
}

return M
