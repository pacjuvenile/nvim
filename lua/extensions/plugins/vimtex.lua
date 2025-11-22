local M = {}

M.ensure_installed = true
M.url = "https://github.com/lervag/vimtex"
M.dependencies = {
    {
        url = "https://github.com/mhinz/neovim-remote"
    }
}

M.enabled = true
M.lazy = true
M.ft = "tex"

M.config = function()
    vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-xelatex"
    }

    vim.g.vimtex_view_general_viewer = "/mnt/c/Users/sunny/app/SumatraPDF/SumatraPDF.exe"
    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    -- vim.g.vimtex_compiler_progname = "nvr"

    vim.keymap.set("n", "<localleader>vb", [[<CMD>VimtexCompile<CR>]], { silent = true, desc = "Latex compile" })
    vim.keymap.set("n", "<localleader>vc", [[<CMD>VimtexClean<CR>]], { silent = true, desc = "Latex clean" })
    vim.keymap.set("n", "<localleader>vv", [[<CMD>VimtexView<CR>]], { silent = true, desc = "Latex view" })

    vim.g.vimtex_quickfix_mode = 0
end

return M
