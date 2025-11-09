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
            -- buffer补足宽度填充 
            fill = {
                bg = "none"
            },
            -- buffer初始文字
            background = {
                bg = "none"
            },
            --  buffer激活时文字
            buffer_selected = {
                bg = "none"
            },
            -- buffer失活时文字
            buffer_visible = {
                bg = "none"
            },
            -- buffer激活时指示器
            indicator_selected = {
                bg = "none"
            },
            -- buffer非激活时指示器
            indicator_visible = {
                bg = "none"
            },
            -- buffer初始关闭按钮
            close_button = {
                bg = "none"
            },
            --  buffer激活时关闭按钮
            close_button_selected = {
                bg = "none"
            },
            -- buffer失活时关闭按钮
            close_button_visible = {
                bg = "none"
            },
            -- buffer分隔符
            separator = {
                bg = "none"
            },
            -- buffer激活时修改符
            modified_selected = {
                bg = "none"
            },
            -- buffer失活时修改符
            modified_visible = {
                bg = "none"
            },
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
