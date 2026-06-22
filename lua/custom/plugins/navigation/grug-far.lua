return {
	ensure_installed = true,
	url = "https://github.com/MagicDuck/grug-far.nvim",
	dependencies = {
		{ url = "https://github.com/nvim-tree/nvim-web-devicons" }
	},

	lazy = true,
	cmd = "GrugFar",

	config = function()
		require("grug-far").setup({
			windowCreationCommand = ""
		})
	end
}
