local M = {}

M.ensure_installed = true
M.url = "toppair/peek.nvim"
M.build = "deno task --quiet build:fast"

M.lazy = true
M.event = "VeryLazy"

M.config = function()
    require("peek").setup({
        theme = 'light',
        app = '/mnt/c/Users/sunny/app/qutebrowser/qutebrowser.exe',
    })

    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, { desc = "Peek open markdown preview" })
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, { desc = "Peek close markdown preview" })

    vim.keymap.set("n", "<leader>po", "<CMD>PeekOpen<CR>", { silent = true, desc = "Peek open markdown preview" } )
    vim.keymap.set("n", "<leader>pc", "<CMD>PeekClose<CR>", { silent = true, desc = "Peek close markdown preview" } )
end

return M
