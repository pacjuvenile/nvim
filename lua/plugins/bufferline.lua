local M = {}

M.ensure_installed = true
M.enabled = true

M.setup = function()
    require("bufferline").setup({
        options = {
            custom_filter = function(buf_number)
                local buftype = vim.bo[buf_number].buftype

                if buftype == "nofile" then
                    return false
                end

                return true
            end
        },
        highlights = {
            fill = {
                bg = "none"
            },
            buffer_selected = {
                bg = "none"
            },
            buffer_visible = {
                bg = "none"
            },
            close_button_selected = {
                bg = "none"
            },
            close_button_visible = {
                bg = "none"
            },
            modified_selected = {
                bg = "none"
            },
            modified_visible = {
                bg = "none"
            },
            indicator_selected = {
                bg = "none"
            },
            indicator_visible = {
                bg = "none"
            },
            separator_visible = {
                bg = "none"
            }
        }
    })
end

M.config =  {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
        { "<leader>bp", "<CMD>BufferLinePick<CR>",        silent = true, desc = "Bufferline pick" },
        { "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", silent = true, desc = "Bufferline close others" }
    },
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled
    return M.config
end

return {}
