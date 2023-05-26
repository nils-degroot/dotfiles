local map = vim.api.nvim_set_keymap

return {
	-- Methods
	nnoremap = function(lhs, rhs, options)
		options = options or {}
		options.noremap = true
		map("n", lhs, rhs, options)
	end,
	vnoremap = function(lhs, rhs, options)
		options = options or {}
		options.noremap = true
		map("v", lhs, rhs, options)
	end,
	nmap = function(lhs, rhs, options)
		options = options or {}
		map("n", lhs, rhs, options)
	end,
	vmap = function(lhs, rhs, options)
		options = options or {}
		map("v", lhs, rhs, options)
	end,

	-- Util objects
	silent = { silent = true },
}
