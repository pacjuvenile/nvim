return {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
        { "<leader>bh", "<CMD>BufferLineCyclePrev<CR>",   silent = true, desc = "Bufferline cycle prev" },
        { "<leader>bl", "<CMD>BufferLineCycleNext<CR>",   silent = true, desc = "Bufferline cycle next" },
        { "<leader>bd", "<CMD>bdelete!<CR>",              silent = true, desc = "Delete current buffer" },
        { "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", silent = true, desc = "Bufferline close others" },
        { "<leader>bp", "<CMD>BufferLinePick<CR>",        silent = true, desc = "Bufferline pick" }
    },
    opts = {},
    config = function(_, opts)
        require("bufferline").setup(opts)
    end
}
