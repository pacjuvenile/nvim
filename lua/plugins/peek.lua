local M = {}

function M.setup()
    require("peek").setup({
        auto_load = true,        -- whether to automatically load preview when entering another markdown buffer
        close_on_bdelete = true, -- close preview window on buffer delete

        syntax = true,           -- enable syntax highlighting, affects performance

        theme = 'light',          -- 'dark' or 'light'

        update_on_change = true,

        app = '/mnt/c/Users/sunny/app/qutebrowser/qutebrowser.exe', -- 'webview', 'browser', string or a table of strings

        filetype = { 'markdown' }, -- list of filetypes to recognize as markdown

        -- relevant if update_on_change is true
        throttle_at = 200000,   -- start throttling when file exceeds this amount of bytes in size
        throttle_time = 'auto', -- minimum amount of time in milliseconds that has to pass before starting new render
    })
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, { desc = "Peek open markdown preview" })
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, { desc = "Peek close markdown preview" })
end

return {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    lazy = true,
    event = "VeryLazy",
    keys = {
        { "<leader>po", "<CMD>PeekOpen<CR>", silent = true, desc = "Peek open markdown preview" },
        { "<leader>pc", "<CMD>PeekClose<CR>", silent = true, desc = "Peek close markdown preview" }
    },
    config = function()
        M.setup()
    end
}
