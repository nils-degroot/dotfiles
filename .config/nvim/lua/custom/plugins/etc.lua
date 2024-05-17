local function kebabcase(string)
	local out = ""

	for char in string:gmatch(".") do
		if char == " " then
			out = out .. "-"
		else
			out = out .. char:lower()
		end
	end

	return out
end

return {
	"srcery-colors/srcery-vim",
	"mg979/vim-visual-multi",
	{
		"echasnovski/mini.starter",
		branch = "stable",
		config = function()
			local starter = require("mini.starter")

			starter.setup({
				header = "",
				items = {
					starter.sections.recent_files(10, false),
					starter.sections.builtin_actions(),
				},
				footer = "",
			})
		end,
	},
	{ "echasnovski/mini.pairs", branch = "stable", opts = {} },
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"weirongxu/plantuml-previewer.vim",
		dependencies = { "tyru/open-browser.vim" },
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "zettel",
						path = "~/Nextcloud/Documents/zettel/",
						overrides = {
							daily_notes = {
								folder = "reccuring/dailies/",
							},
							templates = {
								subdir = "templates",
							},
						},
					},
					{
						name = "work",
						path = "~/Nextcloud/Documents/work/",
					},
					{
						name = "beer",
						path = "~/Nextcloud/Documents/beer/",
					},
					{
						name = "dnd",
						path = "~/Nextcloud/Documents/dnd/",
					},
					{
						name = "personal",
						path = "~/Nextcloud/Documents/personal/",
					},
				},
				ui = {
					checkboxes = {
						[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
						["x"] = { char = "󰱒", hl_group = "ObsidianDone" },
					},
				},
				notes_subdir = "notes",
				note_id_func = kebabcase,
				disable_frontmatter = false,
				daily_notes = {
					folder = "dailies",
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					conform.format({ bufnr = args.buf })
				end,
			})
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
}
