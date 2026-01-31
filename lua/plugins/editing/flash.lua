local M = {}
M.url = "https://github.com/folke/flash.nvim"

M.lazy = true
M.keys = {
  { "<leader>s", mode = { "n", "v" }, [[<cmd>lua require("flash").jump()<cr>]], desc = "Flash" },
}

M.config = function()
  require("flash").setup({
    label = {
      after = false,
      before = true
    },
    char = {
      keys = {}
    }
  })
end

return M
