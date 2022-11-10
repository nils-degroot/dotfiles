return function()
	require("rust-tools").setup({
		tools = {
			inlay_hints = {
				auto = true,
			},
		},
	})
end
