return {
	'saghen/blink.cmp',
	version = '*',
	dependencies = {
		'rafamadriz/friendly-snippets'
	},
	lazy = true,
	event = 'VeryLazy',
	config = function()
		require('blink.cmp').setup({
			sources = {
				default = { 'buffer', 'path', 'lsp', 'snippets' }
			},
			keymap = {
				preset = 'none',
				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },
				['<Tab>'] = {
					function(cmp)
						return cmp.select_and_accept()
					end,
					'snippet_forward',
					'fallback'
				},
				['<C-e>'] = { 'show', 'hide', 'fallback' }
			},
			completion = {
				documentation = {
					auto_show = true
				}
			},
			cmdline = {
				sources = function()
					if vim.fn.getcmdtype() == '/' or vim.fn.getcmdtype() == '?' then
						return { 'buffer' }
					elseif vim.fn.getcmdwintype() == ':' then
						return { 'cmdline' }
					else
						return {}
					end
				end,
				keymap = {
					preset = 'none',
					['<Up>'] = { 'select_prev', 'fallback' },
					['<Down>'] = { 'select_next', 'fallback' },
					['<Tab>'] = {
						function(cmp)
							return cmp.select_and_accept()
						end,
						'snippet_forward',
						'fallback'
					},
					['<C-e>'] = { 'show', 'hide', 'fallback' }
				},
				completion = {
					menu = { auto_show = true }
				}
			}
		})
	end
}
