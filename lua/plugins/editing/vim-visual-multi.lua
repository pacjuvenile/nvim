local M = {}

M.ensure_installed = false
M.url = "https://github.com/mg979/vim-visual-multi"

M.lazy = false

M.init = function()
  vim.g.VM_maps = {
    ["Add Cursor Down"] = "<C-j>",
    ["Add Cursor Up"] = "<C-k>"
  }
end

return M
