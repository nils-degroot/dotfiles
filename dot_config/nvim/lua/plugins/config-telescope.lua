return function()
	local actions = require("telescope.actions")
	local telescope = require("telescope")

	telescope.load_extension("media_files")
	telescope.load_extension("projects")

	telescope.setup({
		defaults = {
			theme = "ivy",
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		},
		pickers = {
			fd = {
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
			},
		},
		extensions = {
			media_files = {
				filetypes = { "png", "webp", "jpg", "jpeg" },
			},
		},
	})
end
