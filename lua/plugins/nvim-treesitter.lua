return {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "VeryLazy",
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                -- 配置脚本
                "bash",   
                "vim",
                "lua",
                "toml",
                "yaml",
                "json",
                -- 笔记/论文
                "markdown",
                "typst",
                -- 数值计算
                "matlab",
                -- 科研绘图
                "r",
                -- 应用层 
                "python",
                "java",
                "go",
                -- 系统/高性能
                "c",
                "cpp",
                "zig",
                "rust",
                -- 硬件描述
                "verilog",
                "vhdl"
            },
            highlight = { enable = true }
        })
    end
}
