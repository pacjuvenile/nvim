local M = {}

M.ensure_installed = true

function M.setup()
    require("peek").setup({
        theme = 'light',
        app = '/mnt/c/Users/sunny/app/qutebrowser/qutebrowser.exe',
    })
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, { desc = "Peek open markdown preview" })
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, { desc = "Peek close markdown preview" })
end

M.config = {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    lazy = true,
    event = "VeryLazy",
    keys = {
        { "<leader>po", "<CMD>PeekOpen<CR>", silent = true, desc = "Peek open markdown preview" },
        { "<leader>pc", "<CMD>PeekClose<CR>", silent = true, desc = "Peek close markdown preview" }
    },
    config = M.setup
}

if M.ensure_installed then
    return M.config
end

return {}
