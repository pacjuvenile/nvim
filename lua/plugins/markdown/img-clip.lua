local M = {}

M.ensure_installed = true
M.url = "https://github.com/HakonHarnes/img-clip.nvim"

M.lazy = true
M.ft = "markdown"

M.config = function()
    require("img-clip").setup({
       filetypes = {
           markdown = {
                -- 模板选项
                template = "<img src=\"$FILE_PATH\" width=\"100%\">",
                insert_mode_after_paste = false,

                -- 提示选项
                prompt_for_file_name = false,
           }
        }
    })

    vim.keymap.set("n", "<localleader>ic", function()
        vim.cmd([[normal! m`]]) -- 标记光标位置
        vim.cmd([[PasteImage]]) -- 粘贴图片链接
        vim.cmd([[normal! 0v$h"+xdd]]) -- 剪切图片链接并删除新行
        vim.cmd([[normal! ``]]) -- 回到光标位置
    end, { silent = true, desc = "put the image link into the clipboard" } )
end

return M
