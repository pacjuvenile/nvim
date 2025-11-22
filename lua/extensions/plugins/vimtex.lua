local M = {}

M.ensure_installed = true
M.url = "https://github.com/lervag/vimtex"
M.dependencies = {
    {
        url = "https://github.com/mhinz/neovim-remote"
    }
}

M.enabled = true
M.lazy = false
-- M.ft = "tex"

M.config = function()
    vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-xelatex"
    }

    vim.g.vimtex_view_general_viewer = "/mnt/c/Users/sunny/app/SumatraPDF/SumatraPDF.exe"
    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    vim.g.vimtex_compiler_progname = "nvr"
end

return M
