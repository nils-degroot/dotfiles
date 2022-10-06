return function()
	require("true-zen").setup({
		modes = {
			ataraxis = {
				callbacks = {
					open_pos = function()
						vim.defer_fn(require("galaxyline").disable_galaxyline, 100)
					end,
					close_pos = function()
						vim.defer_fn(require("galaxyline").load_galaxyline, 100)
					end,
				},
			},
		},
	})
end
