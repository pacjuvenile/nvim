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
            init = function()
                require("plugins.nvim-tree").startup()     
            end,
            config = function()
                require("plugins.nvim-tree").setup()     
            end
        },

        -- UI
        -- nvim-web-devicons
        {
            "nvim-tree/nvim-web-devicons",
            lazy = false,
            config = function()
                require("plugins.nvim-web-devicons")
            end
        }
    },
    ui = {
        border = "rounded"
    }
})
