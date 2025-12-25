local M = {}

M.ensure_installed = true
M.url = "https://github.com/stevearc/oil.nvim"
M.dependencies = {
    {
        url = "https://github.com/nvim-tree/nvim-web-devicons"
    }
}

M.lazy = false
M.keys = {}

M.config = function()
    function _G.get_oil_winbar()
        local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
        local dir = require("oil").get_current_dir(bufnr)
        if dir then
            return vim.fn.fnamemodify(dir, ":~")
        else
            -- If there is no current directory (e.g. over ssh), just show the buffer name
            return vim.api.nvim_buf_get_name(0)
        end
    end

    require("oil").setup({
        win_options = {
            winbar = "%!v:lua.get_oil_winbar()"
        }
    })
end

return M
