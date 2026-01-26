local M = {}

M.ensure_installed = true
M.url = "https://github.com/catppuccin/nvim"
M.name = "catppuccin"

M.lazy = false

M.config = function()
  require("catppuccin").setup({
    styles = {
      keywords = { "italic" }
    },
    integrations = {
      rainbow_delimiters = true,
      telescope = {
        enabled = true
      }
    }
  })
  vim.cmd("colorscheme catppuccin-macchiato")
end

return M
