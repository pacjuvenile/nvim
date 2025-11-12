local M = {}

M.ensure_installed = true
M.enabled = true

M.setup = function()
    require("lspsaga").setup({
        finder = {
            keys = {
                toggle_or_open = "<CR>"
            }
        }
    })
end

M.config = {
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
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled 
    return M.config
end

return {}
