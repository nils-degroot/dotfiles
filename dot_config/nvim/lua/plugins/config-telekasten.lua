return function()
	local home = vim.fn.expand("~/Documents/notes")

	require("telekasten").setup({
		home = home,
		tag_notation = "yaml-bare",
		template_new_daily = home .. "/templates/daily.md",
	})
end
