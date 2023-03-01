return function()
	require("project_nvim").setup({
		manual_mode = true,
		patterns = { ".git", "package.json", ".projectile" },
	})
end
