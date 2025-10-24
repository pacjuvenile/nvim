local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- 文件跳转
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
            cmd = "Telescope",
            keys = {
                { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Telescope find files" },
                { "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Telescope live grep" }
            },
            config = function()
                require("plugins.telescope").setup()
            end
        },

        -- 界面UI
        -- nvim-web-devicons
        {
            "nvim-tree/nvim-web-devicons",
            lazy = false,
            config = function()
                require("plugins.nvim-web-devicons").setup()
            end
        },

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
