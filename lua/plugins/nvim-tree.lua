local M = {}

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
