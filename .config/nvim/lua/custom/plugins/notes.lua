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
						overrides = {
							templates = {
								subdir = "templates",
							},
							daily_notes = {
								template = "daily",
							},
						},
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
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
}
