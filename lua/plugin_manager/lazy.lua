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
        { import = "plugins.nvim-tree" }, 
        -- telescope.nvim
        { import = "plugins.telescope" },

        -- 配对
        -- nvim-autopairs
        { import = "plugins.nvim-autopairs" },

        -- 美化
        -- indent-blankline.nvim
        { import = "plugins.indent-blankline" },
        -- nvim-treesitter
        { import = "plugins.nvim-treesitter" },

        ------------------------
        -- 2. lsp
        ------------------------

        ------------------------
        -- 3. 额外功能
        ------------------------
        -- markdown渲染
        -- peek.nvim
        { import = "plugins.peek" }
    },
    ui = {
        border = "rounded"
    }
})
