local util = require("bindings.util")

local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
local silent = util.silent

nnoremap("<Leader>cc", ":noh<CR>", silent)
nnoremap("<F1>", ":execute 'silent ! alacritty &'<CR>", silent)

vnoremap("<", "<gv", silent)
vnoremap(">", ">gv", silent)

vnoremap("<Leader><Leader>w", "<CMD>lua require('util-hop').word_forward()<CR>", silent)
vnoremap("<Leader><Leader>b", "<CMD>lua require('util-hop').word_backward()<CR>", silent)
vnoremap("<Leader><Leader>j", "<CMD>lua require('util-hop').line_forward()<CR>", silent)
vnoremap("<Leader><Leader>J", "<CMD>lua require('util-hop').line_forward_start()<CR>", silent)
vnoremap("<Leader><Leader>k", "<CMD>lua require('util-hop').line_backward()<CR>", silent)
vnoremap("<Leader><Leader>K", "<CMD>lua require('util-hop').line_backward_start()<CR>", silent)
vnoremap("<Leader><Leader>f", "<CMD>lua require('util-hop').find_forward()<CR>", silent)
vnoremap("<Leader><Leader>F", "<CMD>lua require('util-hop').find_backward()<CR>", silent)

nnoremap("<CR>", ":Lspsaga code_action<CR>", silent)

require("which-key").register({
	p = {
		name = "project",
		f = { "<CMD>Telescope fd<CR>", "Find file" },
		b = { "<CMD>Telescope buffers<CR>", "View open buffers" },
		a = { "<CMD>NvimTreeRefresh<CR>", "Refresh tree" },
		t = { "<CMD>NvimTreeFocus<CR>", "Focus tree" },
	},
	t = {
		name = "toggle",
		t = { "<CMD>NvimTreeToggle<CR>", "Toggle tree" },
		f = { "<CMD>ZenMode<CR>", "Toggle focus mode" },
		p = { "<CMD>MarkdownPreview<CR>", "Markdown preview" },
	},
	c = {
		name = "code",
		r = { "<CMD>Lspsaga rename<CR>", "Rename element" },
	},
	f = {
		name = "file",
		p = { "<CMD>e ~/.config/nvim/lua/config.lua<CR>", "Edit vim config" },
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
		d = { "<CMD>Lspsaga peek_definition<CR>", "Show definition" },
		s = { "<CMD>Lspsaga hover_doc<CR>", "Show doc" },
	},
	v = {
		name = "vim",
		p = {
			name = "packer",
			i = { "<CMD>PackerInstall<CR>", "Packer install" },
			c = { "<CMD>PackerClean<CR>", "Packer clean" },
			u = { "<CMD>PackerUpdate<CR>", "Packer update" },
		},
	},
	n = {
		name = "notes",
		f = { "<CMD>Telekasten find_notes<CR>", "Find notes" },
		t = { "<CMD>Telekasten show_tags<CR>", "Show tags" },
		n = { "<CMD>Telekasten new_note<CR>", "New note" },
		g = {
			name = "goto",
			d = { "<CMD>Telekasten follow_link<CR>", "Follow link" },
		},
		i = {
			name = "insert",
			l = { "<CMD>Telekasten insert_link<CR>", "Insert link" },
			m = { "<CMD>Telekasten insert_img_link<CR>", "Insert media" },
		},
	},
	["<Leader>"] = {
		name = "hop",
		w = {
			"<CMD>lua require('util-hop').word_forward()<CR>",
			"Hop word forward",
		},
		b = {
			"<CMD>lua require('util-hop').word_backward()<CR>",
			"Hop word backward",
		},
		j = {
			"<CMD>lua require('util-hop').line_forward()<CR>",
			"Hop line forward",
		},
		J = {
			"<CMD>lua require('util-hop').line_forward_start()<CR>",
			"Hop line forward start",
		},
		k = {
			"<CMD>lua require('util-hop').line_backward()<CR>",
			"Hop line backward",
		},
		K = {
			"<CMD>lua require('util-hop').line_backward_start()<CR>",
			"Hop line backward start",
		},
		F = {
			"<CMD>lua require('util-hop').find_backward()<CR>",
			"Hop line backward start",
		},
		f = {
			"<CMD>lua require('util-hop').find_forward()<CR>",
			"Hop line backward start",
		},
	},
}, {
	prefix = "<Leader>",
})
