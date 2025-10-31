local M = {}

M.setup = function()
    require("catppuccin").setup({
        transparent_background = true,
        styles = {
            keywords = { "italic" }
        }
    })
    vim.cmd[[
        colorscheme catppuccin-macchiato
    ]]
end

return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
        M.setup()
    end
}
