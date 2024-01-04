return function()
	require("telekasten").setup({
		home = vim.fn.expand("~/Nextcloud/Documents/zettel/"),
		dailies = vim.fn.expand("~/Nextcloud/Documents/zettel/reccuring/dailies"),
		weeklies = vim.fn.expand("~/Nextcloud/Documents/zettel/reccuring/weeklies"),

		template_new_note = vim.fn.expand("~/Nextcloud/Documents/zettel/templates/notes.md"),

		tag_notation = "yaml-bare",
	})
end
