local M = {}

M.ensure_installed = true
M.url = "https://github.com/hiphish/rainbow-delimiters.nvim"
M.dependencies = {
  {
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  }
}

M.enabled = true
M.lazy = false

return M
