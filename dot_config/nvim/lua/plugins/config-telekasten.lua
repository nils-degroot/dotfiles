return function()
	require("telekasten").setup({
		home = vim.fn.expand("~/Documents/notes"),
		dailies = vim.fn.expand("~/Documents/notes/reccuring/dailies"),
		weeklies = vim.fn.expand("~/Documents/notes/reccuring/weeklies"),

		template_new_daily = vim.fn.expand("~/Documents/notes/templates/daily.md"),
		template_new_weekly = vim.fn.expand("~/Documents/notes/templates/weekly.md"),
		template_new_note = vim.fn.expand("~/Documents/notes/templates/zettelkasten-note.md"),

		tag_notation = "yaml-bare",
	})
end
