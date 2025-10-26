local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        ------------------------
        -- 1. 编辑效率
        ------------------------
        -- 跳转
        -- nvim-tree.lua
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            lazy = true,
            keys = {
                { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Nvimtree toggle" }
            },
            config = function()
                require("plugins.nvim-tree").setup()     
            end
        },
        -- telescope.nvim
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            lazy = true,
            keys = {
                { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Telescope find files" },
                { "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Telescope live grep" },
                { "<leader>fc", "<CMD>Telescope colorscheme<CR>" }
            },
            config = function()
                require("plugins.telescope").setup()
            end
        },

        -- 配对
        {
            "windwp/nvim-autopairs",
            lazy = true,
            event = "InsertEnter",
            config = function()
                require("plugins.nvim-autopairs").setup()
            end
        },

        -- 美化
        {
            "lukas-reineke/indent-blankline.nvim",
            lazy = true,
            event = "VeryLazy",
            config = function()
                require("plugins.indent-blankline").setup()
            end
        },

        {
            "nvim-treesitter/nvim-treesitter",
            branch = "main",
            lazy = false,
            config = function()
                require("plugins.nvim-treesitter").setup()
            end
        },

        ------------------------
        -- 2. lsp
        ------------------------
        
        ------------------------
        -- 3. 额外功能
        ------------------------
        -- markdown渲染
        -- peek.nvim
        {
            "toppair/peek.nvim",
            build = "deno task --quiet build:fast",
            lazy = true,
            event = "VeryLazy",
            keys = {
                { "<leader>po", "<CMD>PeekOpen<CR>", silent = true, desc = "Peek open markdown preview" },
                { "<leader>pc", "<CMD>PeekClose<CR>", silent = true, desc = "Peek close markdown preview" }
            },
            config = function()
                require("plugins.peek").setup()
            end
        },
    },
    ui = {
        border = "rounded"
    }
})
