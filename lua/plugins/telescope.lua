local M = {}

function M.setup()
    require("telescope").setup({
        pickers = {
            find_files = {
                find_command = {
                    "rg",
                    "--files",
                    "--hidden",
                    "--glob",
                    "!**/.git/*"
                } 
            },
            live_grep = {
                glob_pattern = {
                    "!**/.git/*"
                },
                additional_args = { 
                    "--hidden",
                },
            }
        }
    })
end

return M
