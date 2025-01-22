return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		opts = {
			org_agenda_files = "~/org/**/*",
			org_default_notes_file = "~/org/refile.org",
			org_todo_keywords = { "TODO", "DOING", "|", "DONE", "DELEGATED" },
		},
	},
	{
		"akinsho/org-bullets.nvim",
		opts = {},
	},
}
