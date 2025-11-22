local M = {}

M.ensure_installed = true
M.url = "https://github.com/MagicDuck/grug-far.nvim"
M.dependencies = { "https://github.com/nvim-tree/nvim-web-devicons" }

M.lazy = true
M.cmd = "GrugFar"

M.config = function()
    require("grug-far").setup({
        windowCreationCommand = ""
    })
end

return M
