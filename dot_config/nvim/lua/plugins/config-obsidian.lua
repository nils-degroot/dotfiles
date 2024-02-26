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

return function()
	require("obsidian").setup({
		{
			workspaces = {
				{
					name = "zettel",
					path = "~/Nextcloud/Documents/zettel/",
				},
				{
					name = "work",
					path = "~/Nextcloud/Documents/work/",
				},
				{
					name = "beer",
					path = "~/Nextcloud/Documents/beer/",
				},
			},
		},
		notes_subdir = "notes",
		daily_notes = {
			folder = "reccuring/dailies/",
		},
		note_id_func = kebabcase,
		disable_frontmatter = false,
		templates = {
			subdir = "templates",
		},
	})
end
