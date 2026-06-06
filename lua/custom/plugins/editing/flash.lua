return {
	url = "https://github.com/folke/flash.nvim",

	lazy = true,
	keys = {
		{ "<leader>s", mode = { "n", "v" }, [[<cmd>lua require("flash").jump()<cr>]], desc = "Flash" },
	},

	config = function()
		require("flash").setup({
			label = {
				after = false,
				before = true
			},
			modes = {
				char = {
					enabled = false
				}
			}
		})
	end
}
