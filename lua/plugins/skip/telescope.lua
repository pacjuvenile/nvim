local M = {}

M.setup = function()
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

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = 'make'
        },
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-treesitter/nvim-treesitter",
            branch = "main"
        },
    },
    lazy = true,
    keys = {
        { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Telescope find files" },
        { "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Telescope live grep" },
        { "<leader>fc", "<CMD>Telescope colorscheme<CR>" }
    },
    config = function()
        M.setup()
    end
}
