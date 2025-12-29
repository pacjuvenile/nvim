local M = {}

M.ensure_installed = true
M.url = "https://github.com/folke/tokyonight.nvim"
M.tag = "v4.14.1"

M.enabled = false
M.lazy = false

M.config = function()
  require("tokyonight").setup({
    transparent = true,
    styles = {
      sidebars = "transparent",
    }
  })
  vim.cmd [[
        colorscheme tokyonight-moon
    ]]
end

return M
