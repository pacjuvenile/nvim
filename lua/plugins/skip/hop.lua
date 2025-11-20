local M = {}

M.ensure_installed = true
M.enabled = true

-- M.config = function()
--     require("hop").setup({
--         hint_position = require("hop.hint").HintPosition.END
--     })
-- end

M.spec = {
    "smoka7/hop.nvim",
    lazy = true,
    keys = {
        { "<leader>hp", "<Cmd>HopWord<CR>", mode = { "n", "v" }, desc = "Hop word in current buffer" }
    },
    config = M.config,
    enabled = M.enabled
}

return M
