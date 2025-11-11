local M = {}

M.ensure_installed = true
M.enabled = true

M.setup = function()
    require("hop").setup({
        hint_position = require("hop.hint").HintPosition.END
    })
end

M.config = {
    "smoka7/hop.nvim",
    lazy = true,
    keys = {
        { "<leader>hp", "<Cmd>HopWord<CR>", mode = { "n", "v" }, desc = "Hop word in current buffer" }
    },
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled
    return M.config
end

return {}
