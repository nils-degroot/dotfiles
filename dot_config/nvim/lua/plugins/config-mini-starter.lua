return function()
	local starter = require("mini.starter")

	starter.setup({
		items = {
			{
				{ action = "PackerCompile", name = "Compile", section = "Packer" },
				{ action = "PackerSync", name = "Sync", section = "Packer" },
			},
			starter.sections.recent_files(10, false),
			starter.sections.builtin_actions(),
		},
		footer = "",
	})
end
