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
        require("plugins.skip.nvim-tree"),
        -- telescope.nvim
        require("plugins.skip.telescope"),

        -- 配对
        -- nvim-autopairs
        require("plugins.pair.nvim-autopairs"),
        require("plugins.pair.nvim-surround"),

        -- 美化
        -- indent-blankline.nvim
        require("plugins.beautify.indent-blankline"),
        -- nvim-treesitter
        require("plugins.beautify.nvim-treesitter"),
        -- tokyonight
        -- require("plugins.beautify.tokyonight"),
        -- catppuccin
        require("plugins.beautify.catppuccin"),

        ------------------------
        -- 2. lsp
        ------------------------
        require("plugins.lsp.mason"),
        require("plugins.lsp.blink"),

        ------------------------
        -- 3. 额外功能
        ------------------------
        -- markdown渲染
        -- peek.nvim
        require("plugins.markdown.peek"),
        -- img-clip.nvim
        require("plugins.markdown.img-clip"),

        -- 命令异步执行
        -- asyncrun.vim
        require("plugins.asyncrun"),
    },
    ui = {
        border = "rounded"
    },
    install = {
        colorscheme = { "catppuccin-macchiato" }
    }
})
