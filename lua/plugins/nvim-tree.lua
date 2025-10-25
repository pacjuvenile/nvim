local M = {}

function M.setup()
    require("nvim-tree").setup({
        git = { 
            enable = true 
        },
        filters = {
            git_ignored = false,
        }
    })
end

return M
