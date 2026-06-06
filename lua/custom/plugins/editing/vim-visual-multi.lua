return {
	ensure_installed = false,
	url = "https://github.com/mg979/vim-visual-multi",

	lazy = false,

	init = function()
		vim.g.Vmaps = {
			["Add Cursor Down"] = "<C-j>",
			["Add Cursor Up"] = "<C-k>"
		}
	end
}
