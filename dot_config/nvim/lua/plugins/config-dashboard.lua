return function()
	local db = require("dashboard")

	local dashboard_footers = {
		{ " A wizard is never late, Frodo Baggins. Nor is he early; he arrives precisely when he means to." },
		{ " I think there's more to this hobbit than meets the eye." },
		{ " I cannot jump the distance. You'll have to toss me. Don't tell the elf" },
		{ " It comes in pints? I'm getting one" },
	}

	math.randomseed(os.time())

	db.setup({
		theme = "hyper",
		config = {
			shortcut = {
				{
					desc = " Tree",
					action = "NvimTreeFocus",
					key = "t",
				},
				{
					desc = " Files",
					action = "Telescope fd",
					key = "f",
				},
				{
					desc = " Quit",
					action = "q",
					key = "q",
				},
			},
			packages = { enable = true },
			project = {
				limit = 5,
				icon = "",
			},
			mru = {
				limit = 8,
			},
			footer = dashboard_footers[math.random(1, #dashboard_footers)],
		},
		preview = {
			command = "cat",
			file_path = "~/.config/nvim/nvim-logo.cat",
			file_height = 10,
			file_width = 80,
		},
	})
end
