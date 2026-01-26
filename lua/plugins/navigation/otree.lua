local M = {}

M.url = "https://github.com/Eutrius/Otree.nvim"

M.lazy = false
M.keys = {
  { "<leader>e", "<CMD>Otree<CR>", desc = "nvim-tree toggle" }
}

M.dependencies = {
  "stevearc/oil.nvim"
}

M.config = function()
  require("Otree").setup({
    win_size = 25,
  })
end

return M
