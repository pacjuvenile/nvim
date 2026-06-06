return {
	ensure_installed = false,
	url = "https://github.com/stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},

	enabled = true,
	lazy = true,
	keys = {
		{ "<leader>o", "<cmd>AerialToggle! right<cr>" , desc = "toggle outline"}
	},

	config = function()
		require("aerial").setup({
			layout = {
				win_opts = {
					wrap = true,
					linebreak = true,
					breakindent = true
				},
				resize_to_content = false
			},
			icons = {
				fixed_width = false
			}
		})
	end
}
