local M = {}

M.ensure_installed = true
M.url = "https://github.com/HakonHarnes/img-clip.nvim"

M.lazy = true
M.ft = "markdown"

M.config = function()
  require("img-clip").setup({
		default = {
			dir_path = "assets"
		},
    filetypes = {
      markdown = {
        -- 模板选项
        template = '<img src="$FILE_PATH" width="100%">',
        insert_mode_after_paste = false,

        -- 提示选项
        prompt_for_file_name = true
      }
    }
  })
end

return M
