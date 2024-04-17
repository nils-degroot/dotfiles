local nvim_set_keymap = vim.api.nvim_set_keymap

-- Util objects
local silent_noremap = { silent = true, noremap = true }

nvim_set_keymap("v", "<", "<gv", silent_noremap)
nvim_set_keymap("v", ">", ">gv", silent_noremap)

nvim_set_keymap("n", "<CR>", ":lua vim.lsp.buf.code_action()<CR>", silent_noremap)

require("which-key").register({
	p = {
		name = "project",
		f = { "<CMD>Telescope fd<CR>", "Find file" },
	},
	t = {
		name = "toggle",
		t = { "<CMD>TableModeToggle<CR>", "Toggle table mode" },
		f = { "<CMD>ZenMode<CR>", "Toggle focus mode" },
		h = { "<CMD>set invlist<CR>", "Show hidden characters" },
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
