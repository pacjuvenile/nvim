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
        { import = "plugins.skip.nvim-tree" }, 
        -- telescope.nvim
        { import = "plugins.skip.telescope" },

        -- 配对
        -- nvim-autopairs
        { import = "plugins.pair.nvim-autopairs" },
        { import = "plugins.pair.nvim-surround" },

        -- 美化
        -- indent-blankline.nvim
        { import = "plugins.beautify.indent-blankline" },
        -- nvim-treesitter
        { import = "plugins.beautify.nvim-treesitter" },
        -- tokyonight
        -- { import = "plugins.beautify.tokyonight" },
        -- catppuccin
        { import = "plugins.beautify.catppuccin" },
        

        ------------------------
        -- 2. lsp
        ------------------------

        ------------------------
        -- 3. 额外功能
        ------------------------
        -- markdown渲染
        -- peek.nvim
        { import = "plugins.markdown.peek" },
        -- img-clip.nvim
        { import = "plugins.markdown.img-clip" },
        
        -- 命令异步执行
        -- asyncrun.vim
        { import = "plugins.asyncrun" },
    },
    ui = {
        border = "rounded"
    }
})
