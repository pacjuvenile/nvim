return {
	ensure_installed = true,
	url = "https://github.com/lervag/vimtex",

	enabled = true,
	lazy = false,
	-- ft = "tex",

	init = function()
		vim.g.vimtex_mappings_enabled = 0
		vim.keymap.set("n", "<leader>ll", [[<cmd>VimtexCompile<cr>]],
			{ silent = true, desc = "Vimtex toggle compilation" })
		vim.keymap.set("n", "<leader>le", [[<cmd>VimtexErrors<cr>]],
			{ silent = true, desc = "Vimtex toggle quickfix window" })
		vim.keymap.set("n", "<leader>lc", [[<cmd>VimtexClean<cr>]], { silent = true, desc = "Vimtex clean auxiliary" })
		vim.keymap.set("n", "<leader>lv", [[<cmd>VimtexView<cr>]], { silent = true, desc = "Vimtex forward search" })

		vim.g.vimtex_quickfix_open_on_warning = 0

		vim.g.vimtex_view_method = "sioyek"
		vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
	end
}
