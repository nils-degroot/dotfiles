local util = require("bindings.util")

local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
local silent = util.silent

nnoremap("<F1>", ":execute 'silent ! alacritty &'<CR>", silent)

vnoremap("<", "<gv", silent)
vnoremap(">", ">gv", silent)

nnoremap("<CR>", ":Lspsaga code_action<CR>", silent)

require("which-key").register({
	p = {
		name = "project",
		f = { "<CMD>Telescope fd<CR>", "Find file" },
		a = { "<CMD>NvimTreeRefresh<CR>", "Refresh tree" },
		t = { "<CMD>NvimTreeFocus<CR>", "Focus tree" },
		p = { "<CMD>Telescope projects<CR>", "Change project" },
		r = { "<CMD>ProjectRoot<CR>", "Change cwd to project root" },
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
	f = {
		name = "file",
		p = { "<CMD>e ~/.config/nvim/lua/config.lua<CR>", "Edit vim config" },
	},
	g = {
		name = "goto/git",
		b = { "<CMD>Telescope git_branches<CR>", "Git branches" },
		d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
		s = { "<CMD>Telescope git_status<CR>", "Git status" },
		i = { "<CMD>call CocAction('jumpImplementation')<CR>", "Goto implementation" },
		r = { "<CMD>call CocAction('jumpReferences')<CR>", "Find references" },
	},
	s = {
		name = "show",
		d = { "<CMD>Lspsaga peek_definition<CR>", "Show definition" },
		s = { "<CMD>Lspsaga hover_doc<CR>", "Show doc" },
	},
	v = {
		name = "vim",
		b = { "<CMD>Telescope buffers<CR>", "Buffers" },
		p = {
			name = "packer",
			i = { "<CMD>PackerInstall<CR>", "Packer install" },
			k = { "<CMD>PackerClean<CR>", "Packer clean" },
			u = { "<CMD>PackerSync<CR>", "Packer update" },
			c = { "<CMD>PackerCompile<CR>", "Packer compile" },
		},
	},
	n = {
		name = "notes",
		f = { "<CMD>Telekasten find_notes<CR>", "Find notes" },
		t = { "<CMD>Telekasten show_tags<CR>", "Show tags" },
		n = { "<CMD>Telekasten new_note<CR>", "New note" },
		m = { "<CMD>Telekasten<CR>", "Menu" },
		g = {
			name = "goto",
			d = { "<CMD>Telekasten follow_link<CR>", "Follow link" },
			t = { "<CMD>Telekasten goto_today<CR>", "Today" },
		},
		i = {
			name = "insert",
			l = { "<CMD>Telekasten insert_link<CR>", "Insert link" },
			m = { "<CMD>Telekasten insert_img_link<CR>", "Insert media" },
		},
	},
}, {
	prefix = "<Leader>",
})
