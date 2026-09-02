local function user_sysroot_src()
	return vim.tbl_get(vim.lsp.config['rust_analyzer'], 'settings', 'rust-analyzer', 'cargo', 'sysrootSrc')
end

local function default_sysroot_src()
	local sysroot = vim.tbl_get(vim.lsp.config['rust_analyzer'], 'settings', 'rust-analyzer', 'cargo', 'sysroot')
	if not sysroot then
		local rustc = os.getenv 'RUSTC' or 'rustc'
		local result = vim.system({ rustc, '--print', 'sysroot' }, { text = true }):wait()

		local stdout = result.stdout
		if result.code == 0 and stdout then
			if string.sub(stdout, #stdout) == '\n' then
				if #stdout > 1 then
					sysroot = string.sub(stdout, 1, #stdout - 1)
				else
					sysroot = ''
				end
			else
				sysroot = stdout
			end
		end
	end

	return sysroot and vim.fs.joinpath(sysroot, 'lib/rustlib/src/rust/library') or nil
end

local function is_library(fname)
	local user_home = vim.fs.normalize(vim.env.HOME)
	local cargo_home = os.getenv 'CARGO_HOME' or user_home .. '/.cargo'
	local registry = cargo_home .. '/registry/src'
	local git_registry = cargo_home .. '/git/checkouts'

	local rustup_home = os.getenv 'RUSTUP_HOME' or user_home .. '/.rustup'
	local toolchains = rustup_home .. '/toolchains'

	local sysroot_src = user_sysroot_src() or default_sysroot_src()

	for _, item in ipairs { toolchains, registry, git_registry, sysroot_src } do
		if item and vim.fs.relpath(item, fname) then
			local clients = vim.lsp.get_clients { name = 'rust_analyzer' }
			return #clients > 0 and clients[#clients].config.root_dir or nil
		end
	end
end

return {
	treesitter = {
		parser = { 'rust' }
	},
	lsp = {
		name = 'rust_analyzer',
		cmd = { 'rust-analyzer' },
		filetypes = { 'rust' },
		root_dir = function(bufnr, on_dir)
			local fname = vim.api.nvim_buf_get_name(bufnr)
			local reused_dir = is_library(fname)
			if reused_dir then
				on_dir(reused_dir)
				return
			end

			local cargo_crate_dir = vim.fs.root(fname, { 'Cargo.toml' })
			if cargo_crate_dir == nil then
				on_dir(vim.fs.root(fname, { 'rust-project.json', '.git' }))
				return
			end

			local cmd = {
				'cargo',
				'metadata',
				'--no-deps',
				'--format-version',
				'1',
				'--manifest-path',
				cargo_crate_dir .. '/Cargo.toml'
			}

			vim.system(cmd, { text = true }, function(output)
				if output.code == 0 and output.stdout then
					local ok, result = pcall(vim.json.decode, output.stdout)
					local workspace_root = ok and result['workspace_root']
					if workspace_root then
						on_dir(vim.fs.normalize(workspace_root))
					else
						on_dir(cargo_crate_dir)
					end
				else
					vim.schedule(function()
						vim.notify(
							('[rust_analyzer] cargo metadata failed, using %s'):format(cargo_crate_dir),
							vim.log.levels.WARN
						)
					end)
					on_dir(cargo_crate_dir)
				end
			end)
		end,
		capabilities = {
			experimental = {
				serverStatusNotification = true,
			},
		},
		settings = {
			['rust-analyzer'] = {
				lens = {
					enable = false,
				},

				diagnostics = {
					disabled = {
						"unresolved-macro-call",
						"macro-error",
						"attribute-expansion-disabled",
						"proc-macro-disabled",
					},
				},

				cachePriming = {
					enable = false,
				},

				procMacro = {
					enable = true,
				},

				cargo = {
					allTargets = false,
					buildScripts = {
						enable = true,
					},
				},

				checkOnSave = false,
			},
		},
		before_init = function(init_params, config)
			if config.settings and config.settings['rust-analyzer'] then
				init_params.initializationOptions = config.settings['rust-analyzer']
			end
		end,
		on_attach  = function(_, bufnr)
			vim.api.nvim_buf_create_user_command(bufnr, 'ReloadWorkspace', function()
			local clients = vim.lsp.get_clients { bufnr = bufnr, name = 'rust_analyzer' }
			for _, client in ipairs(clients) do
				---@diagnostic disable-next-line:param-type-mismatch
				client:request('rust-analyzer/reloadWorkspace', nil, function(err)
					if err then
						error(tostring(err))
					end
					vim.notify 'Workspace reloaded'
				end, bufnr)
			end
			end, { desc = 'Reload workspace' })
		end
	}
}
