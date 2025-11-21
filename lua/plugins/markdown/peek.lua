local M = {}

M.ensure_installed = true
M.url = "toppair/peek.nvim"
M.build = "deno task --quiet build:fast"

M.lazy = true
M.ft = "markdown"

M.config = function()
    require("peek").setup({
        theme = 'light',
        app = '/mnt/c/Users/sunny/app/qutebrowser/qutebrowser.exe',
    })

    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, { desc = "Peek open markdown preview" })
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, { desc = "Peek close markdown preview" })
    vim.keymap.set("n", "<localleader>po", [[<CMD>PeekOpen<CR>]], { silent = true, desc = "Peek open markdown preview" } )
    vim.keymap.set("n", "<localleader>pc", [[<CMD>PeekClose<CR>]], { silent = true, desc = "Peek close markdown preview" } )
end

return M
