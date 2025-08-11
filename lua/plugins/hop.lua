return {
    "smoka7/hop.nvim",
    lazy = true,
    keys = {
        { "<leader>hp", "<Cmd>HopWord<CR>", silent = true }
    },
    opts = {
        hint_position = 3   -- require("hop.hint").HintPosition.END的值是3
    },
    config = function (_, opts)
        require("hop").setup(opts)
    end
}
