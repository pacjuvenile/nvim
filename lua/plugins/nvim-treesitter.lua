local M = {}

function M.setup()
    require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath('data') .. '/site'
    })

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

        local treesitter_autogroup = vim.api.nvim_create_augroup("TreesitterAutoGroup", { clear = true })
        local pattern = {}
        for _, parser in ipairs(ensure_installed) do
            local has_parser, _ =  pcall(vim.treesitter.language.inspect, parser)
            if has_parser then
                -- 找到解析器适应的全部文件类型
                pattern = vim.tbl_extend("keep", pattern, vim.treesitter.language.get_filetypes(parser))
            end
        end
        vim.api.nvim_create_autocmd("FileType", {
            group = treesitter_autogroup,
            pattern = pattern,
            callback = function()
                vim.treesitter.start()
            end
        })
end

return M
