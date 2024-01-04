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
		t = { "<CMD>NvimTreeToggle<CR>", "Toggle tree" },
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
		f = { "<CMD>Telekasten find_notes<CR>", "Find notes" },
		t = { "<CMD>Telekasten show_tags<CR>", "Show tags" },
		n = { "<CMD>Telekasten new_note<CR>", "New note" },
		m = { "<CMD>Telekasten<CR>", "Menu" },
		s = { "<CMD>Telekasten search_notes<CR>", "Search in notes" },
		g = {
			name = "goto",
			d = { "<CMD>Telekasten follow_link<CR>", "Follow link" },
			t = { "<CMD>Telekasten goto_today<CR>", "Today" },
			w = { "<CMD>Telekasten goto_thisweek<CR>", "Week" },
		},
		i = {
			name = "insert",
			l = { "<CMD>Telekasten insert_link<CR>", "Insert link" },
			i = { "<CMD>Telekasten insert_img_link<CR>", "Insert image link" },
		},
	},
}, {
	prefix = "<Leader>",
})
