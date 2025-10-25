local M = {}

function M.setup()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            -- 文档查询
            "vimdoc",
            "query",
            -- 配置脚本
            "bash",
            "toml",
            "yaml",
            "json",
            "vim",
            "lua",
            -- 笔记/论文
            "markdown",
            "markdown_inline",
            "typst",
            -- 数值计算
            "matlab",
            "haskell",
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
            -- 前端开发
            "html",
            "css",
            "javascript",
            "typescript",
            -- 硬件描述
            "verilog",
            "vhdl"
        },
        highlight = { enable = true }
    })
end

return M
