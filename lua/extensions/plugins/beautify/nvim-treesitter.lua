local M = {}

M.ensure_installed = true
M.url = "https://github.com/nvim-treesitter/nvim-treesitter"
M.branch = "main"

M.lazy = false

M.config = function()
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

    local treesitter_augroup = vim.api.nvim_create_augroup("TreesitterAuGroup", { clear = true })
    local pattern_filetype = {}
    for _, parser in ipairs(ensure_installed) do
        local has_parser, _ = pcall(vim.treesitter.language.inspect, parser)
        if has_parser then
            -- 找到解析器配对的全部文件类型
            local parser_filetypes = vim.treesitter.language.get_filetypes(parser)
            for _, parser_filetype in ipairs(parser_filetypes) do
                if not vim.tbl_contains(pattern_filetype, parser_filetype) then
                    table.insert(pattern_filetype, parser_filetype)
                end
            end
        end
    end
    vim.api.nvim_create_autocmd("FileType", {
        group = treesitter_augroup,
        pattern = pattern_filetype,
        callback = function()
            vim.treesitter.start()
            vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end
    })
end

return M
