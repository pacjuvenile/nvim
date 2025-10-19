return {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    keys = {
        { "<leader>lf", "<Cmd>lua vim.lsp.buf.format()<CR>", desc = "Use lsp to format current buffer" },
        { "<leader>lF", "<Cmd>Lspsaga finder<CR>" },
        { "<leader>lr", "<Cmd>Lspsaga rename<CR>" },
        { "<leader>ld", "<Cmd>Lspsaga definition<CR>" },
        { "<leader>lh", "<Cmd>Lspsaga hover_doc<CR>" },
        { "<leader>ln", "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
        { "<leader>lp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>" },
    },
    opts = {
        finder = {
            keys = {
                toggle_or_open = "<CR>"
            }
        }
    },
    config = function(_, opts)
        require("lspsaga").setup(opts)
    end
}
