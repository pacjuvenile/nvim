local M = {}

M.ensure_installed = true
M.url = "windwp/nvim-autopairs"

M.lazy = true
M.event = "InsertEnter"

M.config = function()
    require("nvim-autopairs").setup({})
end

return M
