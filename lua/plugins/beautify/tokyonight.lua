local M = {}

M.ensure_installed = true
M.enabled = false

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

M.spec =  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = M.config
}

if M.ensure_installed then
    M.spec.enabled = M.enabled
    return M.spec
end

return {}
