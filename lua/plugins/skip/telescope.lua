local M = {}

M.ensure_installed = true
M.url = "https://github.com/nvim-telescope/telescope.nvim"
M.dependencies = {
  {
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  {
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    build = 'make'
  },
  {
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  }
}

M.lazy = true
M.keys = {
  { "<leader>ff", "<CMD>Telescope find_files<CR>",  desc = "Telescope find files" },
  { "<leader>fg", "<CMD>Telescope live_grep<CR>",   desc = "Telescope live grep" },
  { "<leader>fc", "<CMD>Telescope colorscheme<CR>", desc = "Telescope colorscheme" },
  { "<leader>fh", "<CMD>Telescope help_tags<CR>",   desc = "Telescope find help documents" }
}

M.config = function()
  require("telescope").setup({
    pickers = {
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--glob",
          "!**/.git/*"
        }
      },
      live_grep = {
        glob_pattern = {
          "!**/.git/*"
        },
        additional_args = {
          "--hidden",
        },
      }
    }
  })

  -- 加载fzf并在telescope中使用
  require("telescope").load_extension("fzf")
end

return M
