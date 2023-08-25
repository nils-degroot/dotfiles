return function()
	require("telekasten").setup({
		home = vim.fn.expand("~/Documents/notes"),
		tag_notation = "yaml-bare",
		template_new_daily = vim.fn.expand("~/Documents/notes/templates/daily.md"),
		template_new_note = vim.fn.expand("~/Documents/notes/templates/zettelkasten-note.md"),
	})
end
