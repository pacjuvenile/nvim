local M = {}

M.ensure_installed = true
M.url = "https://github.com/nvim-telescope/telescope.nvim"
M.dependencies = {
  {
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  {
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  {
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    build = 'make'
  },
  {
    url = "https://github.com/2KAbhishek/nerdy.nvim"
  }
}

M.lazy = true
M.keys = {
  { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Telescope find files" },
  { "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Telescope live grep" },
  { "<leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Telescope help tags" },
  { "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Telescope buffers" },
  { "<leader>fc", "<CMD>Telescope colorscheme<CR>", desc = "Telescope colorscheme" },
  { "<leader>fn", "<CMD>Telescope nerdy<CR>", desc = "Telescope browser nerd icons" },
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

  -- 使用fzf作为telescope扩展
  require("telescope").load_extension("fzf")
  -- 使用nerdy作为telescope扩展
  require("telescope").load_extension("nerdy")
end

return M
