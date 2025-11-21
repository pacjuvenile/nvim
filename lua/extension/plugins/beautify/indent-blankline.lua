local M = {}

M.ensure_installed = true
M.url = "lukas-reineke/indent-blankline.nvim"

M.lazy = true
M.event = "VeryLazy"

M.config = function()
    require("ibl").setup({})
end

return M
