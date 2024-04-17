return function()
	require("project_nvim").setup({
		patterns = { ".git", "package.json" },
	})
end
