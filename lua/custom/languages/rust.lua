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
		cmd = { 'rust-analyzer' } ,
		filetypes = { 'rust' },
		root_dir = function(bufnr, on_dir)
			local fname = vim.api.nvim_buf_get_name(bufnr)
			local reused_dir = is_library(fname)
			if reused_dir then
				on_dir(reused_dir)
				return
			end

			local cargo_crate_dir = vim.fs.root(fname, { 'Cargo.toml' })
			local cargo_workspace_root

			if cargo_crate_dir == nil then
				local rust_project_root = vim.fs.root(fname, { 'rust-project.json' })
				local git = vim.fs.find('.git', { path = fname, upward = true })[1]
				local git_root = git and vim.fs.dirname(git)
				local root = rust_project_root or git_root
				if root then
					on_dir(root)
				end
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
				if output.code == 0 then
					if output.stdout then
						local result = vim.json.decode(output.stdout)
						if result['workspace_root'] then
							cargo_workspace_root = vim.fs.normalize(result['workspace_root'])
						end
					end

					on_dir(cargo_workspace_root or cargo_crate_dir)
				else
					vim.schedule(function ()
						vim.notify('[rust_analyzer] cmd failed')
					end)
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
