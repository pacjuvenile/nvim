return {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
        { "<leader>bh", "<CMD>BufferLineCyclePrev<CR>",   silent = true },
        { "<leader>bl", "<CMD>BufferLineCycleNext<CR>",   silent = true },
        { "<leader>bd", "<CMD>bdelete!<CR>",              silent = true },
        { "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", silent = true },
        { "<leader>bp", "<CMD>BufferLinePick<CR>",        silent = true }
    },
    opts = {},
    config = function(_, opts)
        require("bufferline").setup(opts)
    end
}
