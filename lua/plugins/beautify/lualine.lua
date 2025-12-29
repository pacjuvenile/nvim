local M = {}

M.ensure_installed = true
M.url = "https://github.com/nvim-lualine/lualine.nvim"
M.dependencies = {
  {
    url = "nvim-tree/nvim-web-devicons"
  }
}

M.enabled = true
M.lazy = true
M.event = "VeryLazy"

M.config = function()
  require("lualine").setup({
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    extensions = { "nvim-tree" },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { "filename" },
      lualine_x = {
        "encoding",
        "filesize",
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = {
        function()
          local prose_filetypes = { "markdown", "text", "md" }
          if not vim.tbl_contains(prose_filetypes, vim.bo.filetype) then
            return "%l:%c"
          end

          local word_count = 0
          if vim.fn.mode() == "v"
              or vim.fn.mode() == "V"
          then
            word_count = vim.fn.wordcount().visual_words
          else
            word_count = vim.fn.wordcount().words
          end
          return word_count .. " words"
        end,
      },
    }
  })
  vim.opt.showmode = false
end

return M
