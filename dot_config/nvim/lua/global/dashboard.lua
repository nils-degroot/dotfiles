local db = require("dashboard")
local util = require("util")

local dashboard_footers = {
	{ " A wizard is never late, Frodo Baggins. Nor is he early; he arrives precisely when he means to." },
	{ " I think there's more to this hobbit than meets the eye." },
	{ " I cannot jump the distance. You'll have to toss me. Don't tell the elf" },
	{ " It comes in pints? I'm getting one" },
}

math.randomseed(os.time())
local foot_rand = math.random(1, #dashboard_footers)

db.preview_command = "cat | lolcat"

db.preview_file_path = "~/.config/nvim/nvim-logo.cat"
db.preview_file_height = 10
db.preview_file_width = 80

db.custom_center = {
	{
		icon = " ",
		desc = util.string_pad("Find file", 18),
		action = "Telescope fd",
		shortcut = "SPC p f"
	},
	{
		icon = " ",
		desc = util.string_pad("Edit vim config", 18),
		action = ":e ~/.config/nvim/lua/config.lua",
		shortcut = "SPC f p"
	},
}

db.custom_footer = dashboard_footers[foot_rand]
