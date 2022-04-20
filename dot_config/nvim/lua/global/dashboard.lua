local g = vim.g

local dashboard_footers = {
	{ " A wizard is never late, Frodo Baggins. Nor is he early; he arrives precisely when he means to." },
	{ " I think there's more to this hobbit than meets the eye." },
	{ " I cannot jump the distance. You'll have to toss me. Don't tell the elf" },
	{ " It comes in pints? I'm getting one" },
}

math.randomseed(os.time())
local foot_rand = math.random(1, #dashboard_footers)

g.dashboard_preview_command = "cat"
g.dashboard_preview_pipeline = "lolcat"
g.dashboard_preview_file = "~/.config/nvim/nvim-logo.cat"

g.dashboard_preview_file_height = 10
g.dashboard_preview_file_width = 80

g.dashboard_custom_footer = dashboard_footers[foot_rand]
g.dashboard_custom_section = {
    find_files = {
    	description = { " Find files     " },
    	command = "Telescope fd"
    },
    edit_nvim_config = {
    	description = { " Edit vim config" },
    	command = ":e ~/.config/nvim/init.vim"
    },
}
