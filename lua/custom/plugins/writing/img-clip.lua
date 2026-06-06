return {
	ensure_installed = true,
	url = "https://github.com/HakonHarnes/img-clip.nvim",

	lazy = true,
	ft = "markdown",

	config = function()
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
}
