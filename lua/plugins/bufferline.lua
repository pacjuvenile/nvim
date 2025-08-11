return {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
        { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
        { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
        { "<leader>bd", ":bdelete<CR>", silent = true },
        { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true },
        { "<leader>bp", ":BufferLinePick<CR>", silent = true }
    },
    opts = {},
    config = function (_, opts)
        require("bufferline").setup(opts)
    end
}
