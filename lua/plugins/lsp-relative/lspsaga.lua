local M = {}

M.ensure_installed = true
M.enabled = true

M.config = function()
    require("lspsaga").setup({
        finder = {
            keys = {
                toggle_or_open = "<CR>"
            }
        }
    })
end

M.spec = {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    keys = {
        { "<leader>lF", "<Cmd>Lspsaga finder<CR>" },
        { "<leader>lr", "<Cmd>Lspsaga rename<CR>" },
        { "<leader>ld", "<Cmd>Lspsaga definition<CR>" },
        { "<leader>lh", "<Cmd>Lspsaga hover_doc<CR>" },
        { "<leader>ln", "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
        { "<leader>lp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>" },
    },
    config = M.config,
    enabled = M.enabled
}

return M
