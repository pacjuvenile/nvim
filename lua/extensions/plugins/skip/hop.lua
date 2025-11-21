local M = {}

M.ensure_installed = true
M.url = "https://github.com/smoka7/hop.nvim"

M.lazy = true
M.keys = {
    { "<leader>hp", "<Cmd>HopWord<CR>", mode = { "n", "v" }, desc = "Hop word in current buffer" }
}

M.config = function()
    require("hop").setup({
        hint_position = require("hop.hint").HintPosition.END
    })
end

return M
