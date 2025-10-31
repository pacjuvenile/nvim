local M = {}

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

return {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
        M.setup()
    end
}
