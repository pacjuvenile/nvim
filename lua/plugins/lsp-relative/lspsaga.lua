local M = {}

M.ensure_installed = true
M.url = "https://github.com/nvimdev/lspsaga.nvim"

M.lazy = true
M.keys = {
    { "<leader>lF", "<Cmd>Lspsaga finder<CR>" },
    { "<leader>lr", "<Cmd>Lspsaga rename<CR>" },
    { "<leader>ld", "<Cmd>Lspsaga definition<CR>" },
    { "<leader>lh", "<Cmd>Lspsaga hover_doc<CR>" },
    { "<leader>ln", "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
    { "<leader>lp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>" }
}

M.config = function()
    require("lspsaga").setup({
        finder = {
            keys = {
                toggle_or_open = "<CR>"
            }
        }
    })
end

return M
