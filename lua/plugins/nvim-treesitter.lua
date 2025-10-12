return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    commit = "99bd52ba56a4b7c9a8cc50a6140180755e76fac6",
    build = ":TSUpdate",
    lazy = false,
    opts = {
        install_dir = vim.fn.stdpath('data') .. '/site'
    },
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)

        local ensure_installed = {
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
            "systemverilog",
            "vhdl"
        }
        require("nvim-treesitter").install(ensure_installed)
        local pattern = {}
        for _, parser in ipairs(ensure_installed) do
            local has_parser, _ =  pcall(vim.treesitter.language.inspect, parser)

            if has_parser then
                -- 找到解析器适应的全部文件类型
                pattern = vim.tbl_extend("keep", pattern, vim.treesitter.language.get_filetypes(parser))
            end
        end
        vim.api.nvim_create_autocmd("FileType", {
            pattern = pattern,
            callback = function()
                vim.treesitter.start()
            end
        })
    end
}
