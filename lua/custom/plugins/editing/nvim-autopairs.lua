return {
	ensure_installed = true,
	url = "https://github.com/windwp/nvim-autopairs",

	lazy = true,
	event = "InsertEnter",

	config = function()
		require("nvim-autopairs").setup({})
	end
}
