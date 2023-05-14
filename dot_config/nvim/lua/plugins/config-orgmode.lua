return function()
	local orgmode = require("orgmode")

	orgmode.setup_ts_grammar()
	orgmode.setup({
		org_agenda_files = { "~/Documents/notes/*" },
		org_indent_mode = "noindent",
	})
end
