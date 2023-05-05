return function()
	local db = require("dashboard")
	local util = require("util")

	local dashboard_footers = {
		{ " A wizard is never late, Frodo Baggins. Nor is he early; he arrives precisely when he means to." },
		{ " I think there's more to this hobbit than meets the eye." },
		{ " I cannot jump the distance. You'll have to toss me. Don't tell the elf" },
		{ " It comes in pints? I'm getting one" },
	}

	math.randomseed(os.time())
	local pad = 24

	db.setup({
		theme = "doom",
		config = {
			center = {
				{
					icon = " ",
					desc = util.string_pad("Find file", pad),
					action = "Telescope fd",
					key = "f",
				},
				{
					icon = " ",
					desc = util.string_pad("Edit vim config", pad),
					action = ":e ~/.config/nvim/lua/config.lua",
					key = "c",
				},
				{
					icon = " ",
					desc = util.string_pad("Open tree", pad),
					action = "NvimTreeFocus",
					key = "t",
				},
				{
					icon = " ",
					desc = util.string_pad("Show projects", pad),
					action = "Telescope projects",
					key = "p",
				},
				{
					icon = " ",
					desc = util.string_pad("Exit", pad),
					action = "quit",
					key = "q",
				},
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
