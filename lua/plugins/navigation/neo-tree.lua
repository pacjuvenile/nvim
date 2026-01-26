local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
M.branch = "v3.x"
M.dependencies = {
  { "nvim-lua/plenary.nvim"},
  "MunifTanjim/nui.nvim",
  "nvim-tree/nvim-web-devicons", -- optional, but recommended
}

M.lazy = true
M.keys = {
  { "<leader>e", "<CMD>Neotree toggle<CR>", desc = "neo-tree toggle" }
}

M.config = function()
  require("neo-tree").setup({

  })
end

return M
