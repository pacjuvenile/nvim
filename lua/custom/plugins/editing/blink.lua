return {
	ensure_installed = true,
	url = "https://github.com/saghen/blink.cmp",
	version = "1.x",
	dependencies = {
		{
			url = "https://github.com/rafamadriz/friendly-snippets"
		}
	},

	lazy = true,
	event = "VeryLazy",

	config = function()
		require("blink.cmp").setup({
			completion = {
				documentation = {
					auto_show = true
				}
			},
			keymap = {
				preset = "none",
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },

				["<Tab>"] = {
					function(cmp)
						return cmp.select_and_accept()
					end,
					"snippet_forward",
					"fallback"
				},
				["<C-e>"] = { "show", "hide", "fallback" },
			},
			sources = {
				default = { "buffer", "path", "lsp", "snippets" }
			},
			cmdline = {
				sources = function()
					if vim.fn.getcmdtype() == "/" then
						return { "buffer" }
					elseif vim.fn.getcmdwintype() == ":" then
						return { "cmdline" }
					else
						return {}
					end
				end,
				keymap = {
					preset = "none",
					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },

					["<Tab>"] = {
						function(cmp)
							return cmp.select_and_accept()
						end,
						"snippet_forward",
						"fallback"
					},
					["<C-e>"] = { "show", "hide", "fallback" },
				},
				completion = {
					menu = { auto_show = true }
				}
			}
		})
	end
}
