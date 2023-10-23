return function()
	local starter = require("mini.starter")

	starter.setup({
		items = {
			starter.sections.recent_files(10, false),
			starter.sections.builtin_actions(),
		},
		footer = "",
	})
end
