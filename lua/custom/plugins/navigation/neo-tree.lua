return {
	ensure_installed = true,
	url = "https://github.com/nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	lazy = true,
	keys = {
		{ '<leader>e', [[<cmd>Neotree toggle .<cr>]], desc = 'neo-tree toggle' }
	},

	config = function()
		require("neo-tree").setup({
			auto_clean_after_session_restore = true,
			close_if_last_window = true,
			source_selector = {
				winbar = true,
				content_layout = "center",
			},
			commands = {
				system_open = function(state) vim.ui.open(state.tree:get_node():get_id()) end,
				parent_or_close = function(state)
					local node = state.tree:get_node()
					if node:has_children() and node:is_expanded() then
						state.commands.toggle_node(state)
					else
						require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
					end
				end,
				child_or_open = function(state)
					local node = state.tree:get_node()
					if node:has_children() then
						if not node:is_expanded() then -- if unexpanded, expand
							state.commands.toggle_node(state)
						else                           -- if expanded and has children, seleect the next child
							if node.type == "file" then
								state.commands.open(state)
							else
								require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
							end
						end
					else -- if has no children
						state.commands.open(state)
					end
				end,
			},
			window = {
				width = 25,
				mappings = {
					["<S-cr>"] = "system_open",
					["<Space>"] = false,
					["[b"] = "prev_source",
					["]b"] = "next_source",
					O = "system_open",
					h = "parent_or_close",
					l = "child_or_open",
				},
				-- fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
				--   ["<C-J>"] = "move_cursor_down",
				--   ["<C-K>"] = "move_cursor_up",
				-- },
			},
			filesystem = {
				window = {
					mappings = {
						["<esc>"] = "none",
						["/"] = "none",
						["P"] = "none",
					}
				}
			  -- follow_current_file = { enabled = true },
			  -- hijack_netrw_behavior = "open_current",
			  -- use_libuv_file_watcher = vim.fn.has "win32" ~= 1,
			},
		})
	end
}
