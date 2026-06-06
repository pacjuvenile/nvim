return {
	ensure_installed = true,
	url = "https://github.com/kylechui/nvim-surround",

	lazy = true,
	event = "VeryLazy",

	config = function()
		require("nvim-surround").setup({})
	end
}
