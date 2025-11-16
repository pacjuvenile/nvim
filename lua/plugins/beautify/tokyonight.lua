local M = {}

M.ensure_installed = false
M.enabled = false

M.setup = function()
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

M.config =  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled
    return M.config
end

return {}
