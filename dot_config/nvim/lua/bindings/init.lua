local util = require("bindings.util")

local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
local silent = util.silent

vnoremap("<", "<gv", silent)
vnoremap(">", ">gv", silent)

nnoremap("<CR>", ":lua vim.lsp.buf.code_action()<CR>", silent)

require("which-key").register({
	p = {
		name = "project",
		f = { "<CMD>Telescope fd<CR>", "Find file" },
		o = { "<CMD>Telescope oldfiles<CR>", "Find recent files" },
	},
	t = {
		name = "toggle",
		t = { "<CMD>TableModeToggle<CR>", "Toggle table mode" },
		f = { "<CMD>ZenMode<CR>", "Toggle focus mode" },
	},
	c = {
		name = "code",
		r = { "<CMD>Lspsaga rename<CR>", "Rename element" },
		c = { "<CMD>noh<CR>", "Clear selection" },
	},
	g = {
		name = "goto",
		d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
		r = { "<CMD>Telescope lsp_references<CR>", "Find references" },
	},
	s = {
		name = "show",
		d = { "<CMD>Lspsaga peek_definition<CR>", "Show definition" },
		s = { "<CMD>Lspsaga hover_doc<CR>", "Show doc" },
	},
	b = {
		name = "buffers",
		b = { "<CMD>Telescope buffers<CR>", "Buffers" },
	},
	n = {
		name = "notes",
		f = { "<CMD>ObsidianSearch<CR>", "Find notes" },
		n = { "<CMD>ObsidianNew new_note<CR>", "New note" },
		t = { "<CMD>ObsidianTemplate<CR>", "Insert template" },
		g = {
			name = "goto",
			t = { "<CMD>ObsidianToday<CR>", "Today" },
		},
	},
}, {
	prefix = "<Leader>",
})
