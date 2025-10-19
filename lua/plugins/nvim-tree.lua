local M = {}

function M.startup()
end

function M.setup()
    require("nvim-tree").setup({
        actions = {
            open_file = {
                quit_on_open = true
            }
        }
    })
end

return M
