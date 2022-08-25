local dashboard = require("dashboard")

local dashboard_footers = {
	{ " A wizard is never late, Frodo Baggins. Nor is he early; he arrives precisely when he means to." },
	{ " I think there's more to this hobbit than meets the eye." },
	{ " I cannot jump the distance. You'll have to toss me. Don't tell the elf" },
	{ " It comes in pints? I'm getting one" },
}

math.randomseed(os.time())
local foot_rand = math.random(1, #dashboard_footers)

dashboard.preview_command = "cat | lolcat"

dashboard.preview_file_path = "~/.config/nvim/nvim-logo.cat"
dashboard.preview_file_height = 10
dashboard.preview_file_width = 80

dashboard.custom_center = {
	{
		icon = " ",
		desc = "Find file         ",
		action = "Telescope fd",
		shortcut = "SPC p f"
	},
	{
		icon = " ",
		desc = "Edit vim config   ",
		action = ":e ~/.config/nvim/lua/config.lua",
		shortcut = "SPC f p"
	},
}

dashboard.custom_footer = dashboard_footers[foot_rand]
