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
      theme = "catppuccin-frappe",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "" },
      lualine_b = { "mode"},
      lualine_c = { "" },
      lualine_x = { "progress" },
      lualine_y = {
        function()
          local prose_filetypes = { "markdown", "text" }
          if not vim.tbl_contains(prose_filetypes, vim.bo.filetype) then
            return "%l:%c"
          end

          local word_count = 0
          if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
            word_count = vim.fn.wordcount().visual_words
          else
            word_count = vim.fn.wordcount().words
          end
          return word_count .. " words"
        end,
      },
      lualine_z = { "" },
    },
    winbar = {
      lualine_a = { "filename" },
      lualine_b = { "filetype" },
      lualine_c = { "encoding" },
      lualine_x = { "lsp_status" },
      lualine_y = { "" },
      lualine_z = { "" }
    },
    extensions = { "nvim-tree" }
  })
end

return M
