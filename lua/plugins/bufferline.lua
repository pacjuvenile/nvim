local M = {}

M.ensure_installed = false

M.setup = function()
    require("bufferline").setup()
end

M.cofig =  {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
        { "<leader>bh", "<CMD>BufferLineCyclePrev<CR>",   silent = true, desc = "Bufferline cycle prev" },
        { "<leader>bl", "<CMD>BufferLineCycleNext<CR>",   silent = true, desc = "Bufferline cycle next" },
        { "<leader>bd", "<CMD>bdelete!<CR>",              silent = true, desc = "Delete current buffer" },
        { "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", silent = true, desc = "Bufferline close others" },
        { "<leader>bp", "<CMD>BufferLinePick<CR>",        silent = true, desc = "Bufferline pick" }
    },
    config = M.setup
}

if M.ensure_installed then
    return M.cofig
end

return {}
