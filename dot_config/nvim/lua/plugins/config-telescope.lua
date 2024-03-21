return function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local themes = require("telescope.themes")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		},
		pickers = {
			fd = {
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
				theme = "ivy",
			},
			lsp_references = {
				theme = "ivy",
				previewer = false,
			},
		},
		extensions = {
			["ui-select"] = {
				themes.get_dropdown({
					width = 0.8,
				}),
			},
		},
	})

	telescope.load_extension("ui-select")
end
