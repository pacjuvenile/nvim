local M = {}

M.ensure_installed = true
M.url = "https://github.com/kylechui/nvim-surround"

M.lazy = true
M.event = "VeryLazy"

M.config = function()
  require("nvim-surround").setup({})
end

return M
