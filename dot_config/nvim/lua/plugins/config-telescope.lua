return function()
	local actions = require("telescope.actions")
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			theme = "ivy",
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
			preview = {
				treesitter = false,
			},
		},
		pickers = {
			fd = {
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
			},
		},
	})
end
