local M = {}

M.ensure_installed = false
M.url = "https://github.com/stevearc/aerial.nvim"
M.dependencies = {
  "nvim-treesitter/nvim-treesitter",
  "nvim-tree/nvim-web-devicons"
}

M.enabled = true
M.lazy = true
M.keys = {
  { "<leader>o", "<cmd>AerialToggle! right<cr>" , desc = "toggle outline"}
}

M.config = function()
  require("aerial").setup({
    layout = {
      win_opts = {
        wrap = true,
        linebreak = true,
        breakindent = true
      },
      resize_to_content = false
    },
    icons = {
      fixed_width = false
    }
  })
end

return M
