local std_lib = nil
local mod_cache = nil

local function identify_go_dir(custom_args, on_complete)
	local cmd = { 'go', 'env', custom_args.envvar_id }
	vim.system(cmd, { text = true }, function(output)
		local result = vim.trim(output.stdout or '')
		if output.code == 0 and result ~= '' then
			if custom_args.custom_subdir and custom_args.custom_subdir ~= '' then
				result = result .. custom_args.custom_subdir
			end
			on_complete(result)
		else
			vim.schedule(function()
				vim.notify(
					('[gopls] identify ' .. custom_args.envvar_id .. ' dir cmd failed with code %d: %s\n%s'):format(
						output.code,
						vim.inspect(cmd),
						output.stderr or ''
					), vim.log.levels.ERROR
				)
			end)
			on_complete(nil)
		end
	end)
end

local function load_std_lib_dir()
	if std_lib and std_lib ~= '' then
		return
	end

	identify_go_dir({ envvar_id = 'GOROOT', custom_subdir = '/src' }, function(dir)
		std_lib = dir
	end)
end

local function load_mod_cache_dir()
	if mod_cache and mod_cache ~= '' then
		return
	end

	identify_go_dir({ envvar_id = 'GOMODCACHE' }, function(dir)
		mod_cache = dir
	end)
end

local function get_root_dir(fname)
	local in_std_lib = std_lib and fname:sub(1, #std_lib) == std_lib
	local in_mod_cache = mod_cache and fname:sub(1, #mod_cache) == mod_cache
	if in_std_lib or in_mod_cache then
		local previous_buf = vim.fn.bufnr('#')
		if previous_buf > 0 and vim.api.nvim_buf_is_valid(previous_buf) then
			local clients = vim.lsp.get_clients({
				name = 'gopls',
				bufnr = previous_buf
			})
			if #clients > 0 then
				return clients[1].config.root_dir
			end
		end
	end

	return vim.fs.root(fname, 'go.work') or vim.fs.root(fname, 'go.mod') or vim.fs.root(fname, '.git')
end

return {
	ts_config = {
		parser = { 'go' }
	},
	ls_config = {
		name = 'gopls',
		cmd = { 'gopls' },
		filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
		root_dir = function(bufnr, on_dir)
			local fname = vim.api.nvim_buf_get_name(bufnr)
			load_mod_cache_dir()
			load_std_lib_dir()
			on_dir(get_root_dir(fname))
		end,
		settings = {
			gopls = {
				semanticTokens = true,
			}
		}
	}
}
