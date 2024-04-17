return function()
	require("oil").setup({
		columns = {
			"icon",
			"mtime",
		},
		delete_to_trash = true,
	})
end
