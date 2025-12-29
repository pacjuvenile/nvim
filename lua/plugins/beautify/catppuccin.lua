local M = {}

M.ensure_installed = true
M.url = "https://github.com/catppuccin/nvim"
M.name = "catppuccin"

M.lazy = false

M.config = function()
  require("catppuccin").setup({
    transparent_background = true,
    styles = {
      keywords = { "italic" }
    }
  })
  vim.cmd [[
        colorscheme catppuccin-macchiato
    ]]
end

return M
