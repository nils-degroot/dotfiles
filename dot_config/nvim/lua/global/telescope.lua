local actions = require("telescope.actions")

require("telescope").setup {
	defaults = {
		theme = "ivy",
		mappings = {
			i = {
				["<esc>"] = actions.close
			},
		},
	},
	pickers = {
		fd = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
		},
	}
}
