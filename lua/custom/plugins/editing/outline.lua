return {
	url = "https://github.com/hedyhli/outline.nvim",

	lazy = true,
	keys = {
		{ "<leader>o", "<cmd>Outline!<cr>", desc = "outline toggle" }
	},

	config = function()
		require("outline").setup({
			outline_window = {
				position = "right",
				width = 30,
				wrap = true
			}
		})
	end
}
