local M = {}

M.ensure_installed = true
M.url = "https://github.com/HakonHarnes/img-clip.nvim"

M.lazy = true
M.ft = "markdown"

M.config = function()
  require("img-clip").setup({
    filetypes = {
      markdown = {
        -- 模板选项
        template = "<img src=\"$FILE_PATH\" width=\"100%\">",
        insert_mode_after_paste = false,

        -- 提示选项
        prompt_for_file_name = false,
      }
    }
  })

  vim.keymap.set("n", "<leader>p", "<cmd>PasteImage<cr>", { silent = true, desc = "Paste image from system clipboard" })
end

return M
