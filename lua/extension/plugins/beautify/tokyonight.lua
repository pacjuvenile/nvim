local M = {}

M.ensure_installed = true
M.url = "https://github.com/folke/tokyonight.nvim"

M.enabled = false
M.lazy = false

M.config = function()
    require("tokyonight").setup({
        transparent = true,
        styles = {
            sidebars = "transparent",
        }
    })
    vim.cmd[[
        colorscheme tokyonight-moon
    ]]
end

return M
