local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<Leader>cc", ":noh<CR>", silent)
nnoremap("<F1>", ":execute 'silent ! alacritty &'<CR>", silent)

require("which-key").register({
	p = {
		name = "project",
		f = { "<CMD>Telescope fd<CR>", "Find file" },
		b = { "<CMD>Telescope buffers<CR>", "View open buffers" },
		a = { "<CMD>NvimTreeRefresh<CR>", "Refresh tree" },
	},
	t = {
		name = "toggle",
		t = { "<CMD>NvimTreeToggle<CR>", "Toggle tree" },
		f = { "<CMD>Limelight!!<CR><CMD>Goyo<CR>", "Toggle focus mode" }
	},
	c = {
		name = "code",
		r = { "<Plug>(coc-rename)", "Rename element" }
	},
	f = {
		name = "file",
		p = { "<CMD>e ~/.config/nvim/lua/config.lua<CR>", "Edit vim config"}
	},
	g = {
		name = "goto/git",
		b = { "<CMD>Telescope git_branches<CR>", "View branches for project" },
		d = { "<CMD>call CocAction('jumpDefinition')<CR>", "Goto definition" },
		i = { "<CMD>call CocAction('jumpImplementation')<CR>", "Goto implementation" },
		r = { "<CMD>call CocAction('jumpReferences')<CR>", "Find references" },
	},
	s = {
		name = "show",
		d = { "<CMD>call CocAction('definitionHover')<CR>", "Show definition" }
	}
}, {
	prefix = "<Leader>"
})
