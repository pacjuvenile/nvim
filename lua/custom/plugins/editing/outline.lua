local M = {}

M.url = "https://github.com/hedyhli/outline.nvim"

M.lazy = true
M.keys = {
  { "<leader>o", "<cmd>Outline!<cr>", desc = "outline toggle" }
}

M.config = function()
  require("outline").setup({
    outline_window = {
      position = "right",
      width = 30,
      wrap = true
    }
  })
end

return M
